Return-Path: <linux-arm-msm+bounces-62962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF1AECD99
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D1B5188F68E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF1524469F;
	Sun, 29 Jun 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZSmCBvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34447244196
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206091; cv=none; b=n6wXSHjSZkw493W+7rucVM80SrCqX3DrdysJOTIZec2XttHVA9DbNBKKMBu3MhVw1nWEpvL0ZQoXhGaVXR8kkSiLbiBPBFLXtNDX0sdYtd4syg+sSXifyoWcsdPFvPyI6vH6Cug+hde+Vvmw4lUXw3XM3JSGMaT9f+vD3Qhx97o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206091; c=relaxed/simple;
	bh=Ci4tiURPEN3fgQgUAfKfwBL/Zz+rrpzlouAnx0HAJyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPTNP24g/prJ9EUXG0iVTWXD7wzI4YQm9lndJI1ThyEwaVo2VWLYvwjzHaBossh6hey2ugXnwiU59B6smG4YZ4sUvHtWQwd8aXJ3XMK/jodZB9zKtISbtLIO/niC70MnlNau1w0hbNHBKzrp3sD+rFI53fAe0hvJsjh2gZtOqfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZSmCBvG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TDUN8A013224
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+3e0ksDzZ42
	mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=; b=VZSmCBvGgZjdmydzwZ5DBStUTGQ
	UV9Wqke/L28Nva2w5HQeQ3RLj3WtxSH4mPGU6WroNOAwfG1uLj55alMN/mx4iMXm
	qvFYN3RLYlRlCfYnGVxxWXrd9fGaBDkp7v7Kh1Xyd9PlSN5RAOdM3iU1dgHCD0X+
	Pnk6U09kU0/VB8JRQe/Qq/dQzBBOLTzipDnqWv1jTD0Cn4wExz7pe+R8To0OI9xr
	QMOw51Uw38FgQOHZa4i5qICMDKEdiKn+uDSImuwBabTtDDG9y4R9EVAd0j/d0Oa9
	mS5xLpkclwaY0KidVBIhUAd08jjCo6kueta+FSzce9iPHLitVfP5tXdON3A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801t7sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:08:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso1425136a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206088; x=1751810888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3e0ksDzZ42mLlKJB4uSylL2Fh/ag708LB47aoZZ0mw=;
        b=OImW8TLugY5jx+t/kywRjsLfS6pWP8KP9YBJYglOYvnLz0kP5MPh3No4Ljth67gEAA
         7rGr0ttU6j/JMDKlHyqLu3Vg1Crz5et3er7BbJaC0sfPxiK+gKt0wmBwwRjVRnSdpjcq
         EP+FWk+9jxhG8KcjY7YpakUdOqS4KBjFoLp2TIiHTCPyfll3yiUdDQRbbaYu7fIDAcB9
         D2UXRzY+1CfEnXRZBoQv45dXNQieyAd3EL+ciLdEOO20F6N+p6FDyMRj+DcDwYVDcelV
         VRpeL2E3wA9RRTHbGm7CBl7F4seGWUJbn5Js8ajUCYDa0S2XOfdpTzn6C+ovm5de0z3F
         tMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/rxieH2a+GZKb8Zjyh6sVtln1JkHd6++onx1WRVc8X7FOefR0p/yOGF9ALTYJ2I2odFG7W+3prMLSsUZa@vger.kernel.org
X-Gm-Message-State: AOJu0YyGNVG2uZjk2Qx9IkusOwHDJ5dTbDbWeQH0MWCZk9Yet4G5bzKF
	b+i64sqZ7IBLGpv/p8cbWIlfA4KJywQn9RnDwaDyA23BrNYik7uWYiU0ZlhySjzLA90IllsuUUk
	XCd2M1KrtDsmII+D7TULi6R45u5CusyDK4tk+Jo2hnyollT6gtjxO3NffPY38/JcVPxEB
X-Gm-Gg: ASbGncuDWyxtMBeJY9xc0qllIPh1+6unSHXyNljKRP4w0qsP37zM73Yfvk2zOAtyjQz
	MQlrkdcS4M3RPBTUSOV67+9Z+lxQ/DYbLIKhX+fHFQiUlWwYeXv3T4WaQMivZAO9yS+KCLfqviB
	cJn5xH5nQOz5NGCEjgzucHLci3mEfztSZCa1DmRetR3URB3jRrb2M3YNKvO8Dq5xjZgcm00j0NK
	dpikkRWZPqRLJlbdfHdgEDC+Bc7ErBvpnvuIYGz6Qu9GGhRFMwrU2ztXsHNOiANSmlPYB5x3VmD
	W37/ifY/cg36miZtLKNiatWsrQVO6JKS
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-318c8eed32amr14074268a91.11.1751206087732;
        Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYkvmCpaWJmCDoX/uhVGt0Pk6ICFtUgsS6BHNOC2nwdb/Xmkyt9dsqSqbLYw4AbYMUQq+a2w==
X-Received: by 2002:a17:90b:4a8e:b0:311:e5b2:356b with SMTP id 98e67ed59e1d1-318c8eed32amr14074204a91.11.1751206087057;
        Sun, 29 Jun 2025 07:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bc7dsm59102335ad.114.2025.06.29.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:08:06 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH v8 32/42] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Sun, 29 Jun 2025 07:03:35 -0700
Message-ID: <20250629140537.30850-33-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 49grQcgkAXvvMtRws1c9iFfZBFmArNDL
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686148c9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 49grQcgkAXvvMtRws1c9iFfZBFmArNDL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOSBTYWx0ZWRfX9JyXi5tFDHmZ
 I8RckE5sGta9Qg1CvmtS3FdplwjlBJ3PPbfMFUqQzvEfLbqD8cR8jxB22shfhByvqVTdGQoqo/8
 risBpFCjWeFeOaP95MD9uYzLSe3KfMWcu9/ygPl9tWcCry5cLWU2ZK4WNN96C2PVSqQ9gBZ+sxj
 Tsh030WtJ70aVx/36aTl9QJj1haWJyJ0xJgB6T+YFG6exdXZ1XvidNfkwMVCqImJc7K1yRx/f87
 dwZSTutBrJM26qH/zOAREUUhWFIP8kgVDaPWFuzpOgout3YSRlgk+lxXJnQpFKNPMZX7/ZDrh0T
 P38oihqYO/3StwxqAQXDyuHjN4NjN6ypcOiucRUDfNyTtG/8LhsuvLDB2lTMFPdind2PcNN+scA
 LqqD2LQDKSacH8SHB5lIskdz7pIBnQ6x6aYN5NV+1y9vGNpjOrvwtIl0Czvy/jv2R2tD/grw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=979 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290119

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


