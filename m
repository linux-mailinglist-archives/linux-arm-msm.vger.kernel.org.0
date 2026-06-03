Return-Path: <linux-arm-msm+bounces-110907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sL2COmXXH2pzqwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:27:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BAB63532D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 09:27:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=dDat0cUL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110907-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110907-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8CAD93093136
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 07:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096B238AC88;
	Wed,  3 Jun 2026 07:07:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0455638887B;
	Wed,  3 Jun 2026 07:07:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470423; cv=none; b=bFoQZ8WmwTHWBZ0U978MurbLTYFR4KPpBLE2w/3792678DBZQ9Be4Er/iI7f0ocv/A71om/g7TRLh6mPre43/lKMzh3P6sxtzL8F+iAS+RWKxgSeHiDGQe45fTPpPMmcjNp2UZhmBe2SeJQHEcLrHsG5ItpkKcXnR9KmNnImIL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470423; c=relaxed/simple;
	bh=iUt9cva/HldmvJgAfO9LfYPdbw+C7kceZVn8qe7pjXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDO0pRDXle45Zzevf6n8AipHkkT0eMkAW+RcCYqMN6nvQeHuC+F7viOklX9moWPRPwUNfU/3qAz8Qf9LUpCcjiEHsWtd5iPyOmd21bKa6a/ofXIgEYg7TNvcXqNXWvpBCydH4r8+zsZnFxf4741TOIRiLe2tZOfuJnPTPpyoNKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dDat0cUL; arc=none smtp.client-ip=220.197.31.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Hb
	dooL8DwyY6Ng904lfjBSnbeiNymW6BuXU/xHnCYbY=; b=dDat0cULPDHgeT9YfJ
	f5MrSOoBmxbItFGoAUOPmlQIT5rZ/nkzhjXOHjpnRbKq4bHwAYkdA4wRofsf9x42
	HcLfI+GSeEOf+XA3XaBbOGqEsJgE4Ct3oScH3YlNr/jNUaFMOQao2mXygDH+xV3V
	1x4KCwNOMkfDpDpGYfjqihn5Y=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wB3F3Rk0h9qXG1vBA--.18132S2;
	Wed, 03 Jun 2026 15:06:16 +0800 (CST)
From: zwq2226404116@163.com
To: mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org
Cc: mani@kernel.org,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	kuba@kernel.org,
	Wanquan Zhong <wanquan.zhong@fibocom.com>
Subject: [PATCH 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
Date: Wed,  3 Jun 2026 15:06:08 +0800
Message-ID: <20260603070608.309114-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3F3Rk0h9qXG1vBA--.18132S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF1xZryfGw4fuw1fZw47Jwb_yoWxuF15pF
	WfArZ8tr4kJw15Xay8A34kGF9Y9an8G34UKrnrKw1Ig3WFyw48X3y8K347trWYvw1vqr1S
	gFn0kry7uanrJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0gkxiGof0mnXdQAA3O
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110907-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zwq2226404116@163.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,gmail.com,lunn.ch,davemloft.net,fibocom.com];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zwq2226404116@163.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4BAB63532D

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support

Add MHI PCIe device configuration for Rolling Wireless modules:

- RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW0
- RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes

Register PCI_DEVICE_SUB entries for vendor 0x2099, device 0x1300/1301 on
QCOM 0x011a (sdx35) and 0x0309 (sdx75) respectively.

Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
WWAN_PORT_ADB port via the wwan subsystem.

Tested-on: Rolling RW135R-GL / RW151 hardware (MHI probe, MBIM, DIAG, ADB)

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>
---
 drivers/bus/mhi/host/pci_generic.c | 100 +++++++++++++++++++++++++++++
 drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
 2 files changed, 101 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77f..ad166de2d0f3 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -902,6 +902,94 @@ static const struct mhi_pci_dev_info mhi_netprisma_fcun69_info = {
 	.sideband_wake = true,
 };
 
+static const struct mhi_channel_config mhi_rolling_rw135r_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static struct mhi_event_config mhi_rolling_rw135r_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
+};
+
+static const struct mhi_controller_config modem_rolling_rw135r_config = {
+	.max_channels = 128,
+	.timeout_ms = 8000,
+	.num_channels = ARRAY_SIZE(mhi_rolling_rw135r_channels),
+	.ch_cfg = mhi_rolling_rw135r_channels,
+	.num_events = ARRAY_SIZE(mhi_rolling_rw135r_events),
+	.event_cfg = mhi_rolling_rw135r_events,
+};
+
+static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
+	.edl = "qcom/sdx35m/prog_firehose_ddr.elf",
+	.name = "rolling-rw135r",
+	.config = &modem_rolling_rw135r_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
+static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
+};
+
+static struct mhi_event_config mhi_rolling_rw151_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
+};
+
+static const struct mhi_controller_config modem_rolling_rw151_config = {
+	.max_channels = 128,
+	.timeout_ms = 50000,
+	.num_channels = ARRAY_SIZE(mhi_rolling_rw151_channels),
+	.ch_cfg = mhi_rolling_rw151_channels,
+	.num_events = ARRAY_SIZE(mhi_rolling_rw151_events),
+	.event_cfg = mhi_rolling_rw151_events,
+};
+
+static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
+	.edl = "qcom/sdx75m/prog_firehose_lite.elf",
+	.name = "rolling-rw151",
+	.config = &modem_rolling_rw151_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+	.edl_trigger = true,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
@@ -909,6 +997,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FN920C04 (sdx35) */
 	{PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2020),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn920c04_info },
+	/* Rolling RW135R-GL (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
+	/* Rolling RW135R-GL (sdx35) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw135r_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, PCI_VENDOR_ID_QCOM, 0x010c),
@@ -941,6 +1035,12 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990B40 (sdx72) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1300),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1301),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx75_info },
 	/* QDU100, x100-DU */
diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
index fa73861db6ad..c0bba94d5c3f 100644
--- a/drivers/net/wwan/mhi_wwan_ctrl.c
+++ b/drivers/net/wwan/mhi_wwan_ctrl.c
@@ -264,6 +264,7 @@ static const struct mhi_device_id mhi_wwan_ctrl_match_table[] = {
 	{ .chan = "DIAG", .driver_data = WWAN_PORT_QCDM },
 	{ .chan = "FIREHOSE", .driver_data = WWAN_PORT_FIREHOSE },
 	{ .chan = "NMEA", .driver_data = WWAN_PORT_NMEA },
+	{ .chan = "ADB", .driver_data = WWAN_PORT_ADB },
 	{},
 };
 MODULE_DEVICE_TABLE(mhi, mhi_wwan_ctrl_match_table);

--
2.43.0


