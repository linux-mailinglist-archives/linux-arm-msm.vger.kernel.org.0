Return-Path: <linux-arm-msm+bounces-67207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE438B16AC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 05:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1D693A76ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 03:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C857A189F20;
	Thu, 31 Jul 2025 03:19:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8E7482
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753931951; cv=none; b=GHtOEJ3gM2Oj5Um4JgBNbXBrB8VUBOMJAIaJXH90nrg7nZTPqkY4h7enmY1UV13Uh8aeAdR6hMoRI6j6D+WsnUUis6GU9tel47z5+ihM3qLacf+GNKCiI9DYTZXW6TbxQInSNmRKbRI4DPuFwVD10Yz3DYnAhygoqwiq+OEAnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753931951; c=relaxed/simple;
	bh=cN1ZlwbbCqmJ13urYAh6MK999RuzzPbxeop+dhHmN2E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=lZKiaIjU71iEzPliAqL8/CHqMT9yo61bKSJ6bLXwQuARMroUx/OelE3kA4A38AOMD34NuRajuactpmdbrkZLMFWBlXQ7HV5C7hQEBM1q3J8JqbdjNgCsLmGbej57rLO10mHszWYcOm8GQGad2bQepht1GPd8pw+wbB8SKvDM1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1ba31eec6dbd11f0b29709d653e92f7d-20250731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:1bef9395-f09e-4aa4-8528-cefe2e0d19d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:707c96dfc8fa45d302ad1c5696b7a62a,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1ba31eec6dbd11f0b29709d653e92f7d-20250731
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 995350925; Thu, 31 Jul 2025 11:19:02 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	robin.clark@oss.qualcomm.com,
	joro@8bytes.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] iommu: Fix macros coding style error
Date: Thu, 31 Jul 2025 11:18:59 +0800
Message-Id: <20250731031859.550632-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change just fix coding style, no function improve.

-Macros with complex values should be enclosed in parentheses

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/iommu/msm_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 43a61ba021a5..85f74b3c7a1f 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -26,9 +26,9 @@
 #include "msm_iommu.h"
 
 #define MRC(reg, processor, op1, crn, crm, op2)				\
-__asm__ __volatile__ (							\
+(__asm__ __volatile__ (							\
 "   mrc   "   #processor "," #op1 ", %0,"  #crn "," #crm "," #op2 "\n"  \
-: "=r" (reg))
+: "=r" (reg)))
 
 /* bitmap of the page sizes currently supported */
 #define MSM_IOMMU_PGSIZES	(SZ_4K | SZ_64K | SZ_1M | SZ_16M)
-- 
2.25.1


