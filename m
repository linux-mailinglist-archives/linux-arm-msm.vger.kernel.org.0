Return-Path: <linux-arm-msm+bounces-118951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6KHrBuLSVWoNuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9841E7515C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="U+wYA/Ea";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118951-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118951-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49D05300E15D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D615B3D9030;
	Tue, 14 Jul 2026 06:10:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AE93D890E;
	Tue, 14 Jul 2026 06:10:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009438; cv=none; b=SRkP2KXU7ofdGgVmlvuhnPLZavDaLMTbsdv9EXBG9/PsheYgbFYscsv8n3G/3yA+k80sEUwUq5hOY3YIp53VzaOdbWmwzv/sgw2Bez7k2iACVTc7Vvbz2hx/1jYKR9eDYlBJej6/b38sAF+mCFvp788y4pdjY63htRPbMQnz6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009438; c=relaxed/simple;
	bh=/zk7nGNl3dB++t62aMOiEHIuhmWOXP6KRdHJMEJHOjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HynT60w42LQ3qvF/v9Mdt4BF+XQRq4IqNW1PVKdoEgwCKjepK8ZMlATdQebrmffsihcGbeJCYfTT1SQx+9zJNTPRVBvO9ZCfTYC5oqPsi756xYFGYkvZ8p/iNjWd696JuH5sT636fG3tbjhHG0l+wLz6zDTEQWJIIWXmfHr+GBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U+wYA/Ea; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZW
	71BHzQut9m5+gFs8IhfBSqnJb/qt1PIQnhKAHYDfM=; b=U+wYA/EaIbmtWiu60G
	8is+Hhskr2gPlrIcjjkeNGnGs5PSEgmQMc478N+VTetIwYyid9BRnMGeVULMHOov
	zgW1A2/dO3Dx8kMXl44k20dcnexHpGYagNm0rlfr6HPWpFZgtVfw/aU7zW3Mm8K+
	4Ix1BbjdwX7qaVp0Z8XFBktMY=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S4;
	Tue, 14 Jul 2026 14:09:48 +0800 (CST)
From: weimin xiong <xiongwm2026@163.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	weimin xiong <xiongwm2026@163.com>
Subject: [PATCH v1 2/4] iommu/arm-smmu-v3: Fix fwnode lookup lifetime handling
Date: Tue, 14 Jul 2026 14:09:28 +0800
Message-ID: <20260714060930.220277-3-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAnwyab0lVqrG_HHA--.5129S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Gr1DWr48urWrJF47JF18Zrb_yoW8JF45pa
	yUuF90kryDW3W2k3srXF1ayFy5ua1Fya4rtrW8u3s09wn5tryfGryxtF9Fgrn5CrWrJF13
	trn2q3yrCFn8ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul4iUUUUUU=
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzQzPX2pV0qz4CQAA3h
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,oss.qualcomm.com,lists.infradead.org,lists.linux.dev,vger.kernel.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118951-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:benjamin.gaignard@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:xiongwm2026@163.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[xiongwm2026@163.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiongwm2026@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9841E7515C1

bus_find_device_by_fwnode() returns a device with its reference count
incremented. arm_smmu_get_by_fwnode() drops that reference before
reading the driver data, which leaves the returned pointer derived from
a device after its reference has been released.

Read the driver data before put_device() and return NULL directly when
the lookup fails.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb48..ef53dd703 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3980,9 +3980,15 @@ static
 struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 {
 	struct device *dev = bus_find_device_by_fwnode(&platform_bus_type, fwnode);
+	struct arm_smmu_device *smmu;
+
+	if (!dev)
+		return NULL;
 
+	smmu = dev_get_drvdata(dev);
 	put_device(dev);
-	return dev ? dev_get_drvdata(dev) : NULL;
+
+	return smmu;
 }
 
 static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
-- 
2.43.0


