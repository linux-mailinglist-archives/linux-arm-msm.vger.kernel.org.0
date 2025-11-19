Return-Path: <linux-arm-msm+bounces-82452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4DEC6D824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 7F6042D406
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 08:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8272FF140;
	Wed, 19 Nov 2025 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SdWaPX4c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594CC2FD69B;
	Wed, 19 Nov 2025 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542082; cv=none; b=vAI86f+zMDa/qqArxV4MqjPWv4lSUXxZxkJRcEZLYeZgvU/ioqFU8TBCPSTScFFxrc7aW9aodVtxHIxPpun8x9/VRpCZRnJCM1D2ubRoxuyS3IHDid1pripuU1qQg7lNwC418zzkYIR3JGewn2iTG6AspxlvKFG5+YiHpmLOQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542082; c=relaxed/simple;
	bh=O49iELD3kyWCfrVpGVJs1lLgucO8zwXquiJoldaJSL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hkVLU2mHhmfg7ISAvxiCzVadprxVGHaigXbOqarYBi9rpUmtPGxnSton7WwEq6kkgJ766v1ZwWAqnt2GR2wV+4WOabLo5llh9bAIcFFyYMV34TurQmupWstpQSMT4tnowfJtkk5UYgWL0u8fHtJVOTL7tPa66KsrgwgzemgZMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SdWaPX4c; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Yk
	wwP38JHvCo882DSvkKjOiqTTOePIZx3hF9olcucO4=; b=SdWaPX4cYP7XxWw8l3
	KfkmF/59458iQsIX9p/ktixD2w8XrRv4AxbKPKY2WfuIEYnhIuswTmpsNnbHOiVe
	8LOdlpe3bVViNf4ZrwueCfBAAhbQp5YWrGcK8jvOdmdY7nvS0R1H/L5VPW3TvEkn
	XV1UXWLWnT677lmRGnLfC3ajM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3X0r0gx1pAgHiBA--.132S2;
	Wed, 19 Nov 2025 16:46:47 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: mani@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v2 1/2] bus: mhi: host: pci_generic: Add Foxconn T99W760 modem
Date: Wed, 19 Nov 2025 16:45:37 +0800
Message-Id: <20251119084537.34303-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3X0r0gx1pAgHiBA--.132S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWxWF1ftr4fAFy8Wr4kZwb_yoW8Ar43pF
	4F9rWjyF4vqr45ta1vyryDuF95GwsxC347KFnrKw12gw4qyrZ0qrs7Kw12gF1Yva95XF4S
	vFyUWF9Fg3WDtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRuT5PUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbibgULZGkdgCFb5gAAss

T99W760 modem is based on Qualcomm SDX35 chipset.
It use the same channel settings with Foxconn SDX61.
edl file has been committed to linux-firmware.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
v2: Add net and MHI maintainer together
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


