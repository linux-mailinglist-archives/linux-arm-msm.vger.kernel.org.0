Return-Path: <linux-arm-msm+bounces-19636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C74428C1CFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 05:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82444283FC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 03:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BB7148FFA;
	Fri, 10 May 2024 03:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jm0m7fbP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B80F1148FE0;
	Fri, 10 May 2024 03:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715311651; cv=none; b=YrU+XhHcnVNevkjJ3jpsDc81CXelbsnXfEjVFVCAQzYkfffrumVz1bjkPpevXDQQiSAJ0hQvQxaX5ZNxEk8BHbqOuuA6pjVebu+nVwbDrFKCwEGEx5FEIiSwM1XRnEyY4jBYBcdOAGZEmZUvUK1yTO1d41dEmGWALj1grvxfvUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715311651; c=relaxed/simple;
	bh=Z7MPoeMmZKPqqjt1uSdl2xiWuJE7dBoYnnwX8FfM10I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fNtIEsqemEcMjNNLPexHjZ4QD+0tdyv0V+exF6HbmQve1Mr/KUHNu6RPtP7Jwp41TgXkQyQQ/9fbgstrsf/zcAEGR7bBsObPBYRVB/RjCSsWi2dnsaG6LVRSuhRpDLd0qJtYjZ7glVuK61jdYgXC/KkJ8jOn4nLMI7Lr1PklYgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jm0m7fbP; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=jmv/e
	Z0oj6B9M++CEv1uezXK3yVeNwJfrJ1xXJUCHHw=; b=Jm0m7fbPXu0lXqMbkZT9w
	IKXhJc7PNi/cQY/OTENlzVL6iZ7cXI0yh8O5Wk+32uWHQhi9swJPOx/cICXEq0Fw
	kPrGqbiOFhG7Pu/FXV1c48TADth5GCueSh/KOqndlFDFoa4bBdmv9z4hcwOzsYy4
	GAiih1dCm64MfJXbDJX8xo=
Received: from localhost.localdomain (unknown [223.160.225.215])
	by gzga-smtp-mta-g2-5 (Coremail) with SMTP id _____wD3H9EDlD1mCPkAAQ--.22491S2;
	Fri, 10 May 2024 11:27:00 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: Add Foxconn SDX72 related support
Date: Fri, 10 May 2024 11:26:57 +0800
Message-Id: <20240510032657.789629-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H9EDlD1mCPkAAQ--.22491S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW3JFy7Xr4rGr4UZr45Awb_yoW5CrWUpF
	4fZ3y5taykJrWFgFW8A34DGas5Jan3Cr9xKFnrKw1I9w1Fy3yYqFWkK342gFyYy34qqFyS
	yFykWa4a93WDJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHlkcUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiowXaZGVODTtkoAAAsB

Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
And also, add firehose support since SDX72.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08844ee79654..0fd94c193fc6 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -399,6 +399,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
@@ -419,6 +421,16 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
 	.event_cfg = mhi_foxconn_sdx55_events,
 };
 
+static const struct mhi_controller_config modem_foxconn_sdx72_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.ready_timeout_ms = 50000,
+	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
+	.ch_cfg = mhi_foxconn_sdx55_channels,
+	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
+	.event_cfg = mhi_foxconn_sdx55_events,
+};
+
 static const struct mhi_pci_dev_info mhi_foxconn_sdx24_info = {
 	.name = "foxconn-sdx24",
 	.config = &modem_foxconn_sdx55_config,
@@ -448,6 +460,16 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
+	.name = "foxconn-sdx72",
+	.edl = "qcom/sdx72m/xbl_s_devprg_ns.melf",
+	.config = &modem_foxconn_sdx72_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config mhi_mv3x_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
@@ -680,6 +702,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5932e (sdx62), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx65_info },
+	/* T99W515 (sdx72) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
+	/* DW5934e(sdx72), With eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
+	/* DW5934e(sdx72), Non-eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx72_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1


