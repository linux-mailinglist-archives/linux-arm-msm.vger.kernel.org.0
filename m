Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18582DDB14
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 23:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfJSVG2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 17:06:28 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33212 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfJSVG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 17:06:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id d22so4590683pls.0;
        Sat, 19 Oct 2019 14:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RtlAkYH1/9Xe5FbxpSbJIDnr8807L6EpWQnr1xtse+w=;
        b=lhkpCh9CuYWOsq9d3aTSAtzipZvirVyxX0zPNo/N7hJX4p8fJ+c9zBn8ZF7TP98AWR
         q+vJIBjBDaxUpmq821AsRxbn7iewOyVMXjv+OM90EOIMlnXTQ8QQ1n4zlWUiIklimZ7P
         lSzObmDBAAbZs+Uc02iHSUvEDdSlakmr0Gn8udrDPb+L9R89eQqujxEtZlyh6RzBPD1f
         3/sVLSyTd7CIemnTxsCL6zItewx0e2zXfjwABkzT3I38FreJfT3m29Y+EXmQtilphLcm
         Iv6NfVgdhf1CzIs0oy4E5LKJwZdlDJKGEcv+SZmAQ/d9cI/edBZ2xNIo2346ZB/l4mck
         XZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RtlAkYH1/9Xe5FbxpSbJIDnr8807L6EpWQnr1xtse+w=;
        b=cl9+ZGyfLjt980DTxdsAb3Dg0FmwzgtATHp/G97SJyBaSbiX9pibf2OpuhEeqU8ikC
         FdcYEeEnLlXSxHWORCZobgS1nhXBlPmQH1KGsuCMCj8dTwpwG8xaSrXDx1R5zSn6s8L3
         KMP3XL+0sAHPH+XKc8BlJ0JZxLmiPlfSOXbxGAtU96FroZ8DSASc/DmlKl5m1oY0uS8q
         h5R0W+KeDpSgihGfvoCioeY63A0Jm5aV4a+/bPVCOCuBWOJfNje9thhs90vdkgxA0OXT
         ItkuXuuLthZWrpKw/Fugpq7TBXp1NICiGGsV0vXKnyUpWYTjEwLRRePAd3u8ONHEk0Cx
         4Hag==
X-Gm-Message-State: APjAAAUpzEMeoe2M5zJ+4A8wC+SCBdBokyud2iqyCahqBNHbYsFRT8mh
        cD5JZnw51qGcdIgDkC2wDxM=
X-Google-Smtp-Source: APXvYqyeavuYSW6adRkMes3cIdvD+qtvameT2H6Hm82W9gIn4yNRrxd5lvc0t80fx3uvEosdSCISnQ==
X-Received: by 2002:a17:902:848e:: with SMTP id c14mr16729221plo.217.1571519187859;
        Sat, 19 Oct 2019 14:06:27 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id w14sm12588476pge.56.2019.10.19.14.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2019 14:06:27 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        gregkh@linuxfoundation.org, jslaby@suse.com
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] tty: serial: msm_serial: Fix flow control
Date:   Sat, 19 Oct 2019 14:06:16 -0700
Message-Id: <20191019210616.41199-1-jeffrey.l.hugo@gmail.com>
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
 drivers/tty/serial/msm_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index 3657a24913fc..aedabf7646f1 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -987,7 +987,7 @@ static void msm_reset(struct uart_port *port)
 	msm_write(port, UART_CR_CMD_RESET_ERR, UART_CR);
 	msm_write(port, UART_CR_CMD_RESET_BREAK_INT, UART_CR);
 	msm_write(port, UART_CR_CMD_RESET_CTS, UART_CR);
-	msm_write(port, UART_CR_CMD_SET_RFR, UART_CR);
+	msm_write(port, UART_CR_CMD_RESET_RFR, UART_CR);
 
 	/* Disable DM modes */
 	if (msm_port->is_uartdm)
-- 
2.17.1

