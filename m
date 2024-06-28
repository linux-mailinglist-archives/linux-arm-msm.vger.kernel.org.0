Return-Path: <linux-arm-msm+bounces-24567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9143991B888
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351F31F220A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E983313FD9C;
	Fri, 28 Jun 2024 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MxypDuw4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F393B29D;
	Fri, 28 Jun 2024 07:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560221; cv=none; b=dGOvB3oBHcOQF36FjJK2S8bEv1VoNQXZmsS45gQPtU0bCB+CULze3fMjFcyZF/Ot1YL/3uaqeHc/lFyzRURWCgdWvam7De+2hNKlMMW/aqvf7Wl1qMNLusPgq6Upwn7pzAsmU+J+U3lq8j9LDRO79YO8knv/0tLKnKBhenSDzFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560221; c=relaxed/simple;
	bh=92AGGsrcbotljDKeMUOW1yDTBBo1NNwetVgmd8RhVRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HY0VrTMA7JNK9l3uhw4ToOGZOz6vB7ZuGZRC0aO91gRjNl9cAEwblpAPKcaFJAwq00Of8wuH9MJmHj+6qRHd2Wm3BJE++yeFjtk5/4Vr5aW/wPpHyrwGg9j/Eji40ndcf2ikFxA25JwmwpZayAP4bwmEVr+lG7Dbz+o2oGQQPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MxypDuw4; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qOVWR
	6aXQqry3nItjJ+e8OBR8po78qC5/g5g+JfJjCI=; b=MxypDuw48EkSGFXIK/dnP
	LsAsEAto02A5B4vqM23ACVUX7OuUa9pXMH/cL+UEc/AW6edPk/ZESoff5aBzZrvv
	TlNusJkKPkjOLmjO72xfQTGNeUkt+tV6QyR5WAw22z5DDTsoUZPmg/ha8pu/ncjM
	EauPW59a9sI7ybgdSB5aHE=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wD3X37sZ35mLRo3Ag--.8195S2;
	Fri, 28 Jun 2024 15:36:14 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	quic_jhugo@quicinc.com
Cc: netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3 1/3] bus: mhi: host: Add Foxconn SDX72 related support
Date: Fri, 28 Jun 2024 15:36:05 +0800
Message-Id: <20240628073605.1447218-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X37sZ35mLRo3Ag--.8195S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxur15Kry7Zw47JF4rKw4UArb_yoW5KrykpF
	s3Z3yUta1kJFWrKFW8A34DG3Z5GrsxCr93KFnrKw1Igw1Yy3yYqFZ7K342kryYy3sFqryS
	yF95WFy293ZrJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRu6wZUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQ8MZGV4IU3ZaQAAsT

Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
And also, add firehose support since SDX72.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: (1). Update the edl file path and name (2). Set SDX72 support
trigger edl mode by default
v3: Divide into 2 parts for Foxconn sdx72 platform
---
 drivers/bus/mhi/host/pci_generic.c | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 35ae7cd0711f..1fb1c2f2fe12 100644
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
 static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.name = "foxconn-sdx55",
 	.fw = "qcom/sdx55m/sbl1.mbn",
@@ -488,6 +500,28 @@ static const struct mhi_pci_dev_info mhi_foxconn_dw5932e_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_t99w515_info = {
+	.name = "foxconn-t99w515",
+	.edl = "fox/sdx72m/edl.mbn",
+	.edl_trigger = true,
+	.config = &modem_foxconn_sdx72_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
+static const struct mhi_pci_dev_info mhi_foxconn_dw5934e_info = {
+	.name = "foxconn-dw5934e",
+	.edl = "fox/sdx72m/edl.mbn",
+	.edl_trigger = true,
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
@@ -720,6 +754,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5932e (sdx62), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0f9),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5932e_info },
+	/* T99W515 (sdx72) */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe118),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w515_info },
+	/* DW5934e(sdx72), With eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11d),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
+	/* DW5934e(sdx72), Non-eSIM */
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1


