Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57FB72E6F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgL2Ihs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgL2Ihr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:47 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559A6C06179A
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:30 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id lt17so17232924ejb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=giyY+as4LBRWSxR8Oh2vVriyApOQD59afQIHnBuhU1mQ8+ONsJEvDK7q6/LXElrSJ1
         gmtAPUuj3JV4pjDdkJEvUCFTWZyLjWAPIP6ohCs4LNv4RCrtNWRrDSbJAuwI2nb5/XpO
         4AyLbAaBNWCuHMExyV0KLkFL4tyvvJfv7M4A51KKTgwD+rUsX5R4AREmhvd1x6/DTGvJ
         kkT7uDCo3EC2SEDqWgx1CjwCqLTHFhp0d1/zpBmJOplZ5K8c9AssNwWiXqNmios9dZc9
         3RfgQXWA6EqUs1tl9hDEaATjDLf5PKWbh4WQkr3sNkM/AImO3zUAGs72duMmkdkpkcYp
         kS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=igsPNOIk/HCCUqVHIEXIB7A32UgxngrSm1bisOIh+4CUfJk0pafh8iHQ3pzjIN2awY
         wBADiT7aA8DbCIxaEFGssqL8R4ctER+2BxhEi7qXWf9+x8rkoV7Zj5adO+1s1uyvWZc5
         8pauyWNXF0IvyADBL9tenInEmjwvEmBDIrrirGiU3ddkgRXAnIoX6ye4tvEJf2TcrEHn
         sa6FHnng9KVkJdJz1PhURBSa14siucXU5yU4AQVLAB6A/CCRFGCAPJ5v8oR0g+6ca+z1
         qrBP812fAADhOc6iyZDapZND6+xPQ0y4xr/qU7Ur8/XqvukRgc90vPcFVbXY8/zNhzTh
         F9+w==
X-Gm-Message-State: AOAM5312HJWWVJWa9bm5XgPSCXm5MWhw+xi4S/gC4hTV2fo7CskccsCA
        lV01QTF1HfV8PzWM45QCd/A2ny5HkFiMcQ==
X-Google-Smtp-Source: ABdhPJwuIIt6QGzs3nx8f5jgav3b44JRshZ2nQSlXL+HclbWL1uSRgRX1sRs3yTHn3ehekP3WkLTWw==
X-Received: by 2002:a17:906:3bcd:: with SMTP id v13mr44714785ejf.181.1609230988978;
        Tue, 29 Dec 2020 00:36:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 04/10] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Tue, 29 Dec 2020 09:43:45 +0100
Message-Id: <1609231431-10048-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 13a7e4f..077595c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -76,6 +76,36 @@ struct mhi_pci_dev_info {
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
+		.doorbell_mode_switch = true,		\
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
+		.doorbell_mode_switch = true,		\
+	}
+
 #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
 	{					\
 		.num_elements = 128,		\
@@ -110,8 +140,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
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

