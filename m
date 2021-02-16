Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02A5A31CF6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhBPRpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhBPRpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:45:02 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2B8C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 09:44:22 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o15so9763466wmq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 09:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=rAhPMMIy1hTycGZ0RmiLCgGL437elgRaiEVTV2b0DN8=;
        b=b/FpZ1ZF9T9Y7e9tth8gaQTfepndNmPuDRAvOfL8WYW435rFPmlXbcvBp1YqBtlrHB
         hPXk5Lqo/d1uUjetz1RaOKcLwdfi2Jqfr8M6DrkFKlszf7+qquIQ0Gg+YbepPDAtzTSk
         SyuIs8BOaPzpgQWV5HKtVri/RCr5HSWbSxA0S4tN3/if8w0eA7zf6ZLV56ydrgxV3EYd
         q9iqJR4yAiuHP23J0pq3AiybAsbwjOWh7PVH+C2oxYACR2ls8qlZ5uoZwDBjyr1IW5gw
         UA9EGivsIXwhH8Gu6Goisi8AHnTSvslO/RLzVu/SuOP8FmSIWBf2q5DQn2soUHMmjG+W
         ulWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rAhPMMIy1hTycGZ0RmiLCgGL437elgRaiEVTV2b0DN8=;
        b=G1c4tyaQC79byuylrvVa9LgelvRdsm7BYz41uMOvqDQMGgH8CsCplzjBP8bBmF+ZQU
         RW2X+qluL79W9eTvImOmvXMwoD6LOlYHyjGvfMUZt4dKKJffwK5wRRLXNsb0xLpDNCWp
         ugtgWRj+9Op97D21/jz77KChip24Z73cyDb+0+cdBNN/bg8hyveAES7VfjKTLRCS662x
         bUbv8vc2EXy5AOyaqUKW0bVhNxHzElf6hITisRkngcj9BH8ax4Y4Ctp0V3n9rNZoQnkz
         axurd+QsUcwRkMpG1HET+0HFy4TtIVKUbcC8zDnl+fortrOdowQraVzit6KPCITZNXgY
         U4Hg==
X-Gm-Message-State: AOAM531mPGxhe8bqOu4MNavwUF0uDkpB3sU+0OF+5H/G5Ypl/BlV2QPJ
        +Emiu7EIU3g454/zUpa+YCOTWQ==
X-Google-Smtp-Source: ABdhPJzxfzO/yK6o9GALHP3mhT6wLtdYn516vGjj7F9wYFphlTYjpXif0ysURv9WsW8xJtaFZoP6kg==
X-Received: by 2002:a05:600c:4f46:: with SMTP id m6mr4155183wmq.154.1613497460868;
        Tue, 16 Feb 2021 09:44:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:3aa1:8a00:4dc0:cae4])
        by smtp.gmail.com with ESMTPSA id o1sm4042956wmq.8.2021.02.16.09.44.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 09:44:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        mpearson@lenovo.com, cchen50@lenovo.com, jwjiang@lenovo.com,
        ivan.zhang@quectel.com, naveen.kumar@quectel.com,
        ivan.mikhanchuk@quectel.com, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 1/2] mhi: pci_generic: Parametrable element count for events
Date:   Tue, 16 Feb 2021 18:52:27 +0100
Message-Id: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all hardwares need to use the same number of event ring elements.
This change makes this parametrable.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this change to the series
 v3: no change

 drivers/bus/mhi/pci_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 8187fcf..c58bf96 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -71,9 +71,9 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
-#define MHI_EVENT_CONFIG_CTRL(ev_ring)		\
+#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
 	{					\
-		.num_elements = 64,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 0,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -114,9 +114,9 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = true,		\
 	}
 
-#define MHI_EVENT_CONFIG_DATA(ev_ring)		\
+#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -127,9 +127,9 @@ struct mhi_pci_dev_info {
 		.offload_channel = false,	\
 	}
 
-#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
+#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
 	{					\
-		.num_elements = 2048,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 1,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -156,12 +156,12 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 
 static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
-	MHI_EVENT_CONFIG_CTRL(0),
+	MHI_EVENT_CONFIG_CTRL(0, 64),
 	/* DIAG dedicated event ring */
-	MHI_EVENT_CONFIG_DATA(1),
+	MHI_EVENT_CONFIG_DATA(1, 128),
 	/* Hardware channels request dedicated hardware event rings */
-	MHI_EVENT_CONFIG_HW_DATA(2, 100),
-	MHI_EVENT_CONFIG_HW_DATA(3, 101)
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
 };
 
 static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
-- 
2.7.4

