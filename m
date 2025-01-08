Return-Path: <linux-arm-msm+bounces-44466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A49A0688F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:43:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C733A5190
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A03204690;
	Wed,  8 Jan 2025 22:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L0WKhrNv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCFB202C4F;
	Wed,  8 Jan 2025 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736376197; cv=none; b=alNG2RiGiYZSJBvCypoF6KAyTRQX7jWPIDb+xIQGrfSaB7paujUa4JvC0hnmPrn9HT/wpQF4xaAfUEX7v3ePHB0Sk/yqkEQDdvVC+CTKgnoQV41ef64N4fBJGDoltz0USvecmi4zRmuPNoWfQ626CyEEC8KsBsRwD+H2xpK2qsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736376197; c=relaxed/simple;
	bh=yntijMR5igf8+SRnFWzw0pLwjuicULmhUrZvX1BBQ/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VrQDqZ18FuSCTku2p3UNJfgIBoXaoN0r+NUmi3OO1igBj8ZOWI5IxP/2PozGIYtnBZRdb71ZbqKUnfWwi0AFNPpysWuHrWlZzxY7yqitmUiBNRTUu14JYPjTy+/W3WWSfqUvCiCOX+p/fSfES41a0deEuopmR3EQbcYRURbJxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L0WKhrNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508CLcAH028217;
	Wed, 8 Jan 2025 22:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+MiiTp0B/IBQUsDOuxU3B2/w2xDLeHcYE/rPPtfMd4=; b=L0WKhrNv4i6irjf6
	bj6n8Osa5fiIQDa+dm/Rt0ALsdjqhvZuF2BOclLIHWf8otvvG0bgOX3rPZ/lBBvV
	V8UNvXb7P4+K6Z30aU5E5F/f+3RdtsG515M68JDeTBk6egMoAsI0veO8B5GKD9ud
	sxuYMdYOvqTb2RdudBCnHa4VHlpcFkzUfH9w+6TSb1sgW72hrQ/KWBC6ixCzXpfl
	J2lTFY/ztv9zos13xBSFoIjMYZAxK8LDc9VCeCT+BUfApQ1cUdRJOr8MVY9UfPlc
	pTR03XtEdJC80fiQSV3V6wpAvPxqKnNluf7GN5rjv97y2Q3r0ssdvOcVTXa759rQ
	IEtF/Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441sa29daf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:43:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Mh578014421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:43:05 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 14:43:00 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 04:12:38 +0530
Subject: [PATCH RFC 1/4] drm/msm/adreno: Add speedbin support for X1-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-x1e-speedbin-b4-v1-1-009e812b7f2a@quicinc.com>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
In-Reply-To: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736376174; l=1972;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=yntijMR5igf8+SRnFWzw0pLwjuicULmhUrZvX1BBQ/E=;
 b=HGzU4wvF/VvJlzEq3P0hvKND+fDdczwCryAAzQiP+qmO581Xo3hs+5tlT/h7MAK7yXRrXrGA6
 dbUsSgLD31nArOfnC/bKvhp68wvPZCDB5HpiLV8oE9DxIX1onOtv8j2
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: quCIZFjrmV5xQmaPWEL7mBz-bFCWiPqK
X-Proofpoint-ORIG-GUID: quCIZFjrmV5xQmaPWEL7mBz-bFCWiPqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080186

Adreno X1-85 has an additional bit which is at a non-contiguous
location in qfprom. Add support for this new "hi" bit along with
the speedbin mappings.
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..e2261f50aabc6a2f931d810f3637dfdba5695f43 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1412,6 +1412,11 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020202,
 		},
 		.address_space_size = SZ_256G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 263, 1 },
+			{ 315, 0 },
+		),
 		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 75f5367e73caace4648491b041f80b7c4d26bf89..7b31379eff444cf3f8ed0dcfd23c14920c13ee9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1078,7 +1078,20 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 
 int adreno_read_speedbin(struct device *dev, u32 *speedbin)
 {
-	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	u32 hi_bits = 0;
+	int ret;
+
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	if (ret)
+		return ret;
+
+	/* Some chipsets have MSB bits (BIT(8) and above) at a non-contiguous location */
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin_hi", &hi_bits);
+	if (ret != -ENOENT)
+		return ret;
+
+	*speedbin |= (hi_bits << 8);
+	return 0;
 }
 
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,

-- 
2.45.2


