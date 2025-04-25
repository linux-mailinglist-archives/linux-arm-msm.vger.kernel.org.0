Return-Path: <linux-arm-msm+bounces-55750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5EA9D24E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF513A9C6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E77A224AF9;
	Fri, 25 Apr 2025 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/IzE1Vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DF221D9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610559; cv=none; b=L1b/jhlZ1WYjCxbCVd2VY1vTuj6aEkrC/VNJnkFXWdK103n2pLqwtw3wJG3Pie0jCTfUb/RNNk8kbIXgm5scmC9xTQU8T0DVUkBSNr8l2N4xQGklLfqDaR172GO5HvbcdFJKpsMFFcsuhlzT8AKS/DfKIa8RmK/A7BwKf2KzpXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610559; c=relaxed/simple;
	bh=zi6XU+PXzgyyO7zfBxiQGFtMjk5GDx/6hmtJu1GnLRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cytiFgyRg5tsiGpjm7dYEK2IhHr92FEyVoxiMDMURN52irPTGxfAn1DhPcUc+BrEIQVdImUWUAT2r7a2/n2gya6gasyghwFIqGp38RFHYDZtqiJx6FRuEwqMO3Rrxb54SBVPP3UkaXsRuHrZG/qNvoHsiT8ebdg2m0Orsitbc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/IzE1Vg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtvF004029
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Op5Ucj3NsPaSHpQN3+W+ByQRkYYVKvbIsr+8S3UcS4U=; b=X/IzE1VgEx1CPVgX
	KlsmlWkRPhKb+bF4Mqo2rzaHWy+4ZTzJzSpGGj9sm2F4ESNqNTXBwBOavOJd6m8I
	qYlTdQIyvmBoYAyO9LM09CWzRN8k2MmhIXoyA5ukPSOdpRI90m0TaLDHk7RC/YVn
	BKWJ/4Ndg+ufu2lXe5LgAOhxWlo79ZEUB5GfszECAlmAUl/r8yRaGJidfxFElXyv
	Xs1tL+qGlnWd5lh+eGzMbFbZRKpMpHiSOOdo2l+mTIMvUjmjRLXowlVo95lNyVtL
	ZDyJOC8M7D3VqmxceSAEq4nLguqP3OC7/KyJvm7KNKRCMEa/56ps5/ql/WmN5jVM
	eKDRSg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a797-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47699e92ab0so49843461cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610556; x=1746215356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Op5Ucj3NsPaSHpQN3+W+ByQRkYYVKvbIsr+8S3UcS4U=;
        b=AA2eZ7jPAJru7UVsFTc/ysNvUtG2Am7+0usJZD2bHSRcddzYxw2PW89RoUyURKzang
         k3WhdDpRv45xJPRJGz/2Kndf6H8YaalNZu4YP9rAx1fHOQVECAMZJSju31irEuO3U4ds
         apCsN09nbZwYlgSUDSHZMqYSFlSDOwGo0W2CmTFIN9wC0nKu2iYQEtCuTMQZzEQJBYvG
         /l5qtXKjQ8fRnQmy/qIAuHSbAzJC6k3M/y5ECRgTJ+1iF76KgyAZj0mS9u0S4hO9bxRa
         m6uURiSkfIDQMOhyEkC/+CFb5ptiO7XpTl0fstzCssk510j5Il6JmTDF2Avvk4e2YMoX
         6FBQ==
X-Gm-Message-State: AOJu0YyK3E5kBAG7LokMI2bFwU2Ru2RlaH4lWJhRnBlt4Fq12ppaN1Bp
	izGpzx/nbDgFreiO1QR6W7c1q08Cx7lX+HQxfC6H0b7cPDZ8hxhEzxDglyNO1jNC5FdMUOvUcYj
	/iK7BulZc13Dr3Mp3KPqsl8MHhqzV7jD8bCzeuilPycoSBlS0sPNWFyobx00Q539K
X-Gm-Gg: ASbGncs9oNGS7QLJK51EY/1/BZ/qgiTuk1wbVbMX6oON+vl9ts6bpIrfdNoaK0ivf99
	Irmg7Wsu28AQ33o9VlNExfkVTQSGoR9dY7LV0TLtZMfGA4XgKyVGfo6T1VE1LYYH9kfYVLbE+XJ
	S6ulxFsnLAzhjx3nwVAsnq9yncvWXjJhm5q2jM/WVvPNoF5UFOEbLLvP83UOJE0m/oXaxsMcVzH
	3I4obJ4EDsMUbTU6wQGDdfuSudPX56JgUkY5uiWt8APs+3X+22q14MFfncGKKMt6ak59fYlAbco
	LbZE4Yb2WSdnZSW5s6dBCEhMWFNVDEyq7zejOtgr5zOyROvjxOoIWxDsiMiVUvpf/kFoDnv3L5z
	cb+yIVIdg2wTk9cGqsdJGNTkp
X-Received: by 2002:ac8:5f8c:0:b0:476:9483:feaf with SMTP id d75a77b69052e-4801ca7cd8bmr58651911cf.19.1745610556107;
        Fri, 25 Apr 2025 12:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvsYm+y4nGXf58l7owYH/EptT90yacYmOjG5Q/lvtKP+/y6qqRd2lf6/BRdOEXF6bTAvHKow==
X-Received: by 2002:ac8:5f8c:0:b0:476:9483:feaf with SMTP id d75a77b69052e-4801ca7cd8bmr58651561cf.19.1745610555757;
        Fri, 25 Apr 2025 12:49:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:09 +0300
Subject: [PATCH v2 2/5] drm/msm/dpu: enable SmartDMA on SC8180X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-2-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3199;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fFGUiM7rgjkUGAW2oQNNZ8SSmLtzgOiuFiVQLK6bnQQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC+c2OF+dpZ5x23AvPYZzM2MBCF3aqqk+qzvls
 wBX0P8XsxGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvnNgAKCRCLPIo+Aiko
 1YxaB/wM8mKWJRIVva/SbIne6SnB6a09rDJUu2XRLkcr6IYyW0u5+lvBVXrZxK2q9+UhWyT+r/M
 LfutguivISiLA9iHcQUS1g84PJVmPhYHUty+PaTu/c1P/glxccHD1jebQF02tRNUxSe/S/tiuvN
 TKtVBCxBW6jyifRgIZ0XuIBbiUYyUV/QFYMOBK6LiJmbgTxnyMmvpjWN+OmyIyda+PPlvI5mVrh
 SrVyMm7oM1aP7tbcYoda1Vkb+BcATg9UVthsb2atzf5/rQTQCQNUU1ktYFArBe/Gti4+9Xi/ZW/
 d/YLQ29ohqgzdByB3l9CN6mYuvbgImjF6iDjfb3A2YpJl8/G
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680be73d cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0qT3Y18QIILfcGn7-LoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: t4Mm1qiQqKGsUkay2UK0S6rctC6nT8XX
X-Proofpoint-ORIG-GUID: t4Mm1qiQqKGsUkay2UK0S6rctC6nT8XX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfXzg7ou12fVT4a Wi3IpGuKzoTsMFrRe0Qg5aCJFfKo0v1O1LIuAtxrJTYX6ve5sfP/KJbClYn3ScyaqgMn85XCDnz XF7e0aKu5JHEFRI3LQZc8Av7TACGUXNhAY3ltouXCO8X6RBmFxHvXZtZS/EOdefSIye3Kf36pQp
 Md98ZV0yq8Wa+XtnnsmyqcbSRxS8Ve9/A0WZ0SgY16MnEgJ63oP/jR79hcaSfBMpOpiVeGoG6H2 KhFzQlVqSd5CJLjbM0uBCmN4f+MAYEaDNCjecU9GudUGshgpbwS1ydY8awD02a359C5S7TPbSuT Ae2t78MU5YBGT4pvfF2hzpOZu8S8hcFJvykcOfzvwSoLNLs50N9Gl7UYZAqyqkeidyt1vk3M9ey
 V1FUz4EDgvm4otUuYllmigme5HGUPCrNUnFH3+HzzRGTyJdz8Pk/uIf4LTYIgQ0g0PApTqat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=892
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reworking of the catalog dropped the SmartDMA feature bit on the SC8180X
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d76b8992a6c18c21a54eb2a373c789720b876c8b..e736eb73a7e61544e0940f1ac683ac0e4c5c79d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -91,7 +91,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -99,7 +99,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -107,7 +107,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -115,7 +115,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -123,7 +123,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -131,7 +131,7 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5


