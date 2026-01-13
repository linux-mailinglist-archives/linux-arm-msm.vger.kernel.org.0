Return-Path: <linux-arm-msm+bounces-88848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BABFDD1A7C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5126F3081F8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8866338F247;
	Tue, 13 Jan 2026 16:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oJoJoRDU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jlG+dVXK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5EA350290
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323468; cv=none; b=uhRP5Y9tYNB2o7lHDEeND7sy+v+WSiBhhodvilYbG3LsW0/zY0yHcg8k9niCu7rF8ulpZCX0wsq3L6qHXi5r6keQSRtlolzQMEXCxvD1bLIlAOdFqeFU5JpYB5WWdi9ULRD5aKlzTRqDL6d4ftp9Ith0SmeIXjo14UiSwgOFd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323468; c=relaxed/simple;
	bh=nHRSUklijPQc2jdlENh96HtWcCH+DpPknCnBLECuzqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMvrn5ecdBdB06QLrL1sBRNKBrc5Ws7xRYvOl30XPR3H38tMW0/kkLL6Uu1wUnw7E4KC7J2meqd4U1KcKzWyX+eCHV5pVUrpRRZzK6FAMA9O60wsfhvfqrK1MzEQzVkcvL8bkP1twAttBO47F13n2eIbgYqyuyn2lpqrDFTa6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oJoJoRDU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jlG+dVXK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCEiLs3810630
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=; b=oJoJoRDU7g0nU9To
	pAqlFfT+VmgqzUJH5AQm19gDy6AeQePrHTsDgWCnkWVWBFMudpoQgHl4ozDbSVly
	vi7mRXPKjjF3RR8iuqnJrMq/F88ILHp7Pm3P14RqK2olxueHklf3+SZAh0+QBzmW
	oi9HSTKU/jwBhMeQnCpJwMPdwlYYCDHVdDE5j4fm6JLHNUp217U3XNwGSUUZd5y+
	zr0+qGdNwLMv9muD7hgsSkQ2x6Y7kXbMoRCd9M/WwB5PAxqewKFVpGcCId0iAdSK
	rv88DJI3VNHvISszUwN/kuuuO4Qh/6Jok9MX2rbjlww1NEA4cva30xbDsgzxQ2PG
	/PPyaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t7b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so2016727585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323462; x=1768928262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
        b=jlG+dVXK8/h5A0e114QsibyVjfmtmu5Qdl37VNpy8Y3kQN6ZvBjXiNUfsDXL4Mp9fM
         +fZJB010whrVn+3y0yqS2EvNYeJrE3MOo27oCdIMT8yLXcpcV5AwODMmtKCd8r2aVTMT
         Rk5Y/5dZLUHgEgq4Pbquk2ssM50txtxIU00uit0frciCB7LUESmkhmYnf6Ql4dbgtR5c
         yxFL6tuBzDvafdmBM5GxoeybIIvoRK0TDDqM75oLw6MA5yWOPu0yTUBIpN2tLs7IwDcC
         3+x/80mUOr7YffDrq1yNI0kw3QiCu3GEsE3Bu6PoGOpchqKy3+pKV7EU9K9TKnFmeSeg
         4HIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323462; x=1768928262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3jkI5KBlBqmZ2HnDU7wrb/gTC/agtlfdGFSMyUfGxQ=;
        b=AHH814YSXdt3/C8CCAl0hlY49IjF4BIWJVavQAhlgwczJExTjlaGioTwjZ/sLgQFK9
         qbCOdugR7fuNoFr76gcA1WKZzDvWwYR8PieEpFOKkcnPDWMeN14m9eo9FOXv7sQysKUu
         YRh3A7+mHTN2h4r4wBppEhz9d53EQP38rjubsOU+QrE4UNa7uU4OcWnauHIEwWJ66cfB
         6gte2X471F5Wvz3dCP39qaoYVm2Rgtx/YAeaZXY5mYglKUJ/yun9aekHaB9uWKE+daoa
         OstqsTx3i2WP9VR5CvG3klrdy1NffyZOu0aPaCfoXqTDz+ODuBdrLJkx1qXsG+v3hFsG
         v76w==
X-Forwarded-Encrypted: i=1; AJvYcCUWQW6p4ysE44V1uejqTjaVjWEhq0hdD8r+qvMoQrKQsaBupFuLiu6TaaEyrV9XXuM0Ns5h4CeAIFaTdCKu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa1E4WQow5d4y9CXwko8TSOM3svS2NalArjOtel++IXto51riS
	JTOYCRIqc+CB1ODkordPDY1B6+qFjVcQWU5iEaKcuE7WzCjeuexv9YWdo68UTMWwuLi0CHA6C/r
	s2MFpzT44BGkeszV8aQ2DFrTPiLr59MdsBwsdH2cC+kzg11fce9i1MFVuivICPbQ3jUPU
X-Gm-Gg: AY/fxX5Pp6kM/SfF0aTrmbGLG/bU9oO0nFa3mNclZ5BmhpW5sOTLnzGTuTC25qe6dYe
	R1RJZLl8Kv9mcX6zztzB+ImJFvneIcAFofQynCo0QLvd8q0H6IPqT0F+5hxKPHa7WHRG4pUhT5i
	mw3baONFTsZnSusy23F0hnIBBjuBvikYpCuAfhPYnVop9m5wLu2K5640BQi7ymrBmIm45IiKfeC
	C0SejngOlXb01ZUqzupUHugVfvsSs1CrFjp4aLV7XNolHusItpSzqY9Myac/4J0w5GCZyn3JjAg
	HCrLfzKxntiAx6ubVYInTldZHTSjiTZQ/2D8SjQp/gE9UCYTf8dpcazfMu/hwFUo4m7dRE9z6fd
	6jqujsAN+iOIba4irhkAscengKcNlVlqIeHzVHLUWG7TmvrKZaCYxGTX0h0/mgHsxtBZ2REjXe+
	B0uKFWNP+E6H+qElDTDT2xM5Y=
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8c38940e76cmr3076018485a.75.1768323461695;
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFixxGv4qvV/C3gFxLRBxbhyay69L0agbIGsQIgfJHuYPpY2Dfb0r4yCe+MUS6dHgi/ZThQ7A==
X-Received: by 2002:a05:620a:3192:b0:8b2:5df1:9341 with SMTP id af79cd13be357-8c38940e76cmr3076013885a.75.1768323461140;
        Tue, 13 Jan 2026 08:57:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:24 +0200
Subject: [PATCH v2 09/11] media: iris: drop remnants of UBWC configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-9-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=nHRSUklijPQc2jdlENh96HtWcCH+DpPknCnBLECuzqc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBpZnl0R9mcetWZiHcOLy7ag03H0ROOXYvlfi50m
 sg8vGsT25SJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5dAAKCRCLPIo+Aiko
 1W2nB/j4AoOJ6aWIMhTNvzAaChzogMOBVmDThqW8wMpr38Jm3Zqp9gIhlYQR6G6tiH2Dpmd6AEE
 DVC1pO1CVJvYpHOcHlUgqOsgwgwDmutuplQSXiaeVO28KenheoO56JaZ9rkguHarBTtYYwz6t90
 PtUENrBooP3UOqZLc4lS3aRKUrfDWUcKMVsQQJxLQCxj43t3PfOFwltjRYTWmPWYeEPNI0UcnrZ
 bBfI+ZE1gaCONR1ChxhkKdGbvVfSu11Ugutnfh07dmwjH4y9OQRC5osKfD2zXoztg6g2EeCkOOG
 WleBTPbRNl3TgFfVyFdLnJoU3groM9VuEaXmetn+cAy6Xxg=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NKu6Tq2wMoYL_3m7mCjMkoiJLSUjXJfW
X-Proofpoint-ORIG-GUID: NKu6Tq2wMoYL_3m7mCjMkoiJLSUjXJfW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX8kL8cl7FXoiu
 fXAXv+xOVX7/mkxnRELGuSWO9zXnkeV79AigJseKHrJyRley2izLiOmI49/jY0L2o3DunWUWWP6
 KoY5GhbCvwr1RNvDAeAL7ZimA98mjy+EoEvDC8JWIkA9Nx9OQGdMJZYpZMP2WCloBoObxJM4YOu
 glamPnnT3uOCetXH+MyRpkFUtT0Vos9gWtoxikRpWrY+pcsTeFxeemNSkTiF3Ey+y3oPRy3Tbqw
 uh+EjNgKdcRpfiLN2kK3yN9rA9RbZol6JuyCApsmDdjwDrxRwKBfYEOotKZ1dexGs7yco6MvfWt
 6kMPgkHfQ/gehe/LYYXXavZ/b+5vUCKJSasSH5O8ioP602CUAME1B4SYqc9FHYzLIcPj6Hm7wLX
 s707nngnJhv28rf3bTyabRyvhvgyr40EK/9YVY/uqBfKQYK/Ebm+cxiK2xWYReYw0rFORSH5Vj/
 njWZVOLa2/RRBaPnDTA==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=69667986 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=2Ss2wluK-XfGWxNQOroA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Now as all UBWC configuration bits were migrated to be used or derived
from the global UBWC platform-specific data, drop the unused struct and
field definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


