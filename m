Return-Path: <linux-arm-msm+bounces-115625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lDSSKurjRGqn2goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:54:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9757C6EBC42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 11:54:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=Oae3uNUB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115625-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115625-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4DAC3001A5C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 09:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CE713F4137;
	Wed,  1 Jul 2026 09:54:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5700F3B27EE;
	Wed,  1 Jul 2026 09:54:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899684; cv=none; b=Qdx1lt94rbwwaOXH0RUJUfzvPu5bD2an4mQZGDXc3+QBTAFesCzL5LhaosQC1kwp885ULqyC3NV249f1mHJkS7Nav2Y0acyDro9P+USBnyBNUkf/rLI6MTpqGssDQmBb14JNIgTvFLJ1ufK4PxVmdevcAi/aB42AH6Yxkm4E5TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899684; c=relaxed/simple;
	bh=78GZqLBubj8E9uX/o9e6hxnuHbGruLQCoTLyXDTACW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGAOOTeWAArguTgkTUCXkTSa/+4qb7oH+jz4dvmFKmZAymb/7pGsXp7bU+4OBOHH4ilXeHWRuqHyiU1g4kpnccOHczP6z51/YDNq6wwZhc0XIgtgivwOObJXlGDbTsoUHemP1h75qF3MO25IReeSH0LiGXCPbsAhvfVB0YMy/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Oae3uNUB; arc=none smtp.client-ip=220.197.31.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=su
	nDimvKPAGXr1s3eNxIeBtTHJPCyhFgFWGTZXYX4go=; b=Oae3uNUBWnLZyIfBV6
	XXUfuPtOiKuT/5dHMyrN8XZHbgOyWsIJ1n05S3Fh7kwAQPdm9BFQ0ol/X2S0/cU1
	psXXdstEvL5HiIGKvJfN/vB2ypvXop1cWML9HfVeTF5Dlu0Z0xtezlDvzG2lPKz9
	qvsjXQAsEcJ7d6r+6SrcnMgIs=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAnZKKq40RqU6VxHA--.29763S2;
	Wed, 01 Jul 2026 17:53:47 +0800 (CST)
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
Subject: [PATCH v3 1/1] bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support
Date: Wed,  1 Jul 2026 17:53:44 +0800
Message-ID: <20260701095344.309409-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnZKKq40RqU6VxHA--.29763S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFWxCF15ZF18Gr18Gw13CFg_yoW5Gr1kpF
	4SvrWUtr4vvFyF9ay8A3s7GFyrXan8XrZrKF98G34xC34Yy34UtrW0g34agFyYvFZ2qFWY
	vrsYg3yxZF4UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0gvOJmpE46uzyAAA3s
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
	TAGGED_FROM(0.00)[bounces-115625-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9757C6EBC42

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

bus: mhi: pci_generic: fix Rolling Wireless RW135R-GL and RW151 support

- Increase RW151 MBIM channel ring size from 4 to 32

On HP and Lenovo laptop platforms the device probes successfully and
WWAN ports are created, but pci_generic enables runtime autosuspend
(PCI D3hot/M3) after a short idle period. Resume from runtime PM leaves
the modem in MHI SYS ERROR; driver recovery (reset) fails and the device
becomes inaccessible (PCIe config space reads as 0x7f). The failure is not
self-recoverable while runtime PM remains enabled; keeping power/control=on
avoids the issue.

Set no_m3 on RW135R-GL and RW151 so probe does not enable runtime M3
autosuspend for these modules.

Power management testing (separate from runtime PM above):
- Suspend-to-RAM (S3/mem): tested on RW135R-GL and RW151; MHI/MBIM/wwan
  function after wake.
- Suspend-to-disk (hibernate): not available on the test platforms
  (/sys/power/state lacks "disk", ENODEV).

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>

---
v2 -> v3: RW151 MBIM ring size 32; disable runtime M3 (no_m3)
 drivers/bus/mhi/host/pci_generic.c | 4 +++-
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index d598bb3b3981..d0fee7e3ba3a 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -942,6 +942,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.sideband_wake = false,
+	.no_m3 = true,
 	.mru_default = 32768,
 	.edl_trigger = true,
 };
@@ -949,8 +950,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
 static const struct mhi_channel_config mhi_rolling_rw151_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
-	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
-	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(14, "NMEA", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "NMEA", 32, 0),
 	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
@@ -986,6 +987,7 @@ static const struct mhi_pci_dev_info mhi_rolling_rw151_info = {
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
 	.dma_data_width = 32,
 	.sideband_wake = false,
+	.no_m3 = true,
 	.mru_default = 32768,
 	.edl_trigger = true,
 };

--
2.50.0


