Return-Path: <linux-arm-msm+bounces-115804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EjbANZSTRWq6CQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:24:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7246F20FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 00:24:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=WPeoOOQR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115804-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115804-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05361301A283
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 22:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BB93B7753;
	Wed,  1 Jul 2026 22:24:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89317431E69;
	Wed,  1 Jul 2026 22:24:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944657; cv=none; b=Yzpw0PHOAPnkJ7hcp4WFkardJYqvQLJhLOdrI6gL2mdHzaCaWN4w2f6smvxWMfvgaLhRZFnIICCzCCXnoAp9AwdxclltkfyUPXh1AxPn1Mu82rKleYZgMGSIbj0DRzlJD8vVecwFY06TbfUTePBg5usf2VtXt/n++LsUoO5SIyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944657; c=relaxed/simple;
	bh=MMmb7cQ4l3D7S8pV55IdpLdS4n2+QvNWTz+MTNasu/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kjuOb2lvUK7ZwjABVhp+dFGIke8jkX9uxBsINcOufc9iCfrTKuFwPI284SW6ET7o5E0RTqJWPOqS9f2cM3/bDONLoSMyxq/W3gqZkagJ8bxoBeezcbQqdW+SX36AKqtpT3NP4rhiZCGGcvTjMu3ZHKFcZe05rccMPQPAo0x0pBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPeoOOQR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467561F000E9;
	Wed,  1 Jul 2026 22:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782944656;
	bh=2ILB0Bz8lqylo3zNtQHZjdtTG+G4R3NByr8o+uAceO0=;
	h=From:To:Cc:Subject:Date;
	b=WPeoOOQRHxMHhJRuXAb+cjZNbCZqk57LxfZotrhnabuvehXg17X1PjKpWTDhioDyH
	 VBY5XWldBxnYczW8hvarxy+bsYLZAFkk30xKrMwv/9bFwrnA4SYQtNnX0vTSTRzMx0
	 QNGJkgMBHmx2zkzsHSLpjW91cPVzEUb+j4U75zT2vCX90YAT8S2RBUQs+f1s8b2MlC
	 pU8zVmvLfTSOYclbGnO8BgPKLzgT1n8M4U8JuNiWvt+cta8tmzHAg1z1h6UE8g6JRB
	 wQuo354dZ7VzW2SM6tSaKnrwMH4f9qKhlCWhwlpySz9Wja7tQCLKZT5oR7DTVupqLq
	 GSVVepBW+FhKg==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] iommu/msm: Return -ENOMEM on memory allocation failure in probe
Date: Thu,  2 Jul 2026 01:24:11 +0300
Message-ID: <20260701222411.138514-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115804-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:quic_srichara@quicinc.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[vz@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vz@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF7246F20FC

If dynamic memory allocation in driver's probe function execution fails,
it should be reported to the driver's framework with -ENOMEM error code.

Fixes: 109bd48ea2e1 ("iommu/msm: Add DT adaptation")
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 drivers/iommu/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 0ad5ff431d5b..708baeb29c03 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -720,7 +720,7 @@ static int msm_iommu_probe(struct platform_device *pdev)
 
 	iommu = devm_kzalloc(&pdev->dev, sizeof(*iommu), GFP_KERNEL);
 	if (!iommu)
-		return -ENODEV;
+		return -ENOMEM;
 
 	iommu->dev = &pdev->dev;
 	INIT_LIST_HEAD(&iommu->ctx_list);
-- 
2.51.0


