Return-Path: <linux-arm-msm+bounces-20015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BADF8C8E9D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 May 2024 01:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4877E281C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 23:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F02141999;
	Fri, 17 May 2024 23:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IEgc64Vb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151FD1E86F;
	Fri, 17 May 2024 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715989105; cv=none; b=PHXBSgF2I9R3RCq8LhpDeKtmyAMpCTndmhV7tQLkw4Cnqyk8IymNcPFximAmg9Bvf3C7Qwhjw3LqN7jtX8hMgZO19DV6KfkLaiKHJxdvutb1pO6YrI65DgcPL8QCGpRZNNXPtMr8ydaxdOtvoJ+Y06cBPrkAN/PGZwBy2K+rFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715989105; c=relaxed/simple;
	bh=jLEESef6TQjODRDsbyZTnjOu6IAvDEc42WtvZ8kQXuM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YCw5Z+F2dlajual64kk7JusbGlfXXEHEGRcspDyExlr4bC4xAwU2++6fgyPkAx9+GDpvpr8KWj2S0DqevYiFeH0JbizuM1rShJ/dF/3i8Fv7ZYsXTjOqU1tl+gOfrvqAdpxkerEdoFRKKlbkpsJWsFCJnfBPJ5ajNp7wYRg4rm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IEgc64Vb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44HI0OoS026628;
	Fri, 17 May 2024 23:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Wkf15et0LGIqkNnyWmzVU3f9IoC1kvo+kKKWTEObMfE=; b=IE
	gc64Vbuen8Z3UpI0PRsCbVIecBsMPXyP8FqjHe68kH/XrJjUwKzepCjHLkNtax4t
	JNox/bG/6cg/5HBYZX9++6d2sGA7WsItz6OVWFhOe+oMazzcIZe9kvxhsGzgpJ/3
	YAXk4HXTKJY4oQdIraq4zvbl+lNAEPYbG64GUopzznVePK/B2wontmJRZvEnklh7
	OhxVNvhZgKA2wEXvKI2JRTGdynoZ8N5c0gueM+G4lHyV6cIzDVtqq8HP4FoddZAk
	FfNskOi8equ03yfDzwHP1PrLy1r0DN4p8tGC0h706mH1CHav0I5LHSZP6jntFIeR
	ge7q/xdorIIrpPkWLwkA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbhe9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44HNcFhU020827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 23:38:15 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 May 2024 16:38:15 -0700
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
Subject: [RFC PATCH 4/4] drm/msm: switch msm_kms to use msm_iommu_disp_new()
Date: Fri, 17 May 2024 16:37:59 -0700
Message-ID: <20240517233801.4071868-5-quic_abhinavk@quicinc.com>
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
X-Proofpoint-GUID: Ozp-vEdYGT0Yjhs9JwV2ItcjmRg4nNhe
X-Proofpoint-ORIG-GUID: Ozp-vEdYGT0Yjhs9JwV2ItcjmRg4nNhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_11,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170184

Switch msm_kms to use msm_iommu_disp_new() so that the newly
registered fault handler will kick-in during any mmu faults.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 62c8e6163e81..1859efbbff1d 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -181,7 +181,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	else
 		iommu_dev = mdss_dev;
 
-	mmu = msm_iommu_new(iommu_dev, 0);
+	mmu = msm_iommu_disp_new(iommu_dev, 0);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-- 
2.44.0


