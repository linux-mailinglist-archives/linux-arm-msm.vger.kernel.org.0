Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D249532F385
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCETIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbhCETIY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:08:24 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE695C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 11:08:23 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v15so3245690wrx.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7G9A1TBrr/rvyfIfwUmC1Wqq1DUUgbMT2BKXZ0DzFl8=;
        b=QoU3xVHlVE9VxGu0CpwsK2MVpmUV8lng4DnYW3gVdzARhivUP438tDt0aaXxyqkwCW
         KF7dhaKlFGBbNA1AKQRMUAlv6MAnwnn34yrisdaIg3qG00I8n+DkYvHoPS5DALAIYQwb
         qL/QYS4AiFCfhpdlcZWDVL8I4rZQdMRWUaf2rQCdFHsqbEWi6/f1xGwWWzR4/MlfSy2M
         3Yn0wZPiVp6uxy2yp01WyHu2fFS0ORAS9sqlJSX6fgU8qank0J5iUKYH1eAmPol3zzHm
         JfvsPrYFIr4X4tDf3N6ynRGzw2kcD0X2FtH+Us1k0McnpdwPvvnrhA6vL6E+Frkt7yho
         sltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7G9A1TBrr/rvyfIfwUmC1Wqq1DUUgbMT2BKXZ0DzFl8=;
        b=IoCY4w4BuzNDKX9xXBlZs8nF7zXSkosPxyU1b9oHoB8OIrTUSYM90KdfwIAbzovMEo
         6GpOEG/VfA7bKpX7SdJKFU/F4LNdU7RpebNjydxhMb9ZhOtrQE6E5sBzOTZKsEK3CKhY
         ARxaQf5RjC09MTFapGs+j7Jp9poyOhRHodqZrPir11tWL9m7P9K/MCbGcirF+wkSyLDW
         BcUJtyggpIeYuJBXFTFRkQDIP5lasgWWXopyt4FnRlhxuS0RsNugx5hFcxTwRSgqd6wA
         4cfXFsL9W4JFoipJv7cwBl2ldNRnWef/8WQJiLEopK0mjmHhV9eOT3148OkORtx91mz6
         /qBQ==
X-Gm-Message-State: AOAM531rfI1iCwIvccbYw2VtzgqADLrdXbhw/C8renT6pFqEU2dh41Rr
        YDRDAybISF+VaEn44gT48vAYEA==
X-Google-Smtp-Source: ABdhPJzka748+YNnd3BdVMDKzM5P9fZpyNW+bMFazs+Z5g1/29WbbIYjGWLaKhzwm/KMm0eqNzpnBg==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr10632342wrs.317.1614971302423;
        Fri, 05 Mar 2021 11:08:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c11sm5355437wrs.28.2021.03.05.11.08.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:08:22 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/6] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Date:   Fri,  5 Mar 2021 20:16:44 +0100
Message-Id: <1614971808-22156-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for EM1XXGR-L modems, this modem series is based on SDX24
qcom chip. The modem is mainly based on MBIM protocol for both the
data and control path. The drivers for these channels (mhi-net-mbim and
mhi_uci) are not yet part of the kernel but will be integrated by
different series.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: update timeout_ms according real modem boot time
 v3: no change

 drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c58bf96..45d0cf2 100644
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
+	.timeout_ms = 20000,
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

