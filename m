Return-Path: <linux-arm-msm+bounces-24696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 318A291CA4B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 03:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C51B1C21A7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 01:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FD54C9B;
	Sat, 29 Jun 2024 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3/YI9i+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB053C30;
	Sat, 29 Jun 2024 01:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719626078; cv=none; b=rPmp+gXEBF41YDCJ7TA9UvS66ig2ztDPMDcWIOO8JEN0JA0GNJ3uY6agsUei66X2PCNWU0y8WTeOmr/M3iobqgDrPX30eNRzgu4XAXWcp0n9R+SW6xt/vC4p85BelZA+37drQ+aYYvt+OjMXwyv4VhB0IR/py82PM9JcVBb0vcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719626078; c=relaxed/simple;
	bh=3u2pm7rwCyjrU79mpkGGU4MWMl5lGnQKXuKnXy1C37o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FjChPMtWJqhf/afPnbD4ybvoJQ2DZ5luhF9ITJO24OJ1CCT6mfVuleJpgMajR0zPNmD12hpuhHpm7sUB2mUHLcnNEGTHr7BBvtDqEF7aIb8SEimnYl/KEblRrwvtk7WBZ+mAKaksTaYN0DhjIgFplX5K2ZOV/qXMsF4D0x7eNSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3/YI9i+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SFvjD7015158;
	Sat, 29 Jun 2024 01:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	40DFX/qp9QhWUdhCwkjY0MLqSA2OywazTDQZNa9cs5k=; b=G3/YI9i+9Mw4S4Iv
	Na1R9K3iIbhfXyccidwE7BK7WXKfGee1bn4YhHJlqHjS2+Vvkylv72HMdPEU80yg
	dtMbsYQ/3nvlyj+MqDA5+ZxhU1R7XW2gM5ykzzjglHt0qE6LCtr8N8d/nGHNOj66
	XCdqDWak3Uo5hmUAdbbGYXEGEvDHC/9sutUFQa+uMlttNPWjDQXPVxgP4hpNuD5O
	dgCbNOmKqZGXc3/0W7/9Es7Nw9mW2TZ0N7DOVp66BaNp61R4p4QKfcDDfWGSQlU/
	meyz5WWZp8WjgbiFyZXbr7T2WBwbKxOv76K+E5Sdb6o0NtG9+8QJF/sEAh34Hzbe
	sTpDxA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqsj1sqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 01:54:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45T1sLNC001928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jun 2024 01:54:21 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 18:54:16 -0700
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        "OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Will
 Deacon" <will@kernel.org>
CC: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>, David Airlie
	<airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "Sean
 Paul" <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] drm/msm/adreno: Introduce gmu_chipid for a740 & a750
Date: Sat, 29 Jun 2024 07:19:36 +0530
Message-ID: <20240629015111.264564-4-quic_akhilpo@quicinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -SFmJSWdz4k9fKCa9MQnfPZbHq8uF4H3
X-Proofpoint-GUID: -SFmJSWdz4k9fKCa9MQnfPZbHq8uF4H3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_18,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406290013

To simplify, introduce the new gmu_chipid for a740 & a750 GPUs.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v2:
- New patch in v2

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 23 +----------------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index c507681648ac..bdafca7267a8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1206,6 +1206,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
+			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
 	}, {
@@ -1241,6 +1242,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
+			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 20034aa2fad8..e4c430504daa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -771,7 +771,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
 	u32 fence_range_lower, fence_range_upper;
-	u32 chipid, chipid_min = 0;
+	u32 chipid = 0;
 	int ret;
 
 	/* Vote veto for FAL10 */
@@ -833,27 +833,6 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 
 	if (a6xx_info->gmu_chipid) {
 		chipid = a6xx_info->gmu_chipid;
-	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
-	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
-		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
-		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
-
-		/*
-		 * The min part has a 1-1 mapping for each GPU SKU.
-		 * This chipid that the GMU expects corresponds to the "GENX_Y_Z" naming,
-		 * where X = major, Y = minor, Z = patchlevel, e.g. GEN7_2_1 for prod A740.
-		 */
-		if (adreno_is_a740(adreno_gpu))
-			chipid_min = 2;
-		else if (adreno_is_a750(adreno_gpu))
-			chipid_min = 9;
-		else
-			return -EINVAL;
-
-		chipid |= FIELD_PREP(GENMASK(23, 16), chipid_min);
-
-		/* Get the patchid (which may vary) from the device tree */
-		chipid |= FIELD_PREP(GENMASK(15, 8), adreno_patchid(adreno_gpu));
 	} else {
 		/*
 		 * Note that the GMU has a slightly different layout for
-- 
2.45.1


