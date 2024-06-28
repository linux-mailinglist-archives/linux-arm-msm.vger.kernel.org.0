Return-Path: <linux-arm-msm+bounces-24686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AD91C881
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 23:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D188B1C22E59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 21:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A624E80638;
	Fri, 28 Jun 2024 21:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H7YO+cqY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971137E56B;
	Fri, 28 Jun 2024 21:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611358; cv=none; b=H6E5vdS3K/QDF5hj6TcnmD+u4dc6+Iyx8WEMaPu1/Ppn05yGbFUbcLs8tAWbP4/kBXlMB6xwHAggS/w/6JZLBEjuz13495wM1HIRJAEo6OV+sNGJ30qkuqkZD23x+gRkl7UNSEvo+kaORrK/D5K/u0zuuCeeAZgHRw5lQ49QW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611358; c=relaxed/simple;
	bh=g+ORvJ0RsstaSZcylqOz47mI7u5C3HD5piOed9fEK2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1sT40gXCll0WQMYnxFjBxGzG+CTlxqqhK3PjOhSOAUnuAYyKZGkSJujLjtZS65DICE14qL4tjCPLZDGoavteK/iCj8HjNxB5F2hF9+jJY/3/rmezVDNVGq0+NZCFJitTUZBnEZaxo15N71KByxExIJ5/QrWyHLt9FhAAID/tUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H7YO+cqY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SEfj5d010388;
	Fri, 28 Jun 2024 21:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZaprBArW1L7QsxACmo9caYiTRV4yfhCxlPzTci8mgs=; b=H7YO+cqY4juU9IUb
	CL9LIRAmNQn4UBiKQ+jIf7FI2CCJNtf0rsuhDp1ko/H5QPktJuLdh+uUMyOW2Xkr
	rBLkVDIBBD6dUwv5uJ0WFzxJltLIU2jKgbbMlnKtmfeL6H3xxIAPMUZzJ3E/02SV
	K//IEMcGC/08VRLE/rRMB2z7XqmkYblWyy2woBIT9rePftrH4i2HUb8VFDyFKvNZ
	iIRZRt09es8MZUUBlLtQRVrPv7urrq9PYIcQnGlO0At4UdGovc5aw8WZ2mhhamIg
	IdoZtyJEc/OCdUI5k/DibWuFNtkrxexj4dgAEJtVQMM08Nm4hV670gvm3wI15KIw
	ysjglQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywpu1gwb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SLn3o2032520
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 21:49:03 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 14:49:03 -0700
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
Subject: [PATCH 2/5] drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
Date: Fri, 28 Jun 2024 14:48:44 -0700
Message-ID: <20240628214848.4075651-3-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: OXsAMSLQIthwCztSd9Fb1rr4tXUhRusA
X-Proofpoint-ORIG-GUID: OXsAMSLQIthwCztSd9Fb1rr4tXUhRusA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 phishscore=0 mlxlogscore=935 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280164

In preparation of registering a separate fault handler for
display, lets rename the existing msm_fault_handler to
msm_gpu_fault_handler.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


