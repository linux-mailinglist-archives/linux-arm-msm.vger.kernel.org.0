Return-Path: <linux-arm-msm+bounces-60407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B29ACF73E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B68401889670
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C47289839;
	Thu,  5 Jun 2025 18:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er67g9a7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACA28981C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148433; cv=none; b=rmzKRFG1JWZnwk9xd4nyTEwIR3J67TyDKv0VM4R1oc3Q3AmS/IPdiWrGlUIiHT37Bzm2AYUgAPV5S6RGjqQI0hnukPaeLW4JprVev1ryxRMaapC3OJQXme9WWeTtCvminK6tW4POotwQMUVM0CmkcaKdZCF+gaV6tiWwt3EmXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148433; c=relaxed/simple;
	bh=vPu53PGWBpfPppllpl1iLj20es1VLGg4hj8SiJ/zrYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VrHsI8NSZ6vrjlcJMVJAeno3yqh6DTkTWaTpf9dDsI7iIEQZzRTSq0qy1sP2khSd12CakEivNcoynWRh2bcw392WQhsaGeYKRPD4vUbZsHMGkW1sHLzrvlPHcWk39oomvhbyrBXvXZ++y+hWW6/0XrJS58EmtpC5z1e+gqIioUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er67g9a7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555GVMgM004233
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=49iUFarYqun
	NoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=; b=Er67g9a7Gk+LidAHj0cQ3Qpw+LZ
	EOrAqqdSVqkDq59XlMHbDRo+tYSYL7Ja1AovMDGAFfF2RNgqcND39nck3lTCbvCo
	LEucwKE+Arcv/SdbxI7OJ5b9IVxrg9oGSUD7O3hKLfacNNtKdCxXKqZQyN0ZwYTd
	0u3k71SQtAiH1L9vSzgzSCvBcIegzE4XW4sEDc3spBWolYLfRJj4h6SLr826NJza
	w5+7da1NqDou+zrlJT0IwnlnI0os3Orinjhtu0HEh4mFr3Bg90ntPeH+RcxzsTs8
	wMTOX1zRZBOWfhWl2UEv29EAZ59+pjJOMTcILfb0SEXpKpf50Hv8+8CcpRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8s2cbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23505adcac8so11475295ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148393; x=1749753193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49iUFarYqunNoIxPR8E20lSmIXKZAbaZ3WmH/nqkmuc=;
        b=Hjo1aJk5L0dqVqmVFR3WeHvL0j21Aqqb+jGTNdMZD7oIERAldVEx2jbdYM/jvKKuCN
         wkdAxf58OUNk7r2nzlD5RUrF8uwdugUdDVlNeYVvlcv+0BQq1ga0yEhG1AMfrrcwMfRi
         scGrzd/EYEfZfNEyIxbXbGJJBGywt0dbRgEysuzOuBwy/Q38GHjj+QIZBdWzm0jr9zcv
         a4moqeaPTW87VhO+ocgcRqz2QrLVdMLyTkBJqYYyYEAlZeHc8LpAgoMlnBX+bvi2ez3Q
         NxaOmqX2P1YohzaxDWXATHly7ejSolhjtn3XlTheKi2SVgA8TLtFvH0s5ErZGVNNmkea
         YCZw==
X-Forwarded-Encrypted: i=1; AJvYcCVjYxclbhD33NnoTsugRjyYg2iHf7HMiXLlCD1gC8Jm2o+XqwjZtyqc6gGdSaBVUFf6OTicr+aPPKy2cccU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu5g3XPQS8SzR5wCxjSE3DLBvYQiY0ahz1/yk+9Rxx7T0nVYqP
	uQOYCYAKF27Nl/+Cv/yHp64CZkVYpBBjH7/U8EJgR1lxhN0J+pMkaXRUt6DQVCcZo86J63WNOyf
	jhyi1h+gZ3bgxTZu/0L921VySfBxnjCzuZzBHJpEDBT5qd8zCkv3JIDgiRxEOCy5EwdtL
X-Gm-Gg: ASbGncuthmZnqExPj+lTm52BZUDAXdTe5wjVps+bIisUkXQnCzizw1ZKo8tuesQ/3+D
	8jUkv/hg3kGVXQrHO77g1WNo7QpTMOwzYQ6ycmbx+lg5MyQVpazTEFTfPIMzleZibF+46LL1BGn
	s1Utkby3NmwI1TMiQBmj9j/GCbtbaGDFCjc5An5uWy2f5u8Ws7NHAJb6QkYK1PhmzimYON2wtnZ
	WMYF3ufHOuGP1+hGrfke9tzpSxzwxDm39oaZfj2uIQC8tdCtEL4H68XqC3YVgrSAoHRjaLE6UrG
	Kp9+cr7RnHXUoijhe+XmBw==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr6094155ad.25.1749148393469;
        Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0jqdoODWZ/61ArVqyj/ItoV5kaRHwp4+BPeGGigRtruYOwxTDYKpmN1DgxwTU01eE5wdGg==
X-Received: by 2002:a17:903:2349:b0:235:2799:640 with SMTP id d9443c01a7336-23601d225damr6093815ad.25.1749148393096;
        Thu, 05 Jun 2025 11:33:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf954esm122815285ad.210.2025.06.05.11.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:12 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 32/40] drm/msm: Split out map/unmap ops
Date: Thu,  5 Jun 2025 11:29:17 -0700
Message-ID: <20250605183111.163594-33-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: XHp_Zws7NO9-Pf6bsD0TG78HpcCoDLpD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NiBTYWx0ZWRfX7A3O4E9mSNG2
 irFmURY5HL9WQAmDjXmkF0UNnyV1u7ew7/og598ZfQ1x3BM14YWHHje861malSvblCufCVBw8ld
 1uGR3a77eR8cyEdqC1+bHgaInVYsT63b1FOl/sWXhbrTZykeN7fBj+JqR/apUo+eoNe0MSyNJtY
 n+SOHH0mtaCYpxJxKcHimlmZfifHshEH8HylQ3ZGaKy9SHUj9pBM3wVGAmWwrsxLG0/EELBMDuX
 yJCAgUlYPVmxc26mrWDf3euUawA3RcyA5Hu+kjAbTnz+AwWtOnMY5kj2oD4qYByy2pr6cFYawV/
 vTwdUl16ka6gr2zZWqWenlToNH9vxHHxtoYFrkuqFA/tS73lqoyOh8dqpGAHIAkcIOfIMhmrntN
 6CfFggTieh25IiHWpbvBMOlsQG8Dc5XUPKbP9zQNwWe8tUW8UDcpXTf1jD2gkdfSEzTv22PY
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6841e30c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=xxbd-mT8tQbqgF3hF1cA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XHp_Zws7NO9-Pf6bsD0TG78HpcCoDLpD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050166

From: Rob Clark <robdclark@chromium.org>

With async VM_BIND, the actual pgtable updates are deferred.
Synchronously, a list of map/unmap ops will be generated, but the
actual pgtable changes are deferred.  To support that, split out
op handlers and change the existing non-VM_BIND paths to use them.

Note in particular, the vma itself may already be destroyed/freed
by the time an UNMAP op runs (or even a MAP op if there is a later
queued UNMAP).  For this reason, the op handlers cannot reference
the vma pointer.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 63 +++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index cf37abb98235..76b79c122182 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -8,6 +8,34 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#define vm_dbg(fmt, ...) pr_debug("%s:%d: "fmt"\n", __func__, __LINE__, ##__VA_ARGS__)
+
+/**
+ * struct msm_vm_map_op - create new pgtable mapping
+ */
+struct msm_vm_map_op {
+	/** @iova: start address for mapping */
+	uint64_t iova;
+	/** @range: size of the region to map */
+	uint64_t range;
+	/** @offset: offset into @sgt to map */
+	uint64_t offset;
+	/** @sgt: pages to map, or NULL for a PRR mapping */
+	struct sg_table *sgt;
+	/** @prot: the mapping protection flags */
+	int prot;
+};
+
+/**
+ * struct msm_vm_unmap_op - unmap a range of pages from pgtable
+ */
+struct msm_vm_unmap_op {
+	/** @iova: start address for unmap */
+	uint64_t iova;
+	/** @range: size of region to unmap */
+	uint64_t range;
+};
+
 static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
@@ -21,18 +49,36 @@ msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 	kfree(vm);
 }
 
+static void
+vm_unmap_op(struct msm_gem_vm *vm, const struct msm_vm_unmap_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	vm->mmu->funcs->unmap(vm->mmu, op->iova, op->range);
+}
+
+static int
+vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
+{
+	vm_dbg("%p: %016llx %016llx", vm, op->iova, op->iova + op->range);
+
+	return vm->mmu->funcs->map(vm->mmu, op->iova, op->sgt, op->offset,
+				   op->range, op->prot);
+}
+
 /* Actually unmap memory for the vma */
 void msm_gem_vma_unmap(struct drm_gpuva *vma)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
-	unsigned size = vma->va.range;
 
 	/* Don't do anything if the memory isn't mapped */
 	if (!msm_vma->mapped)
 		return;
 
-	vm->mmu->funcs->unmap(vm->mmu, vma->va.addr, size);
+	vm_unmap_op(to_msm_vm(vma->vm), &(struct msm_vm_unmap_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+	});
 
 	msm_vma->mapped = false;
 }
@@ -42,7 +88,6 @@ int
 msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 {
 	struct msm_gem_vma *msm_vma = to_msm_vma(vma);
-	struct msm_gem_vm *vm = to_msm_vm(vma->vm);
 	int ret;
 
 	if (GEM_WARN_ON(!vma->va.addr))
@@ -62,9 +107,13 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 	 * Revisit this if we can come up with a scheme to pre-alloc pages
 	 * for the pgtable in map/unmap ops.
 	 */
-	ret = vm->mmu->funcs->map(vm->mmu, vma->va.addr, sgt,
-				  vma->gem.offset, vma->va.range,
-				  prot);
+	ret = vm_map_op(to_msm_vm(vma->vm), &(struct msm_vm_map_op){
+		.iova = vma->va.addr,
+		.range = vma->va.range,
+		.offset = vma->gem.offset,
+		.sgt = sgt,
+		.prot = prot,
+	});
 	if (ret) {
 		msm_vma->mapped = false;
 	}
-- 
2.49.0


