Return-Path: <linux-arm-msm+bounces-115924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2zQBDDRCRmr8MwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:49:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 891476F62DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:49:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=f5mAaCOi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115924-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115924-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AEE8327FE50
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 10:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 908B14252AC;
	Thu,  2 Jul 2026 10:01:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A735387566;
	Thu,  2 Jul 2026 10:01:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986466; cv=none; b=K4MkEaAPU51u7Z2bGYpCIVMqzIIFnfQKi+XhoGs+QFTD3Z/ZI0oGUXEh5zo/o0TsZ4V+ZZ3uwOWNszMtcQZOZWvXfyoGJjRWxZhgsO/rV4i7A7EmdQ5p9P0KH0k2qYWSYyHS6VNH/XNNJS9tp6o/CJbjpvOlJmnoQMthV3TIHQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986466; c=relaxed/simple;
	bh=DlqkhAl0ewtcZtBaSvOYmer4jT2OP57J6tMO9UF3hC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asB2eOUkCKZCbN8zrfFidNgGDap/DGOucsMpIe7/gVx3DaKWzoHvuCBhL7BuBSIqXca6OTEOze+L79dCBy2Er7fapi30SrTvr6zitrEYobmtEEKceFU2pVLPw41iIqPpgCujrsTX2eeHpPQD1PtCXh999oBEQj3fkFOR+GrOdao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=f5mAaCOi; arc=none smtp.client-ip=117.135.210.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/2
	9zxwkQfEY1GZi/kTJzhJOJtDS7UKT4qndOF2MtSxA=; b=f5mAaCOibgULb42AQh
	l33rJAEsArydhMnbERXq7Fzv/Itqv2jLeO9JlwA6KhMYyzZJxV+PrMdVGXPwGiIk
	oZLJGzqDQY30lz37OwflnnxwP/vEnRCU1m/iQX+1X1ZEkheZl7cbmhO5QJzbMSuK
	NVhJ5lb+Jrpr23LrZAE6wQmyY=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wA3fGGyNkZqKBmJHA--.9501S2;
	Thu, 02 Jul 2026 18:00:19 +0800 (CST)
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
Subject: [PATCH v4 1/1] bus: mhi: pci_generic: fix Rolling Wireless RW151 MBIM channel ring size
Date: Thu,  2 Jul 2026 18:00:13 +0800
Message-ID: <20260702100013.545593-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3fGGyNkZqKBmJHA--.9501S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4kJFy8uF43uw47Ww1Utrb_yoW8JFW5pF
	1IyrWUAr4vyryrXay8Z34DKF95Xa1DX3yDtrnrCw1jgF90yw1DtrW0g34IgryYvrZ2qr4F
	9Fs8WrWruF1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um1v-UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0hPlPWpGNrMJugAA3D
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115924-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,fibocom.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 891476F62DE

From: Wanquan Zhong <wanquan.zhong@fibocom.com>

bus: mhi: pci_generic: fix Rolling Wireless RW151 MBIM channel ring size

Increase RW151 MBIM channel ring size from 4 to 32 to match the device
firmware channel configuration.

Signed-off-by: Wanquan Zhong <wanquan.zhong@fibocom.com>

---
v3 -> v4: Drop no_m3 quirk per review; keep RW151 MBIM ring size fix only
 drivers/bus/mhi/host/pci_generic.c | 2 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index d598bb3b3981..d686aef6e158 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -949,8 +949,8 @@ static const struct mhi_pci_dev_info mhi_rolling_rw135r_info = {
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

--
2.50.0


