Return-Path: <linux-arm-msm+bounces-42602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA99F5B72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 01:28:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B273E7A2DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 00:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441693594E;
	Wed, 18 Dec 2024 00:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QjWnU1KW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C49B673;
	Wed, 18 Dec 2024 00:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734481714; cv=none; b=eHaSTGWGy5sbMCpgxM/qhK/I+FrbcROGBbmXx3Jlp7n48xsTNMoHjjHcWA3wDMwQd0T/pw6Wixa5kliyM5LNEd5GjCWplgIf/EBj0UJhAxb0hwzGs8y6MvGzpXYTa82384e6ME88+a/+9Y1E5MZ9p7XfX4VVhRcC/gRJhP+YHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734481714; c=relaxed/simple;
	bh=78esjIZEkx/EUR2XZpbZMk0pMEDrNR4ylsw3/52uv0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oez9rDQ/y23vR1N4tFLZMSzvCFBtfHTyV1bfuN4y+xWt0kxvSjLw/lpQYqyVlgZxuL7eKnD0tpPdM2lv/jQvHSneCIHnOxhoRTrL8VIe0KwlAvoe0pp+elgiwl4Rw1vcwZLjDOH2AEZjAeAjmLKaqCcyLqCX0RgRAJlf1MvDZk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QjWnU1KW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHIwbiu002133;
	Wed, 18 Dec 2024 00:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myYww2Od+H2WvIDZTrWYhVhZOVKCuSgZj1leBnxI6IU=; b=QjWnU1KWPp5FLjmB
	vyvzI4qKAOTjZEbkxFWlm1qhzE7JPzQY/FfSvUlTVZU4xp3ccoq+Xo1dKTgldY4Z
	d1dkn3pthnUBfWt2A6cMR+lN21cDHiyAUWm24b9H8cGFdzIAPnaQOhxRoiw/InKD
	eYGtJwuUmvCOn0lERWXyTJgrek3byfMI9cblUewNtrfgwf2veCWZY6MLPn8RGNbD
	sQ6peeFIcGb05aJWs9u6jkeLSCQnh3d0WKdxDDjOpkDtgfzMMMXjrrtHQJilYfYs
	wLaYsRaaTCFqLf1J4m157eegmUv66D/QQalk6YXQoauCKzOaRzNkQ0yRuzE9G8Q2
	2FYTDQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kf1qgkvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI0SNKD026420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 00:28:23 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 16:28:23 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 17 Dec 2024 16:27:55 -0800
Subject: [PATCH v2 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for
 msm_kms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241217-abhinavk-smmu-fault-handler-v2-3-451377666cad@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734481701; l=2621;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=99KxOzXRa3BNL0aHIbNgZdNQd0mHj+iXCNXCRKHJ+2c=;
 b=ibd0MExfMeIUhVCp1TP/6t/9quultKw2DGPoR+JjgsHvxkPLXOXVigR9Zx0a2Ax7k/QDqYdYQ
 WHtGu/HqUCjAb6cildTkxCqHLcCM0PkOtEJ1mKhXckVpZS2juOb8YCT
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8IYLCAN2bD_yD7hN0N6JeDwlkxT7Lq2Z
X-Proofpoint-ORIG-GUID: 8IYLCAN2bD_yD7hN0N6JeDwlkxT7Lq2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 mlxlogscore=865 spamscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412180001

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Introduce a new API msm_iommu_disp_new() for display use-cases.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h   |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 20518bf9898af1b5798f7c96ddfd0f1bef90df76..b5d8503d28f9b4b82265af2b3df48994b94ff0fc 100644
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
@@ -437,6 +448,21 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
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
index 88af4f490881f2a6789ae2d03e1c02d10046331a..730458d08d6b0ddf16358eb12d7a991fe39fe77e 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -42,6 +42,7 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 
 struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks);
 struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsigned long quirks);
+struct msm_mmu *msm_iommu_disp_new(struct device *dev, unsigned long quirks);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags, void *data))

-- 
2.34.1


