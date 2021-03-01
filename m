Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7B932836B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237707AbhCAQS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237693AbhCAQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:17:46 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 511E7C061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:17:01 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id v15so16778980wrx.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KS1kq5BuDgV8Wc46EkUvtnfUv9ANjYiniYKfO7WViLw=;
        b=dkoq2PHUQCwQ+BbYuNhiw8oRtMRCC9upZdkuD4YRCYLqkzwWM+Epo3GUX7MGe1wNAE
         VQKjOhHAvZ7HeVunsWflUMe9XYdTO84I/4xpGKuMxTw8kZdHyJ842gai5czYtRwf+VJ7
         T4gcK3FPj/DrJ1ok2RcV/l8VrUTLKGET6ecH902iyb4WoVVEXy7zl7h4tp9VBXcEGZGV
         PxOot7x1shIUF70VFbtk6bbRxb9XFOh2aFOvsoa64ivoSCUKqgkNrZGaaW1dd9OSHyUv
         OQqip94KGsrqdomAitk4xEmGMSVkc2LXhsWF4DgodSs9dSE63aKIzIas/fo00fMbHNBR
         ubqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KS1kq5BuDgV8Wc46EkUvtnfUv9ANjYiniYKfO7WViLw=;
        b=HZVwKneIcPCH1IIWEC7zH6WZifOq7UdozxidrVX91l+xap+sHX0eG3rFpgdqntv2TF
         XO07kaLz5Vb1FtjYTOzCO5vFXJtVtURO40+C/AmRqu45uxk7vBDsO1YxVmVgboYhqHZw
         lgFlFaATnb1TAIRU4UjYUNtiSdaYI/sh34UPgH+g5xq3CCav5fQP67vjpqV/oJCaOoZg
         7rU5g1Y3QGMif1qc1MTFSSFRp64+FOj89Ym66rdmZmTmQ0Y3gdc9jXanRh4J+siGhCsA
         9KHEf4dGxV6gsDD+7EdCI3pavPPgaFV4PPTtKJSJW60E8chtaK77xBeg5Hnv/f8XQkUk
         V0mA==
X-Gm-Message-State: AOAM530PSd5eNxgn+7vZSTX8X7JE2PbN2IKI8p3EfqK3AYZrxjWcQy2z
        Ro5o4PMAcvDRo/CapbjdjGoy3Q==
X-Google-Smtp-Source: ABdhPJy+Ux2VjURtqnSlwyxndnTR1ekYiXgmcp+mAsSP6hMFVpReT3pdUYZnqwf25a4FHuR2DrlCSA==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr18459818wrx.338.1614615420016;
        Mon, 01 Mar 2021 08:17:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.16.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:16:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/6] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Date:   Mon,  1 Mar 2021 17:25:07 +0100
Message-Id: <1614615911-18794-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for EM1XXGR-L modems, this modem series is based on SDX24
qcom chip. The modem is mainly based on MBIM protocol for both the
data and control path. The drivers for these channels (mhi-net-mbim and
mhi_uci) are not yet part of the kernel but will be integrated by
different series.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c58bf96..00a0410 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -114,6 +114,36 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = true,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_UL_SBL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_TO_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_SBL),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+	}						\
+
+#define MHI_CHANNEL_CONFIG_DL_SBL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_SBL),		\
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
@@ -182,9 +212,52 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_quectel_em1xx_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
+};
+
+static struct mhi_controller_config modem_quectel_em1xx_config = {
+	.max_channels = 128,
+	.timeout_ms = 8000,
+	.num_channels = ARRAY_SIZE(mhi_quectel_em1xx_channels),
+	.ch_cfg = mhi_quectel_em1xx_channels,
+	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
+	.event_cfg = mhi_quectel_em1xx_events,
+};
+
+static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
+	.name = "quectel-em1xx",
+	.edl = "qcom/prog_firehose_sdx24.mbn",
+	.config = &modem_quectel_em1xx_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
+		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
+	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
+		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.7.4

