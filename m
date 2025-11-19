Return-Path: <linux-arm-msm+bounces-82414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 034EAC6C955
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 155352C6EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114922E9EC7;
	Wed, 19 Nov 2025 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oSRnvduV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0248CFC;
	Wed, 19 Nov 2025 03:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522626; cv=none; b=aSh4qRBgzh5uWhWKnLOnscAlzFeFmZXoCzHsbDmXlQXJC4FH5m9uCLNMkTEoUY3xcOhXno2NrZA19TqzCY8mTii1RiVzBjNQc52yuGmvI7+hVYfgM8j9LY+bp94Tc3Vo8c/gLMOW2MzP5qW4q29Cd2MbKuEaaSSKvsjkERNHC+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522626; c=relaxed/simple;
	bh=ZCpiVAVxhb1YiBPCTVKjzdj9RiGRlirVoDs1YOS/wpY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UGLIJGYClfYw+HCyZgkfjwMovX1zCv2zx1krFdSURrjh/9GYv98Tm+LGhQuxd3xR4f/VK0WhcYqwj5Il70wmenB3oXhuANhRg2F2sd0PQEYvg+0inx+9I2icKpxuVHHFKg9VMfkCe2XXCsKK1G1rldUX2tvqDCxO/xhoFNQpU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oSRnvduV; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=WT
	32kMdgOLoeNtu5hoZ13GATzOZ7OID01JPDzDmZTZk=; b=oSRnvduVMZw15vEV4N
	PskiAwFlE6nrTG1nuu3Klms89L1Xwhs8adbSjKQsWziajzOurkvhYMlotetdZlZx
	VTF0bLjYXON4jaWJ+XkAcbBwc8+UTKnCjElAIgjURTCzDvxw0SWiWOp5qM7dbIAK
	3+ttvL337KaFwYpip6tB5kxRk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAH7AkjOB1pu1UWEg--.29172S2;
	Wed, 19 Nov 2025 11:23:16 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
Date: Wed, 19 Nov 2025 11:23:13 +0800
Message-Id: <20251119032313.6119-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAH7AkjOB1pu1UWEg--.29172S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyDXrykZw45ZFW8Kw47twb_yoW8Ww1UpF
	4F9rWjyF4vqr45tw4vyr9ruF95GwsxC347KFnrGw12gwn0yrZ0qrZ2gw12gF1Yva93XF4S
	vFyUWF9Fg3WDtr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRhNVhUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/xtbCwAS4HWkdOCR2XwAA3g

T99W760 modem is based on Qualcomm SDX35 chipset.
It use the same channel settings with Foxconn SDX61.
edl file has been committed to linux-firmware.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 3d8c9729fcfc..e3bc737313a2 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -663,6 +663,17 @@ static const struct mhi_pci_dev_info mhi_foxconn_t99w696_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_foxconn_t99w760_info = {
+	.name = "foxconn-t99w760",
+	.edl = "qcom/sdx35/foxconn/xbl_s_devprg_ns.melf",
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
@@ -1010,6 +1021,8 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5934e(sdx72), Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe11e),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_dw5934e_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe123),
+		.driver_data = (kernel_ulong_t) &mhi_foxconn_t99w760_info },
 	/* MV31-W (Cinterion) */
 	{ PCI_DEVICE(PCI_VENDOR_ID_THALES, 0x00b3),
 		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
-- 
2.25.1


