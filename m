Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7665C2C0CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730238AbgKWOEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730232AbgKWOEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:30 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9032C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:29 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 64so5299978wra.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gYIKCcN8WQ/EbGFIHV1x88OAZPf2nkJY+y3eCrkB1Og=;
        b=AKIjlBTuJv9zdqcpLJHX+cjyDxMwH1ui0yz7N3JR4vzpC8jB3ZmKqhdnf7e2/Jm0lD
         59c0qp9RXkAZaBIf6NQ2vih8ksaqWhCyAXGnVlge0OvrllK9v1ZSVcqx0w8gCEmJ7JMf
         Thr1kUgcmdL/+MA/sogeGCUIFhIh4woTa9ytxQFkmp0Ec0Fnbbo6AdxnQlp/OKkJHOb7
         lAZQc7Wx04O2sD+h0jfAiL8eMjrklo03wXVZ1Ngjyapo3LUpfORFezvRYt4wWjWt3yYJ
         EQ7Li4JtG1wlfUdtQvCZoiwbaNY/g6ewzhXNtVaAauwFvL3DClJhmGYNevck6tw+yrJt
         XSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gYIKCcN8WQ/EbGFIHV1x88OAZPf2nkJY+y3eCrkB1Og=;
        b=ZA/J8epnHEXAaaO7/hRQABbIazWQQf1UjIdCSdSsTe66lywNuHhqxbqUujK8Q2jOkf
         JyYag+AsBNhBXU3rgDJ1MsUPgWyVBestm7mtASP3TUQcM6A1Zrzy3QI96PdTYb6Ajnnq
         uZU4uCBL+H2XjBOQzmtaMBFixmVD6pTB9cDLc9kTrdIR9Z6zXj4p8Cz2GbimMvvLJn+0
         YKi2dXbT411P4azcCUUdE+NmfMOj+W+sDmzkL8IuUyOnlwNcKhIEHkHy3NADi1bw869p
         CN5ZK5H5ySLjQJ2gEnBLe2x7MFPlpYtJvS9GdLRScEO9UgsxvQS8XxY+izkqCho2BSQn
         OcEw==
X-Gm-Message-State: AOAM5311hnqjiKF32SqCRdRiQpl2p4E487TUCje62SNBVu/Nuoy/WeEh
        5JM0lIKMYtJ/U9Oi0oiBtLxkvA==
X-Google-Smtp-Source: ABdhPJyf1178j1t8am+5omnJBOYTrdCST5KsuwnvKGhojFysyxN1F3aqlfDPSw+5hExt06DCfMmTnQ==
X-Received: by 2002:a5d:4ec8:: with SMTP id s8mr10130565wrv.349.1606140268338;
        Mon, 23 Nov 2020 06:04:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:26 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 3/8] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Mon, 23 Nov 2020 15:11:01 +0100
Message-Id: <1606140666-4986-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hardware channels have a feature called burst mode that allows to
queue transfer ring element(s) (TRE) to a channel without ringing
the device doorbell. In that mode, the device is polling the channel
context for new elements. This reduces the frequency of host initiated
doorbells and increase throughput.

Create a new dedicated macro for hardware channels with burst enabled.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 09c6b26..0c07cf5 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
 		.offload_channel = false,	\
 	}
 
+#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_TO_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_ENABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}						\
+
+#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_ENABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}
+
 #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
 	{					\
 		.num_elements = 128,		\
@@ -112,8 +142,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
-	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
 };
 
 static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
-- 
2.7.4

