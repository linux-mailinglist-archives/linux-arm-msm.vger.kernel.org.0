Return-Path: <linux-arm-msm+bounces-118950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8hfBOu7SVWoRuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 844707515D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b="iqI/ShWL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118950-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118950-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0207305BA1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD41F3D9048;
	Tue, 14 Jul 2026 06:10:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CC3D8912;
	Tue, 14 Jul 2026 06:10:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009437; cv=none; b=AowAc8zUv3QRWr74efmJ39M8gy3CMC3jHJJ35x/83bzl76qyfyvyI6Tp8nsOg6YWVthep26nwxhU1XYErntbk1E5jS5yniWxzFJIEtqvgaDQws6x0xvB5ql77c8w1UrjET9kt83Bbm9LWGHXyOML7zHdYe12v/OFbaPLi+yjFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009437; c=relaxed/simple;
	bh=h1rcSZIJCx1s78fckibab2t0DEvvfwOPISuMFxICZCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVPbMYj5f9rC+9wL9+1PVnvs8TDxCKiqAt9wszqVTonHQyWEtCxOYRH1szkApSZcOOvoJmva0qGmJmB/0JYNGzTkN/6FuyC7NME3T8PjMJvs3BKClCQIPqnIxqwqMnkpuFb4bEthulMu8AAJQNa7jlIGJ96HSCxZc/DSYicmz5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iqI/ShWL; arc=none smtp.client-ip=220.197.31.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fO
	rVLDpGjRjUa+f8VzrtP6B9hFELin8qYtwTJlLmQHk=; b=iqI/ShWLN0QGPUqjSJ
	HV4sJ1rtMWL3tWOLVElIvwBK6ZSAS4vfu0sssBfLo/bYGEpI3L73sIP+ni1SSqUT
	CmAr7QEESbFj+puJ3v3C2uYKuvXUwn8posOU/mE9sIfmLZjymxF95WZIUJm21bsD
	UnPKkFa6CVRl/0wW+XDTRAaMM=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S5;
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
Subject: [PATCH v1 3/4] iommu/vsi: Fix fwnode lookup lifetime handling
Date: Tue, 14 Jul 2026 14:09:29 +0800
Message-ID: <20260714060930.220277-4-xiongwm2026@163.com>
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
X-CM-TRANSID:PygvCgAnwyab0lVqrG_HHA--.5129S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyrGF1DJw1fCw47uF45Jrb_yoW8Ww45pF
	WUGayYkrWUXF10gF47C3W5CFyYvws2va4I9rW5tw4v9w1rtrW8ta4UJryjqryrCFZ5J3W7
	Kw13ta97CFy5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeg4fUUUUU=
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzgzPX2pV0qyd0gAA3c
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
	TAGGED_FROM(0.00)[bounces-118950-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844707515D2

bus_find_device_by_fwnode() returns a device with its reference count
incremented. vsi_iommu_get_from_dev() drops that reference before
reading the driver data, which leaves the returned pointer derived from
a device after its reference has been released.

Read the driver data before put_device(). Also make
vsi_iommu_probe_device() fail with -ENODEV when the IOMMU cannot be
found instead of dereferencing a NULL pointer.

Signed-off-by: weimin xiong <xiongwm2026@163.com>
---
 drivers/iommu/vsi-iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
index 42c424496..d19db561e 100644
--- a/drivers/iommu/vsi-iommu.c
+++ b/drivers/iommu/vsi-iommu.c
@@ -220,10 +220,15 @@ static struct vsi_iommu *vsi_iommu_get_from_dev(struct device *dev)
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct device *iommu_dev = bus_find_device_by_fwnode(&platform_bus_type,
 							     fwspec->iommu_fwnode);
+	struct vsi_iommu *iommu;
+
+	if (!iommu_dev)
+		return NULL;
 
+	iommu = dev_get_drvdata(iommu_dev);
 	put_device(iommu_dev);
 
-	return iommu_dev ? dev_get_drvdata(iommu_dev) : NULL;
+	return iommu;
 }
 
 static struct iommu_domain *vsi_iommu_domain_alloc_paging(struct device *dev)
@@ -619,6 +624,9 @@ static struct iommu_device *vsi_iommu_probe_device(struct device *dev)
 	struct vsi_iommu *iommu = vsi_iommu_get_from_dev(dev);
 	struct device_link *link;
 
+	if (!iommu)
+		return ERR_PTR(-ENODEV);
+
 	link = device_link_add(dev, iommu->dev,
 			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 	if (!link)
-- 
2.43.0


