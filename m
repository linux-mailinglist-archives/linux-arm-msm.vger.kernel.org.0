Return-Path: <linux-arm-msm+bounces-118953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xtd7EDzTVWokuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:12:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DBB751600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:12:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=DdqhWYc6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F270E30D6604
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F8338E8C1;
	Tue, 14 Jul 2026 06:10:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37B3D9043;
	Tue, 14 Jul 2026 06:10:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009444; cv=none; b=GgjFBmrR7tnCPVe4h5aotnQb8s2YXhFH4/eMYHa6ZGUSPf0/xsk4t8uPAgKOkw9lvZPZOL62kCTKStb4fkap1X01g4lSWyWLRV0dmzxt9k8ech9ypKdoAByzovgeB9sjljqKZHYCPG+H7JpW02DpRPqZ83MJiSyts0mxWB6cH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009444; c=relaxed/simple;
	bh=OK6F+QADPy1VWZWq5kaE5EqHcErchmyJYXKrGpnsvXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sn3EUuN2NlCHtxVKJCLt95uv77b2a9Gv+wcp9G9tdZtyKxTZfXUFutRbrhmXunbSbD/04s0sxYx5eCGX1KPTAlwy7a6falRTvdqejyKGPvhNe63QT4f/0qxhofsZsyfJeRPKFFUHFqJ2NV++mpig3a3v6w3fQkc5db2EHQzc3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DdqhWYc6; arc=none smtp.client-ip=220.197.31.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dS
	Md5BPF4fYsYrSjBZEUKbIw8wpxukNBKTZpcMK3Duo=; b=DdqhWYc66UcFUgEnhy
	cf1r+XH3UNq0EIYmW8zU6iHHiZf1TLAWcUBEyJQ221DA601xIR1WzSQzIU3abw4Q
	8DBC1TkBft4NfF7z0vtaHEMl3B2MhtPkj1zWtttsII1AyGQ5hZdxbvDz91Xtkfnd
	d8OJBbnJgKXcALciSuMVeZOs8=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S3;
	Tue, 14 Jul 2026 14:09:47 +0800 (CST)
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
Subject: [PATCH v1 1/4] iommu/arm-smmu: Fix fwnode lookup lifetime handling
Date: Tue, 14 Jul 2026 14:09:27 +0800
Message-ID: <20260714060930.220277-2-xiongwm2026@163.com>
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
X-CM-TRANSID:PygvCgAnwyab0lVqrG_HHA--.5129S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryDZr43Ar15GF1ruw1fCrg_yoW8Xw15pF
	WUCFyYvrWUWF1jkr4DJw1rAF1Y9a10yas5CrW8C3s09w13ta45tFy8KFyagwn5CrZ5J3W3
	tr9Fq3yrCF98ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UH6wtUUUUU=
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbC7wvOXmpV0qsbnwAA32
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,oss.qualcomm.com,lists.infradead.org,lists.linux.dev,vger.kernel.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118953-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93DBB751600

bus_find_device_by_fwnode() returns a device with its reference count
incremented. arm_smmu_get_by_fwnode() drops that reference before
reading the driver data, which leaves the returned pointer derived from
a device after its reference has been released.

Read the driver data before put_device(). Also handle a failed lookup in
arm_smmu_probe_device() before dereferencing the returned SMMU pointer.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206..b70c307b8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1426,9 +1426,15 @@ static
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
 
 static struct iommu_device *arm_smmu_probe_device(struct device *dev)
@@ -1451,6 +1457,10 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 			goto out_free;
 	} else {
 		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
+		if (!smmu) {
+			ret = -ENODEV;
+			goto out_free;
+		}
 	}
 
 	ret = -EINVAL;
-- 
2.43.0


