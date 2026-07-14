Return-Path: <linux-arm-msm+bounces-118949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BQ8IId/SVWoMuAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0B7515BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:10:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=OwtK6mD4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118949-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118949-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F24C73017392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56033A875E;
	Tue, 14 Jul 2026 06:10:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46253D3CF6;
	Tue, 14 Jul 2026 06:10:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784009436; cv=none; b=NGVksOX6rwVMD+YZDYnieAeN67C5UkDOrFScOZtsl0X8Ie3DO8U4JF0g9HXrJE0ziBmq7/T9JAAr73y9+O1mzkHuUfDwsS4fKBWMDT8KIgR54MOf13jV2+JtIhOILryyp3ZT9QZ832mvzeUuBZYZY+0qs0Z9GvTieCqAA9zXL7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784009436; c=relaxed/simple;
	bh=4xPqYvlq9Nfls+v7bxOV7lBCChf+ugfxubUKqn9mCi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knM6/sDj3Tqon4RVQPHOtDWF4m50llfZjisEt8gwoX3ORNmK2KW4srXVM5odhn1+Z4BbKwIAj5OCok/xL68u6G/8Vsdrq4djh79jkQFQ4CMDdirqz+twK7dXEDikEsrdA13A6VzLLf2PCTA1H8535Y1v9doT8V0R+SN9L+ojr54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OwtK6mD4; arc=none smtp.client-ip=117.135.210.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bn
	7zqv7BhhO4u2hyqtDUkagNf7vxIqH4Kedjj5Ao8gg=; b=OwtK6mD4hKcXDiM1hO
	qPwRv5qhI/mzDULJimzH9Y9IxR/J8+QkKfrm5IWPi6H8Yy+INj2zjIAD1hDcdNPT
	0CUv6LutuOvjYBSSUq0bsOiXWHGMpH61vh4m5CUSXe7TpFdXwXQsKVr+/fP0zDbW
	M8LHhjuo2Nw4aSpm+Gt/o4u8w=
Received: from xwm-TianYi510Pro-14IMB.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnwyab0lVqrG_HHA--.5129S2;
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
Subject: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe cleanup
Date: Tue, 14 Jul 2026 14:09:26 +0800
Message-ID: <20260714060930.220277-1-xiongwm2026@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAnwyab0lVqrG_HHA--.5129S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr4kGryxKF15JFW8Kr4DJwb_yoWDGFX_ur
	yrZ3srXw1rZFWxZa42qF47ZrZYkr4IvF97GrWjg3s3Jr17XrWkGa1qvFn5Ja1xWw1jyFn7
	tw4Ykr1xG342gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUuHq3UUUUU==
X-CM-SenderInfo: x0lr0wdzpsijqw6rljoofrz/xtbCzgvOXmpV0qudxAAA3K
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,oss.qualcomm.com,lists.infradead.org,lists.linux.dev,vger.kernel.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118949-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7B0B7515BE

Fix a few IOMMU driver lifetime and error-path issues found while
auditing fwnode-based device lookup and probe cleanup paths.

The first three patches avoid deriving driver private data after
dropping the device reference returned by bus_find_device_by_fwnode().
They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
IOMMU lookup fails.

The last patch unwinds msm_iommu_probe() state if sysfs setup or
iommu_device_register() fails.

weimin xiong (4):
  iommu/arm-smmu: Fix fwnode lookup lifetime handling
  iommu/arm-smmu-v3: Fix fwnode lookup lifetime handling
  iommu/vsi: Fix fwnode lookup lifetime handling
  iommu/msm: Clean up probe state on registration failure

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  8 +++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 12 +++++++++++-
 drivers/iommu/msm_iommu.c                   | 10 ++++++++--
 drivers/iommu/vsi-iommu.c                   | 10 +++++++++-
 4 files changed, 35 insertions(+), 5 deletions(-)

-- 
2.43.0


