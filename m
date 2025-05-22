Return-Path: <linux-arm-msm+bounces-59128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBBAC1472
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E53FA23D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC782269CF6;
	Thu, 22 May 2025 19:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmxMKV4w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0BD2C2AAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940691; cv=none; b=Q2bQ9PVNUV3dLMxHsU6ShULiHflDPerYXP51bCsU7wLnps1DzJb5h8VPT1CueSJ9tsW1u/WddNJ3i2LROxObaO8HThRqPlVvqQGQxoL9bYnNk4CS2TMhMSgUJibwfw9RhHZ9xRdzIfjpslP42hvxl+KIF8UWFnagA30dkcbZ+/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940691; c=relaxed/simple;
	bh=AvH0+m/lcq7fYeoRmjqLFbsVRzIu9NAfIv+c2dZOgqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9jPV9nvIZOK8a8cJcLf2mGOMAJn8uRknMCIazFMPVsTcaB2pogTMEEk9GbZkhpe6h2gWosefwr+kS9+Hs+jSTaXhqmZ0fNLrMR8tuFMBlHYJ8X49PcbSqahkyyJ+Oo1Ld2fV+WdCxf2wGVIKyx1Yqy/o1WfjDPGcmwZUkw1nE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmxMKV4w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGAwNZ013430
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MX/zaY86CMaaVpd1fEt3109ml2WBuAQGEdMYy1p3bSw=; b=DmxMKV4w0gJBvYCk
	2t8CQ3nnqZv74G+VdBXYC4mvflzEbIDIRKDEXBq7hmhmfK6O0rQ0cZZ0AzOgLmgK
	MnvcR4oJkFj9k/Jh4nJaam2MpyTswJ7DSSa1aB0qP8tl4JZrbORgOGLQoMGnP7aL
	tbDcw0NYHHui0tJixuzXpxnCXlAORTaJq3sA/j76spFD9BpPR03b/zbXAn37JsMm
	1u+EU9banBSHiYAThiTPCR7WlKi3xCjeOCq9Phdw9fTmWpbX8lXmTQMivi5hRt1w
	XRugsFbLXqEToilTGTtqSv5BhHAf+TJHXhuDzLklKcqjg+99Fp+yC7IcbGOX1ZBT
	6ZC9qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fnt8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso1251372585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940687; x=1748545487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MX/zaY86CMaaVpd1fEt3109ml2WBuAQGEdMYy1p3bSw=;
        b=QKfLrfg5b0FICbBmvk5UOs8pkXehNVXS4l8BZXzIa+wE4Q3cJP3mPBJDBvL4Kkwdoe
         FKFkODwtj6B2bQ0UzoEFfRD/jRle4Y9fWBWoAtzsDYTsKY+8Z5OTS0z/OR9ENz3l+aHN
         rytQ4c0H1Jz3ZUMNGyXIemf9AIyTWEw7TtHncMrHCmw7Yx/SVFcp77g96ih/a7MUsLdE
         cq0gNQBvqWm2dghhf2vahNrTIRgNS7HcgPMMhnECfLGKrsSCdJ90niLIoIjZxSnPtGI+
         V4bEpH+xP3ZycAeczkHxejj5MF/EoaSTIDAz6fjiO7EMbN73YA7lbltmq2RxgYIvdTJE
         kcRw==
X-Forwarded-Encrypted: i=1; AJvYcCWCDoX57PUUD4xhmZDLI8gQL4wo4oBmksXIO6yox1YZOhier7gmr1xl0ruPpXWqAiyz/WJsySI3yyo186Aj@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5LivoLk2R3ruNhcH4ykY70i5jX4LoaQl3JhKJ06vLAAk1AOJ
	xcEhS/imVT56Up05hrQIWXXzjQjNr+t6iZHIuPGVPtgPWIvAlZXOv1zeyZ9SkEJT9zr1mfK/Pau
	/o15rw8rge0SVEvy0QNdRbfptim/sFLnxgCAqtYPYvCRaIms34XffyfaQRmHKouIuWqAQ
X-Gm-Gg: ASbGncvFAePX8e0suwbOFtWKPQlL9g7EmNLec7OKHZNXc6ullRrOQOs/nOtdQN834DW
	TGwCO1G2I20uLJ3kekJL5yz+9iIQczzxaUv5B0uiTdaJNft/x4gTABhHpCE8weR4A9dIy949s+Z
	oVyIfa1M+uHwvnfa/zwMRE8bLMzsvlRs3E6V44BI0e+tPuXh1pKzrcdA6E7UMAo8EA9M1tEDd0J
	FzXaCXi7JlWmBgQW3jziwASbuDULb0CBge7q3Qe9OBGK/ukf3SGzorVDVHnuq3x6d5lk/gQdRli
	oJK0VsoYCLzCiovfE80/QDF2NQRiE4rVshysG7AilqH4GyhEzbi4nFVQLl0UlQcQffae7hOIDNp
	x9Kwdtr8EJVQBDNton0PfPQVK
X-Received: by 2002:a05:620a:448f:b0:7c9:245f:bacd with SMTP id af79cd13be357-7cd47fef380mr3767413685a.58.1747940687393;
        Thu, 22 May 2025 12:04:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHItJtcU0CGElxAydltQU5INvhpDGIhI30oydYlUqmCwY6qeReKNDyInGwbRKTl2U+r2m63NQ==
X-Received: by 2002:a05:620a:448f:b0:7c9:245f:bacd with SMTP id af79cd13be357-7cd47fef380mr3767406885a.58.1747940686672;
        Thu, 22 May 2025 12:04:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:44 +0300
Subject: [PATCH v5 25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-25-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14624;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AvH0+m/lcq7fYeoRmjqLFbsVRzIu9NAfIv+c2dZOgqc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/K87DFWOOs9sUYduaoPHtiFnKMQ+vT5y6Q
 nzAoQn6PrmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1fqtB/9KvXoY5LQ7Yhg5vpBdBujHtE1rnj9R9GsShoDpOa+5Jhe/Aohza/6mjFZxoRQ0IdDxhBe
 MqpMZimhdwtY9fEsGCyhj24gv1gAMzU8f3CAiFK6+5sXDKFSjOLwKNI/Z9kMEUd2ca3AgMFM3e2
 hk8TDeqWQCSeX5KE0QIWhuaFgS93Syys+fVsxQx33xf31CfA1BAlNVrGwp3NjydFvEd29cDLwRb
 qaiNZBCtw1Ev3g/K/+niHrF4Bgdgbv3sJgVrP9lMK/3Gw5By9/7UTkOR/OmAiH2NyLtP06YT/3Y
 +5kkmxTdBCFwVclyAKCkGLzpTh3DKfBac4UmTNrmxVms0gpU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX1aYE52rxCxcO
 U61hPIJ8F/Y/fDbblef8zP2hSkkcs5hKsrpK2zgLbTK08aeYRy6+eSXfrNdxHwbuAQUlPvoZMUQ
 tziUUdD4b44b1ZYFoDFLU3X5oACU6jN96cFZaZDR/glupmrBtvTT7Jf6xZkjSacGXEEzELzhUHt
 DJ7lJIP34nSHWAmbHmOGWyaL4gQARwl5ooyUACZILKqx7uayzMVYiMj3lObYgOlzokn+bkxxu4P
 pVCqhO9WysiftD+tx7I83cx+xusN+7FeKx9Ifd9p5ecsSjseXlwJdyNz1I2ROfr0g66t3LwNnaO
 ch0kiPMeF1ZA7pUyoDOM1SEghDooxtXVT0qQzNHOcygOl+A5jQJn7QspoZYEPKnbRuyZaWgJdho
 R7z3qDMUvy4b6LMyXuCOyFGRzn6PVJ31pIEfK61QCzC7KoM+MPsf4JWva5Ck+2WpURNlhJK3
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f7550 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qMlBm1ryi7ijQuv_G2cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 45o73_Qa-dj8klsSlZcnKK_AgpXAOqsf
X-Proofpoint-ORIG-GUID: 45o73_Qa-dj8klsSlZcnKK_AgpXAOqsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

Continue migration to the MDSS-revision based checks and replace
DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
 19 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 013314b2e716a6d939393b77b0edc87170dba27b..56d3c38c87781edb438b277c77382848b679198f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -318,7 +318,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 5d3b864d28a86fb86fc4576210c9418604afd844..ae1b2ed96e9f10a6e7a710fc8bb4e40dec665cf9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -275,7 +275,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a6e9dfc583f283d752545b3f700c3d509e2a2965..fc80406759cd52f0d633927c8ba876feaff48e07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -281,7 +281,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca..a56c288ac10cd3dfe8d49a6e476b9fff062f8003 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -241,7 +241,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index 5c2c8c5f812347970c534769d72f9699e6e7049a..2950245e7b3f5e38f3f501a7314bb97c66d05982 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 9ceff398fd6f554085440f509b6f8398b4fbf304..7b8b7a1c2d767eafca7e7440098bb28e2e108902 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -312,7 +312,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index f6a0f1a39dcc3c9e82c07889d71905434274cdf9..c990ba3b5db02d65934179d5ad42bd740f6944b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a..093d16bdc450af348da1775ff017d982236b11b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b..85aae40c210f3aa1b29bf0b5ea81ee1f551a6ef6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -285,7 +285,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 5d88f0261d8320a78f8d64c9bb68b938f83160a0..8f978b9c345202d3ea1a7781e4ef2763b46c6f6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 3c0728a4b37ea6af25ab64315cfe63ba6f8d2774..b09a6af4c474aa9301c0ef6bc0ce71ba42cce3a2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -298,7 +298,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index b8a1646395916fde04b9750cf548edca5729d9c2..0f7b4a224e4c971f482c3778c92e8c170b44223f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -305,7 +305,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.clk_ctrl = DPU_CLK_CTRL_WB2,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c..465b6460f8754df18bbcf4baac2f8a3ebdea3324 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 2e7d4403835353927bc85a5acd3e6c5967cac455..6caa7d40f368802793c8690544c1c82b49a617cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sar2130p_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6..7243eebb85f36f2a8ae848f2c95d21b0bc3bebef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -294,7 +294,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
 	{
 		.name = "wb_2", .id = WB_2,
 		.base = 0x65000, .len = 0x2c8,
-		.features = WB_SM8250_MASK,
+		.features = WB_SDM845_MASK,
 		.format_list = wb2_formats_rgb_yuv,
 		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
 		.xin_id = 6,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index ad0460aa5b5ce5a373dab18c89e4159855da4d2b..6d7be74bafe326a1998a69ed9b3495c5acf6350f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -98,9 +98,6 @@
 			 BIT(DPU_WB_QOS_8LVL) | \
 			 BIT(DPU_WB_CDP))
 
-#define WB_SM8250_MASK (WB_SDM845_MASK | \
-			 BIT(DPU_WB_INPUT_CTRL))
-
 #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
 #define DEFAULT_DPU_LINE_WIDTH		2048
 #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 41906dadff5a8ef39b2e90f3e80bb699a5cf59b7..8c394e7d6496ca2d120c81c7776b4b979368be23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -140,8 +140,6 @@ enum {
   * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
   * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
   * @DPU_WB_CDP              Writeback supports client driven prefetch
-  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
-  *                          data arrives.
   * @DPU_WB_CROP             CWB supports cropping
   * @DPU_WB_MAX              maximum value
   */
@@ -155,7 +153,6 @@ enum {
 	DPU_WB_QOS,
 	DPU_WB_QOS_8LVL,
 	DPU_WB_CDP,
-	DPU_WB_INPUT_CTRL,
 	DPU_WB_CROP,
 	DPU_WB_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
 
-	if (test_bit(DPU_WB_INPUT_CTRL, &features))
+	if (mdss_rev->core_major_ver >= 5)
 		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
 
 	if (mdss_rev->core_major_ver >= 9)

-- 
2.39.5


