Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0A172B1DCC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgKMOxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbgKMOxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:33 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658DEC0617A6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:33 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id u12so2986130wrt.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gYIKCcN8WQ/EbGFIHV1x88OAZPf2nkJY+y3eCrkB1Og=;
        b=HMWFg8dIsnCK6ovPR1me5i6sDp6rsOudcQ8A0RfpUpPiEJwtR4is9ps/QCxSDNs1mV
         HtszjXD3Efx7oq/KVgaPyzmV4GXNL4KIEREOLMuSVSMkzxsrbkI2mrsi0E73MD9tkYZo
         vNoJOE3UwKhymXas+MOezTUra40A5YCBG7xJCmMNLfM4W6LU4HQOJoPseJCBAiQxnEEX
         t/xVtNw/4pupKOH45USzylbeftXIrpI0/COFmjJWd4vF8/imo0w6f72/9CZg81mPY972
         INABVTqDCrAgNzjmBdHlMTm77T3c7C8rD2AQ1ErYhFGfvDVwSfgAQbpNbKlGXd7RRc/2
         9w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gYIKCcN8WQ/EbGFIHV1x88OAZPf2nkJY+y3eCrkB1Og=;
        b=XJ1nDJKC0BxaisC01BDjN8LIl2Krt4drLmUDYz09C6djSFMIPzUMsEA/OENlY8HBbr
         7cig8oxa8hdSc3tq8FLHcPC70xLm61rEhMQuk5VtsoJXupeTAfXXI9I69bSUfPjHEOS0
         DbFkXf6C0T0dNcFRnmYsykax6B5XAPh2fgYDbHCjrfbvuiOZssuZdEl7l06gKTEXcz8y
         UY8Llx0ah+wvm2xt1bvRuIR/xpVtyt9TVvZn/7jIdmMSPScsmge5EAMRaNrHPfFFJbZj
         MlbgkQJ/oF5u5cdZdiNdX4NHg/S7e7ql6XaMv+Fa9zrymaP6mmo/a2YBuJ8YtwvtvdT0
         LvUA==
X-Gm-Message-State: AOAM5321zEO5ET5XBX1Hpz4456vvIkwbjHdzMgx8vcReF31QitT7jEZU
        O0pCFeKvP7EBbn7WpEg3yYwnF3D2x6dcPGIu
X-Google-Smtp-Source: ABdhPJzrpuxNRyj4XlmZ5sIINRbtZoNyNXBvmXWoxY8N3dAJ6MLTV4geSAoCslp8MLNhG5es3odqHQ==
X-Received: by 2002:adf:bd86:: with SMTP id l6mr4089267wrh.205.1605279212016;
        Fri, 13 Nov 2020 06:53:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:31 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 3/8] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Fri, 13 Nov 2020 15:59:57 +0100
Message-Id: <1605279602-18749-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
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

