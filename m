Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC8EF2E9633
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbhADNmx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:42:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbhADNmw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:42:52 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DEFC061796
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:12 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q75so19358200wme.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=Ij9S+uxCQOB8AB3yESR3oc43wm/FoqRTkJXriq4dF1yk/BLFqfvlm1jHCaQnNyz1Aj
         od5JJMa9vFwX0+ZpgDDv/f0iJN20OjYMo3GmdsVdJJEPHiTYzOQeasUmvfxNZ+rVnbG/
         TZ/e/X9/7qh6Up6nBWfKRR1lT3pv/v5Z/8PMNSrvdLEC8ZSTlzBDgaAoHy1t2MX+k92T
         1jj0EXvagGel6P/PMAkLnH78nVq8HGYxFrF7DsVFqNEb/4NfCB9IsQ+6fgTSJkHF8pe5
         h7TYRu69Ko0Nrw+QXoGysqnF3zJHFISAgEuqxKhCwTFAHvr7jYfyfUOZJifIWKAf9Q3Q
         oeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=AStMVZVNL8ZO1uK8CcQwuC0ll9akSvE9k5V8JF5rWZdPHO2kwrZb/ODrqnA40wMG8z
         YyCql9kgiWSVvC687yx2rY7dGRhTeIPRTdR0ZyGEKnuSCQNDxFRlOmFC8myzy/BRQJPf
         lekoxSgRfvMrxYVily2NCGqsU/nU9uoDqlj9nyBz55+lNy09UmExYlfUTEapNrDcH9oH
         q9WZYkeAFiM6fGbVYP1qZsbdKHNQRFGy9K6u+8iWJq119jJlwbbyi2Mrj4WSn4+sxDhu
         DQvDMeFaGTFcUSegIdIbENdjSgTz9Jt3PMex6UlcZJwxTk1bTguR3Z0LsIBLqNJOWfll
         Qpxw==
X-Gm-Message-State: AOAM531/4H7cxFGfPK8cZAtl/4u0laAKTvbs7fIX9Iw+TflK+qPBc17d
        GQcHCUztMoYaIFB5hNesSWL+wIFNyNTYQy/Q
X-Google-Smtp-Source: ABdhPJxbMVscVe9dL24uVM53NmJKFRIQewadi9EkiPL6Q0Zzsq2ds5FT8pCpsuztxD4Hs7ACoKid9g==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr27331101wmd.118.1609767731127;
        Mon, 04 Jan 2021 05:42:11 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:10 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 03/10] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Mon,  4 Jan 2021 14:49:32 +0100
Message-Id: <1609768179-10132-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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

