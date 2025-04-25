Return-Path: <linux-arm-msm+bounces-55749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AAA9D24B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1BC51C0164F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17D0221D83;
	Fri, 25 Apr 2025 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/xbVFMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E14A22155C
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610557; cv=none; b=aYMEPXJczKuFX8PCYPxThWU/iMTVsWmadXuKXb1URsr0ePud3xsTfG7IulZ+sVzwqLdP3OTjBRmACSzjBRTtN60sadmxOao7EfJYAB2KRvXPEcH1WuQbwnRLX0/c/11M7jIL61ipKO6pnkIVjXlVkKm0xLmE9ra+sWsi7bpnXfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610557; c=relaxed/simple;
	bh=xEqo+EivkXzxOzoaQDh4iS1g3dZuWredikvOGuMfVEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhQgUFSs7JJ65ljpphZOaJtbxJtJXHLkAv7xWT48yXUGPbNlEDXK/SoI0BTuqeQoNzONpYLvOfMzpC89VIMle5atXMmraO29zRMFptpD9VY1RHrsLAX2pZtjkYpD0dD61a+qtIJwGSrUkdJkIiw+z2m9qYw9XnyQzK/fD5Tjv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/xbVFMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwsf032093
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=; b=Y/xbVFMrbGwRmCF7
	wsmRYa+s8c1mZEndO+IXcEW51fj4TW23Nh77+FlDnY0WnRAnaDKqSqoDT1QLOnWx
	njc6Ve/1kObt1zogdkRLg1JUHrX5iOpiIdSfpcqzxfe3AC5gtw+qyOKl/KS/fB3E
	/wVMeAijvzxVND5UUPO3p2QHE4VDnWDdiWmT6Ia+/XbH+9izxxdy+0RSL/oPRR6D
	sANFfxbljs5konwVHd5kOSPX6T4U8+oUxm99t0MGfZOrOeAnxVcHGE0eDQpwN/tj
	TPCiu5wpItqNY5wpLK9TIjudY+nu9WtvhEN01Kvp0Fy8QHfFJ8RLMojURHBk6BF8
	x8ciEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1a0uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:49:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e905e89798so50498706d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610554; x=1746215354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s27H/MGZip346GLJXyEl0+hPEUbbSGTNw9RexNbP/zQ=;
        b=oLRex1iZUNDYAyNZHgHEIUwbQCG5U37cpgxFIRNRXnnHuiHZSiV+zNk5rFc9yuYIFP
         9IBgijhaEWlOdvUh1I71qEhQ/xarU4zPU5CO5ObebAsb+0J5bHsyPxbaOMjxdUmulTuK
         Faus8Fh75HRkMoXMyTt3AmOiF8qQg+atAtllkHpogMqqwJpYtK6oMBw0BRj+P6BTPN41
         QHuw4+RiVH1Dox0tPWX/Y5g1sYnjImB80Nk4rMBagGn++rL7JP5PEGHg9Iq7DM6xSGkT
         30dp4P51l53sOx/s7/KnDQK5dcBM4uwu/EdtNHVgNQgDJ/rbI3D1IcmGJSiIU9DseuKV
         KQWw==
X-Gm-Message-State: AOJu0Yx46eX1q5FCksEOclykIGId+erEW1/YEKiOrmuK8ykOb0v0/Vyc
	7bP0J8iYXzE5xTrgMD+QMoSB1QJDUpwG0NFo032szHin2NqhLo2mV+74Iu9Qj2HnX7ISN5Wl1aa
	ufGSoC71DVRG5mOk6vWod22v0AwyNoyyIwixX26YcQes6ckTWuW8aJBzN60TIN+OtKlP1MQum
X-Gm-Gg: ASbGncu4JUrD9Iu1ZezHI/0o0YFekvDKS7oqm6Uv6dT6e5dCnRu2raeJVGyA7QFiA7c
	Zn+F82xTmgANGgdAQX6Z+YyzzY1m38DSKUWVfPkjrwm5kDOw7tam/Mgm8LrLwWxFzrZX1kIwYA5
	grmS1vV5ur0VJgQ4VG94Xr48nmodqEPQqP3uOqjqtNLHTAAXLMw9EPXdRlgscigP8M7oFhK3N8B
	iRaKeaR/p0msWTOTCn2j2+bbE9KJaU6/PmGfu6r6uC0dUlu/dK9kTiMp1GkdAjMK1v9Ew3IOUnp
	JZCdXIkItBPv76eo3Q6oaEix+3lWR3E3TQe/BZAQ2CsiXsTWWRNe8AW3BBt2UCzrXPR0uUdBWfz
	n/GByD+U8UefMeIfQdDzpLbox
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f4cb9d675bmr56063716d6.17.1745610553742;
        Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIlmd7nFIFgnLBspjDQVkgY90tTtUd8k3ohF7W9+HxepEi1M8QeYnlT7judZ4HqN7C5lnMEA==
X-Received: by 2002:a05:6214:1941:b0:6e8:f166:b19e with SMTP id 6a1803df08f44-6f4cb9d675bmr56063336d6.17.1745610553327;
        Fri, 25 Apr 2025 12:49:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258b7sm725313e87.22.2025.04.25.12.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:49:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 22:49:08 +0300
Subject: [PATCH v2 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-dpu-rework-vig-masks-v2-1-c71900687d08@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C2f4NUqFP0JePGsYgv6HQ3zhP0uNZ8tppCfOQ3zdVxY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwb3c9NvmqV2SRvN49/qMkazLRa+zVF7ntcxJDJ/5WKzP
 xWO5053MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAitxM5GJpSzmcHRb/7GFMZ
 qjXzgy57tthxk5yaun0bOf7n+CqYTHrK1c1kfWLRkcbFyiv1tt9gW/2HYXmokWiEbOOSS/xdx+6
 xBJ7mkHyWya+3a4rxytZyyUybc7OTL+7+L7OfzUjPYs3+3+9s7ET2vvqbaMeUVz7P+uQ177m2sp
 X8mW2hJh0fvHh/iIUV+VpeSFyjO13G7+CD18USfPpLnjP93mvHULZVNHLyXUmR/qJJ/hayJ93Wb
 N8U/OqEHf+uzZu8ddP1V8p3CxqfNWVSrtnLeLVySu4k/9r6Qw1yE9Tkru3t4pVNvuR4qd+u7Hr7
 d/Os/99/xn6qEZeJmSuXbVNi1+r1RP5+2RGPImOb3K8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NEikbHEG97ZxQHlhKheo8fIpabgARsJN
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680be73a cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=1PPYqbpFttJoYAmrjxEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: NEikbHEG97ZxQHlhKheo8fIpabgARsJN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfX6aWIgJjh5xxr lgAT9MhbVDR+p6p3q2eHeTVZkr8Us9VX9FAs4r5gewBKbEtRUpSjyKu9wv+tkhsXASnBAlnPqb2 3WMMLoiCmc9U5cOjeogQV2PaFHgnV/LqyqEMF+kKit8G4MFl/QyN5avyRnJ6Wfy12grNAIU0jm/
 fcoK8KTsI9tbh7MpnKTKMTXYsTP80dZvji1puRZOPfVoez0EQcg348CO/fVTEOBfne/Qe/QIk0x psWPLnuWgl7EJdIYGr26bPhXA7Px74SjsKhF278HxTxRgjwF31bpPIevo8NYX4S5A8eIu1T0Omn TrXH201yvlTG4o8SNwp8+HdlyP8WU4JKml51KWZVy27Bqey09nziBGUZVaBepiTL0M1v2aY9hWN
 gnBU5HehDpCHla4Rrj0mA8JpiyzQFOI+VnFw+0DYS21DsW6ZGcXncWQi6Dks1n8pNxwaXIEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=896 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 979527d98fbcb19c33ccb45b5ba4716031949985..8e23dbfeef35432348c86544e825aefa54d476aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
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


