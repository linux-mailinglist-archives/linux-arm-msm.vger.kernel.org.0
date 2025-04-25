Return-Path: <linux-arm-msm+bounces-55751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B0A9D24F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692BF3BD1BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447177E9;
	Fri, 25 Apr 2025 19:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNjV2Yg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECC0221F28
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610561; cv=none; b=TkFmiJP1oxAq/5M4b8YjOY7iwNqhjHTvZzu8WPQJvDSmDETWOOOePzyBP1IYVgzuZCb2nRuc2V4dschQkuSPPKd0uBcasfh/2W3AxifJlH/NxyXCJiDU92DJoK/boRi/cOHBwkaxajjmbCh73BTM3pelTwy0yKpSOsecuGbAFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610561; c=relaxed/simple;
	bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYc2LWtxHNLHN3YllCyrI/ey0YJOp2dz0LarIHipWzRBgbLvyb49clIgv90XrBuV/mTKQgI5hGzGm56JDaY8kB1t5AKOA34P/EQ6ODRqSXHV2GJMVNRWKAsFn5E7qSxOpQfvVC0rhIDiK7uRUrPETFMCW9QHe4/2NpwRwzPKhXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNjV2Yg6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqhx031964
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=; b=iNjV2Yg65YPih9MY
	NHbRpmoFU78rmRnk+K+o9vaum4aFohzqowSEbaZccjKfyzN+5H9DMFNux1W7W3M9
	j6+/3dtIcSh1Ucm0CvVxIUjcphFnQpkmFiTL+iF4p9VXk8T/eEL5rAHMWdnWEdm9
	CC1M/akHf+P34ayA3xpHoKdXYiHWC1zY8gH7iRSskYo87dXBJATif+I+aWij8uUJ
	mENwPIBmB6jm7HisrVkBgb2Ot76KEoPLpCZ3HIZCO2fgvFyrBVwYk4a/plIVmCdy
	JdmOCRdY8wkDh8vwFUFV5ZswXS5z7IK+uqYi+yuF3NdvmLmLlpF8ECr4Nnww6YSb
	jsAimA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya4gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso41604506d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610557; x=1746215357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yu1pJ4v7QyzpaLYH38MD+E0KLIvxpSKT0ukBB1qszW4=;
        b=UuAywOkSXNoWi4BJgESKwl6QASER7i8KwNdPfOiXdN+tqeReNndjvnW+KQ3u8N+aVC
         yK+xI/thG/gl2Q1bWBzK7xfcp2PIZgU28kLptvzEpx9hDPXe09M68TvhJ75QHuSNmReG
         BLa/B3BhvQXVpmGqbOlGdrYpHx2j8RZ77r744KaT13tPlsPoLK4P4qfQ/nbrZv3ScAjB
         Kx9U/EYwXhaxCX+t2CMWxqEEBy4HFlNcXtQk8/YKCJY0Up6eaTgWhgFJ3jXruFHWESnG
         5FlVe9ZoC8KZtV2pEO4cFg/i2tGXgy/AR0v5IgzjUH4/3GyNEVWSZOA3QPpHwsePcCob
         FDnQ==
X-Gm-Message-State: AOJu0YwOH6Xo2t7EZx6vRzVn6t46IAm4CZ7RlXgihPoAtXlLeyQbXyxQ
	ISEGj6IDPeycRwLVthoxof8cxGtVfEbILqv9cyVLtGVEtVjnLbXkpRo6sV2ePYw0oUUQJY4v2DX
	ePnac+GipSSRpPOSNN62eq1xH6fyF7hDUG0DC+W/iS2ym1dej9W9gdd4EUEao/xkb
X-Gm-Gg: ASbGncsYD8AmseSTrPyiiJgjFt7h0NuupTIETNL9H+ZnR6wHr44tLchNclY9sMnF6lB
	cycAWpU4p1jRIWlB7UDw/S1BaVaIJfcedUSuHkgaRPjralemg6swe4riCulQMxHeCbXBSYJZzZO
	WzJBm+LSE+bxH+Wj0X+zWqA+28RShwewjUQwmN9MNLi4G+VVpPuYKhAVU5CgCMYqnEqjN+fHUww
	XhwnnpjkY+ZStPqyw7kOFmjHcO72Cn8/u7SW9VGnMqr5cZcXDZHmHud2+IXnM6Z4kWlkTI3mgUX
	kdBm2QEC+6DzWfH0F3gXj+kwphvP3jOFrKzzwc5fCQQHzxUg8Xe2H6pgJ2ZMifO7Gy3lTrRjzyy
	sAm2BKn6UWwDiJDsHI23PZ0bw
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4cb9b917dmr61105486d6.3.1745610557409;
        Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWxy8OZVy+1G4435jkDv7x9KFSTI/TlWQyS1nZQqm5LJzAOkiG4ti14J6fup+ZqQ6Lmqkrsg==
X-Received: by 2002:a05:6214:242b:b0:6f2:a886:7c6d with SMTP id 6a1803df08f44-6f4cb9b917dmr61105196d6.3.1745610557116;
        Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:10 +0300
Subject: [PATCH v2 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-3-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3144;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUaIe3YjEScKzRmab1Pl5aHETuKQ1a9T+G7YnxZyaYY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2fBKFWyeuvlxVupBYlHsabn1JoqhaF56EP
 A1a5Yl2OECJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1VujB/0RH8hLC2/n5KPQjXGWQdbQPf/GoiGnrLDEdFtg/55BGzkZSIzNqJJMdmP+7vsHv9MPIcG
 YcyjarvTthBVQ2gwHC8m24VeVjCeGha5APWZv38Zq8g7jZZRW0IxctLvGgswDWh348JqBMuBmUi
 pHi0183XYOLlOK5LMrCk7RjngYk5XLViEtYyM8gy382OtyZ8/gn2L8/ThiJ1yJFI18mvBsqRT5P
 old7nzpGyj4oziK/5oe8fC+TM0PUDgvkrZ2M6wcRHK33oBvuIkwlAPIkvcJIoqL9qbP60RLvoSb
 1yRl43nTtcbz9GZQhJghSKXMIh8csXpawBcumJtujOHTnnf4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX7pOaG+miswzn no0n65e3G14LBoPu4nxmm4ulExi9xVtAWePF9fCWReNzwASv+8X7zGOGxCRd5Z5z2fePppYX4Vz kJ431r4EtCGZC4ZGN+z7hLSgF75e7CezcSK2xRy4DNeUm8Zg+1JirgQtftQ++BCIPp85hoU4Q2T
 GfKMocmQJq7CQb/G5axuChyBvwQcsn+K4oyg/EFqq0ZqdrPVVBVd1bvlw/wFCL+DDcVEuGsjFTq fhLJedk0GTBzYdpQysPeK4N4lq+rEkSNrhxaGUvSoMd6iDcwIqslxlySfDyTvDCxWD52TO6gV1C FPi5d0gXxi139yvivo4ACvzmo3WosFB6Z8NQC4CmcYtSgXOK0OecXq8iu3ewNkEWJpf8tIV0b2U
 /Gdnt4YjoT+ffjfRW61pPDf02I2UqXWx/P7OCM2dSnYkrwtXkE3Cbg/+r8RzIQw9f6Q/sWov
X-Proofpoint-GUID: vVrghMGp0YlInTPuSHPERMBrSQ7uW0VE
X-Proofpoint-ORIG-GUID: vVrghMGp0YlInTPuSHPERMBrSQ7uW0VE
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680be73e cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=fm35gGnZT3d3QFCnA_UA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=738 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

In order to support more versatile configuration of the display pipes on
SC8280XP, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5


