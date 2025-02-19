Return-Path: <linux-arm-msm+bounces-48553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF03A3C923
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 20:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2213F178A8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 19:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C9822DFB4;
	Wed, 19 Feb 2025 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+zvhLw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2459622B8D5;
	Wed, 19 Feb 2025 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739994607; cv=none; b=KLOFheXPSMzPVm61Quwgt3K7DoJ3953N89GUHdSsSwOoA9OlxM/27sflu4+46fHLyb5xDWZTNMlNSqo5SOBoea1i9958wPLefrL2zjWz/76+q/gMemIAealc6qQ6yDj2YeyXKgLLkiDennVSFhk2IaAQep7R4wbjomsHtFzrA0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739994607; c=relaxed/simple;
	bh=ArQQCVtuwEjDq6JtQbIw7bRvMr2Cm6iddHnG6LlHWSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hMbyg/YKsdbTetSb2yViVnsoLm22qCDCCPvRXeh+rjKYWH/RuTq2OF3K8+9+IIvHMBS0fGz7Pg85PB9cp8+uRl+OLWQu9t3G45WnyuIf5rcX6ItvJBAU0D/OGp037r0P6oMnM80LVh4NpkZhSMD3+t+kdWtdqrmkRBSW6vqdjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U+zvhLw7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JHKF2O016821;
	Wed, 19 Feb 2025 19:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuzJyirh6hJh6aAKfnLw6rMrdjcJ40lPIf9IG6VHAsY=; b=U+zvhLw7qIFEEOTC
	nDKCmEX5KcY2Sx66D1/YP30vnWR5XPg7uZxeTt1oZyrO0cmLxEUrU3h2ROW9iSwK
	yutmXzzTx3TDfWVWtcQxHQwaaa++bJ5d9ViPpTr7czl3w0Ca2eC92N/KJ19J7Pr5
	SqbYQ7rRT8JjfLtC+CPBT94ilrls+BO+yNhTDsqvW77qJzxvkWgHBFARol0D+ju5
	fKowPo1dkAyiQqumzXPWHroxC3H90wkCbUCNVAADd4gDhxIeTTk8OO8ZqD3+4LAg
	wMU/RJxClUL1LNTOFnd2w33SROk92E2yfFO4j07wOUzuYYgs7Yeuy3a4VYBu9JkO
	/E3dfw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0brnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JJnwmg017786
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 19:49:58 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 11:49:57 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 19 Feb 2025 11:49:19 -0800
Subject: [PATCH v3 3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for
 msm_kms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250219-abhinavk-smmu-fault-handler-v3-3-aa3f0bf4434a@quicinc.com>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739994597; l=2509;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=IweI7Ja1gyBievrLJ8jsbiIrl93lO7J0u8PsokxaqVc=;
 b=G4XEIl2jhlXks6LUPqvMNyxyDn2jDFv2CG9VAD/sKBOBRq0pwv618SAtCg6tBGh5+lmWybLe0
 LoadePqlhVeAKK/daStC0qaHXPuOpl48TtnQou7loDQe3IMfQ53zkXc
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j8w86UAFVzF5KK4iB6if942yI6RqYTW9
X-Proofpoint-ORIG-GUID: j8w86UAFVzF5KK4iB6if942yI6RqYTW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_08,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=872 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190153

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
index 20518bf9898a..b5d8503d28f9 100644
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
2.48.1


