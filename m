Return-Path: <linux-arm-msm+bounces-63018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E06BFAED0E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C81173B697E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABE325F7B1;
	Sun, 29 Jun 2025 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C205ImoM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9744325DD07
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228228; cv=none; b=g2F4BGRAWvSxqGcXfA//U2cqY7/kh2AyOpsCjoPBuiHE15P2Z77HJL2ewcns221ZcvfztTRI8GiPusm8NTKA20uSNg8EF2nxAKOPfB/5Bv/D2kajbHW1uPAcqk/QNQ2OrgcX9VtyNCUp+VgiebLuNuw1llqXvzwPpcnNCwMXXsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228228; c=relaxed/simple;
	bh=Ci4tiURPEN3fgQgUAfKfwBL/Zz+rrpzlouAnx0HAJyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t77jBvtZZ+gWg8fz0wolmtHJIdFolnrH63+PoZxwIafg8hL0vQyaMQ3cOjkO/0Q+4+1YCt+wrYv1JQBThfhtEkjNBDV1chsUUfCgVSA6dRUyjDbarGhuC2yc9vmBYLK0xJXrm9GPaeWT9eWUz91eRcsUS7x+I/MfZpUNuLrmu7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C205ImoM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TFcR39026611
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
	mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=C205ImoMUA3PXX4VdMPfQpZQcpx
	4l/8ebb50L2HtCB2w7fMbd2JYEy6zU+YJwsD0NZm09WUDWWtzqE4BgZ1g84AEBPN
	FvP7Kl7avWNryi3+zsT0mYgQ+HibZOLRF6+EJzkGz3vUP//UyypJ0z/tiFLFqgUf
	/Tfbp4Ky0vXiqoH96aRmlkXjvWsaDfzMrXm3j32Sj9eMEUYNVITa0ybX6DWBsuW2
	VbPa9PjBosu3RvaCfW5FRlu11745OHM6HrGxv78SVQqf+QMPj6tdxxrMgTiMIn4C
	8zvS9kBF6ABT/BOY5ZAd7gyzKh/G/9zNA1DjOXAoVR0D/XlUvrlA9V9UM1w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcjjfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:17:05 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748e4637739so2660747b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:17:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228225; x=1751833025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
        b=iLyPPjNYDUBuRPn8o2ZruKTCxCmRfTWA71gbn3OEf5VVodfOtUyKV86kvWc44vf40p
         FEZgd0Fl5sBsmuSBs45FLTYWXcDHoWLvnq0VqB4m5i9kYE5ipXWq00kcixjHMoZUjD9i
         pxiDTR3TG8TwGlpCK5BVtPbbU0/v1x/PENtTBOVJAK050qzFqgBqfMcBZORilPuRrLsC
         zysPwmNd0ojk/IowPJsCVq5QMEe478vZUefC5xQpfS3CqDmiB+u8CYDh/FjFawTVeUfT
         KM9LMhIc18k95s4HlyAKzLKe9DmXTA48iFWU8RDGPduAn1zJufm53GNMHtSQ+CYTgZxh
         LvGA==
X-Gm-Message-State: AOJu0YwxpGTJdSFq5VPax4yBT/A6FBdbqc2kkbFkeAVgKh6VOx4Hn40M
	kXc5wYn5r8Z+F2Rx6MPM4zAJ52kfqFrItvddluSOI7hFUrw7HxY9Ocw6oiExjZevsQqZwrhNs34
	vHc4qiU77ciFZPDyEZXVJPuBXvrqImCJ4Q75HHGTdYaTjTKnqGx0ICb5A8Q6o/DqcNPxK
X-Gm-Gg: ASbGncsB2zaTNlVavJiDt8N67ugnrZ90gI95JWe40+I6iuUkANaqxw5TOIlaJhs8cwe
	cLTN8kPm3zBwNtNEjD4F9VUqkq8OVaR+fekd1sy8WVcJEtrC4pzc95nFEBqJiH1nz6ly1oFNtAj
	/iFhf8Wdxt0oTDtZoH9WgAV6miy9Tk/uG5ej+Gmjay6+uhGDaFVCVGc4y2reRcFXV1xg0dqXGL1
	v1LSuTb3Pdb65UbWzRZ9aaR8bqPl0eQ4GWwXw1BLDVfCR+zMDpfDpO7wzPPb2THKfLLMB1Pxd4Y
	1bjouEtUNZB15zD5IpJ9btNFc++hgmlAFg==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr15223419b3a.10.1751228224784;
        Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0f42J78b5kxB0hNvjroBKsRXjXeZuWzvQV4YS47hMUJFad/41z/IabO6ypJ/hY16UGYkV3Q==
X-Received: by 2002:a05:6a00:b52:b0:748:6a12:1b47 with SMTP id d2e1a72fcca58-74af7aef473mr15223388b3a.10.1751228224324;
        Sun, 29 Jun 2025 13:17:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56cb98asm7266082b3a.126.2025.06.29.13.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:17:03 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 13:13:15 -0700
Message-ID: <20250629201530.25775-33-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: vUIjH8BJ0RiUYRi7bZb0VI3uwrcuV88a
X-Proofpoint-ORIG-GUID: vUIjH8BJ0RiUYRi7bZb0VI3uwrcuV88a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX4HCJwNV04S2u
 Q4Lu/wdkdnhjLAbUhfisxiUA+azeNapxeG8oLiQkKEYhvS4EGyyuVM0EjNbaxUP4h5b9+eMOIQK
 JcXk7/qY3f/Infhs1hZ11MqG4yhz065IaIXbJA9p4JEF3OjzQPUrLWggSmmOevEqT37rknBcynU
 HNcOt9Y3YrfCjNPoVFzW4eIyjLBIrrPvchObIYOBoKmC67AKJTDDlM8IRsS97YX+FSrhrDpfI1G
 tYON7fD1UA5kABORE1NfBMNJao/x47M9qHw+B2H/yCiRyvoAcbRC82PkpBXfAi71W6V1DWM1NaV
 HU7cI9JGtsI3goCuTj3LNj2YmRNhqcBD0zchIKv4O4+a6UORiGZPuGIr10fq8dhI95pm6W+xaXB
 8BCK0eMaCkUCRPAmGDTwSaQ33B2F0LQJCbIDCgH1DBDPm6+MAjPIvtCpkZvJsZLdgh6Qo3hM
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=68619f41 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=979 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506290172

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 62b5f294a2aa..5e115abe7692 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2280,7 +2280,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a0c74ecdb11b..bd67431cb25f 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -94,15 +94,24 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 {
 	struct msm_iommu_pagetable *pagetable = to_pagetable(mmu);
 	struct io_pgtable_ops *ops = pagetable->pgtbl_ops;
+	int ret = 0;
 
 	while (size) {
-		size_t unmapped, pgsize, count;
+		size_t pgsize, count;
+		ssize_t unmapped;
 
 		pgsize = calc_pgsize(pagetable, iova, iova, size, &count);
 
 		unmapped = ops->unmap_pages(ops, iova, pgsize, count, NULL);
-		if (!unmapped)
-			break;
+		if (unmapped <= 0) {
+			ret = -EINVAL;
+			/*
+			 * Continue attempting to unamp the remained of the
+			 * range, so we don't end up with some dangling
+			 * mapped pages
+			 */
+			unmapped = PAGE_SIZE;
+		}
 
 		iova += unmapped;
 		size -= unmapped;
@@ -110,7 +119,7 @@ static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
 
 	iommu_flush_iotlb_all(to_msm_iommu(pagetable->parent)->domain);
 
-	return (size == 0) ? 0 : -EINVAL;
+	return ret;
 }
 
 static int msm_iommu_pagetable_map_prr(struct msm_mmu *mmu, u64 iova, size_t len, int prot)
@@ -324,7 +333,7 @@ static const struct iommu_flush_ops tlb_ops = {
 static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(parent->dev);
 	struct msm_iommu *iommu = to_msm_iommu(parent);
@@ -358,6 +367,10 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	ttbr0_cfg.quirks &= ~IO_PGTABLE_QUIRK_ARM_TTBR1;
 	ttbr0_cfg.tlb = &tlb_ops;
 
+	if (!kernel_managed) {
+		ttbr0_cfg.quirks |= IO_PGTABLE_QUIRK_NO_WARN;
+	}
+
 	pagetable->pgtbl_ops = alloc_io_pgtable_ops(ARM_64_LPAE_S1,
 		&ttbr0_cfg, pagetable);
 
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 9d61999f4d42..04dce0faaa3a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -51,7 +51,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.50.0


