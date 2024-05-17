Return-Path: <linux-arm-msm+bounces-20016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B28C8E9E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 May 2024 01:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1431F21D0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 23:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A831420A2;
	Fri, 17 May 2024 23:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fm1gfs6m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768D140E30;
	Fri, 17 May 2024 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715989105; cv=none; b=aZX30Y8wV9HR40EpJDKGRl7PLEa/sf3TBqxnxlKtxTcUlWTpIl0IL5UiEYgNRynJoC4VLBfPWDkJqA4o5SjrOm+l5JR5XvWvzVRnBUMcweiX5gsMBTmvABleRfzWEKdzAQI9mI/tnxnkpu5IJ225l75FTD3mPQs3TYVXvfezC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715989105; c=relaxed/simple;
	bh=VswKE3Z0M+J0ZPE4NGdkYDWerMZfHzIxIFBfLKsbdmk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMGeZsaR+hxd4joUjGP6Pw4hnC7Xiy/BLJGqcwP2smunrznTGXWUIgQiMW/7w/Zuv883hRdMDPTwyN3PE+dV+v34jBv38mX+7O8aLd22qs7s/wzQjfJsYiV/Zrzdp3NnDxM6efun3TTc6YkmrVbq27RjRUA32O6l5Cj/IiWum04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fm1gfs6m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HL9c2g014908;
	Fri, 17 May 2024 23:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=5/xBMVzYqvKugxRDUEjgoiOlAb7PFXQQoAMv2t2BAjw=; b=fm
	1gfs6mlqTY0NXZ7ZcKviW1g3mayliWK+txdiW+pa8HAmGbHhjAJS7lnCwRkTbQ3C
	HeiFn7z6Fl1cUsZmzJGzMYh07ZL+BRUuK3huB6n7cy775s0XzPaCB5gK9S0z+DTX
	u0/bw/iEptiPaM36qtKuSdpHM/nkwnA8aN32ns3k0Kyet0mYrxH7PCfhTTwcetyQ
	AZrFEadvSFGxSwL4G36F+gfFLwlOsQyOfKSKAVp468VaP+2Za2Qvwtit24SID5/W
	VYEjq/6Hz9fTPjlDY32V+zak5IDCZBaRsQsKP98F0dW2krh+Ae8s6t6MLbOALTmv
	7SgVexmwS9fB2kVbNymg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y5e9cvp6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HNcCxG000663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:12 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 May 2024 16:38:12 -0700
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
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 2/4] drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
Date: Fri, 17 May 2024 16:37:57 -0700
Message-ID: <20240517233801.4071868-3-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wAbB6x7HbI3X1HsafBMl1fWL9K9vhBgI
X-Proofpoint-ORIG-GUID: wAbB6x7HbI3X1HsafBMl1fWL9K9vhBgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_11,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=810
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170184

In preparation of registering a separate fault handler for
display, lets rename the existing msm_fault_handler to
msm_gpu_fault_handler.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index d5512037c38b..a79cd18bc4c9 100644
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
@@ -445,7 +445,7 @@ struct msm_mmu *msm_iommu_gpu_new(struct device *dev, struct msm_gpu *gpu, unsig
 		return mmu;
 
 	iommu = to_msm_iommu(mmu);
-	iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+	iommu_set_fault_handler(iommu->domain, msm_gpu_fault_handler, iommu);
 
 	/* Enable stall on iommu fault: */
 	if (adreno_smmu->set_stall)
-- 
2.44.0


