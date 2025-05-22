Return-Path: <linux-arm-msm+bounces-59123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA6AC1466
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67AF91C017B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2273629A321;
	Thu, 22 May 2025 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mWaqssDX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1762BFC7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940673; cv=none; b=jT1RJUZTPB3QGh0f318AB0Q9JxLNRREM24CVspfjhJ5Ey4MS4yIXKVOcyVU8BksXLE8pncVqFpq1yAEmv8mJx9HpSWj4xJu7MkHj8glNxhQHiKMpnOHsE5kXW2eBwnxcgeBX8iZe31o58rqOucrbDP019IRulYVmRvKkV8XvDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940673; c=relaxed/simple;
	bh=0Z18wmYz6vI5iy0HTnequFEV6jc8LDOzxS3aEXuZrUU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3pzO8l4ZapeGNqz0lyPHEsc5Brv5jxggdOhQ6mOnBRR8Ie++qTXrlhlsIBOpF6niF+Okjq3XrD0YPGCAREUzUxyQQj2nalCb7AtfXqB8XwLcYXmhakJRFlTGZglzjGpre1Te+qeRFcqJiwXDY9iZnE8MUEIFQk7DbxLNU8yRmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mWaqssDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MEZoeR020559
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDJ+E3AHEwe2QaUDTH9rzBaRNHpj0Q7gi6qHaCF2e+k=; b=mWaqssDXr+eSX3oG
	q+pCGxeSbmrBmnFV0KzoF9UOUMiZb94ruTf/sCG2qciPfPUY47stqzyrCMwaKK5v
	GZPvxlsNVPaJpbepU6BcEvAOXtC2oTv94/QU1I+o+u43LfbX3qD07KCArN8pDxZ1
	/zgjsRwjnsrgr64D3eallurGacpgXKxRPiO0SU07yDd+6lXPXdgeK2hKBOOabt/D
	9ECHnJmVsE+97HgYfP9aW9T/os5GX2hrADd9lQQFHgiGXObfBN7UUrIwiQKa88Ao
	Lfw6rjqDkRiT7O46r9+U8W8stzA6jsh3aauEKVY1L3CRwLROg0uuC7Z5rzf8b7a7
	zSCDZg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c579d37eeeso1250420185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940668; x=1748545468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDJ+E3AHEwe2QaUDTH9rzBaRNHpj0Q7gi6qHaCF2e+k=;
        b=eO2S5Nnx0M4z6OOovLqPF87djhd686YiN/xLxfNfy1gNEg7qjPq8za0g5tTqJflf6T
         /EgLYURsYSIgt4XDrgGySgtMcD/Szq3FGyhngWykPlfPnv52QZyk4pGnEgnnAg592mD4
         pMuaflLKd4siJhsvq+Gzna8uDxHE4iFDmVZuBZUvUAwpYy/0xlYkpSv3saGSAfiZzobu
         Hlje/5hjkG6wOevXqhWI2niu+QvOTjCb8T/fyhh1V/LL5U8VAxe/3sxam8C1eEKCZHcL
         L8ecTQk77Vh+LvvnKQIjQ0AY1JfZorPq8DcBudgbkbeGBuLyenrpEDrINUeYWQOEXZnn
         POWg==
X-Forwarded-Encrypted: i=1; AJvYcCVpf4KWrNyn6tQZsyWzinNlLGUBhIS1CBGJ/Ow5CUo8MSmwW1mLPerK0WCBYtN/jSqEsVNsto0fXRjArM9y@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0T4LWcvm7MX5npo57xsN0j8KKOSTlGhuTW3AqqCPzW/JOWMr
	6htUWI7+yasmvIiGmkHJW2dZ7qTQP+eXtC0KiJBCW0trWYti1Q0s6unnYcl8J7ksu2JiLKKYn5U
	XHNjPZmDKhWI1Y50otStP6tMbeGArskz+U5Qsny4zIb/GdGT/DSpB4UyGgJaM8KyXsmfmlmGUPL
	aL
X-Gm-Gg: ASbGnctb4ult9Xq+8jXRZ21QzkLxlb3TA2Ww4OwdmpH2hn3oRhBHgFFS0/lLzE5Sphb
	VVBKTXAJWNQMWDbEMbg4spQj7A2iaqLW4MTDOA1IAB4xesSnYi7iftF0RE4uPA94P7Xsrd1pmoU
	yE9kbEPaCcf6lRaCKGtDQJTPdvSb3gSk+JJF/iPY8rqXfSchKSL8UWYJzFAvUuMm+V2uIYXJT8N
	56k63/QBST1ka+ru46JUEB/batSBVS2I/9Ap/SBm4xr6Qv4q7qvXgGBV2tIJ5/EPvpL2LykBRrk
	3/bajfWP8Ko31DwlxUdQW7X/Z0TTAKIwwy30Y/WU4oghqPzsFQF64Zke3fpYXac7vmqzS+4PKQw
	DCvpqGuJHj9v0LO8rIoO9HAl1
X-Received: by 2002:a05:620a:2495:b0:7c5:3b3b:c9d8 with SMTP id af79cd13be357-7cd47fc65cbmr3657753685a.45.1747940668355;
        Thu, 22 May 2025 12:04:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrjizfeYUVLg6OhsDSjrFTslVxOV3Fl+jMi4ostwqXynpZ+WrAkCsHl95B/eySWhyncKYAvA==
X-Received: by 2002:a05:620a:2495:b0:7c5:3b3b:c9d8 with SMTP id af79cd13be357-7cd47fc65cbmr3657749285a.45.1747940667946;
        Thu, 22 May 2025 12:04:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:37 +0300
Subject: [PATCH v5 18/30] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-18-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8158;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fVPfpF4w+ayXwxcVscTWY4CSNiLYlfpbZi4KzYirIPU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+8ahFLa5BT0qEgeq5IR2gfo3xcCU6wcNmz
 erR/uvpYI6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1UhRB/0VarUe33UPMwOnC6/Uv9w3v1bQ15adixoFlQTGyGFgErbpq8p9d2TLyBcBRjO5aVqNMaY
 I8v58a7Hv3ZUrgg3CGfI9xvFpZbldjBnIK0tk0S8uRo0AYPj248wvYeOhiE8U3cLIBeEbh3Sgjo
 01yl3egwPdxG+JX+yLV16TK57gPsKQTvnmjBWDagka0O/MF/1u1vIjd2gjI0Ii9ivd/mnEzVnlc
 aIAjz6uqdBRJQ3j0KVQ8tLIBaQGqVQMbXaUg0mQGWfLs7LQPEIwiOUeE0KgAFgLgdFLIA+Nh1m0
 eHh+9vP1Toj7SdpRw9n8L572Rf0wZKloxx2MuKoX5tyOjjxc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: j4T5H8bSFHR_pYd1WplMd1Xroho5v15Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfXz196I8V+1NZH
 KVsZ0/iROBgrm5yQ59o+k24g9tG3h+z0YCaIL1NYzwX1+rTJ5uWt/+XeDHeFZYRPma1aCMC4RzW
 zWk1/TaPbFRFdIoiDV0pH4Xxt6vS1VHer86rszLQSugiZkWSy1N62GUIO+oL/68W4rSOJAFSUMj
 43zbFWEcFJdkUwajfIZsOY/srxpXvOuiELfEjbx2bNCL7Iq/fwB7/gNgwn0tf299N6ux9BZ5uiu
 73v8eoEjuKXsp8L7wzmkRTH3gqTraWQVkcVsbtTHYVGOXuJ2W0rHBfSMkh1Ex2kAJbNgSHL3nDt
 to78eVEE536Hl/GhO5gBeyRN5cFFrBjuvZCH/Rn8W0sSYy7RxLmvAQPr510acIgCGpbq9Am0Zin
 oIlGEpli9r5xdxyzJ0d/LvhkT8g7NcyDze7rVSvCHeCEQnWZkxOvT+eP9f304HVbgmuyna7S
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f753d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=MP74wIc9YfZe_pNrw8AA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: j4T5H8bSFHR_pYd1WplMd1Xroho5v15Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=875
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_VSYNC_SEL feature bit with the core_major_ver < 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index c0b4db94777c42efd941fdd52993b854ab54c694..29e0eba91930f96fb94c97c33b4490771c3a7c17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8937_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index d3e4c48be306a04b457cc002910eb018a3f13154..cb1ee4b63f9fe8f0b069ad4a75b121d40e988d2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8917_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index c488b88332d0e69cfb23bcf4e41a2e4f4be6844d..b44d02b48418f7bca50b04119540122fb861b971 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8953_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 0e8e71775f2c1c38af018353c85ffeb6ccddb42f..8af63db315b45a5a44836303c8ce92eeccc5b1f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -22,7 +22,6 @@ static const struct dpu_mdp_cfg msm8996_mdp[] = {
 	{
 		.name = "top_0",
 		.base = 0x0, .len = 0x454,
-		.features = BIT(DPU_MDP_VSYNC_SEL),
 		.clk_ctrls = {
 			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 			[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f2ec30837f9ccbff1041f0465d0123382a00355a..f91220496082bd101099c1817c41699215980d53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -23,7 +23,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_mdp_cfg msm8998_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 26f39acd82e07c71cbeaaa72c14d9b7e14d2dcc3..8f9a097147c02b538e720dd52f77e705f7ff1ca2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm660_dpu_caps = {
 static const struct dpu_mdp_cfg sdm660_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 657f733c9ffff73f9eb5051ba55ed2e4e7bb496d..0ad18bd273ff8c080f001f0bee654393cf0c24cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -22,7 +22,6 @@ static const struct dpu_caps sdm630_dpu_caps = {
 static const struct dpu_mdp_cfg sdm630_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x458,
-	.features = BIT(DPU_MDP_VSYNC_SEL),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 15da5ded19267711e6df8605d576539475fe634c..3e66feb3e18dcc1d9ed5403a42989d97f84a8edc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d48c26a7cb6b69961cebc19576e3f7fc3b8dd2c5..92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -34,8 +34,6 @@
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
  * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
  *			   in a failure
- * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
- *                         (moved into INTF block since DPU 5.0.0)
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -44,7 +42,6 @@ enum {
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_PERIPH_0_REMOVED,
-	DPU_MDP_VSYNC_SEL,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd..cebe7ce7b258fc178a687770906f7c4c20aa0d4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -270,7 +270,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
 	ops->get_danger_status = dpu_hw_get_danger_status;
 
-	if (cap & BIT(DPU_MDP_VSYNC_SEL))
+	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
 	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;

-- 
2.39.5


