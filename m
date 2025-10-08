Return-Path: <linux-arm-msm+bounces-76297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A8BC34E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 06:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91A7F4EFE13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 04:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039962BEC41;
	Wed,  8 Oct 2025 04:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBD9u0+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319B82BEC22
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897996; cv=none; b=QcI7LcWwRysaf/O8RA6Dv74T1m0SQZU1loX53lghF7dpaRwBEbAh7yaeX/uipYFrHjZ/DLm53Mdl0Q8visPyGNsJMvMc5x0E9DI9p0UIgXLHyfOD/JZi3FWD466jfQ4ruV+xu7tYP81Sl+P+YPwPk/yB3MlvhCwgwAU1FvuoovM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897996; c=relaxed/simple;
	bh=WVcPThemHWksAIsVmW4eiiuZ9R/8dpiWBdZgPjKT5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ca5lYChgAcRd/eLfJN+9Wv4ArDuSRaDzDJ/JhyrLcPavQQfZlKMFpU5rBT26yM//02WG/98G6LKxoc57ji1oKMak3KtuNZI/nIeEbtzMq2fVb0OiFSm6aD2GaPA05m3YmwsgRi4AQa9kyZUi0elsbUtLs5FPfFrk6DVfquabVvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBD9u0+x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59804tmv019926
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 04:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3OkFKObasZHkBNUAbv6zxDXDlDmudDhGXc/cgtgK+Q=; b=IBD9u0+xBNhe4wvp
	ZILif3/oM9hWGm+ZwgyycymadCh6GdVbxfqkK5DYy4XNXg7C+wVTpyBEWQ7VjheX
	ikLeJdVhMOR/cR9j5XMs6XS4DCiTQ50x1dqqM7YRYkhiXTLMVHVcTgMXSXN6LRdF
	giYmHrXH5pC9f0sWP7ZRP09rGW1GQr0CJ8/SrBQgvAHhZ0sFvMFaNnLA9OFgQKVO
	G2eyUkxHHQNHpn4md8lqzRyoCx97/BptBpkIQqK6b9lx7nEhx1hhp2ieCipgN+oh
	4GnFmrDgtQE6ouYJYT60C0PdVw5yq7EZl4nhx/aZkd3eFlyrDkbzzo5NFbNO3+Yd
	enZc3Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0n2m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 04:33:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e5b6f1296so137089036d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 21:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759897993; x=1760502793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3OkFKObasZHkBNUAbv6zxDXDlDmudDhGXc/cgtgK+Q=;
        b=Nm0WhrbqnkwAZndntnPS7d0J2iH2nRXOyy/tOneg+QuCptIQ2odnSp8jWBmHEgsroR
         8Z6kU0Di9J9KBSe+iCj00afe9rHL2DxialqgPcCnEpOBk9J9kilCcxgIjKTTcVsqI3xR
         KndaN2hHZZlzdfpc5xPZs9ayP0n5SGNjssqv5txubuz8VIiagoYON0yS24RkRZCclfiC
         bwnm31K8IXey5hR5CYfK5unABUOv9bxBg8q+gGJ2njaJkD5M+GVQGrO1SLDMRnWvFYSI
         l1fIOlMAE4zyvEMvUB7mEnAN2c4RGOpJK0JrEl3RZZZrWDUsTChI8WzM/UVeCEDWd26e
         D0ew==
X-Forwarded-Encrypted: i=1; AJvYcCUojkuZv24ROI26afl55gnJFHntAW5fjCCv8AOup6hgfJBmh0r4dI++i1K37kGprnnGKP2jcuHr7C5PvQmT@vger.kernel.org
X-Gm-Message-State: AOJu0YyZiBUeV0MiADnMezKg/h3lULnhqkfPgu5ekBs4K0Gs51T6jfuZ
	NugFyHffU7YklALLPYwgecxAl/e8D8taxw73SJNMeexjN9Y0OH5hrY1Ft8PSOwiP4/s0E4LRIUp
	P/X7OvleufODIl4GQs709wOIZL2IhvoZYQSfITpA3tKcgNa8IN8QihjqbI4K7e+cP+4WQyHC2k8
	rp
X-Gm-Gg: ASbGncuy80qVUZQth/oM3lJ8NFKx4GeQ+pyGvNEB5RA7pL17kW/gBRxnck0vVCWtmR0
	932wa2GcZGgJuLd1q1x4FSSRFUBJedhKT3w6loce3GkMJVJHPFPIjGkUsW7lKRa3tk3ZGA6sVLL
	H9/WyiEXsMj/f/P+aoEwT/+PyqIbydh00dvmeclzp88qRec68vKYrMQQmcPE4RYmy3jyaf8fV1L
	BybYrceoliaGlOl1tpyeoTkKiQw4OWCnrNCoNcGA57FvPCGGp9qWkvBLirDmfN9cMQrUA4uNygu
	gvOI19obztmZ8jK0dOfvY1bMELLCQ7iq6E/kFiWsYBgPG7+J/uy8PhE5XZMW+kQZqiFCeBWmA6o
	Ti2HMiZvtgZ1oIQVJNYFJVcDtNnSQWWyMsBdOQDtgzlq0SKNggkSpb7LShA==
X-Received: by 2002:a05:6214:202b:b0:786:50ca:73dd with SMTP id 6a1803df08f44-87b2ef6dec8mr25060576d6.46.1759897992955;
        Tue, 07 Oct 2025 21:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5fSQzUEHlM9Sba1DnS9w73buYjBeWNYucwN0HTAHf5h2O3699qv7BAQEh0X1/W8ikiBVw7A==
X-Received: by 2002:a05:6214:202b:b0:786:50ca:73dd with SMTP id 6a1803df08f44-87b2ef6dec8mr25060406d6.46.1759897992532;
        Tue, 07 Oct 2025 21:33:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119f461sm6751107e87.107.2025.10.07.21.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 21:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Oct 2025 07:32:59 +0300
Subject: [PATCH 1/8] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
In-Reply-To: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WVcPThemHWksAIsVmW4eiiuZ9R/8dpiWBdZgPjKT5Nc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo5emCPIOQmXOHe3H3umhVm6Pti8BcuSKftq32V
 7ZuzDrWEK6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOXpggAKCRCLPIo+Aiko
 1XuaB/oDRU5WDHN8I/Bco1ROv4ItfONcJkCZrGXR5Cl5LQl41bTyqOPKoekOgMKAnqFdZEYIXWp
 s03Of28XCTBbvMd1DxcvRusj540BikKox+2CHaH+V7L3cKFTRecdvCqZ5rH2Ujo7uVJJJi+AAY9
 9EmwCSXy3ivSS9vu5P2dleCoO66XkKaFw1b8jJxKhMm/Fmrx2bx1nA7zYYLsn+g08AqDLWyYc1i
 Ib6Sgi3T+72U3j3O9oNrhB3TVihzTnHWQwLyhot6KHkMI1r3n+b6+JaIyM5xImUYEzFD9xbGEgN
 rDa1mcdswSYVXzVDlRAz+mXNSIUkjJscqfgImPcPjvpHCeTQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4xiTonqx1qZlF1rES_sAOZvU3gUFn-Cb
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e5e98a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=4lT8O_Qwe5KXetiC_XUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 4xiTonqx1qZlF1rES_sAOZvU3gUFn-Cb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfX+tE67FyroRkO
 eo5iIRegySrESBDNlKfZWFW6YcZqKshz6SwTosaQzGgz42t6HZkSWhTVxDNct7TWpINeTYbHLKY
 Pm1x5+q/AxFVciY+qZFBeup5RtHDmhkK0lKLwqwV1u3QZ54uWPnaM4O08obJRkbH6D6GUBhi6QZ
 IjN74A3/3BtsWCP9WnYQTyO/GiD5Ck4XVqNJ1bxqtoxcbq+nMzewOdl/FljJcpDFyDu3ArrnHD1
 CRqsKvCR9mJZupjrEo5yjaWZ1u5IZ3+tBHzwvGTcaZEIHAkmkKGsCj+xUXWUu6l2gdkvlrIiof5
 dzHo+SMvkL1vYd1PSoBDrHMhW0LBz9WWIkQI1SeICGMzZSpz7kPr+3pc1xO+00fcOkod6P60Sl3
 7zJnGH+yEqzLutC9944bOYGcVo1NWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

Make all struct platform_inst_fw_cap instances constant, they are not
modified at runtime.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h  | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 754a5ad718bc37630bb861012301df7a2e7342a1..9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -301,7 +301,7 @@ int iris_ctrls_init(struct iris_inst *inst)
 
 void iris_session_init_caps(struct iris_core *core)
 {
-	struct platform_inst_fw_cap *caps;
+	const struct platform_inst_fw_cap *caps;
 	u32 i, num_cap, cap_id;
 
 	caps = core->iris_platform_data->inst_fw_caps_dec;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 58d05e0a112eed25faea027a34c719c89d6c3897..17ed86bf78bb3b0bc3f0862253fba6505ac3d164 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -215,9 +215,9 @@ struct iris_platform_data {
 	const char *fwname;
 	u32 pas_id;
 	struct platform_inst_caps *inst_caps;
-	struct platform_inst_fw_cap *inst_fw_caps_dec;
+	const struct platform_inst_fw_cap *inst_fw_caps_dec;
 	u32 inst_fw_caps_dec_size;
-	struct platform_inst_fw_cap *inst_fw_caps_enc;
+	const struct platform_inst_fw_cap *inst_fw_caps_enc;
 	u32 inst_fw_caps_enc_size;
 	struct tz_cp_config *tz_cp_config_data;
 	u32 core_arch;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 36d69cc73986b74534a2912524c8553970fd862e..cbf38e13f89e5c4c46e759fbb86777854d751552 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -19,7 +19,7 @@
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -203,7 +203,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 35ea0efade73caa687d300779c5b1dc3b17a0128..87517361a1cf4b6fe53b8a1483188670df52c7e7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -5,7 +5,7 @@
 
 #define BITRATE_MAX				245000000
 
-static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
@@ -189,7 +189,7 @@ static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
 	{
 		.cap_id = PROFILE_H264,
 		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 16486284f8acccf6a95a27f6003e885226e28f4d..e29cba993fde922b579eb7e5a59ae34bb46f9f0f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -17,7 +17,7 @@
 #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
 #define BITRATE_STEP		100
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
 		.min = PIPE_1,
@@ -38,7 +38,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	},
 };
 
-static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
+static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 	{
 		.cap_id = STAGE,
 		.min = STAGE_1,

-- 
2.47.3


