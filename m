Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E10DEF3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 16:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728986AbfJUOSc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 10:18:32 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39538 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfJUOSc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 10:18:32 -0400
Received: by mail-pl1-f193.google.com with SMTP id s17so6681679plp.6;
        Mon, 21 Oct 2019 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Q7pZ33ZbznXPJtvmD19nVQgQlTsXtZXtBOem8I3QUdY=;
        b=INKY8gjaHhVN5RG3HbT/ZFNUyfWVhQcYZHqWFfbkpK9LZ5p7mYSFYQoPmdkCcrAyK6
         kG0/4g4Fv+dYnHMWRYWGWq/UVymZSIHmv0zToJC2nblaxfKjngnYumo/4/Xy4eUeh+Lt
         THexRIY4u2cdv7wff7dhbBkS6nq7YrxjCAZx6Jc15kvBxO11I0rX3PcdGsl4soLCZXnK
         3vD/GAmPyFuhCMT7+yJ9pPnkIVQIeOHS5xryoXlgLhvczvh0+dnPVlaYa4VECDtY30Gw
         Hp+gEe03s0MvPXeHo2h9p89q87r7LyGYIYecLH59qdcbWHaAMf8eokSn3rfqbR/BuQJN
         0jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q7pZ33ZbznXPJtvmD19nVQgQlTsXtZXtBOem8I3QUdY=;
        b=uKHvO5+Vo/kGbPdNYkh7ZtztrnjZ+b5oqXrRRXn1sX8Ft/BuFnM5y1VPTTfalPDHr4
         ajsK28/W5LXOlt+GIdA4ZdoMuUSTueIB05r6fqoXPj3OJoT0suQ3Lf9+Yq4oE4YMJ6KV
         v/NCQHKdn7BMIn0gSFQLjZZri+0mOTg0BJCvu8u/IGQnEakIp+lhFJOmKciqaklKXOHA
         U6fN944JwrE0lQ/684yMlo7OMHA7Lo8JyY/JQBMsNpZLO0isnE8en8/JSQvGlhPqR7rQ
         P065PnKT0/JTmIoFG8CNDCKGu1v5xwpd47tWPLVp6EzxjpD78fkpVo3PpcDBMHu7VpuZ
         D08A==
X-Gm-Message-State: APjAAAWXIXc9lCfrOq+mOKTmranVndRBIgoHijlM3wmeqL7K9p9p/KOX
        XFHNVYNoA3AgE1I5TJZ/zdk=
X-Google-Smtp-Source: APXvYqw1mW2AQvjdOIP7c29+EWwxZggL2XmITz2nkKCN5wF79Uum+vQkU9s7tJDd/aN4/aG+i0+d6w==
X-Received: by 2002:a17:902:fe0d:: with SMTP id g13mr6890785plj.253.1571667511820;
        Mon, 21 Oct 2019 07:18:31 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id p189sm16699509pfp.163.2019.10.21.07.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 07:18:31 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org
Cc:     linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] Revert "Bluetooth: hci_qca: Add delay for wcn3990 stability"
Date:   Mon, 21 Oct 2019 07:18:27 -0700
Message-Id: <20191021141827.11150-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit cde9dde6e11a5ab54b6462cd46d82878926783bc.

The frame reassembly errors were root caused to a transient gpio issue.
The missing response was root caused to an issue with properly managing
RFR in the uart driver.  Addressing those root causes occurs outside of
hci_qca and eliminates the need for the 50ms delay, so remove it.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 8ae91e0f8102..c591a8ba9d93 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1155,10 +1155,8 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
 		host_set_baudrate(hu, speed);
 
 error:
-		if (qca_is_wcn399x(soc_type)) {
-			msleep(50);
+		if (qca_is_wcn399x(soc_type))
 			hci_uart_set_flow_control(hu, false);
-		}
 
 		if (soc_type == QCA_WCN3990) {
 			/* Wait for the controller to send the vendor event
-- 
2.17.1

