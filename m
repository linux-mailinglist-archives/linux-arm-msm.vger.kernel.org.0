Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17E9E314C08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 10:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhBIJqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 04:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbhBIJob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 04:44:31 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45EBC061794
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 01:43:45 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i5so2452132wmq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 01:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/vf1mB4T1/394CEX0VM8YVRJCvYayOVx/u5Plqvs+cE=;
        b=MwkMTrh+ujHGUEPEYew4i7QwVZEO8njwpnxjPqFZ7mH1YX/KoilS6srOdbeu27ap2I
         xqsKI87n/I36gtKKApdoZwxw7XIVEIQNljiTtYR3MAXVQfA6ZqJJefWIyLsmpLUsaSzL
         GD26RgF6u4JuL/HK4JkGOjHHWhPM24avbePJQs5Ih+wyHHKGQlfDxnhk+vXEZWSjVsle
         ukqBct7asalytvxSCxCsX1gRTysbMAKQnlLGl4nrSdZu8UUjakWcEksn5i2AXxninfQG
         MBko+lbhW4VxlgZqtfDr7bPohq5YIZukMxhmYn7aQut+6TKnJI7u4lHQ4N+P2S+MXo56
         qTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/vf1mB4T1/394CEX0VM8YVRJCvYayOVx/u5Plqvs+cE=;
        b=UiOlJCJGUMtykXBA/VPs8IOAc9Xj315o3/kSo+trsT5TArFGeb/qCc6z1iov+p8llM
         cEMdvuDhQqzAPrQIrBbTMLRgtJlwKLJcJ5zbaspOiDKrwjEAmItIe36tYCiBu5uSjkk4
         Tw/CXNqNhG6bh0hgaSy8YGgJNZ8+c2kNIzoJd7Waaymigww8qNIByTkHvit1FR/mfdBk
         Rfjvp8OmRd0BUllgxVmDc9w13/il0vRLGpB+VO7immzP1xwyk0TndWt52qec7/mmdlff
         SNVCjyQJvIt2NtNioiC2jWaWs3fIMjpiYWNydSWAfruuZgRPZFg4Cr11Uidm+reaOIyD
         mHmA==
X-Gm-Message-State: AOAM531HdNTP7aRn554u618V/o7iNviW9OO3VBd6qqkehhBGofGRPlyr
        Fwk4yrSwou/yrZV5pPAV7uztyw==
X-Google-Smtp-Source: ABdhPJzZN8wfrZLORvmD7A+8UQfVlVqtB4qnxVW1K6GmnEQbhCvUJBg+xI7bEHtA6+iOvuwNzcrTDQ==
X-Received: by 2002:a1c:9cc5:: with SMTP id f188mr2480339wme.171.1612863824585;
        Tue, 09 Feb 2021 01:43:44 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u3sm39444168wre.54.2021.02.09.01.43.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 01:43:44 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        mpearson@lenovo.com, cchen50@lenovo.com, jwjiang@lenovo.com,
        ivan.zhang@quectel.com, naveen.kumar@quectel.com,
        ivan.mikhanchuk@quectel.com, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Date:   Tue,  9 Feb 2021 10:51:46 +0100
Message-Id: <1612864306-10108-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612864306-10108-1-git-send-email-loic.poulain@linaro.org>
References: <1612864306-10108-1-git-send-email-loic.poulain@linaro.org>
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
 v2: Specify 256 elements for the hardware event rings

 drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c58bf96..56bd9ed 100644
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
+	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 16, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 16, 0),
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 16, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 16, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 16, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 16, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 8, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 8, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_quectel_em1xx_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 256, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 256, 101)
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

