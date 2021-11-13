Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCC544F30A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 13:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbhKMMOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 07:14:43 -0500
Received: from dvalin.narfation.org ([213.160.73.56]:60268 "EHLO
        dvalin.narfation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhKMMOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 07:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1636805509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FC64XGammN+oDjpCb8mJfMbTk4X85pGUPiwSl7lch/U=;
        b=f+mFf6WgrqIAogY/f5cMfzhyXPzCL7FQOXLPG+gwuEpYMBOwyUpma7+kWJHS6WVw0XXkF9
        VuMpyop8abVLR6YbhtnE6Db4dN25pkVRCS6CQykIiHasNgMs5E38yBWoS9d8sSPxXMQSds
        I9qaO1rwDF3fmyZ++6WWFxiYHL/JH1I=
From:   Sven Eckelmann <sven@narfation.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-serial@vger.kernel.org, Sven Eckelmann <sven@narfation.org>,
        stable@vger.kernel.org
Subject: [PATCH] tty: serial: msm_serial: Deactivate RX DMA for polling support
Date:   Sat, 13 Nov 2021 13:10:50 +0100
Message-Id: <20211113121050.7266-1-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CONSOLE_POLLING mode is used for tools like k(g)db. In this kind of
setup, it is often sharing a serial device with the normal system console.
This is usually no problem because the polling helpers can consume input
values directly (when in kgdb context) and the normal Linux handlers can
only consume new input values after kgdb switched back.

This is not true anymore when RX DMA is enabled for UARTDM controllers.
Single input values can no longer be received correctly. Instead following
seems to happen:

* on 1. input, some old input is read (continuously)
* on 2. input, two old inputs are read (continuously)
* on 3. input, three old input values are read (continuously)
* on 4. input, 4 previous inputs are received

This repeats then for each group of 4 input values.

This behavior changes slightly depending on what state the controller was
when the first input was received. But this makes working with kgdb
basically impossible because control messages are always corrupted when
kgdboc tries to parse them.

RX DMA should therefore be off when CONSOLE_POLLING is enabled to avoid
these kind of problems. No such problem was noticed for TX DMA.

Cc: stable@vger.kernel.org
Fixes: 99693945013a ("tty: serial: msm: Add RX DMA support")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
I've already described this problem in a mail two weeks ago
https://lore.kernel.org/all/4119639.d4o71su6xY@sven-desktop/

There was no feedback so I would like to propose the minimal version which
was described in that mail.
---
 drivers/tty/serial/msm_serial.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index fcef7a961430..489d19274f9a 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -598,6 +598,9 @@ static void msm_start_rx_dma(struct msm_port *msm_port)
 	u32 val;
 	int ret;
 
+	if (IS_ENABLED(CONFIG_CONSOLE_POLL))
+		return;
+
 	if (!dma->chan)
 		return;
 
-- 
2.30.2

