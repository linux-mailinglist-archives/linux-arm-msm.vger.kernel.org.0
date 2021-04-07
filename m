Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217803566E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244822AbhDGIcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244908AbhDGIch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:32:37 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4CAC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 01:32:18 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id d191so8581737wmd.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=APioPlszcVSXzeqVm325c4uElvkmMV1ZeF5HP1WB8ZU=;
        b=Io8FYcz57txSAKddk8EpdKDYX0k4LqqnxTMkFjyYZ2xgvO7+3LA4+vy8oUxqTmMato
         i272vCDM1a5FEP1md1EzjB+A3isDBfsx503SlaUE5hI8JB9fSiwLVp3DGADbDFkXzWnb
         igWEMgasS7+SUvhgPQ18tx7OPeoBsNeNecaxOG3ZcQgcEu3mdokss8288kYbojWjd29h
         +XrFxYFZVHyMuFTLHFSiaCMU+DWphHP506wAinz2rPmYC8f1q4TWcigF+RYgXSm+rSLx
         Om13OHQSdqtT1CJ3Fr0h+Ss6Xnt9v51aItGfrTHxXi6HzMQUAN05Wh1X8xL7X9t5AmWq
         Sdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=APioPlszcVSXzeqVm325c4uElvkmMV1ZeF5HP1WB8ZU=;
        b=aPBPXi+WpF2t8+m7MAJVHLcgj2F4I9QqDJFv3tiwj/Nm/2idnN5Ves1zKrqpqmjof3
         w8f1c7umkcrcLbdIEv5Apqy3yCzytLLWdp5G2sfeh2f6cSmyQB2k/iOVdbEhy1FVQwxZ
         EDLtfhJQXWTyZxHkJL7J1n37LH1Hphhd+xLp3Za8GlaAFnQn9rhJFpU2ABxei3MCK/Mu
         NiKw8Q2WgNWj6FtkVDzneL7+nUIUPPQgg2qsFBk9X6K+bvpf2rTnQSxyiQERsFOCM1eF
         ei81cdNUNHLjkobmd0PUJHKF6Y4MMhjetsDCqBGnflVKDOvVa/9fIJMGQe/ryPULjPB0
         hy/g==
X-Gm-Message-State: AOAM531QbHCPjvkkLc57QmM2iCEwtPtYuBvBT77uatnB3ZYI5CrzeRf7
        eHGs1tbJpDnrg0Hf5Ev0TTbIyQ==
X-Google-Smtp-Source: ABdhPJzufTlUzHkKOGwrr0QdpvjVvPVe2+GDZAkAW5wPTS2gW+VAbDMVsEgkMa8Ld9MNHX+pRKmR3A==
X-Received: by 2002:a1c:dd89:: with SMTP id u131mr1949183wmg.54.1617784336663;
        Wed, 07 Apr 2021 01:32:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:c4d8:afb9:68e4:d58e])
        by smtp.gmail.com with ESMTPSA id y4sm7394999wmc.2.2021.04.07.01.32.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Apr 2021 01:32:16 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Add FIREHOSE channels
Date:   Wed,  7 Apr 2021 10:41:00 +0200
Message-Id: <1617784860-32439-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When device enters flash programmer context (FP), it exposes firehose
protocol through the EDL dedicated channels.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 544853c..fda3e88d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -145,6 +145,36 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_UL_FP(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_TO_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_FP),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}						\
+
+#define MHI_CHANNEL_CONFIG_DL_FP(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_FP),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
 #define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
 	{					\
 		.num_elements = el_count,	\
@@ -181,6 +211,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
@@ -241,6 +273,9 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	/* The EDL firmware is a flash-programmer exposing firehose protocol */
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
-- 
2.7.4

