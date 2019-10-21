Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 970DADF1F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 17:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbfJUPqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 11:46:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35071 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbfJUPqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 11:46:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id c3so6822467plo.2;
        Mon, 21 Oct 2019 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yQ6ni+bd9BJF4Cmm/B3j7HmHOq+jH+Kczpm1ljsEDGM=;
        b=Ro06y3yv0XUF9A0bdwjh7RIZRubL77EH3UtwhNvN3x7Qx4L4RBVBTFSHcVD5+CUgYS
         S5BSN7Cip2kcBsu6v41e+4Ef6coS68mMS2AKaJRNHx7ibijPmvLPpqHvb2r09Fm/Mrb7
         TTBAi7PQHrV9IYaiq+Kgk1yS4eHhwUxKPsICxcqFv5VvP00/3Hz43aEViiAmPxJuHazZ
         83xO5m32YgRXP2YLa8GX2P4Gri7XDWKgRDAVat2Z0KnR7iGcanBhEQsFvkZ1psXrKfGD
         0YLyE1wU6IXvKkdoL+KUQqKgYvQgBlknyv2BFvuBeMToVGPYYakDtTPXYSHcmV1cMMc4
         ogwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yQ6ni+bd9BJF4Cmm/B3j7HmHOq+jH+Kczpm1ljsEDGM=;
        b=K7yr3wVb51oKawGVLu5/qV42pE9oUZRd19vSbhwf4txG9df9Q/3zqXNZZ8xpgiv6Mm
         ggoKSPhc5fsq6vgqFA2REBgBgO4phs8aFRhSp/77DQqGXQZ12pjSwRWJssOjtggjMequ
         7RdtXJgbpo1wVQ37Kagy8WpU0HVEcmVjvy6dlZhISLXO8znhpXTUgEvcf0jySshfyIZ6
         N2VfwxI4aZZIEBx1HRMxwAI5RcL0V9cTmFB4CoB5WjRaN+ps7ekdioIBx14bkhiob9D6
         sjil3n8OCbQWmIAs7zQia6EiKP1HQi+NOJm3c9X5P2l+9Ehz145bDThi99sX1z8gsvc9
         cz9g==
X-Gm-Message-State: APjAAAUlPfzZ5e0MJgbZ7jxLHnECeLJK0caHDZTxKv7HrKFkIlE61j2L
        91CW2vIB2P+wDLOHG4Csv9U=
X-Google-Smtp-Source: APXvYqy9M6z2BimkonIf2LFzzOLvC/Vr1XfRopL1iRbyH5UFZPwX+og20tyf4pRv7KxoGvPACrLGtg==
X-Received: by 2002:a17:902:6b05:: with SMTP id o5mr25219969plk.33.1571672784211;
        Mon, 21 Oct 2019 08:46:24 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id n66sm22805977pfn.90.2019.10.21.08.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 08:46:23 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, jslaby@suse.com
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2] tty: serial: msm_serial: Fix flow control
Date:   Mon, 21 Oct 2019 08:46:16 -0700
Message-Id: <20191021154616.25457-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

hci_qca interfaces to the wcn3990 via a uart_dm on the msm8998 mtp and
Lenovo Miix 630 laptop.  As part of initializing the wcn3990, hci_qca
disables flow, configures the uart baudrate, and then reenables flow - at
which point an event is expected to be received over the uart from the
wcn3990.  It is observed that this event comes after the baudrate change
but before hci_qca re-enables flow. This is unexpected, and is a result of
msm_reset() being broken.

According to the uart_dm hardware documentation, it is recommended that
automatic hardware flow control be enabled by setting RX_RDY_CTL.  Auto
hw flow control will manage RFR based on the configured watermark.  When
there is space to receive data, the hw will assert RFR.  When the watermark
is hit, the hw will de-assert RFR.

The hardware documentation indicates that RFR can me manually managed via
CR when RX_RDY_CTL is not set.  SET_RFR asserts RFR, and RESET_RFR
de-asserts RFR.

msm_reset() is broken because after resetting the hardware, it
unconditionally asserts RFR via SET_RFR.  This enables flow regardless of
the current configuration, and would undo a previous flow disable
operation.  It should instead de-assert RFR via RESET_RFR to block flow
until the hardware is reconfigured.  msm_serial should rely on the client
to specify that flow should be enabled, either via mctrl() or the termios
structure, and only assert RFR in response to those triggers.

Fixes: 04896a77a97b ("msm_serial: serial driver for MSM7K onboard serial peripheral.")
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

v2:
-mask out RX_RDY_CTL in msm_reset() to close a small race window for RFR

 drivers/tty/serial/msm_serial.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3657a24913fc..00964b6e4ac1 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -980,6 +980,7 @@ static unsigned int msm_get_mctrl(struct uart_port *port)
 static void msm_reset(struct uart_port *port)
 {
 	struct msm_port *msm_port = UART_TO_MSM(port);
+	unsigned int mr;
 
 	/* reset everything */
 	msm_write(port, UART_CR_CMD_RESET_RX, UART_CR);
@@ -987,7 +988,10 @@ static void msm_reset(struct uart_port *port)
 	msm_write(port, UART_CR_CMD_RESET_ERR, UART_CR);
 	msm_write(port, UART_CR_CMD_RESET_BREAK_INT, UART_CR);
 	msm_write(port, UART_CR_CMD_RESET_CTS, UART_CR);
-	msm_write(port, UART_CR_CMD_SET_RFR, UART_CR);
+	msm_write(port, UART_CR_CMD_RESET_RFR, UART_CR);
+	mr = msm_read(port, UART_MR1);
+	mr &= ~UART_MR1_RX_RDY_CTL;
+	msm_write(port, mr, UART_MR1);
 
 	/* Disable DM modes */
 	if (msm_port->is_uartdm)
-- 
2.17.1

