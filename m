Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19C931CF70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhBPRpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:45:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhBPRpE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:45:04 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB80AC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 09:44:23 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id r21so14159857wrr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ey6o+SyW5jwfdnYEPn/67irudseYw9DtHcmTlyMAwY0=;
        b=qTgRTNsKUsgTuOT1oIOgXsqQAZsSpKkhgJVkV9L35R3cdVQlTL5L63vUojO+gQEchy
         iArnPuYM92aB5flUyPtlszsrpma5Vm0I9Ce8L2O1zNkCHy2axyT6U1Pl7sV7GQ2oIRQ+
         JzcWfFjfzNMmt/NrgkXEgo/Q8nI4X0C92x6nq8bzBRBNLXepprhZL2KmuiLrfve33tmp
         OxNjd0dJLDrK61fgvuV1EyH17hFdC44A5utc9mCP14a0CgKEQDJTchCyz/Mw1cL6iEW9
         KJYJs8AJSIzixiPpJtyZQsXPy/fDtorMLfXzA24DRgvY+aOLMWkthq0rSkx3MOaQZ0bw
         lKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ey6o+SyW5jwfdnYEPn/67irudseYw9DtHcmTlyMAwY0=;
        b=hPX5qVkErIfk64PIUbOkaS/VuYSnJCcOgavenk/frnicW0Cd7dPH2C3tE8XOgTJvr6
         EkcJ+NCbnyb4+nk+1Dy1HNqIIBp/q4D33C2KKrS6IWvyD/58QrUJKt7na+C9lc7kAJbS
         eqEcvQIR7fmJQsqC4wOFehvykofgnv8zIBcHle8a0j5fsF63M/EFtZeJnC9WeJK0wAEW
         sdFsHiB//cBQiD0jlsLhxoz27i7R2RaqMpWnY9K97IuVy6DILVHjXJIAPCAoarjP4p8V
         HkOGPGp+B8L4OAROK1L6eik6xSGu9QKot1i9rtCPEWXhqwqAPBxs+AKxJfWpBBbRP58+
         17jA==
X-Gm-Message-State: AOAM530mpcIZbfsa/RqALvAZ6WBRHVGH7Yb9I63UR1380VEBgXhcygDg
        Rh+EaSQ9SY4XMRvEX8JRhh4ydg==
X-Google-Smtp-Source: ABdhPJyzj5fjV9UUI61Sp1jt/a54lxgg5b+/t8rHvOSLPNie0pmAdBVSyXIqajWdtGeb0lFVJR3KjQ==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr24784495wru.236.1613497462352;
        Tue, 16 Feb 2021 09:44:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:3aa1:8a00:4dc0:cae4])
        by smtp.gmail.com with ESMTPSA id o1sm4042956wmq.8.2021.02.16.09.44.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 09:44:22 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        mpearson@lenovo.com, cchen50@lenovo.com, jwjiang@lenovo.com,
        ivan.zhang@quectel.com, naveen.kumar@quectel.com,
        ivan.mikhanchuk@quectel.com, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 2/2] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Date:   Tue, 16 Feb 2021 18:52:28 +0100
Message-Id: <1613497948-26424-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
References: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
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
 v3: increase hw event elements to 1024 (aligned with downstream)

 drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c58bf96..42b3952 100644
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

