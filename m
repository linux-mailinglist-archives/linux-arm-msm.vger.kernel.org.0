Return-Path: <linux-arm-msm+bounces-62531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC731AE8DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B2167A7713
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065CF2EF9C2;
	Wed, 25 Jun 2025 18:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSND3PA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054512EE28E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877935; cv=none; b=Jf/JnxrYTo28bE/zyGw8wLQuthtia+8EY5wiswrsmHl4EV+th2SVnQFsWFor979/073yTt0pum1pgFGaCRWawoPhQWKMHAoTj6vl8ZWYENT3araPci0Kuf+/284xP+PciBt/28C26wT9i028bPnQyLRktQ46FDD6qxrh5zfkI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877935; c=relaxed/simple;
	bh=1DeDF0ar0bWjHYOdiDm1icJLnBGNeW7jU5ESThe4AlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggj/kUgOUDO6qxk6otpoqmsLR+zmD6vnVuwy30oSgclutZ8aeQ6YqFLWUFHuBjIvZNxHh3OBRzodf4g4FaaHdex+npCMW7l+SQK17YiNWuxa2ZFiLbllnuQCEzR5Hx1V+MOuNLBkWwqI86HnQJw9ISx9BgLhEu9ST3twxIw06vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSND3PA1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PB57pX020873
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3u7saZqSf9v
	I7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=; b=hSND3PA1MWB8KK7yxEeVOXw6Vax
	8yFAQJwhT8Ey5lfeV75HT2BnWSVZ8fOo31cQu76cCGsqo9GrkhxWaJSu/PMp1T/E
	SwiU1JqQvlxyrp9xpqsuo5YRKsE3QKdnhtZ3dbriTwjsPxK5/CCUsqfUYLO3iHdY
	2e2Y4IEpKZPt34C4vuZWBMDz+4rqqsRm7LoLiS+VDrf49h88eDB2rwacSt9zxkdg
	wxhLL3UgZJFt8q5HvZ6LfaztH5A24ra73z+rPL1Lt7sLmHz4bEDTu/RSEryeAfN8
	MOgj9wCdIQUBRHYLBttgW/B4yC9CNDlT5cnivmpS3v9cVTYPSIPhCzfBIJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so92656a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877930; x=1751482730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u7saZqSf9vI7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=;
        b=bGzjHMkKecfcKDioxbBJmtB39OC2NBpkKTZQB8zz9pzlcSWdfxLAajkJbvmSRp/R7g
         MEfS/6117RO/UznMXkzwxuvziOhg+b4+FwxVHVuA3XeUe/pUCQu0o0lkXKTkoJck87lo
         nLcgezyEqDadqVJWwCUM/BXxx4v3OdnBlJ9VlJ4dmDNlF/bs6SvUez0/rDB7oO8H3NNI
         sg3cP0JzYSaPfv1gG3Uuefy4kSkyxsPPUxG+rXwwxQob8DLoD4n48sdQkm70wjHOeBmD
         zQQ9GGlpzgJQrHJ8sxU+iTtnSs1JZy8t8uzlHAf+5kQ/q7N4EC9AiJ+Wa+Bu2NLY7Js3
         2VFw==
X-Gm-Message-State: AOJu0YyFYIkXSzJ94Wuiv4cxPLpBt9ePDfhP1mlvC5Z4rupOwRAd8xHB
	cOPJet7VL48Sx3FOYC2EIwCITz6Mq9mMrGyJp+kVaM2E/RfE/IRxjJrgVeZr/gSD2FI1D2d6Aty
	J2Tqrh0TDY8VmnCdmqI2/7Tonh/o8Cl9rlE8ICv1ZVIpJVyL2RW3DJ5pQNiFzmpQ25YVk
X-Gm-Gg: ASbGncuHLuuy1wYZUNIxQr2gkd3QO3REa8gZlevW51CcuguVNRsgd1UgnspZ0aiTgZ1
	UPkBM7LSm0yJYA0em78k14vrL/V7uR3x2FmyjrWdWbQ7+WUS1cskgS6bamaqGljkdsviKmDDZXI
	pDvmdDXkOva/iO5jfP6Y6mesaWLjB0hkAbFxCmOayOd5J7Fl7Ys324eJiWiMm26+7MBAllTpD9O
	myrZ+8MWwfX6uPGJmZlnoIVtAbgoCaxTK7QkjK5VihA1gtTG5r1Z4S1URN2oG+tIy03wFKC02c2
	rtVvzFAMZwsw9yT42XJYrpd8xnjyVGXj
X-Received: by 2002:a17:903:41c1:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-238c8720354mr9760045ad.13.1750877930252;
        Wed, 25 Jun 2025 11:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8kz0ofYLy2QZ4Xfb5MD01YYNXHJp5HPzUqB6F1lr7GMPXi2DikFC/+7Q83W53JHLLXjlYkg==
X-Received: by 2002:a17:903:41c1:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-238c8720354mr9759805ad.13.1750877929826;
        Wed, 25 Jun 2025 11:58:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393440sm143372875ad.35.2025.06.25.11.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 18/42] drm/msm: Add PRR support
Date: Wed, 25 Jun 2025 11:47:11 -0700
Message-ID: <20250625184918.124608-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x3FemlFlUXbXHo8DmiNBmy9lG1CLddaa
X-Proofpoint-ORIG-GUID: x3FemlFlUXbXHo8DmiNBmy9lG1CLddaa
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX4CN+lrESpHUC
 jDnXnE6WP3HTuxbUGSbUifTIdWh5+zy5+kjvOPfePxW+6B/x6hFzqNAC5rMiTVbwEys6NklS676
 Jfe/4rMRk7AJTQhBvWMfgfaOBHB4O7SYIAmUoyWR0Ey2dGq115llPEHsXpsYWmaXBlnk4XlnQ8g
 KG6hh3B1HFKQjkubAXhXxSlHuTmvKDoLFDlWa8L1eRdob/t7HwatJVWxPYgGegjE3WRT36socLi
 wsXqxwj6oT517F5NPgTtRoxg/FXUs65z2cb0ocoR9PCFIi7CsUge6+ICJatiEAqR8yv2VNIm7vt
 1JGVt+DvERckNlIAOkapSJmCmyBxI0XvOWXEkpmZmMjMM6MNntGzVjMBJbI/2z95ysdRlM2v7hn
 iPKknhvlU/UniNCEHf+h4Gs9+U44e31u7pl0CNjAOusJggDMLLye7s1AxTfJrzlOg2audmUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

From: Rob Clark <robdclark@chromium.org>

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f6624a246694..e24f627daf37 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -361,6 +361,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 	return 0;
 }
 
+static bool
+adreno_smmu_has_prr(struct msm_gpu *gpu)
+{
+	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(&gpu->pdev->dev);
+	return adreno_smmu && adreno_smmu->set_prr_addr;
+}
+
 int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 		     uint32_t param, uint64_t *value, uint32_t *len)
 {
@@ -444,6 +451,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_UCHE_TRAP_BASE:
 		*value = adreno_gpu->uche_trap_base;
 		return 0;
+	case MSM_PARAM_HAS_PRR:
+		*value = adreno_smmu_has_prr(gpu);
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2fd48e66bc98..756bd55ee94f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -13,6 +13,7 @@ struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
 	atomic_t pagetables;
+	struct page *prr_page;
 };
 
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
@@ -112,6 +113,36 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 	return (size == 0) ? 0 : -EINVAL;
 }
 
+static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
+{
+	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
+	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	struct msm_iommu *iommu = to_msm_iommu(pagetable->parent);
+	phys_addr_t phys = page_to_phys(iommu->prr_page);
+	u64 addr = iova;
+
+	while (len) {
+		size_t mapped = 0;
+		size_t size = PAGE_SIZE;
+		int ret;
+
+		ret = ops->map_pages(ops, addr, phys, size, 1, prot, GFP_KERNEL, &mapped);
+
+		/* map_pages could fail after mapping some of the pages,
+		 * so update the counters before error handling.
+		 */
+		addr += mapped;
+		len  -= mapped;
+
+		if (ret) {
+			msm_iommu_pagetable_unmap(mmu, iova, addr - iova);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 				   struct sg_table *sgt, size_t off, size_t len,
 				   int prot)
@@ -122,6 +153,9 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
 	u64 addr = iova;
 	unsigned int i;
 
+	if (!sgt)
+		return msm_iommu_pagetable_map_prr(mmu, iova, len, prot);
+
 	for_each_sgtable_sg(sgt, sg, i) {
 		size_t size = sg->length;
 		phys_addr_t phys = sg_phys(sg);
@@ -177,9 +211,16 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0)
+	if (atomic_dec_return(&iommu->pagetables) == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
+		if (adreno_smmu->set_prr_bit) {
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
+			__free_page(iommu->prr_page);
+			iommu->prr_page = NULL;
+		}
+	}
+
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
 }
@@ -336,6 +377,25 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 			kfree(pagetable);
 			return ERR_PTR(ret);
 		}
+
+		BUG_ON(iommu->prr_page);
+		if (adreno_smmu->set_prr_bit) {
+			/*
+			 * We need a zero'd page for two reasons:
+			 *
+			 * 1) Reserve a known physical address to use when
+			 *    mapping NULL / sparsely resident regions
+			 * 2) Read back zero
+			 *
+			 * It appears the hw drops writes to the PRR region
+			 * on the floor, but reads actually return whatever
+			 * is in the PRR page.
+			 */
+			iommu->prr_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+			adreno_smmu->set_prr_addr(adreno_smmu->cookie,
+						  page_to_phys(iommu->prr_page));
+			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
+		}
 	}
 
 	/* Needed later for TLB flush */
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 2342cb90857e..5bc5e4526ccf 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -91,6 +91,8 @@ struct drm_msm_timespec {
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
 #define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
+/* PRR (Partially Resident Region) is required for sparse residency: */
+#define MSM_PARAM_HAS_PRR    0x15  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.49.0


