Return-Path: <linux-arm-msm+bounces-24687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C891C883
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09F851F218E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF09780BF0;
	Fri, 28 Jun 2024 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h8bbkNT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217907CF25;
	Fri, 28 Jun 2024 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611358; cv=none; b=SBANnEEuF+EeztpG9udsYbkv8Clm3EuWGgbNB0fmPIQSN7w0wSA1nZGaDlqAHRGAmcPt+QJp0pvEj3AilBgNFo9PHtECTSN5We8C/zMnLbtL5a5eKHh/d8hdlCCqRWLi5yCdH4UvM+nDtdRN88z228T1+045SBTjFIi8lPY2voE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611358; c=relaxed/simple;
	bh=WBzP2QnaXjLHyJ2MfgTPMz58EU6HOyYPMks55Sefw3U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtMOzdaZfCTEKizaGTaXanE6Qyc4xMiNwJsPK4HF95u/XkcFMweNrAXSkD4rmKduCTC59Nxlre1GPlwPe9KiXQz6yS9QHGZXhxLXJAWkl7RvAZjjV1MiAGXJ4R5VZMuK4wvuV91aKAtp2aT+PaPGaguIc4kFx9/iiLH43Nufi2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h8bbkNT5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SL11Zo007845;
	Fri, 28 Jun 2024 21:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtAc92ThkQIk2wHAfAQ1fuHdsMif84b8/j5OztsMf3I=; b=h8bbkNT5JXoOX+cI
	50xeOb7cvXkrFjeNfRHzJT2O338zIwWi7hbILd6sfGOn013brHkbzP2XcvV1EmL/
	ygH58mlt8jIm4yrCJVgIfwuFNk/MeXtCTeVGW3g0r32XWRNVd5X38J3K2ud68bLG
	2dkwAtDaNLfDqoyUIfeTfhMDWVzQmWQ0YxFWvnu0l5wVYlO7os3WPhH5W8PQq9xs
	wydNNGKL2F9HvyRgwR+qfP7E7r/dmQOH9xnKK3ET031oMaiFxRLhWUDcgXTR4aHM
	4M+Ha0CHq+zfcoj6z7lGsfbpyo7GtNhUjhG9pilJpzWNho0BTGIDORH1g/roQs/Z
	6uMCDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5avqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SLn5LW032545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:05 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 14:49:04 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
Date: Fri, 28 Jun 2024 14:48:45 -0700
Message-ID: <20240628214848.4075651-4-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f5uukxJRThcaGTAb2mXAKbI2C4wwFrP0
X-Proofpoint-ORIG-GUID: f5uukxJRThcaGTAb2mXAKbI2C4wwFrP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=974 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280164

Introduce a new API msm_iommu_disp_new() for display use-cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h   |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index a79cd18bc4c9..0420bdc4a224 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -343,6 +343,17 @@ static int msm_gpu_fault_handler(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int msm_disp_fault_handler(struct iommu_domain *domain, struct device *dev,
+				  unsigned long iova, int flags, void *arg)
+{
+	struct msm_iommu *iommu = arg;
+
+	if (iommu->base.handler)
+		return iommu->base.handler(iommu->base.arg, iova, flags, NULL);
+
+	return -ENOSYS;
+}
+
 static void msm_iommu_resume_translation(struct msm_mmu *mmu)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(mmu->dev);
@@ -434,6 +445,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 	return &iommu->base;
 }
 
+struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks)
+{
+	struct msm_iommu *iommu;
+	struct msm_mmu *mmu;
+
+	mmu = msm_iommu_new(dev, quirks);
+	if (IS_ERR_OR_NULL(mmu))
+		return mmu;
+
+	iommu = to_msm_iommu(mmu);
+	iommu_set_fault_handler(iommu->domain, msm_disp_fault_handler, iommu);
+
+	return mmu;
+}
+
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks)
 {
 	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index 88af4f490881..730458d08d6b 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
+struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
-- 
2.44.0


