Return-Path: <linux-arm-msm+bounces-59672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58888AC65C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05B4AA238F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5C5F277807;
	Wed, 28 May 2025 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Stkx4be7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22728152E02;
	Wed, 28 May 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424184; cv=none; b=T445n1joH1iGjSfsQxzWurA98ZkE4ss1Fp7Dv6s9loxGjO5IBFNyrlpOIb/H5z/iUpJLJiY//2hzErlJ1mdbGFTM9RxJeVLLC6igTqxJ5ypYJvSb74VrtKriz6xMOUCx//t5zvzKF6TpEdPHJcR6Vx4Vx03Ek8Qh6imaJWBm04I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424184; c=relaxed/simple;
	bh=xkNiKYgODlSY9yyRlPkx7iULzopxvQVIpmtbhyv/rTA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=msDDlPNC0r6X/BslLLZ0OK0JHoBfaLBZaFFX9m79u8Gt/615dEWiz1iAQ5QBjKlhV5HC5kEQHtkS2wRvFPUtaW8HLthh0fdF6X6iMt2vs3ro4wuDKK6XV6eOomMtjx7EJZq22jSvonkVOfbfVQ1rhwJk1VwTvqI4y6H9/yhoXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Stkx4be7; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3j
	2smcIYQQg9AX7JiG4sdGXoPpomEDE53IFAHBoEZdQ=; b=Stkx4be72PteeZ5DEC
	pUc8I/3Ny1Yl2Ef5+6aAVkKppN+yqCG5TG6caQ2p7uA/oUqzqjwmuMS7DFVxwglL
	rmo9+rpG4dx5KbEvBF0DmIUmbcNGSO9fE5bg+M2Nwmwu1eqnpJ6vyTL44TV3MRWp
	g7zTe2TeU2Fs6Z8Ouf/lTCsqw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wCnjVLa1TZoOyU7Eg--.4046S2;
	Wed, 28 May 2025 17:22:35 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	johan+linaro@kernel.org,
	mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Add Foxconn T99W696
Date: Wed, 28 May 2025 17:22:32 +0800
Message-Id: <20250528092232.16111-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnjVLa1TZoOyU7Eg--.4046S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF13Cw15Kr4kZw4kWF43GFg_yoWrurWkpF
	WIv3y5KrWkJa1Fg3y0y34kKas5Zan3Xr93Krnrtw10g3WYk3y5XrWkt342qFWYv34qqrWI
	vFykuFy7uanrJr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRqsUtUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1S2mRxpbZGg2zteGcAABsS

T99W696 is designed based on Qualcomm SDX61 chip which is a cost
down chip refer to previous SDX62/SDX65. Though we have a support
on SDX62/SDX65, we create a new channel config for SDX61 since
we add a NMEA channel support from this product.
For new products we are allowed to customize the subVID and
subPID only.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: Correct the ch_cfg as sdx61 channels
---
 drivers/bus/mhi/host/pci_generic.c | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index a4a62429c784..a90ab31c46a9 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -490,6 +490,23 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
 };
 
+static const struct mhi_channel_config mhi_foxconn_sdx61_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(50, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(51, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
 static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
 	MHI_EVENT_CONFIG_CTRL(0, 128),
 	MHI_EVENT_CONFIG_DATA(1, 128),
@@ -506,6 +523,15 @@ static const struct mhi_controller_config modem_foxconn_sdx55_config = {
 	.event_cfg = mhi_foxconn_sdx55_events,
 };
 
+static const struct mhi_controller_config modem_foxconn_sdx61_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx61_channels),
+	.ch_cfg = mhi_foxconn_sdx61_channels,
+	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
+	.event_cfg = mhi_foxconn_sdx55_events,
+};
+
 static const struct mhi_controller_config modem_foxconn_sdx72_config = {
 	.max_channels = 128,
 	.timeout_ms = 20000,
@@ -615,6 +641,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_t99w696_info = {
+	.name = "foxconn-t99w696",
+	.edl = "qcom/sdx61/foxconn/prog_firehose_lite.elf",
+	.edl_trigger = true,
+	.config = &modem_foxconn_sdx61_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config mhi_mv3x_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
@@ -863,6 +900,21 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990A */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2015),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990a_info },
+	/* Foxconn T99W696.01, Lenovo Generic SKU */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe142),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.02, Lenovo X1 Carbon SKU */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe143),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.03, Lenovo X1 2in1 SKU */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe144),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.04, Lenovo PRC SKU */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe145),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
+	/* Foxconn T99W696.00, Foxconn SKU */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_FOXCONN, 0xe146),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w696_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
-- 
2.25.1


