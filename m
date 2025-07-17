Return-Path: <linux-arm-msm+bounces-65504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68152B09070
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:19:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45D6A7AA010
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85292F85C8;
	Thu, 17 Jul 2025 15:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3Qcr1D1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD6929AB09
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752765579; cv=none; b=HHc59C49KXaDnHN8rDxRj8Gdjf95pF84x5Oo35qrSEYpuFrPPmDNbBynFOtk1yu5zzQ6IMbT7JqF2lYSyvRGDqvEQ4YpdmBFylTabPnqhhZsvhfcNZOwfpC0U/a+NE5QK/SGN5TQ063raOMS1SiY93hxSZcHWFpK0tadBKBigEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752765579; c=relaxed/simple;
	bh=nIYxBNrh+IGmHzXHyYM5zL3J5yc7OmXVZMJo45Kt+0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=urAJDfNY8YO/CbY/LO+p/ufPop5w+L9dMbgBGnRr0y7YPUoK1XaWNIrrYWk4rxFKMrAYiuINLZ+f8xTucXK6bVj0NstDGG+FnhvmQENTSzd74EjlWi1EomKUCpogD6oSOXjxkAzfJysJZu8PQwMkraPEugTlTxpvhvZusMDsXls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3Qcr1D1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HBu83J001312
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD
	4qnNkc5o=; b=C3Qcr1D1NEUcWP6EY+2mlCyQQfNqpNFXdRT6CEeOShwlyLY6upG
	NvYLb8oYruljiKwllG+0oOpWRm6Ism6qOlxpuxMRtt3rT08fg7JMwOM21fy0t0u+
	n8nEuIS24IeIrah6IxzHQ7SIGbZwJjH+VgieZ8kamfe6db/JnNVH+cKMm/fjGxd+
	psGrYB00jA2ANjF48EhZIh7q/wW5I1fkpcEO+HCGF4kJKt1ff/CY1/kScqmkbZsQ
	sDaRcHIrFnC6DB2E/1XhysUcmcGPyd5QIH8fee7wewLZ3zD2pVFwtQTrJ7SPvkPW
	Ez2aNx0AhXPfvRejnGaUCKBYGyd5fDVAOSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dru7uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 15:19:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3bc9d9590cso1263466a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752765576; x=1753370376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdkJ8bz+kx17ne/rgHDgW3wfkXF5IySByRD4qnNkc5o=;
        b=rrysBDTPUGYWeSUNtuW/O8woP2gEmM102mGeYdQtcAnRjy0im4GqHmjUIlQvk3uaGy
         MJUh7RXEaHJlW4E8Lpu+UinK0Pg/uFC380NZSKNYo39tjUtK80kB+d1hDgY+/tCpiOPT
         REEpcKnItIZUgxvBXCnJu22R0FUFp6kTUQD7u3OKBV0BK3i7cJnKIZEbes2ZRQzh4Wo+
         yNq+9N4FIgQlZhiK4AWYCV7f01dDwVsCVLzrGHXkwZIs8tE7menRBlzgBsfWTmpKFHUv
         Y4MQCYruetEebPewox1sBRmE4zrVxL/vnvCj1KIup7K0TrI1tQvP9F+9sndKHfFi0ElF
         +aKQ==
X-Gm-Message-State: AOJu0YwfqNgWw9aj+BP7CHKqKcC+7sQ7jeFWshRCvA5Lb1f8AI0guiPG
	pUxnA5NusKOYZOstvaNI6s943ojl7kk16bQDPYmRHBPg/VgQNsdb34SFDW/nqnU/nwrXrxR+K9s
	Y/6tu7NsKeXJV1d3Qf5FGkqj0AgEgXemd0Cb3Gc/DtdHsiU0huHo0jRCLsS0iSUxuV59T
X-Gm-Gg: ASbGnctt44R/PFfer3MBPrrkMyyOTmd4fnLZ2HbjVmy9nX8cucfqcfuK0Fl0Z6TIrWh
	xs1DdZuVVi1TWIhgAolde+WLKC4kGkwWeutIooyBsNtoF4aiNg/MO5GMWPfCbIa9CX0tWPQz2HL
	+qAgeWTksGjEs+7Bzoh5zBGIF9DBtTmjdH42GvH70ycm6OpQq9CCqoCofWd5UNEAFjJKJXdduC2
	IwmSrFBHdYaRilRO1Nsf4weN78SLxpvCYHLJbFhh0Qe1x4TsSmfSXtQ7lm7PW4K8AZ6IjvQ2ysP
	A7RruOVsw0HxAZ02V2oR5PgIO/49Ta/5X5BNMcTyWxNlGC/HOvY=
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-31caf85e029mr5009456a91.15.1752765575727;
        Thu, 17 Jul 2025 08:19:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJBlIDvX0IMhzg5s1vxarPavrcpaAW/SghWPjLESXyVamMIaNFxD+9sBYlLjBFgfg4OT5j9g==
X-Received: by 2002:a17:90b:3a91:b0:311:9c1f:8516 with SMTP id 98e67ed59e1d1-31caf85e029mr5009375a91.15.1752765574859;
        Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7c32f7sm1708090a91.16.2025.07.17.08.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:19:34 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Fix pagetables setup/teardown serialization
Date: Thu, 17 Jul 2025 08:19:30 -0700
Message-ID: <20250717151931.10228-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: uV93H-VHd3J32JF_ta5hEE3gguRklsNr
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68791488 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=ufhHnk6gINzqDhHgaV0A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: uV93H-VHd3J32JF_ta5hEE3gguRklsNr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEzNCBTYWx0ZWRfXzhqIMoV1ENGO
 RQuf8Wxk7wsNMbOoJ3PHq8v4Q1h8XU7f/8BMq54YPRmbH+ZQMlPcQFZ2fRUd0e/YgT68Bq5T2J1
 hbX4U5empzxtMO8sAEpC1osVI/1MuFlT0IzoWODlquGGdpbvA5qu9JmqGqdb8tcpHGBcPPnnSuL
 qT/MQwgWgPCNWkmqF/NwrizOmIcK85khfbFs5JGWXDag8fC449FoI2j+qM81YiCB6bE9JbZNYkW
 pgbJvcbl2TTFHnvmkJZ+IFM3Ps7s/qod1ZEfTz07YAhwpPVchilhAj8s6lolcxeG4OCUmeZiYEF
 ZMn/4A/3lYIYfN8wY/kxS3WWFupTXCnS7y/mdNNm1ysi7CgQXyNgSGgOyxoRySZyoHb6DHE5W4N
 Z350w/hezFhsAj7twcAStjZtiHsM7P7wmxH0Ub7NmNalV2DJ/lpZYTCUoRUj+j5ZBHu2NJdI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170134

An atomic counter is not sufficient, as one task could still be in the
process of tearing things down while another task increments the counter
back up to one and begins setup again.  The race condition existed since
commit b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
but got bigger in commit dbbde63c9e9d ("drm/msm: Add PRR support").

Fixes: dbbde63c9e9d ("drm/msm: Add PRR support")
Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index cefa50192391..89cdda73711a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -14,7 +14,9 @@
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
-	atomic_t pagetables;
+
+	struct mutex init_lock;  /* protects pagetables counter and prr_page */
+	int pagetables;
 	struct page *prr_page;
 
 	struct kmem_cache *pt_cache;
@@ -227,7 +229,8 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 	 * If this is the last attached pagetable for the parent,
 	 * disable TTBR0 in the arm-smmu driver
 	 */
-	if (atomic_dec_return(&iommu->pagetables) == 0) {
+	mutex_lock(&iommu->init_lock);
+	if (--iommu->pagetables == 0) {
 		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
 
 		if (adreno_smmu->set_prr_bit) {
@@ -236,6 +239,7 @@ static void msm_iommu_pagetable_destroy(struct msm_mmu *mmu)
 			iommu->prr_page = NULL;
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	free_io_pgtable_ops(pagetable->pgtbl_ops);
 	kfree(pagetable);
@@ -568,9 +572,12 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 	 * If this is the first pagetable that we've allocated, send it back to
 	 * the arm-smmu driver as a trigger to set up TTBR0
 	 */
-	if (atomic_inc_return(&iommu->pagetables) == 1) {
+	mutex_lock(&iommu->init_lock);
+	if (iommu->pagetables++ == 0) {
 		ret = adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg);
 		if (ret) {
+			iommu->pagetables--;
+			mutex_unlock(&iommu->init_lock);
 			free_io_pgtable_ops(pagetable->pgtbl_ops);
 			kfree(pagetable);
 			return ERR_PTR(ret);
@@ -595,6 +602,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent, bool kernel_m
 			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
 		}
 	}
+	mutex_unlock(&iommu->init_lock);
 
 	/* Needed later for TLB flush */
 	pagetable->parent = parent;
@@ -730,7 +738,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	iommu->domain = domain;
 	msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
 
-	atomic_set(&iommu->pagetables, 0);
+	mutex_init(&iommu->init_lock);
 
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
-- 
2.50.1


