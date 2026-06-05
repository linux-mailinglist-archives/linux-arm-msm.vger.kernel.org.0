Return-Path: <linux-arm-msm+bounces-111350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZ29OUSfImpsbAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:04:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D57647297
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:04:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=FPwECyRv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4ED3F30214E0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 09:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C403D6CD4;
	Fri,  5 Jun 2026 09:58:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DC3B71A5;
	Fri,  5 Jun 2026 09:58:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780653504; cv=none; b=FErWd86S1fmq/euNjQfn/tkf361e2D6feYlA8v/U4Le3a28zxYeIVUFEfLHPBAdwJ4aDQQSGaVeajQdFHyCyWqGSKyF7duCuW1XOR+zUwUuo3Il5Q9Be4q1U1r1x5GTHb7aSvR4iPDJFV8njSBQ1B5fIYTEfHv6hQjuoVgpK2Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780653504; c=relaxed/simple;
	bh=KmQPYPTu3mQHVoyfQbelJ6r9taSzfQqCFzOxPI6Xtcc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tn8LGVmjpE4AkVJfMO4g4nFwPz4cmM9MIVnlqr72AeX/OuvaDdkZ9A/vkJDnAMAaq59TjPHIpfEHVgRd1e5AvPhTUGWDvaPG9eVkxUuDigxDFyIt4rEqWoGDFlZFwkhSHk2lKtJSjOvPDUI8ARn9ug5VghKCrXmNuLXTGNZSqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=FPwECyRv; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nJ
	CJSHM+rgokK858/r+A5GI/Jgr9ND8rbx+1VK3BdUI=; b=FPwECyRvYu5A+0weC0
	YBFy8Rf8aZ0cWvFxiXoiIUG9MlSS8U2WJksFfKyGoRJqbG60c4SVwSsl8C7MOJHO
	6vSkmseWTpVE91+w8p8SX7TJdRMwVxmWT+hdlxUTQKoP4284V+iZxZepM1jqbdic
	MCt1tT4B6Jy7KWuynXox+ifJg=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDHXrWCnSJq3olXAg--.16837S2;
	Fri, 05 Jun 2026 17:57:27 +0800 (CST)
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
Subject: [PATCH v2 1/1] bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support
Date: Fri,  5 Jun 2026 17:57:18 +0800
Message-ID: <20260605095718.3040-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDHXrWCnSJq3olXAg--.16837S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF17ury8CFyUGF4DArWDArb_yoW3AFy8pF
	WfArW5tr4kJr15uay8Ary8GF9Yvan8G34UKrsrKw1Igw1Fya10qrW8K347trWYv3yvgr1Y
	gFn0krWxuanrJrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0QisBGoinYgm6AAA3i
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111350-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[zwq2226404116@163.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:mani@kernel.org,m:loic.poulain@oss.qualcomm.com,m:ryazanov.s.a@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:kuba@kernel.org,m:wanquan.zhong@fibocom.com,m:ryazanovsa@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1D57647297

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

bus: mhi: pci_generic: add Rolling Wireless RW135R-GL and RW151 support

Add MHI PCIe device configuration for Rolling Wireless modules:

- RW135R-GL (Qualcomm sdx35): MBIM, DIAG, DUN, NMEA, FIREHOSE, ADB, IP_HW0
- RW151 (Qualcomm sdx75): same channel layout with adjusted ring sizes

Register PCI_DEVICE_SUB entries per chipset:
- RW135R-GL on QCOM 0x011a (sdx35): sub-vendor 0x2099,
  sub-device 0x1300/0x1301
- RW151 on QCOM 0x0309 (sdx75): sub-vendor 0x2099, sub-device 0x1500;
  sub-vendor 0x103c, sub-device 0x8fb8/0x8fb4

Use Rolling-specific EDL firmware paths under qcom/sdx35/rolling/ and
qcom/sdx75/rolling/.

Enable the ADB MHI channel in mhi_wwan_ctrl so userspace can access the
WWAN_PORT_ADB port via the wwan subsystem.

Tested suspend-to-RAM (mem) on Rolling RW135R-GL and RW151 hardware: MHI
resumes cleanly and MBIM/wwan function after wake. Hibernate (disk) could
not be tested on this platform (/sys/power/state lacks "disk", ENODEV).

Tested-on: Rolling RW135R-GL hardware (MHI probe, MBIM, DIAG, ADB,
suspend-to-RAM)
Tested-on: Rolling RW151 hardware (MHI probe, MBIM, DIAG, ADB,
suspend-to-RAM)

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>

---
v1 -> v2: Correct Rolling EDL firmware paths; fix RW151 PCI subsystem IDs;
         document suspend-to-RAM testing (hibernate N/A on test platform)
 drivers/bus/mhi/host/pci_generic.c | 103 +++++++++++++++++++++++++++++
 drivers/net/wwan/mhi_wwan_ctrl.c   |   1 +
 2 files changed, 104 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0884a384b77f..d598bb3b3981 100644
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
+	.edl = "qcom/sdx35/rolling/prog_firehose_ddr.elf",
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
+	.edl = "qcom/sdx75/rolling/prog_firehose_lite.elf",
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
@@ -941,6 +1035,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* Telit FE990B40 (sdx72) */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fe990b40_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
+		.driver_data = (kernel_ulong_t) &mhi_rolling_rw151_info },
+	/* Rolling RW151 (sdx75) */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb4),
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
2.50.0


