Return-Path: <linux-arm-msm+bounces-105398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OuhOXiH82kY4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:46:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A528A4A5F4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDA95300F11B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935F0337BAC;
	Thu, 30 Apr 2026 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TSQ3z0/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2398E329C66;
	Thu, 30 Apr 2026 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567604; cv=none; b=sd671zPgHCfK1mRsJRUxXhi9Q6Gp0K6/klvdCUTOBknDby7E98xlHNv5/pjcZFooHj3Jeb0vOj9yd4tVeqXWLpIqzloljs0WJ+qz/0nThErAiYzanC+00xm5/uYfMvdY9JpG3+zmPM4s1xtsUev80E3fz0RVfMeOBAiX1xDftyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567604; c=relaxed/simple;
	bh=vBZRA2uGIChcs+ndx9gspjN3QNgcLBXYaCL4wYQ6tSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hC2uaHWQEaonYnBGz/XeE+StewRe0yJYe7iQkqWJ9nlGojMnLfUfuJJZblQ/QnIwcIK5ycSwHmuckOtPPBebdkJXCFw7kZlInMfkwOtlw/zLJPajjtBNzLxioHbKww6o7AZAibGFDQWMzo1maz6KMLvn7zUqdpBH8TrewmjEtH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TSQ3z0/Z; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5X
	ywz8beiXKigdPY0dCWJdyNA0g5/M/vRfZ/rmu5OqQ=; b=TSQ3z0/ZEnuWWFf/4c
	0XiCngqtAQjhzo/tqnl6h5Fzow9rZB016nU+D9QOe5+0U17a9KxktgeKkFD66N0Z
	KChJ5SVC1l2pNaFFNqqayyZDHtL5gy4OQbkOhECezS6yKNjjVEg6kY5vICxW7rpU
	Br095kZa5cQomfXvXoU3XBhPM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S3;
	Fri, 01 May 2026 00:45:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 1/2] iommu/arm-smmu-qcom: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:45:44 +0800
Message-Id: <20260430164545.49637-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
References: <20260430164545.49637-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHWJ46h_NpWWQZCg--.13259S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur17Kr1UAw15uF1UZF13Arb_yoWkJFXEy3
	W8A3Z7J3Wjy342vry0vrs3Zr90vaykurykWw4SgFyrAr15K395uws5ZF1kGw4xAF40kFyI
	g3sxWr1rZFy7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKiiSPUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxBtH6mnzhzsbHwAA3Q
X-Rspamd-Queue-Id: A528A4A5F4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105398-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,163.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 65e0ef6539fe..99469c4ebac2 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -208,8 +208,7 @@ static phys_addr_t qcom_tbu_trigger_atos(struct arm_smmu_domain *smmu_domain,
 
 	/* Set address and stream-id */
 	val = readq_relaxed(tbu->base + DEBUG_SID_HALT_REG);
-	val &= ~DEBUG_SID_HALT_SID;
-	val |= FIELD_PREP(DEBUG_SID_HALT_SID, sid);
+	FIELD_MODIFY(DEBUG_SID_HALT_SID, &val, sid);
 	writeq_relaxed(val, tbu->base + DEBUG_SID_HALT_REG);
 	writeq_relaxed(iova, tbu->base + DEBUG_VA_ADDR_REG);
 	val = FIELD_PREP(DEBUG_AXUSER_CDMID, DEBUG_AXUSER_CDMID_VAL);
-- 
2.34.1


