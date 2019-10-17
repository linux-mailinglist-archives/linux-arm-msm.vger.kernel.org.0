Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A830BDB90C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2019 23:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502969AbfJQVaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 17:30:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38707 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732322AbfJQVaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 17:30:10 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so2087423pgt.5;
        Thu, 17 Oct 2019 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=h/bBHRGusj98Ie+f89J7SFLKi2fjMoUyMTs7iY5sfPs=;
        b=pek2pn2QOW42nThx78gpJ5eiILVpMLYfOI2e8D3iR7iPQEXoh5JdfF1Qu0FK+lGCHM
         rhfvKLT4pa4vyKPCXuC6ecbmlRgJ2DH0ExZpiTPGHFMzCxwIPx8rSFDC6a/nTc8U03EU
         RSqVFnQjyyHLm8AfXh4B4IWcgdXPwx0CwLwXZ/hksT3qm9lntnIDOo9Ng6cqVcPFJhUw
         zhZ4K5ms0I/s4cvJNumxUpuDMNz/dO4PSh0qADEHotDYexzHpDuUk+2AwM9S2b4MbP2H
         xolo2psfzeukidI6shOdZtzIfta+BsGZA8faGmCVcxjXbSVVbFzMpzlWMR4E9holJ3GS
         2EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=h/bBHRGusj98Ie+f89J7SFLKi2fjMoUyMTs7iY5sfPs=;
        b=oKpuBNtIzHQcR+wOMfl67oEDoQl5vFHiI43HzOUW14j8xCqZ2mNETK7b6bOLIQB464
         HAe8xcV9AmENbIJ1xqD/irj+8v9aH3FIjUiyd6fQy5lw8Qj5womFVCxMxixDMLOthZlJ
         JK50TLk79jE+tyyI7v/rEgSN0t3c3UX4EEsGiKY6r1y/Lsy/+ct8o4O+HbQ6HVhhUkag
         TIwUxDilq/RaPKScHSHgp75aOiNRsQedIsrvQm5YGFpZYdAzUyhBaihbiaWLpdzGzr/g
         YbK/mEzpHezNwfyxsX7I1VruwrYubDj0nlp+30JEP23DaxFWgR8QsnTdO6Z8ZFj0KX+9
         +MwQ==
X-Gm-Message-State: APjAAAVffWPSXpeoAsoii0Lc/WBZy7ji5SGclms1OVeMPGFo/wObFo4B
        NfDCWTKfakYKp16eie8ZWMc=
X-Google-Smtp-Source: APXvYqwQH11M5d3vGXCkqWTsm7amqBAPjHqccTvWu4XC7F8fg2mPRURwIMBKTQC90afxBF7EvjNckg==
X-Received: by 2002:a17:90a:1b49:: with SMTP id q67mr7023570pjq.115.1571347809693;
        Thu, 17 Oct 2019 14:30:09 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id w6sm4297898pfw.84.2019.10.17.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 14:30:09 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
Date:   Thu, 17 Oct 2019 14:29:55 -0700
Message-Id: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On the msm8998 mtp, the response to the baudrate change command is never
received.  On the Lenovo Miix 630, the response to the baudrate change
command is corrupted - "Frame reassembly failed (-84)".

Adding a 50ms delay before re-enabling flow to receive the baudrate change
command response from the wcn3990 addesses both issues, and allows
bluetooth to become functional.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e3164c200eac..265fc60c3850 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1156,8 +1156,10 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		host_set_baudrate(hu, speed);
 
 error:
-		if (qca_is_wcn399x(soc_type))
+		if (qca_is_wcn399x(soc_type)) {
+			msleep(50);
 			hci_uart_set_flow_control(hu, false);
+		}
 
 		if (soc_type == QCA_WCN3990) {
 			/* Wait for the controller to send the vendor event
-- 
2.17.1

