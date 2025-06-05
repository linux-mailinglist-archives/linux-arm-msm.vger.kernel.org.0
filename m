Return-Path: <linux-arm-msm+bounces-60403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7403ACF730
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753F916B220
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21C2288521;
	Thu,  5 Jun 2025 18:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClyghPom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5D2882B9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148394; cv=none; b=Y5zx9ip0DP+ALw1Ta5j905yFLWaoi8N2k+4lkPVOIcd5tFBlctgfsOEdJpDJac/Ep4bSCxqr9elayiPmhb3SeVENY/33CqQNdORfkSHivOt6XhbR0FwLm0rjIUDxvj5RDmgzZ6hF0MShgGmN95YzJaMpRPpKC0uI3o3UKcgJlLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148394; c=relaxed/simple;
	bh=miM77xEXTrB6mt10AQICgq6MDZD3BX5ufhFU8RcosDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAnYav+POki7jY5CPxgRwNNfzUDimV7eua/kEd2uYdm033xKwpi0BKFxna1i/3BhGG4vxC+89LudZYl+NO60pjVfN3koERDO1wz5AE6PjMBxo6SvGtSlD+im8inOrqBEi5bdy3uCbOXmvlxzJ3UhZPcBZY1zqXPQrNvdHOJ3FpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClyghPom; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555HFnvG013514
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Jun 2025 18:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DtgSsqvS9NG
	lueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=; b=ClyghPomOFoMdTdJzGxve7TKXHN
	3OQUYa+lC3FIecHp1y+SfCYVCczz7kP0u2EisRTkMBKeg/Fhh10uMMHFbVjIzh1Q
	Edh0I7kadwComP87m3bhTriUzqyr83vu1PIFmN60gfewQ94d9+4anjazQQ7A2IOF
	oeBEThjo659CyseoxQMEROIrKvsLB7NGcpLlaUxf2DYnP9WyPRCFFWAdJZloxcYm
	1E46HAjYohF0bgJpxj6/A3tvT75v4bGsfa1mTssWN0Ce62ZZbvRMYPBw5vNUL5i6
	eakOoYJaiuu1rBi3jjf01tXi8Ry8cELlkRZC9TsZvD2HYOU/bssjqYHLNew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nt9w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 18:33:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235842baba4so12086755ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 11:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749148391; x=1749753191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtgSsqvS9NGlueSPRpKpNF02UHsYVqSrf4yaa+KHu3E=;
        b=P51cQ7HEtdbf/mscDu2zX9WlD92cxeyz+q8k/YU/FAu4EAk8GgjmVTMDFTspxHA96H
         P0CGY0QEF2nANsIT2WM+gYO7yJ9eUCV2s27lBsedL/Ks7Q2UpQ11TgATCdIhgiAf8j1h
         u2qEv7vk0aF7qRlffje/VV2CNRvM6jz69GsV9HI2sK4wOxcnv+juC0tPXMy3k9x6GWkf
         48ngqhuOMkPRy9ytuyJp0N5Euw6BvsPMmpk5wsIUYSHaFv1fNOxXlCkbLm6MZ/TpwDYT
         5xogOCtq1bRPEotUPmgJUX9T5af5nvj8hCxmqFkYvX18/yeCAvqP47Jf2KZMhP9qF32z
         k9fw==
X-Forwarded-Encrypted: i=1; AJvYcCUOtdv1zmLGTWKiicFEb5B0To2gghYu5kn8wuy4DP/gXF8CKfJT3uhOpOXaPMu6qyp8O4uAJOYZEj0mw+xF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Cre5/4T6vpQmiA2F7ZNSDqlU8y1vhDdzdp38M3cEGM+NIdw9
	FCXo2jekTH+Gir/58U23fZ6oPKidD3rkfa/X67g1p6mAldXehztracx/clxVet1ubpeyccyJ+95
	b2O+CqLPLFpMgaGE6qh91DXuajvfSs9FBAeRl1/V5SoS3bgzwIPvcX4DnGB5Eif9a0Zxe
X-Gm-Gg: ASbGncvrpLepoE6naOpOtTo3m1VwFIvJgERIdwEkAmG8xnQ0/sHJRFbW6l3iZnIt9rP
	BEapG8nrXkZaEmWN4q7bGeTDUTCrB3CSEvQkUmi5DHeRUQZahfxdKxmvs/B+J3DoTS4EpcFai5U
	BtMWGSwyWU6SucrNLBDH3g1oVdsiRZqlz/vVSFqWHocgvZxzrrrEWs2kTdfmR/SjSFrE1Iq8l7e
	OCFk/E9jypi7wc3IGb8eUsXUrK0IbYKoNcrZtbXUvc0/fI6j24/oYJvlEjYohtUsTERbAkzbiRl
	A30VAqniUYx58DHFtZHkEQ==
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-23601e76032mr5573115ad.24.1749148390860;
        Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOxX7OAxfRTU4dE4awOTuujPdjFcN3dyi4/iEto+JK4TWIehfBEilrFztqx0wPx+KLj25mqA==
X-Received: by 2002:a17:902:ecd0:b0:234:d7c5:a0ea with SMTP id d9443c01a7336-23601e76032mr5572585ad.24.1749148390362;
        Thu, 05 Jun 2025 11:33:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3407sm122902075ad.141.2025.06.05.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 11:33:09 -0700 (PDT)
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
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 30/40] drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
Date: Thu,  5 Jun 2025 11:29:15 -0700
Message-ID: <20250605183111.163594-31-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: IUjMk99nH5bgTXerz_nbUYk8jYGl0oQn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE2NSBTYWx0ZWRfX3AEHdzOLwFPB
 3Zm392oSmWw0mfG1alh1ibfHKNVFjtNTvU028f7tnGAETOsTojYuNNv1KfGQUsSRM/xxko9Hqm6
 7kEzGhksbzlL0vhLNGLNfkMII4WofT+M0XSiA2YbIZruQQSJZ4JFW+8NTR4n4FxZVWj0KiKsIo7
 egGjTHtvbvYS8XZkd5Q9MtDqVbJzovkYm2bTDc5fDX3XWzJr5oRJnkA1Bouv2p7FZt6yAgnKExB
 RXS6DFxqdfgGJ719Yr8EzRfeGj/42PUOQ30JcUbkC1jT5to/IhHNKgJXqr21N0a1LGVfEHkh3vR
 6LVmGkQOpMgoIOE0yTgX0tkvhL7wXJdgYwV2VtzvJNm0uV7a1B1AxuZwUi5y+9qFz7kanoGioOI
 YdGFYXl+6FgmDDI/pvAMt20mTAD2wMVnK/LgRQh4FHpdSdiodGpEZOh0l146dcS9zngVsTIp
X-Proofpoint-ORIG-GUID: IUjMk99nH5bgTXerz_nbUYk8jYGl0oQn
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6841e2e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=MLfKQGWeMraaM-6YArcA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=987 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050165

From: Rob Clark <robdclark@chromium.org>

With user managed VMs and multiple queues, it is in theory possible to
trigger map/unmap errors.  These will (in a later patch) mark the VM as
unusable.  But we want to tell the io-pgtable helpers not to spam the
log.  In addition, in the unmap path, we don't want to bail early from
the unmap, to ensure we don't leave some dangling pages mapped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_iommu.c       | 23 ++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h         |  2 +-
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f0e37733c65d..83fba02ca1df 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2267,7 +2267,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 {
 	struct msm_mmu *mmu;
 
-	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu);
+	mmu = msm_iommu_pagetable_create(to_msm_vm(gpu->vm)->mmu, kernel_managed);
 
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 756bd55ee94f..1c068592f9e9 100644
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
index c874852b7331..c70c71fb1a4a 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -52,7 +52,7 @@ static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 	mmu->handler = handler;
 }
 
-struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent);
+struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_managed);
 
 int msm_iommu_pagetable_params(struct msm_mmu *mmu, phys_addr_t *ttbr,
 			       int *asid);
-- 
2.49.0


