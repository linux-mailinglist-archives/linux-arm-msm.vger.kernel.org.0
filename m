Return-Path: <linux-arm-msm+bounces-42599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520789F5B6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C68216F0B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892541D555;
	Wed, 18 Dec 2024 00:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Di5hJ43O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B11798F;
	Wed, 18 Dec 2024 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481713; cv=none; b=bIOJQGccQEFrL2WJtBcx8LK8/H43uR39G2nfLcbTENz/sHlp4V6ywQuHlNxdoWjVmzACjYtsws+r97rGhcbZZEfqTUmfG4X2C6H7wgCjOGa16EGiBvgVnpnaVkH/KK4L/mDsl+7FXTisuDrHFpduJcTJSAOgjJjjNf5zAmBM5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481713; c=relaxed/simple;
	bh=HQ1a0r8YzamuPoqvvPi3Z7r3kACS3/kjuKcpSUKnCNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LClboMOj2FKr4+RL0z52VtDEJoGWg9qLO3jvTkISn+0Md6A2tXlYwCZ3XWnB/llzN9WJ2nnupvwornl9Z2VkV313UQWXklDB/1VVtvnycNRSrtVze+CClDg8amIuMJXMqdmKLq3vkMJq9H3nHcBUwp7onGWSM9C38dMROMeeiYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Di5hJ43O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNWuYo026141;
	Wed, 18 Dec 2024 00:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R7BQgpkUdUiCBotMW+XSIkel7VwpG1LPvdJs0zEOUyA=; b=Di5hJ43OAWHH1UgH
	c0VNu5C00gDN4pt6MaPpYxjZM8XOgz3/t7ZQkfzbfrU2l+dvOVFmhW6Qis+8m7D5
	hkn+Yo96gyXKa0nfjodOO77cgE8zX027OcHz8o4lDEvDYksXXA+QRIz9M5fePO/y
	WD5fII41v21H9B5WwMfPMO4WwHNF9TnG8mnYGINOBRlkIbiQ9BsQwFe9isiOAHWD
	mIfQGSoO/2uos5ZT2IBaL8+LbMNL+d2yZHa3TfkxGWeE6fLBHrWm09y3s/pKFdUp
	PJc3B7XEFYSB2bFcwBsIyf44x+Nx56G9nEo6/0ORodG9YPGrbIb+LZURHqvzYGLm
	s3wAow==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kk2902uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SNpi023107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:23 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:22 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:54 -0800
Subject: [PATCH v2 2/5] drm/msm/iommu: rename msm_fault_handler to
 msm_gpu_fault_handler
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-2-451377666cad@quicinc.com>
References: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
In-Reply-To: <20241217-abhinavk-smmu-fault-handler-v2-0-451377666cad@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=1830;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=4IFO8fShHZl0xqezlvYh9HQ0FytJzCiCsNmYDN2m908=;
 b=3wC/5r3Ep9D2hHit7z0DPyd+V9geR+kJQhHSU9B62q06XuJ5kKbLV6nBSQrffN8gIOwNYNh4k
 zVCXiBzU8oZDRnupQBIQQuVECPrVOqQWiGbi7jz0EHiHStITsAEORuk
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VQ-StgPmFu85eee7cyxHxfB9Uch2Z1Ze
X-Proofpoint-ORIG-GUID: VQ-StgPmFu85eee7cyxHxfB9Uch2Z1Ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=772
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180001

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In preparation of registering a separate fault handler for
display, lets rename the existing msm_fault_handler to
msm_gpu_fault_handler.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 2a94e82316f95c5f9dcc37ef0a4664a29e3492b2..20518bf9898af1b5798f7c96ddfd0f1bef90df76 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -243,7 +243,7 @@ static const struct iommu_flush_ops tlb_ops = {
 	.tlb_add_page = msm_iommu_tlb_add_page,
 };
 
-static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg);
 
 struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
@@ -319,7 +319,7 @@ struct msm_mmu *msm_iommu_pagetable_create(struct msm_mmu *parent)
 	return &pagetable->base;
 }
 
-static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
 	struct msm_iommu *iommu = arg;
@@ -448,7 +448,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
-	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
 	if (adreno_smmu->set_stall)

-- 
2.34.1


