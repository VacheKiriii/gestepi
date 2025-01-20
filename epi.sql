CREATE TABLE epi (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique internal ID
    custom_id VARCHAR(255) UNIQUE, -- Custom ID provided by the manager
    brand VARCHAR(255) NOT NULL, -- Brand of the EPI (e.g., Petzl, Black Diamond)
    model VARCHAR(255) NOT NULL, -- Model of the EPI
    serial_number VARCHAR(255) NOT NULL UNIQUE, -- Serial number of the EPI
    type VARCHAR(255) NOT NULL, -- Type de EPI
    size VARCHAR(50), -- Size (optional, for textile EPIs like ropes or harnesses)
    color VARCHAR(50), -- Color (optional, for textile EPIs)
    purchase_date DATE NOT NULL, -- Date of purchase
    manufacture_date DATE NOT NULL, -- Date of manufacture
    service_date DATE NOT NULL, -- Date the EPI was put into service
    control_frequency INT NOT NULL, -- Frequency of control (in days)
    next_control_date DATE, -- Next control date (calculated based on control_frequency)
);

CREATE TABLE controls (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Unique internal ID
    epi_id INT NOT NULL, -- Foreign key referencing the EPI being controlled
    control_date DATE NOT NULL, -- Date of the control
    controller VARCHAR(255) NOT NULL, -- Name of the manager performing the control
    status ENUM('operationnel', 'a_reparer', 'mis_au_rebut') NOT NULL, -- Status of the EPI after control
    remarks TEXT, -- Remarks or comments about the control
    FOREIGN KEY (epi_id) REFERENCES epis(id) ON DELETE CASCADE -- Link to the EPI table
);