Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5808C31158C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 23:43:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhBEWdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 17:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232394AbhBEOP4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 09:15:56 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151CCC061D7C
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Feb 2021 07:53:45 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id p15so8177609wrq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Feb 2021 07:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=XvW5RdxIXCvvUEXQw9N5TAMqS7f8GIIE6ExF5q/Byl0=;
        b=vIwjeq/leFzlcvsPnU3Mf50m0mnZBXZABaQSTEfB3pdBtX+eRG9nC4ElzzUKLe1Kct
         WjvuPqwn9UoT0NyVMSR4/iS4R2e5kYk8uzR/fD8put93MzBzVp0xsaTQNDd1RRUajBvA
         mcRZ5RLOSlvPncrhaKz5WJLo4icACKceXGqgC5o+Vcws7cG/wyiN+BEOZafM42sVJtz9
         MYxQrEyx39YVqqTJf46ITbtggXAilh0RkAlotzVPDwSLe0ASkH+px4W8Mz/e3chylSae
         CaW53GsAH2gozpOIbxa4v6/FpGxnIpHAaxPSVyC2i3r3sFR5kKzin9K6xHfqT8XN3g8S
         Qqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XvW5RdxIXCvvUEXQw9N5TAMqS7f8GIIE6ExF5q/Byl0=;
        b=DzSYefWc5LYrmJaVSao/f7xa4ejqQmT4HGuibjUfiE6EM3C2GetFqGojfCnynlBEqt
         pdPdvYPFb7UZlPRySv2MOrvC1kRum8CgOTLWwl6gekef4BPVxGGX9ssQPzZlAl+jt+qL
         loxxmL9dgOhxfOn/c2W6b/Pj1j2e5TYtsOtDwSuQ/gsZdwbgwaU4Sb5qVxej+TRwRzIJ
         xBFMnTpfTOzpZFCqWcaDVntK1TucEEtsHS73gkZaJOHl+6R5DfSkVWoudmaTPwAFD3VH
         XmRacQyq1O9oMWPNgcFdhcxjKQ5vuyPB07wYDsoHFXnklgM90UUeLcyeUDSWiisAzBYC
         JQ2g==
X-Gm-Message-State: AOAM531PBNFDayjmyX+gScgGRNw/II5Ew/DD9EOc6oNGQGXjLIkpWmXe
        G/bH3tLfX2CYSZMiZvBMERwIZc98uH76nA==
X-Google-Smtp-Source: ABdhPJyhrmO5HMceXp2p1CU7l6pspj8td8qoo1UtpRcORyJQeCJZd4JB8hjOrhzz/FIaaQ49/JYG7w==
X-Received: by 2002:adf:d085:: with SMTP id y5mr5759773wrh.41.1612538849483;
        Fri, 05 Feb 2021 07:27:29 -0800 (PST)
Received: from localhost.localdomain ([37.168.146.85])
        by smtp.gmail.com with ESMTPSA id t15sm8967796wmi.48.2021.02.05.07.27.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2021 07:27:29 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        ivan.zhang@quectel.com, naveen.kumar@quectel.com,
        mpearson@lenovo.com, cchen50@lenovo.com, jwjiang@lenovo.com,
        ivan.mikhanchuk@quectel.com, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Date:   Fri,  5 Feb 2021 16:35:26 +0100
Message-Id: <1612539327-8580-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
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
index 8187fcf..acfce50 100644
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
 #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
 	{					\
 		.num_elements = 128,		\
@@ -182,9 +212,52 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 16, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 16, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 16, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 16, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 8, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 8, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 8, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 8, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_quectel_em1xx_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0),
+	MHI_EVENT_CONFIG_DATA(1),
+	MHI_EVENT_CONFIG_HW_DATA(2, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 101)
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
+	.edl = "quectel/prog_firehose_sdx24.mbn",
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

