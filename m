Return-Path: <linux-arm-msm+bounces-20046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDC28C991A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 09:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E48E41F2150E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 07:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A3211CBD;
	Mon, 20 May 2024 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pKKrNGmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20034C70;
	Mon, 20 May 2024 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716188831; cv=none; b=IvhcAnLpCGC2LrMjk2wxh4SPNrtWA7dqXTHGfW6A07iCr3K34zfebht9eZtL22QgqYlSHq7NPvSNZns5n1F3Ifm7G8T7Aosa4xRdFWkIzrnvZA1AvCa1zaAx96hFggFFezZ7PNY9yqrjP8Yw8hkE2gEKaw+Z+vvxPjeyp/+m3b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716188831; c=relaxed/simple;
	bh=+SQnDsrQshCUMPZhNcFttAuWI2VGZr6oshXOUoVJ8k0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pwjPnTmnKYxxqPYVQHpRVXJ/QS1/oy8dwdCuqKVhUikozgSTGEs11s5cJxGaB8HcnQsPn+7Knvo7CjWfuqBgxZr/TYR5krKBnZujDfxFqv9L+UgR64KQ3iPn/IwFS0kqHZd+k6+vVCVLWvn6ywd2BMOx54I1/+J/K0FQconMooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pKKrNGmp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pHH88
	A1P/mDNm/sXFTsJk7x3nuIXe5Q5qI2FV5mexhE=; b=pKKrNGmp/WkrLiCx3zg5F
	RDaT6zDuN4hbcSbgJcWs9gX13538+6RCt81IIpmz50QtNiusyiFc8dalozGAj5Ln
	TBlwhxFtQpHyiEjh4kFyvckkhrqym6WpaFhUALf6qcYarBnALlKsJjoPxN3iQZbc
	PRpCANJEATvDrbGYeFDBn8=
Received: from localhost.localdomain (unknown [223.104.68.214])
	by gzga-smtp-mta-g2-2 (Coremail) with SMTP id _____wDnj2p+9kpmpwTbFA--.11787S2;
	Mon, 20 May 2024 15:06:40 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2] bus: mhi: host: Add Foxconn SDX72 related support
Date: Mon, 20 May 2024 15:06:33 +0800
Message-Id: <20240520070633.308913-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnj2p+9kpmpwTbFA--.11787S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw1kJr1rur48uF4rtw48tFb_yoW5Zr47pF
	4rZrW5taykJrWYgay8A34DG3Z5Jws5Ar9xKFnrGw1Ikw1Yy3yYqFWkK3429ryYy34qqFyS
	yF95WFya93WDJF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRLYFAUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQTkZGV4HrV-SwAAsz

Align with Qcom SDX72, add ready timeout item for Foxconn SDX72.
And also, add firehose support since SDX72.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: (1). Update the edl file path and name (2). Set SDX72 support
trigger edl mode by default
---
 drivers/bus/mhi/host/pci_generic.c | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08844ee79654..0b483c7c76a1 100644
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
@@ -448,6 +460,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx65_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_sdx72_info = {
+	.name = "foxconn-sdx72",
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
@@ -680,6 +703,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
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


