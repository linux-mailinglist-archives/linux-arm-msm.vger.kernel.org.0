Return-Path: <linux-arm-msm+bounces-59134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE80AC147E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE28E9E4BAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0178429B21C;
	Thu, 22 May 2025 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBFI5z+K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B9B29B20F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940708; cv=none; b=grbQVmCsHsvy7Y0CxJm68zD1jmFIiRWmFqcTSE/0B6L03932nQy17N8Q3v7pgteXsm8Y3InUdAoC3M5MUsKyXDyBDN2t+BrorfDhJpPBwXVtF4oe0wHPVtpxPdR2qc7KnfTfYaeONlF61vlH6Tkfh5mI+C8imbijDgaS0LPX57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940708; c=relaxed/simple;
	bh=yMylM5q2SumCKQICfch3yCGCj/FmvjrEEGOz3RHRJig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MVySii0/42XDHj2JM+8/IC4MYeoHCqPSot4Xc/biIsnyW68eg3w8ibx00lkgKoEMl3tcYMO4dK5Ic4lYZm/RXL/IQ16MjTaFP/EaZQKIEdB40FZKYi6vYYGAhWnKe7PxUMckUX6pTj54HyBEVsxT1DfGvcz1ikBReESUzH1MwWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TBFI5z+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHIs9e011346
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwZo5rFO+Fo9r6sEtki6tvyPanlZZDkaCTSawEXgDN4=; b=TBFI5z+KMHDRskSj
	weQJV7F0bCw4LJtVyGTJw7N5bPxs9hQBWXl4uDhzgEgV/NXBfXIJt8RUTcYPP2Lk
	uCAXE7JdhM8PuxEZDCYVyE2W9w6RCmFskkDApA5lqERN+4fSNiRjJXIc9aeY+BmI
	0IrbikpE0FpuzISCR/uWrp/4Xi95bVGbbLS4QNoENnKrHSTHN1pquir1xs7zAO/S
	Fe/EqeFr5oLDhTUvRKEmrUu2G+etBMwLaZV15uxSISyrLfpJCGdJWFutpE2+xrTU
	sCzH1DGcw+Oc7aL24lUPxwHRtcd+80Q/MlWcjFeu3y26/ACEACOvku2/zGltw2ae
	zl735Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb7baf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:05:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-52480d42c8eso6977661e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940702; x=1748545502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwZo5rFO+Fo9r6sEtki6tvyPanlZZDkaCTSawEXgDN4=;
        b=vnuGY86032W7hxYJvfvG4d3i7viqRm2oxQWsL6RZk2ZmSswmIvkIhFjm7mjZgP9vUl
         3jshqzenW45v5FoJbj5xDA52SekJl+1S+R4ZMLlqd/AUR/QYLZCWXsLF/RgCVQR+DCeG
         ODLY8QKPDj2ZzANEuzkHEtdzv4KGJD0VwV6NlXQdRKVY6Qeab5xhrMcm510p/ZpoeJ3x
         A48f7XcRq1Zb63SWXaHgvEERvCNEhNTg81YIno3fJ+L+Y8rDr696yjPmBb7D53AlHYIt
         HrSDLlIH9aX0RyuFZEaI7eh9RZhHRHDu+0iswTj3i443LTTEVRlZ9Tz+m0iB8XVpQzC7
         txBA==
X-Forwarded-Encrypted: i=1; AJvYcCUiM4CwCc85UtvT8WWLarezdFtCv2DyfKaRVEYW16n1LemlrMvcjDIn6wZOqyNfKdrvfe0ubUvVnxVO6CLn@vger.kernel.org
X-Gm-Message-State: AOJu0YztFdEDPw62N6MiwVkw45ZD0Pu3fbHNGpQef5YulpXXmqc9HdiR
	u1X/gv1cfGKQUb46unKu9T6/W5ukH97DOAYMu8zw4aIuVR/Sd91fENFsWwbX4ODUCUhRdOZGKLW
	gI5Ff56Jy4DPv8qtcUIXqJVvWiPs5UAaMOxNRZksOgUWduIOlkInPTqXipZyWeNklT7SqtX2kMl
	ap
X-Gm-Gg: ASbGncvVYWLzhRqOF2v9fyTY5PfhKv7jMHdPJMk63vshSfRlclkr2kls5TwEXvNedaM
	G4FYC0+RmhNpyx/ChQ0EnvCGFwlynomE46DQjYkZI046IR1yf0xqdmKePEAM9bfkL/WzLVUeJux
	y1vCkbHgw7TWPIq6h4XVVIiFlFEUpGWZXBNFMHN4uEKYgfGYEMUj3nPs++n8b3Wqt/8qnAKyRi8
	064JkGt+gpqoEDGCe1IHAxACDu61DRqb1D5yzrtUKxZc4GEhceSHUXsnV4OPxv55jtPGbtmPBjW
	l3Oh6itimG9bqmjmSHfGY+83b23TA1MlJT9nF78YmL3ObouugAE+4CckcUh2Dn/MuWP+Wmnjg9r
	8QNCmxcmEAFEk07DPC7k7q8CQ
X-Received: by 2002:a05:622a:590d:b0:49d:89bf:2982 with SMTP id d75a77b69052e-49e1df25d2dmr1080411cf.17.1747940691058;
        Thu, 22 May 2025 12:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGyBoxBiQu+R7TxjU/9FO7jh834AKrFaGdFjzBhtfd5AnK14VFdGaOTFWnZJjxCGXUmmEqvA==
X-Received: by 2002:a05:620a:4445:b0:7c8:4634:51d3 with SMTP id af79cd13be357-7cee3297985mr6441085a.55.1747940679606;
        Thu, 22 May 2025 12:04:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:41 +0300
Subject: [PATCH v5 22/30] drm/msm/dpu: get rid of DPU_DIM_LAYER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-22-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=36957;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=qFUB/zmAszMmoynn89d0rjEkbVCuOItarDz5KzyErKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/OwHbV96aoTlGL0NlD2cJajjKIVY9RPMl1
 ee2KAeiLT+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1Wq9B/4rUrCsa4sz/a1bhywLG2mDQ91bdn4WzsTtbHKwRWfJvfwwfVtbH30yH531fhRlGVzgLSj
 YioVgsrFu6+0Lvm144bAeCFW4J8xD2JwxxutXw1WohtNqMKpNd64m2apN9TNtpe1xuMErhpfPAs
 b6ciRtTHZvRe4RoLfh3L4/I7W+NUWhdtuL7AVMQRrCz+c0DLU6Ey51CiV3Nq6Mv5bmU/n0DAWTf
 mdiOxB+T0z50KJ0A/Jrfhuai6w05OVWpqZY0offyXO4amf+4mxgjNPcPdFTpwBndKr8oKlIGJfq
 omrfborAx9dFHGY2MOIheMDrORKcKnwpCj5hLpKGVo8HoELD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WH4W0tMPn6XJ-AOS_pp9MCkK4-7Gt0_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX/Nf16R9bx01A
 i4CEIddIs5bfQbEVzlW6MwcSol8ZGkur9pjWeVKtdYk9CgVnxyr9R664P9zWdQa8SbuRDqY4zsA
 YXgl5qLRJpxrrJQfhPobCvcB1N37FeehzT4dMwjMP4l3pzWk+K/9HNfb4dnMzLXDGgaEQo4hGMR
 /55ynCxbkEk03A7XSXA4gYYMNO/g13REGoRTDWqLuEON3Y/lP+yEuJmRzgCinNG4BL5ABPM/wLx
 YX637GmP04O/e6tOyBFviY/LNzsEDgXjRMp83THKQ9mrFZqJbFJVUys3yrAaJ2Kqe5PgueZ3/j/
 GkKp6NrZ5NWJE2vLo7SllUY36vYI8rEQJIIz1aajmk5ja7qcd4YY4febZ349GSgWpH0MwcTFjxn
 lHzddcxE3KC6GvN85YF6LqUeAd8v18W7ydrVDUGfyohAqgnWfKfkN8T5QWRDxNVP3JIVpZn3
X-Proofpoint-GUID: WH4W0tMPn6XJ-AOS_pp9MCkK4-7Gt0_K
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f755f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kQUVcpSUXEBHcVziRcEA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and drop the
DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 24 files changed, 85 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index ae66c338250664f9306a7d431cfa18ca07a916a5..9a8f6043370997cb12414c4132eb68cc73f7030a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sm8650_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72a7257b4d7ba5bfe89ec76bac19550e023a2b50..5cc9f55d542b79bd2859cdd13d7f9640bf385866 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -133,7 +133,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -141,7 +141,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -149,7 +149,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
@@ -157,7 +157,7 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index ce169a610e195cbb6f0fee1362bcaaf05df777cb..0f5e9babdeea837c77546cd60cf9b545434c9746 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -68,7 +68,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -76,7 +76,7 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -84,14 +84,14 @@ static const struct dpu_lm_cfg sdm670_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 23a3a458dd5c260399a42e5f4d4361b3c4e82c4f..8e37c40620b62aacdcb47c7a04bcfce944ab0b4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -136,7 +136,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -144,7 +144,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -152,7 +152,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -160,7 +160,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -168,14 +168,14 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index 75f8f69123a4a6afe8234a9de21ce68b23c11605..a05d2ef8fc9d217898b8c12d4639563b28b4477b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -136,7 +136,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -144,7 +144,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -152,7 +152,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -160,7 +160,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -168,14 +168,14 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 6b895eca2fac53505f7a1d857d30bb8a5d23d4c8..cb0b5687b5239418f50c539447f9cfa56e81fcc6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -109,7 +109,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -117,7 +117,7 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -125,14 +125,14 @@ static const struct dpu_lm_cfg sm7150_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index e2306d314ef8f8b59078a8ca8c529f2e56385c98..8fb926bff36d32fb4ce1036cb69513599dc7b6b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -107,20 +107,17 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 62136811a530a6072accbd1ab3e02e7e24220ccb..5c2c8c5f812347970c534769d72f9699e6e7049a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
@@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 		.dspp = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 34f11fb084c02cf994c272196299bb9f7bced4f1..17fa0ef9ac03e4649a218cd837b296211ef4506c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8250_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 135b4f8171360493e58a1945105f8722d513d720..f6a0f1a39dcc3c9e82c07889d71905434274cdf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -84,7 +84,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -92,7 +92,7 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 1189a5ecb3b7b50430eb275280c2309ee9d90b63..343ff5482382645fbd440d18d7ee46e5b3fc868c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 13ff6bdcc517fd566e7701f7a7cefe5ff19c5421..06bcaf4d8b0db74c349112af6884f7f3139a7ff8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -91,7 +91,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -99,7 +99,7 @@ static const struct dpu_lm_cfg sm6350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index d4c2d2da91aac0bce46c4d65079f01484a769ae3..47053bf9b0a205302b3937e625fbeca8d17f0c82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 9135853a0225fa60acb80d17f627153d25c612e6..9c4e8450b67760c880d9bd2528c6a954a0282e08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.lm_pair = 0,
 		.pingpong = PINGPONG_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 6503f11f65c11806c5b9558a0f9fd05b228340be..e81a2a02e0a6379382058fd89500cf2064a2193f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 202de6f9b0c65c6f2caa9e9d5232f5b92d8bdf01..b0e94ccf7f83e9c3c41f1df363cb6a8c24f1503d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -88,21 +88,21 @@ static const struct dpu_lm_cfg sc7280_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sc7180_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 85778071bc1347008dbe4522aeb9ca4fd21aa097..2cf30234e45da8a7776d61c49c26abd75d070941 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -134,7 +134,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sc8280xp_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index f9676f804f9132296467bc751e11036696afa942..dcef56683224b5715c2608b5472d2d5a0da62010 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -135,7 +135,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -143,7 +143,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -151,7 +151,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -159,7 +159,7 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -167,14 +167,14 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 7462cfc4cf8de4a10326c83d3341dbee76e437e8..5f5987d5fc602df29c5eb289823de5dd359df014 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -134,7 +134,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -142,7 +142,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -150,7 +150,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -158,7 +158,7 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -166,14 +166,14 @@ static const struct dpu_lm_cfg sa8775p_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x400,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 695ae7581a88b36fa1f28aa3cd0c9166090e940c..6f310216fbccb985308f617db20c1878e622340a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 9a25113df5aec527baa514aaa61f2b47c2443d27..ba8a2c5dc5e2b3474b295c86afbbbe8f8d416ccd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -132,7 +132,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -140,7 +140,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -148,7 +148,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -156,7 +156,7 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -164,14 +164,14 @@ static const struct dpu_lm_cfg sar2130p_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 54815c613f087454aa7b4befc84462265d8dfc23..77986a7bd62c1b6323482426e596e5974ba40865 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -131,7 +131,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_1,
 		.pingpong = PINGPONG_0,
@@ -139,7 +139,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_0,
 		.pingpong = PINGPONG_1,
@@ -147,7 +147,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
@@ -155,7 +155,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
@@ -163,14 +163,14 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_4,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
+		.features = MIXER_MSM8998_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_4,
 		.pingpong = PINGPONG_5,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d64ebc729bfb589bf90af89c094181f879d5b1ef..ad0460aa5b5ce5a373dab18c89e4159855da4d2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -89,12 +89,6 @@
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
-#define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER))
-
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
 			 BIT(DPU_WB_YUV_CONFIG) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5e4608d10c6d4fee387c9a599a73b15661148430..cc17b20a7d4c15b0cd9c5dc8b9a4b78d4cb78315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -84,14 +84,12 @@ enum {
  * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
- * @DPU_DIM_LAYER             Layer mixer supports dim layer
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
 	DPU_MIXER_LAYER = 0x1,
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
-	DPU_DIM_LAYER,
 	DPU_MIXER_MAX
 };
 

-- 
2.39.5


