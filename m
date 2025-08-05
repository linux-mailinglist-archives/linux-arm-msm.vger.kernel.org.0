Return-Path: <linux-arm-msm+bounces-67799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497B0B1B8AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 18:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C937B1702E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ED5B2918F1;
	Tue,  5 Aug 2025 16:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDHe3jex"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED22571D4
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 16:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754412195; cv=none; b=BifbKm4ijJk8OABVeDRLfal+Xq9LfJrKNnlZkIsuBTJxuUE9iJitSwlKr55xsKoEZhA3xGCeWHXoXuDTjDfQI5hR3yzD/jygRUA6ho8VgnTZRyqkpLWZxlyW+A/YpCRCSDapS28HZ8sHh4UeaWEkBscoKRdJ541HyudLSvc6aiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754412195; c=relaxed/simple;
	bh=nBWEXQsygmIvIk8jgPIUAX212MjBTxOnfQSQBQYqzPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liTcvisUQx9zdd2d8YhuvoaUtedaaiy2uurUQ2E6WTGGoo1UwOgoWaGPf8SmYzfshDXWCdcD4lmsVf92ufOT9LJGpmlSKM6qkaZWs+NfytZrL9OItMczI2rDfDepLF4gUeWVLaUiG3OGJZC8YHKtrTID/2+5xjeyl2z+oUM+VrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDHe3jex; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575E3xwK029616
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 16:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f
	+0mrcaKc=; b=fDHe3jexkYZwPPGKJy7F2swAdK4gcYfVaZ2ysGacXOy+4tdFXPX
	UWGqAluR34H6so0S3k1StKae49FO0PgTZ0lBdtJ5ST5pvar71nQ1plGOGjZ7zrm1
	Dj1SyALsRk3iiHPlzHthrzAOqlnHDD8LAOsZsZAW2ZNYkrYUdLpPV87JBp4ewleY
	GpnL6AFbZ1pPtaWjf9TKAor+IJLaneI0uhjT62LXdzSSYkKrNo49+GZBIyTuCqG4
	0ytLr5TYRg3cJ0oXO8LL64VDY40AhqU55OmfJ1oG9Iig85nvYASXoBJmIjRKg+9Q
	K+ql863nrxDU1Z7ECEzlC70WtINCktNPlaA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc97kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 16:43:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b421b03d498so3260273a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412193; x=1755016993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hv30jdihqjoTZ5O1+BHgicFjeP5thjFR90f+0mrcaKc=;
        b=SnBEh/woS73N5DQcHGrTjxecZIiRGeKKGeDaKDTq0iJ7XEAAvvbbCp/ByXrrgZbza1
         LtIJvYbrVUJWinfXRdxuspY3FEl9ob19iqas6O9dB7NIZvFcx46P52ggS9sk7AShAB27
         dWG8eXx2HaCzrRL55tLL/oynff6GnIeOplS2XGCfsDF2NQWm6p8MXe5Zojp7Y1Y9m4Lk
         7U+pAczL8W6KOKGyhwP0EuiL3PuUEgvwi8PGIGIm2Xs9uQQYE9JR+SaegL04MzbUIT3A
         E/tqlaUKG+TBCuPvS4w1++p4lf+RX3NPmdj4ZNB7hldzN3v7OTXakFY3SFWJ4OV0JrBl
         bX1Q==
X-Gm-Message-State: AOJu0YzdH6uSx5QOf8XMMV1AA1sfluGu1sR9k3jr8pGk18OvKKHhXtWq
	1belwEdS8uY3lOMcr3iDuP0nsb/QTKKR65B7EbeAkQM+8NaxS4vebFeiRbfhKD+oAlftAdlVW+3
	YaFuA06RVsR4vgI9ZjM1z12zm8eWcupNSA/4SqJzjRu6PjaESsjQ0EBRITfOjvSSJ1rn8
X-Gm-Gg: ASbGncsFSvwvU/24GP4MmPe/ge7xIQKlZ+FaEC4QhItZbzMDvoceSYJGkBxnMCx6koZ
	7aTZdH5wRrFFFLz48gqaSYfhV3SbSpG67S9YE6YqxVtPAGv4pgL0IPJwzW/6OjsU5zlGOZ/Hz0S
	cNpbYxek0hFmzrTaQQa8qDUULDpxRQ5/u2wUQo/xMgmGa6MNSOoiF5qxx4UPZSylCYCvKZrNGlr
	vsp52tkjXGufF7ul/O38rBtLbLsCYD1yIHx10uzH8IlSn2HeXxXnzXNnxmgmQLK6y+JqGOTtmg+
	mIvwVxpdVdmVQ/jUXQLtX9yUhrY4d3G3xfs3F+eRu6Hgfy56MyY=
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-24246f721fbmr218343705ad.22.1754412192645;
        Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG19NECaSamtKmV1ToEgyAxx1m7KHOpQTVdLiTHMDu1lnYZHtJCITz8j/23vDlW8kqUI1HB9w==
X-Received: by 2002:a17:902:e889:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-24246f721fbmr218343185ad.22.1754412192122;
        Tue, 05 Aug 2025 09:43:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e81dsm137414025ad.46.2025.08.05.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:43:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix a few comments
Date: Tue,  5 Aug 2025 09:43:08 -0700
Message-ID: <20250805164308.23894-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mMvJgdm6eT1Sf4z4leCADG2hlD6_0Uay
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=689234a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=q6EcQpUjypoMYbJrLQEA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: mMvJgdm6eT1Sf4z4leCADG2hlD6_0Uay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDExNiBTYWx0ZWRfX/IQ5dMYEbmgo
 o2j5y8itury7Br8XwY3QfkRKiyICytGslqHY2YX/RvypdD0sOcAkAWR55D0XlFpQujdQwMI05Nf
 HV3GT4zqjiVv9NuINb6xqvgc3gqcWg7sB5wjEJrQ5LNZzLWhXZxcMNA/YE9wYH+spJVA7hu320M
 OMNlVrtkdSOAPryQ6OaImeQQll9J0qa7TafATd5VyuLGu+zDKAxm7YYKwOkVOBwwvtyfwcbGRBR
 HYhfjhkQT45TA5Q4hyL73QKLyUf1eWEc27gQ4y+wmtamfL+cBUvLp5S/T+k7IjJi36pbbDuWiO/
 4v0wUT9epP53oKAIoGSORjsU9yRljMqmfw/DqcgTeCpvdPzEVBK28nO50sq6Uz9bcgvVEi+Ze5h
 DOf7AIsP5qijoO+INfoBn2yip8AilE9kQKor/eyirTFY/+QYn0VoefGinAbuLiwdT0ndztUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050116

Fix a couple comments which had become (partially) obsolete or incorrect
with the gpuvm conversion.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.h     | 2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 88239da1cd72..751c3b4965bc 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -100,7 +100,7 @@ struct msm_gem_vm {
 	 *
 	 * Only used for kernel managed VMs, unused for user managed VMs.
 	 *
-	 * Protected by @mm_lock.
+	 * Protected by vm lock.  See msm_gem_lock_vm_and_obj(), for ex.
 	 */
 	struct drm_mm mm;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index dc54c693b28d..d1f5bb2e0a16 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -319,13 +319,10 @@ msm_gem_vma_map(struct drm_gpuva *vma, int prot, struct sg_table *sgt)
 		mutex_lock(&vm->mmu_lock);
 
 	/*
-	 * NOTE: iommu/io-pgtable can allocate pages, so we cannot hold
+	 * NOTE: if not using pgtable preallocation, we cannot hold
 	 * a lock across map/unmap which is also used in the job_run()
 	 * path, as this can cause deadlock in job_run() vs shrinker/
 	 * reclaim.
-	 *
-	 * Revisit this if we can come up with a scheme to pre-alloc pages
-	 * for the pgtable in map/unmap ops.
 	 */
 	ret = vm_map_op(vm, &(struct msm_vm_map_op){
 		.iova = vma->va.addr,
-- 
2.50.1


