Return-Path: <linux-arm-msm+bounces-60389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3336ACF711
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36FC51886A37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E83280CD6;
	Thu,  5 Jun 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXfPX0d6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C6527C163
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148375; cv=none; b=u0TjGKSDp0W2ej05ndzbYKaRQ0d5Lf6jiQlf3F5my5psaGsgiAbJWRk/LjB+BrZqKruAdzwwIne7NFwEUev3zJ86QP5HK0vyASnVm2vzsc03HkEjkR24ZckpOdJv+qlAzvbVbJQHWxyC1DGc2Cb8qok+vV2Kxvo6DUwqdEIef1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148375; c=relaxed/simple;
	bh=1DeDF0ar0bWjHYOdiDm1icJLnBGNeW7jU5ESThe4AlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvbt1RXfWr5Qfrn2IzKG3Dk97fDeCUxL6CtXctmnW1Qam19CjaLegNQEJRRrfnA6aYzZQb5x+xRAYtVZ4agrpZbjCrqWD2NI8CoR2Z8tLdN8dELxYllAePy9S5buLjSqAsLin8gX0Z4URSQLaH7QDlA7P4oJPtQm7mh51KDVBME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXfPX0d6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HisVB027442
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3u7saZqSf9v
	I7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=; b=fXfPX0d6PaVGIBJgExovILPPK6D
	4Z3RwxgfsjKXQxaNjqbCUG7u2YaYqS7eBEK0DZT7vlZ7BAtBFov6m4zWNkp98Cyy
	iVCic8TFb6pc+wPgE5EJa6KWQaqxm6N2SGe/xbZSKb0P7OFJWw0emJJCBoiGKqhg
	3FNhH979z7fcSO2ciTpLTEljwwm70wa6Es3TNLyunn9OoYZj1iucP6KGtst2PbpX
	hQA+/L85wUnlfG/cMu0tdpyHz6NG3YAujuXVn73DiAfxdNX+7xF3x/B79055yf3a
	GAnkwYn2AGtj5anXDvi8ghLavu4RXIwP5PhkSGjWzkN2UOnthztJH7jkgMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ta9k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:32:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311fa374c2fso2159047a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148372; x=1749753172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u7saZqSf9vI7fV2Qhb933URL/6xLtZCDgVKJFmz8jc=;
        b=lyW7rzypdrq857Jai1OUXhR/JQOX+AS9gT4t/2XTAwTfqUireYSuRp2AoFvvpaN1xB
         JWAsJrjH0N7OaXs2dyRdc6KiwgXFQ9kq7qUXlE0ZLoziCQBxOGOTf+pr8m2JSCwb8nZo
         Tsp4JUFFNP3uqixYI4x1SU1BqhMv1gYTdAA+FpC4KIl6cyqikOytZG6AuvUHkwmeTnXA
         I1OdlZITe6kUZWMo2dszfYtVxuT51CRoInUPNInPRrtqNc1E2nP65cpCSqsjIOu0UFYc
         WyVt/UtnB9BqOTTQqajqUM30dBGbwGLAfDCmc6G0Jqxu1gTkJ5O944MrOxDX5WHGO2RF
         nVnw==
X-Forwarded-Encrypted: i=1; AJvYcCVCZID/vVptNtNrJU2RdU9xQToKwTFvktZIUwaJcy6PwdQgnlKM3Qj/S9tVWleDk0DqpFwJ4/aPu4jUuFsx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5NSTDXRANlJ+OyHJwqQj415FSZJEQNUmg7K1fPl1U86QHJrN3
	w8JjrzYxICy0fUoB45HOrXe/Y1In/aEyXgYV2yn2iG/d2+V0cZ725xlNl6BixiHYuYkihxJ6Jml
	op2Syh4svzpH96t1rSb9lBaCivh8Yb4/+Vfo/S69okDLAEXEvSDY8x6OvLlnr7z7a3p3E
X-Gm-Gg: ASbGncvK7zFdCbcZzh8JwC7jTHAXErXcbG3hTwlY3g4roh4CratnBgbSCnr+lV2ce/d
	jAZ+Jor3aoZazo712x+yiZNFUqzTXcwoKWivZuv8NfE3P2ktyQ0Hoqx4UndMEm2fZtTRdlxdL+3
	Xw7WBmq3gs5jaFbiYk1Fn4rBtT/1e6EUWDK+zdg10GTsWWU2rLoVMb6jSLILzZGn4jpTJKcoGBL
	YmbAmhjNC98PyReiRlpARnePydlj/bKizZjNj/EuuEu/w81C7yxUPC5MBH/y5nFj7MAVEQqkwoU
	S7Q5VDduUAyfLjPXCovipAXBULGFS4s9
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-31347057c9amr1124714a91.24.1749148371731;
        Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf8XXJ8Mf/VVr/G14I6Dua2+GHn6PtLKJaQTP4schM9Oyz0kgDx0QvXZTk1AeUyR9rUESodA==
X-Received: by 2002:a17:90b:4e83:b0:312:f54e:ba28 with SMTP id 98e67ed59e1d1-31347057c9amr1124675a91.24.1749148371293;
        Thu, 05 Jun 2025 11:32:51 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fe0048sm59361a91.42.2025.06.05.11.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:32:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
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
Subject: [PATCH v6 16/40] drm/msm: Add PRR support
Date: Thu,  5 Jun 2025 11:29:01 -0700
Message-ID: <20250605183111.163594-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
References: <20250605183111.163594-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=6841e2d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=m2jltaIWnU9X2HFGTMUA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: yNXbLlBsrsrnj_TvO0YFo5bhHx5IilVJ
X-Proofpoint-GUID: yNXbLlBsrsrnj_TvO0YFo5bhHx5IilVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2MyBTYWx0ZWRfXx+aFnM4QW5DJ
 GSvk6Asamdik9LowzApqz31MuntfsWEseQolS03+A9R7hfb/7sU1stUq8wOg82Itqum/MnVGIaI
 ZSTouXZM1AaqaOdIKzjpkPbrQY191Azk3ET9P5jnne51rU/SrX/m3yy+Bcx0kQo7xWzHI9RK/yj
 5i10wvJVFkez3+iVfXQTFAqgc6v3B2iMav0uFUiXgfhPfU3MR1ovJyP2zXZFhegLvkaemtZhe3F
 bAUbsjcPlM0PAn7zAG3iH+RNRTJEwbrmiqvr6aQDZWKoq43dINyHbugaMsFGtY6XE0KqZH+xhLl
 GzKZq/WaTeo8j9KeYmLXn+ioKXsITOwqw8FFKaZoKX5FFOn4zHj+dJ09TJBymXiGGeOvylLQTvG
 Ph3YpGAbH1FHLlYQLQ8hADVs1p5KeOMgCMcGCfjuxEHVluqzLtrMpT4oVzy4macjwFqiD0T4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050163

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


