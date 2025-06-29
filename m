Return-Path: <linux-arm-msm+bounces-63005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC112AED0C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D18C3A3A37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57BFC24BBFC;
	Sun, 29 Jun 2025 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glr7MuR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74379248879
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228207; cv=none; b=C/VUGAuHp1V/DaHie4ysgpQDRcv3c5Aj/JyHvYFd9HfHiBxloo/wAg7dIqS+E3/GGtI+RHpLyqoMXfCfqpmPMXeL29DNdkRCWILUQPpokAvtBAsndwR/Amwuawn+aA1WxPMGDFw9AErf7WZORv7403BNmHhYP0dEacPgy59NAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228207; c=relaxed/simple;
	bh=N5h9QxX939KWcmj2LnrrApRV3L5jzVSUkXnQ9YEPILQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WohYrM5dNHNnnF2tf3bjKFklEVxUTWNTb2pSIoxvko6gvPo7QzdMufB0a3U1+R2H82VIImpR0uxp80zTfk7IsYagXMK9vG4/zU11G7IwoE9wIcKWOJoEJcONi482jKVfijJhhaHc91Lx9p+wca8plw7pNCGR+Tj47FlRQknKjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glr7MuR0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TIrIgs015161
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JinTH7RBpIn
	edICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=; b=glr7MuR0iDjTP1Qad76TT0dZOhC
	Oz0QaszL/ho6mDpnn1Lz03vcRW4JieI2oqBHEEBDdvowscqQZB1pdc+AA0ZsCJuQ
	gSEElOXooyIsLx0LKOvjpyIr2uY2yYESKIz9PfVKkAniJOVgBl3lpVqV1A8OJZ8m
	7MP2RLIwdpLcz7W3OEWLdFS41tq/o6kyTiuHb0uEwaouMJKrfgXKJCn1RDYvptyh
	boXe3Dmp6grslAEtXfbL7Q/F+4+ok2P0YMh/VnGts40ghNX6yZUfaeeEMd8wTavh
	uRuxza1YPfOQIeNxe6cX7yXxqWdkD3fZH+f5AGgTcfLQaF+BiwaUnRwofjQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k2thq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748efefedb5so4786684b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228204; x=1751833004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JinTH7RBpInedICQ29N4Lhfv00Y7qC0FBgXZnvj/oGw=;
        b=wp/Gri8kp3GJTeiZS2E666+wcVO5rsXyVNQ2iaB0JBGwHBAZ7QVNqqKY36v5RUC4kF
         G4Iqn/MmKwH4AcI8vzpNFSJ/oaDnqRs3Cq8MDkS89+E2ZMg/dN7Jnncz4bTWyc3upIOt
         1xhglkP5dGJFuTqpJDIdlJb6Iwx2YVAc4vKddoF9sBxMjfr68IVQb1Ljqp+fgs97wJj3
         3nReh7uWA90u+ZmWTez7PGwe1FmtT3qFf4lScaQESewM8Vn7N4gs6VfyoCHR27+1vJew
         n18tmRQvgpQJl0Ee02mdvAqvm7fup/kTF2USxM/WahXMMaVpcdlQ8XE2ergJo1ElUpfA
         rxDg==
X-Gm-Message-State: AOJu0YwHat67hcbecAHHyGlCeXZwdIsLDxUhqiDJLhIUQbybpYlNnLtZ
	mUtC+9KkAu/z1bNXg7AvpgOzB1pEUISNlPCepfh+ItEbfITcwS8yy7/hlu2cF/955Qn1OCu83BT
	9xdElo5+IXwmrZ3c2GyYKk0ePrmwSoN20ZEnmejywrLr9C3sQKuzbUCFjVWg1o2hlJPwe
X-Gm-Gg: ASbGncuauCp9Lk7NYoWegljxiqejghIEeFW07nNxa2lXt3rihi9OTLv7IUXA3zScYcS
	tio/KFCyY+MzHwB7vDsvW2DeyHEaiY9nsVMRgskrcKLOxfIIfofU6d7MWqWk8WRxgvmoYB5xqsf
	VP4gT5DUKLdX2+3G4uqYO0yw+kCIzW1D1VaB+HRojSCSmAfzSIxOi6I3CDsAcUz2pD3DCGWkOaB
	4p6LYXer+SsMu63xCEZWWyuC5aXmWc4cH2TPgcgF4lNwni9aZfrChO0p0VlUUTawuZM9JQ4NAPZ
	WdKkSYRmCq4DjEEFMjAdhXmqaWnt60aPUw==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74af6fd7312mr13757427b3a.22.1751228203654;
        Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEk7ORGHzSfU2DSxnHutHKKkh9bC7DWJEiEZd1kyNe53DB3/eUhy7wAbVuq/qFosk61gf5b5g==
X-Received: by 2002:a05:6a00:4b11:b0:749:93d:b098 with SMTP id d2e1a72fcca58-74af6fd7312mr13757395b3a.22.1751228203166;
        Sun, 29 Jun 2025 13:16:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541bd1fsm6998630b3a.47.2025.06.29.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 18/42] drm/msm: Add PRR support
Date: Sun, 29 Jun 2025 13:13:01 -0700
Message-ID: <20250629201530.25775-19-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68619f2c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MSBTYWx0ZWRfX0qqR6OwNaGo0
 NVJSSPfTCTjaMryFcYZ4PffLHfxHLJ57ZkwO7lTuqJbx1VuCe8TRNHtcT4kUwhF47d0jpYKa4D+
 tgvTwfbgwbkS1GgcAXqKVlyiEdW6lsbRdcoqtn/5XeEqMfOSBJNMU5US1xyUXU2Bad1lzuEWnwX
 e8yTm4J+3kXNZa/U4Rngcb/KTDuRVqOKb+sfWv7zORXzHeunKHZtKDdYxVXR28XQrxvbKsMH9+j
 6i3B6EwS32E9+nb2Dlfuw1m/1eYx25JoU3nUP5bJPuoELZBf3bADPy025ogU4NCmIa0iBkOxd35
 E3MY2pUISlmoUvL6sPSX6YoBRps0tF7Xras/uV1rfYfUCCvLyLPdj7g16B1CxXf6+/60xpgjMhd
 ZF8Dz21XeQ9hACWJ804p8GPM90Jyb5dE8+wdQ9Msa+OqkDO2XjG0sxfrevMUn/A/i7+RqpCQ
X-Proofpoint-ORIG-GUID: 6DpP1V9dDr9-iCs453PsR76pe9KkPBqL
X-Proofpoint-GUID: 6DpP1V9dDr9-iCs453PsR76pe9KkPBqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290171

From: Rob Clark <robdclark@chromium.org>

Add PRR (Partial Resident Region) is a bypass address which make GPU
writes go to /dev/null and reads return zero.  This is used to implement
vulkan sparse residency.

To support PRR/NULL mappings, we allocate a page to reserve a physical
address which we know will not be used as part of a GEM object, and
configure the SMMU to use this address for PRR/NULL mappings.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++
 drivers/gpu/drm/msm/msm_iommu.c         | 62 ++++++++++++++++++++++++-
 include/uapi/drm/msm_drm.h              |  2 +
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 676fc078d545..12bf39c0516c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -357,6 +357,13 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
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
@@ -440,6 +447,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
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
index 3c2eb59bfd49..a0c74ecdb11b 100644
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
2.50.0


