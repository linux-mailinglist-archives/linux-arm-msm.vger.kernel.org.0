Return-Path: <linux-arm-msm+bounces-89334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FD4D2D3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 577B930167B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2487B3559C9;
	Fri, 16 Jan 2026 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQqDWGfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UvYancIS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983173557E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548476; cv=none; b=Eo5+iLSppYiNWVkOLOAE97vCxzAURigF2atkubFh0GKZga2wyw1+Q+AHCd6vZGCqkEidtsYExaMB/tjs2wDk/UhUIaIc11px3YKJNkw/cC/nrSmrwt7fLJbcAFfLJg/n/dfy0v3Kf9EGKG0oEDlk7wAlKx7luYzB74cSEb3e2tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548476; c=relaxed/simple;
	bh=xyHoBWvZZaE8TSDb+hpDqTYRq4EajnBdNLKjYQl12eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=enqhIRa7krtQT7V/CU6qwsH8FfjfAXHAiYP9tY/tooFLKNvhZ75PydvU43UwyCGDxqv0MSK4FBAdcQSuE1SUZ7Nqw05v+tJpNPZRonFohGN8JG4e30ELDkkyGqvhpWZ2l6puLjZoKr9mdA3R/9VpxKYYkClZ1zu7KWLucMxExRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQqDWGfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UvYancIS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMblcC1241227
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=; b=hQqDWGfbUqLwPJnY
	pZ23wCGv3B5oWCgT3L3NHYVrItGXl1mJS7JQfV3+mQOiUu8wXX5XIYg69WxXxhMO
	L2NoqwvuahVyfDdKbZlSaAQsRT1CgxIYghV9t6wMmc0rhi2SEbY+Mst9TaBBMlYG
	7zLy/PeiwxB8R2cXYfsd6JZAeNH6gw9/VidiaypZhlyvuU3ZrmbTRb9mH2ox8lGN
	WuzFM8YbKaDM168fnM1tidPzZfEP8XWgqngkv510HYC0rRmP8WRhjFp3g8Y9O1Tp
	o/Sv8ejyW3wHefhSL7HeOGXP+UWkC3gebRL9fGweMZKnbG+1JffITWVwEbo/yGea
	EQoONg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96ss7bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so513220385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548473; x=1769153273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=;
        b=UvYancISr9UQMj1IUnzX1medM9OKbCZ2D1HlxHL/Fx7NT6feRrvsL1igkf5HioAgr9
         B40OjNhhIKehleRt1MmQI2Ga1SDFrrYcwxnT5huSWoHcJMyPOp5mYaDqyzeKjB1bHpD3
         vTXyYChSsrKv3eEigRaQ6JHtgX1yjgmQMM8fS6k7NyY0qXI/JfygC2Gy61hc4L7Oh9Oc
         gBciZ0KaC4Mok4Zltv4vpNlpKyUgDk7fey6GQIpe9lrFNRz0MMLrvb/Ug7r+7UifjmBv
         gBFYVT3I68ZUFVDh1U7MxCmoy6S83+hEvBn4OSr29Z7YB+hXipN8m+UhZn1JlJ0OZEr7
         7A8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548473; x=1769153273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=db0LO5TJ25DmrOL6OV021nIeGeKQkcenwFXwq6LGlxE=;
        b=THRmxET2x8HZ1D3Sj+1coGsfNqDDbRwFYPavLWBR2vwsk9SyX/YtOJu/2sr1LLdDZK
         Qx0pekf30fJpvvtzEDXLqHfC8U/G8rRPnhHPwQufttI1H8h2u1hAqaQE/Cz4Ir8nkgV4
         mNBPgF+K8kM7PxmLE9Xa+R3UCks5wT5Du5bTZJNj4H78KaNov0fZtGuw2Njvb2thwrKk
         7bSXiq+gfpZrd3nq/Ai8mGV2mLmRp0e4Vpgk7Ui4XsjhzER1YVu8GuzO1Gfq0LiRoyrN
         v4ewaoRCIXfIBeryzI1MxhGSUNk+PN0OtWhjyZZoEwGC4Z8F2rJagcNZO7/2yhafnxH4
         nFmw==
X-Forwarded-Encrypted: i=1; AJvYcCUrcTWSwaBXbfVWg+QHV1BFVVwSZlInG2SHq0cztam9nNO2M8+i7MRp5sMcSBNrpDL+r7Uq1dveqpSlJzG3@vger.kernel.org
X-Gm-Message-State: AOJu0YykWM6dCTlZKnlq1eOf3Ezbitphrsjn+gag+bgMhO6NqVMMpOQp
	fT01iWne8m6O1vwFRcfuoZMGdzPKqGXES049Xae2B/yAoN6W3bLEdbFuWRSc2Vx5X2xuz2z1UEJ
	iHLkYOSaPRNsV5o7pqAlsT7qcNwKnVBmQkfU7gRF0LWweMsZD2X4OEEf4ADW0HbTiAJpN
X-Gm-Gg: AY/fxX4zfN0fj+TrjE7sUv2E0C/SYuPCjEdH5HEFUqK8OwVAxopCbyi0TENYzYdlrEs
	KXX3jRYDmRfhCek0k0YfOmCZwT6gikelcXMXmUlxI31clnMbkOSQct9oMv0PY9cjHQDrFqu6Bvp
	oKvYDDJ0jS0L3SEJL4q4cC5ur3Iv0EddwvOZWR/uJgl5b/5jYoqf0XrD0lTHHvntSAkJSNf0DXQ
	9sbXiyN/FWpwGi+F+Dbu9x0qHemBxBxtgg373xIvEMJuvpdi9KKYww9y3kW5pgFTh+26AaILa0J
	Gfy2Q2fndshzEx3MS25Kd1SFneI7nz1NNifByoRz3HSzYYdx+dWBWcNB9UbB5wOxtn19vtsMYck
	/+tPlqTMQTONr3DIQicKTJMinNgH/5tS4v/Vsncwdtw0da0vChMLC2chE+3TOjvCEuxVQfzQsOv
	OpgQB/cD0TekZBHRjsEDO9vMk=
X-Received: by 2002:a05:620a:1911:b0:8c6:a626:7353 with SMTP id af79cd13be357-8c6a66f3916mr290555385a.20.1768548472722;
        Thu, 15 Jan 2026 23:27:52 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c6:a626:7353 with SMTP id af79cd13be357-8c6a66f3916mr290552385a.20.1768548472243;
        Thu, 15 Jan 2026 23:27:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:43 +0200
Subject: [PATCH v3 9/9] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-9-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xyHoBWvZZaE8TSDb+hpDqTYRq4EajnBdNLKjYQl12eU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2bmi6w7SlOnaWcHhiZNrNOr3bCjMa1l6yfT4snmBr622
 m+df3zsZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBErjNwMCz/1N7oGNJ3v+De
 9c88ET57THfk3uCfcN7/9pyoeckCaU3u5xuTHtQzfZzTsylbdnt5w9n5119P/NO1pC3x+OqtZbe
 cstJallknrfLlerlFbc0K1lK3RY7NB3VcxMr/2v5XTphsG29a0T7vSaGrZ6TAug2xq/e7HBBu/G
 axffq8BWoBL+qdGXYsKw89LF2spSP5x/3LpJag2uQvP91OKaelO5YHr7oU5+aYnxBcWBtSezBn+
 adIudNyszxuvd/N99O+wLiEY77OpFsuQSkm0VZLc3WeJtqX+Tzh/BFR2+zCc4TZl3+9i2ZGi4Np
 vfvDTct05ve7PmSb+GLaVeeZgiHLizIcZBvjv81rurUIAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: b1q9mLYnvVVi3ot8OHzPpthf8huLCHEJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX7XXE6zVJiwwn
 r0XGPgyqytlwMYc7WLcjzs6KtaOm/vS0d895kp3TaxdD7AtQUSuPjk3d8kUHm3vP715qNTtG3vK
 rocMDgVhrIPZry90vpQjOT3mw6+w71inWvJWP6bzuguL2gstS/gZkyyPsTsg225FPGNpxccQgjx
 oabPAxLM/9nj3GMBjIg74t9Dj1T6epQUKmOADYpV5rWL4l3s4crUfASGJ9hK6PzN5jQ09l/LidL
 cDY8GUtaGpk4zp3lhMU3X5fiYO8GRe/du9Wz5+18/mUOxQBJwTs9zyIRwt+7xJjbfXTY9DiGKAt
 TIsr/I9BTKXZOXcicrQiVLYNMx/wIzaddQ7naI6II3IPEguJD9GQIIS7sa4PdNwaPBdJBfAxA6y
 aOfeuONtd8K8TI12uVJ7A0rxSSys2Ug6RwhTeqs1jlJ/+iyWdYYTxgTjvBLlZ+JWncGOktc3Pzq
 8vJlG25YFAwvu2VfeGA==
X-Proofpoint-GUID: b1q9mLYnvVVi3ot8OHzPpthf8huLCHEJ
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=6969e879 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oxqy8SEdECjWQAwmsJkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 4 ----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 7 -------
 2 files changed, 11 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 4abaf4615cea..3b0e9e3cfecb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -71,9 +71,6 @@ struct tz_cp_config {
 	u32 cp_nonpixel_size;
 };
 
-struct ubwc_config_data {
-};
-
 struct platform_inst_caps {
 	u32 min_frame_width;
 	u32 max_frame_width;
@@ -218,7 +215,6 @@ struct iris_platform_data {
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
 	u32 hw_response_timeout;
-	struct ubwc_config_data *ubwc_config;
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index e78cda7e307d..5c4f108c14a2 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -631,9 +631,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 	{IRIS_HW_CLK,   "vcodec0_core" },
 };
 
-static struct ubwc_config_data ubwc_config_sm8550 = {
-};
-
 static struct tz_cp_config tz_cp_config_sm8550 = {
 	.cp_start = 0,
 	.cp_size = 0x25800000,
@@ -760,7 +757,6 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -852,7 +848,6 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -934,7 +929,6 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
@@ -1020,7 +1014,6 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
-	.ubwc_config = &ubwc_config_sm8550,
 	.num_vpp_pipe = 2,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,

-- 
2.47.3


