Return-Path: <linux-arm-msm+bounces-62519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A30AE8DA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86EF45A1DAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEF2E0B45;
	Wed, 25 Jun 2025 18:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WovWfke8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A72DCC0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877910; cv=none; b=P7owDnVFZTHdaNFPgWmHupQVNkX/8DgGfMWD1J6OUBa9j5D6DLUHDrxOHUYrIPeJCSnfwBYEjPR75PO8PVtQMpIjj/HPu3HfukVVlGj76NR4Nr8GLVHwACgxPqm3iIcMgJsn/KFJE03dyy3u8Ab2G+JpG4aFQIG8nylCJrmt1mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877910; c=relaxed/simple;
	bh=x6l1U8SQbNXar2T+nKC44CZbNnCrpWZd9rRpAvG91aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0mkZOq395NcCEP0Ft/KjIe5bbaAtyoVdMdE2sAL+H5R38mM6p+cXVTVDZZCPyBGUd2srLrIALqV+DCr5rnA+Hi89AjCimQoCdvuq/5XYhT2Hv+4Q0U8Xxv9fth3catf86/rdqUR3HtG4Jof4uJCYDY1Qh2KRcu86KYapoWk59Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WovWfke8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCdV7G019166
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BHyE+ROYmr1
	BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=; b=WovWfke8x2POZSi4XbGmSzoYY7r
	OJuPg4AxkbaNSEDy4W9A/qIvRpSjsPBtHFLNfg2eAF7LchS0j2rSUJZNSxecTKhR
	ZSd88/qdk1s4I+A+WGSbtG91p+FaLHyyCB7THVOZyDPRfH7EpACjmmePFE8utNH5
	31zjC90lH2xfh/5MvanjaDhKs2YgMalBEDZZfXUtj1gAB+Za/nwOp3miOitMZUFb
	qFjPLR3wD/j+IlOVshFrvlhITG4lP1LYb1b7L7szhnPuDzcPsTxCn0zCCRo5ANL2
	MO91QPqTho0c7/OFx7yG4eJmt5++tQrfLcIuoHCovxInXdp2sZFW6EXzsiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso1032335ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877907; x=1751482707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHyE+ROYmr1BYZwR3C+QXhzqfJ1dS+58uUEwZ+AZnWU=;
        b=Y1q0kzVDeqTDzRs7pXjmWFz9+qC4ej2emQ5HMfUcq5hw6D+qV/mDneRvrtSfqqG328
         kE2+q62RP1UdjnzwtAbRrdXLiKY9YHq8fQWB8b46KRcPMfbLMPRVinPAlxRrGNAi0haC
         7M3ieA3M1HtyZPWQiI4yjzM9pq5CvhymbzuFs6OXI725ANcXHuSsiEkNHSzVkJE+Qdd8
         FEoLbZIbLiuSFAKdGixOlwnDR76n5NjwZDzmipJGxDNqR/Gqj6RVehMHRTzoeYB6+Wdo
         dvzAG3/2+t0BcjKMBfTJsZPGaV2Ki0GJ8A54rzqg2B05zxQrDpwtqXxEW1TKvoVVba6W
         7VZw==
X-Gm-Message-State: AOJu0YxfAvK7j+k9JrVMFoZIMjPjLnv6StSiWWONUGKuko+n3lDbsC2y
	pWRewhF/ZpX8dkIo3Alhs98OoiemE45pIdLV98DngNyApj+7v6AcWFKF5xzkwfKwMsKapdZmQnI
	NkeMknmExrB501NTmFnAbV2rw97CIsS8eA8nSQlHrwS3H84MXBs/Z12VlHziLIq/tzpDs
X-Gm-Gg: ASbGncuN2mpT1iER7GGETYe3S2Mm6hYjkcTq+9ZLbcKdjtjHIc5ZDoUTgIE7BOErP/D
	T2lZXnqE0pwskWtx7wQZ1cFJX5wOHmd7g/wpqtNHkPYukyLF79Cq3NpOIDPXNMXCDX/B/bC8qUn
	2AZ3Suwsrb/emtrsIAxSvYL5xX/BOAFor//MM5h6pSqFelQgWOQpeP1Bp8t31ohHUmMMBF+T/xk
	XUFtnOf1Hrs00Hu8SFVEjn7/NCdFwCdk/5cMRqCf0fMey++dXwCLGun4/ICve4ZvhKtHvTmjnmc
	1E24PjhxHPUuwJtUgGfnM6Adwnj6kW/U
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id d9443c01a7336-23824095671mr80469745ad.53.1750877906904;
        Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfOU8b5xN3DBcrI0SlkS8W7vOGGlK3RW15375C9lfmS207Fy10Dze1XSZd5UHnBi7y5LdHyA==
X-Received: by 2002:a17:902:ce06:b0:235:eca0:12d4 with SMTP id d9443c01a7336-23824095671mr80469315ad.53.1750877906514;
        Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d868f878sm144055785ad.184.2025.06.25.11.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 08/42] drm/msm: Collapse vma allocation and initialization
Date: Wed, 25 Jun 2025 11:47:01 -0700
Message-ID: <20250625184918.124608-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: byuSEn0ZM459G0h46ZB-OkKdSk_z-wAD
X-Proofpoint-ORIG-GUID: byuSEn0ZM459G0h46ZB-OkKdSk_z-wAD
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46d4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Fs5xBETKxiRrdmql5B8A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXxKkSi0dA70ti
 T8ic5t68YqEUg48Wgd94KmwJeMkscrKb9Db3U0gJ6QGS5FfIN2Sp7KWB0Xq2ajuulYInHUVVV1J
 SJgY/FEPHhYSEJZAb8w+rRu7NE8HaS29LLfY67pn+MNLzy/0ei8L4DOyTfpAmj7i0MZaoBwtvmk
 g4iWR8i2hhkBEaVjUd6MbM8raG7mgUXpPnZX774GuY7QPDB7vzfJvRbScUz9ryGfJjNhj3IZLpD
 xb2JTsFARoOFhsMJ6oeYYtwhhUGywcsDk7tPcg9RzzVOHhmkBer20+HgrgTpcWL8M0ouL+MWZLA
 IybxuP7bC2V0beR5PyodzlDkxlOhoOIH2RD3vSwNd09Yjs80Gi4zmfuuA3wFQsExnm1WXyRj1On
 8/0s6hzXfG7I/Hhxof3KtdiioFXxn9PSCJNU9R1m8MfVdupLSEuDbS3ciYAs8TYEIr/gi3CN
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

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0


