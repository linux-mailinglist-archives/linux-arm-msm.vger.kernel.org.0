Return-Path: <linux-arm-msm+bounces-77892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143CBEE003
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FC60189AD17
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 07:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9683923C4FF;
	Sun, 19 Oct 2025 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHWJ6NYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7523B638
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860630; cv=none; b=JtjtCBtnqe7eWQC7EiZVXXgPO/2Gnyo9iACtaygILMwfSwPtwZ+/5J6HIBtX7swZq8hw3zjg5gYd/nzEBavjq5r247993h0bWpx2j5BBZDu34BxRcT4qM6YDMO2VfgR0craT72uMq9N6ccKRDTo4poBT5KrFPvD9pNrYEgUCF/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860630; c=relaxed/simple;
	bh=MpJAMVxdHplh5I0DSEkx3gDzRHpMmHV3aDbkDKBkLpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwCo3aE368nexM4c+QCopKgJhfAiiMFwBRE8NeXn0SnT/Yk/PnCQnTdYwv8ylyZUISBQxkow8qRY1IDnEtyzZf+0WQ+foZtzCuLiW9cqbMaK5zqiiPiRf1hj+wk/JHpe+PscAeciK8gqp18vhmKlI0Ynm7gQf+VhUJ2iLgab6Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iHWJ6NYt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J6wXPE017965
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GTS5hLn33TGPMNVs3mVW9jG9g5BRYx8J8zCnbeHFDVU=; b=iHWJ6NYtsbsVflEA
	uJYoJTZCNWawTJyHx+wWoaYWgoBOnVRIeIB+cw7wu4E2qW2+6am8AyhGNDsUkHOa
	EO/96HLPdwCOLE7vzhzpV/OmH3DJY91k/Wg1b7QpF2a23RbjKgkDpat+hCqV5LME
	B83+lRfk8UN0CvQQ7dyeOD9dUWemB/5zqtpos3m1hduY5kJxRRUwZxEH7C4Ttiwq
	UJAMEkGmeOAPSI4HC2t4myIJyZXySpTfkv3Nw1sGayIFp8K9rSDKkBHB9z+brgGs
	S07qdXqc6OqqFFYlPPhKJiQnJwVYTe+s/Varh/Q8ZgX+eKTX/RMpK1HiDLpnJFGo
	ufCMPA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343syx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-890f1090e44so553035585a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 00:57:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860626; x=1761465426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTS5hLn33TGPMNVs3mVW9jG9g5BRYx8J8zCnbeHFDVU=;
        b=qYJJI9Spk+dZHINIf2pkyOb/zqax2QjHKux8inrRKAgAdRbNLiTrFagr9xP5xOBr+5
         aqUYYiy4K4ew6spLWUV5osYo6nEi4KHScV+efWFgiGG+rE3RqDeK+jF5u8V9X66ei63U
         My2OTG7FM+vUt+x60AbrtQhQFMFJlLeWza9JBCJiPvnaJuWscx4iBb57KOZiAXL7i+Ng
         9W84/cXX3u9B6qUU453Nwu09N68v5Il8Ny3hpyK4yK6+UJPxw3xac/Y/9Yo7cNn1eDbd
         APGRgqJmV5ov4zUC6VB4RyI9VeXfylk0eWaBqfRkqDMNtN5BY6/biGC/uXFxs4TkWohq
         kglA==
X-Forwarded-Encrypted: i=1; AJvYcCVYPeO0elte97DkhbDQr9WPTvobahBHwQZtlEYIMjBK+80z0YyOqFQMu2/J8/iVUXzLbT690mtLPEb9LRP9@vger.kernel.org
X-Gm-Message-State: AOJu0YyRs0i9xIkh/ORbtiYyOKiKrcLfiNZWePFhPH9w6sqtvLiHWNq1
	ZEtIinRTRDHNi3Xbw0BFke0lJCgSe9jwwa2ANsxt9/47xPQF5zEdHmeprmLaUtM6qg0DTF6wYJM
	c0rI3BdYBMp8DiR1Fl1tiIgAlUv//4L9RT+5a2OPQuINf4ijNb95+Sifs5vVf0rMDJdpS
X-Gm-Gg: ASbGncvVzCqSeKjUDx8MVCxcksq/bRv4z/Es1NFW7d82SMzmI6O5c7nMVCmmRdIfOvV
	UPkN8sDAA18Gb4ZVjEj+eHDsuhoCF6zTcaCKVcyAnMlayfUtkzF4041O5JK/NHvinIadArh28X0
	QYZBgCu7R9YWWp1pegDfth3AmU7Mj/xQQEkjPYKfSiVgN9rGH+5a+SEizOhiNbDH5e2xZKX4mGZ
	/UrHrXuZkFm9zvFOfkkvLHX00Yv21ILXb2PpiiKK3ArkLlVN0+tIb4gHMWfnETM9rL7gVNw1cXY
	26VNPm0z7iB2szJ2uu2i2KtJI/sS5SbiAL6taJ40OrQyjna5aVBz9Wn9uUkPDhjP8HsDnjwJlH/
	y8wt7ShosQFkFlqi+CZWJWkNpv6RiLKuYev7ZLZ0Jk+2itEfF4KhH8pB9k1H/rBR8ekhIRnN7/c
	5Uj/iOa8zbvJ0=
X-Received: by 2002:ac8:7d56:0:b0:4e8:b9fd:59e4 with SMTP id d75a77b69052e-4e8b9fd5d07mr17827021cf.50.1760860626062;
        Sun, 19 Oct 2025 00:57:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHktM1kF3YbeQ+A8MVqprk2+srkSN1FrFEjBBcfgIn/C1U2Q4/923qlnP5ku3zxw8yra3ptEg==
X-Received: by 2002:ac8:7d56:0:b0:4e8:b9fd:59e4 with SMTP id d75a77b69052e-4e8b9fd5d07mr17826891cf.50.1760860625500;
        Sun, 19 Oct 2025 00:57:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:57:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:51 +0300
Subject: [PATCH v4 4/6] media: iris: remove duplicateion between generic
 gen2 data and qcs8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-4-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18966;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MpJAMVxdHplh5I0DSEkx3gDzRHpMmHV3aDbkDKBkLpE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8aXmUc+dv5tvsgodfXS2fKbrntsJN2j7IpXd+kfXc9/i
 2XRyplRnYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSA8PB8MixbvLIns789/x
 WIfc+6IsrWOgn7ooRuftowO/Yt9ub/+Uu23hqlBRlf+T5WzCFQ2ijjGcKudZG+eiPjnErPJjbJD
 aE7cl/IIqGzSLe/Sl9QrXqinaTDyoNf+7RH1b+6a65vl9Sd+SU6vPRj1YX6wrcOCisM9rb8cr3p
 nsP1qmrpnsECLvs3hb/9+9fU6yFkoqRntDHiubL3b+89nVz6zEX9fa7ve37W81P/I6ujCzinuW6
 LbZvYmYb6U2V+BkwZTT9p3Kf3N8dP/1Ki7sOblBu/Ga51cD9Xk7d3//EZby7Lf16cx/l0Qij04R
 cpqd4eE/35dh4p3+ZxqxZk2aCx93cPwveTa5tk+GRfUtAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: q1vPn8CPeOoLrC37Wfnjw9zosPyOblZp
X-Proofpoint-ORIG-GUID: q1vPn8CPeOoLrC37Wfnjw9zosPyOblZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX/OHwqYvZRlb3
 tlH1AJrtvbDum0ds8qR8E7cZHTCDXt3T0tZw7lzC+/r7ZazNHwYeax9M+xGL8JOqzg0HFw/Oock
 oiXiJRaKxwFhojUhg8uiXgHQDPdfjrKUG0PbBMzW+p8KSm05PykFiTU8TEuhaIUXqrSez6sMTV5
 iDXviFgY4LbHYga15yI9F/+y0vKFK/+FJ9f8ODJL9wsw4Rss3uGzOH7KwkibjkIXaiimP4tuZiU
 GLUrcEIURhxgcrGFI8Rz8nrMyj0H9odXuxNxBYirmdmGnFTs25qThYeXgG3gSfqZ0eCCRSEcGKB
 VvgbvToaVqAKeySxcugoCLXuTxBOZH+47w/Tl9JM0jjgomHAF9qvGHPvWlCoGPPNVzOQAuZrly8
 xvr35qVTt4a8hvU+U5WrMtKbcvXJjQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f499d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=8lhtx-rUCDsU0NfLSlYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

Now as we have removed PIPE value from inst_fw_caps_dec there should be
no difference between inst_fw_caps of QCS8300 and SM8550+. Drop the
QCS8300-specific tables and use generic one instead.

The differences between QCS8300 and SM8550 data comes from a
non-conflict merge of commit d22037f3fd33 ("media: iris: Set platform
capabilities to firmware for encoder video device") (which added .set
callbacks), and commit 6bdfa3f947a7 ("media: iris: Add platform-specific
capabilities for encoder video device") (which added QCS8300 data, but
not the callbacks).

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../media/platform/qcom/iris/iris_platform_gen2.c  |   9 +-
 .../platform/qcom/iris/iris_platform_qcs8300.h     | 533 +--------------------
 2 files changed, 8 insertions(+), 534 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 03ce5c259c8491ae6882128795d18569baea6241..6970bee488e4617478f807a30afd231275875f5a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -995,7 +995,6 @@ const struct iris_platform_data sm8750_data = {
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
- * - inst_fw_caps to inst_fw_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
@@ -1021,10 +1020,10 @@ const struct iris_platform_data qcs8300_data = {
 	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
 	.pas_id = IRIS_PAS_ID,
 	.inst_caps = &platform_inst_cap_qcs8300,
-	.inst_fw_caps_dec = inst_fw_cap_qcs8300_dec,
-	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_qcs8300_dec),
-	.inst_fw_caps_enc = inst_fw_cap_qcs8300_enc,
-	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_qcs8300_enc),
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
 	.tz_cp_config_data = &tz_cp_config_sm8550,
 	.core_arch = VIDEO_ARCH_LX,
 	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 310c48958018ae724d01c87e7977096cd86e1bfd..a97a9f932b75a88535df66160dfc934220919ed5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -3,536 +3,9 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-#define BITRATE_MAX				245000000
 
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = PROFILE_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_2),
-		.value = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = LEVEL_VP9,
-		.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_VP9_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_VP9_LEVEL_6_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = TIER,
-		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_TIER_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_TIER_HIGH),
-		.value = V4L2_MPEG_VIDEO_HEVC_TIER_HIGH,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-		.set = iris_set_u32_enum,
-	},
-	{
-		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
-		.min = DEFAULT_MAX_HOST_BUF_COUNT,
-		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
-		.step_or_mask = 1,
-		.value = DEFAULT_MAX_HOST_BUF_COUNT,
-		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-		.set = iris_set_stage,
-	},
-	{
-		.cap_id = PIPE,
-		.min = PIPE_1,
-		/* .max, .min and .value are set via platform data */
-		.step_or_mask = 1,
-		.hfi_id = HFI_PROP_PIPE,
-		.set = iris_set_pipe,
-	},
-	{
-		.cap_id = POC,
-		.min = 0,
-		.max = 2,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
-	},
-	{
-		.cap_id = CODED_FRAMES,
-		.min = CODED_FRAMES_PROGRESSIVE,
-		.max = CODED_FRAMES_PROGRESSIVE,
-		.step_or_mask = 0,
-		.value = CODED_FRAMES_PROGRESSIVE,
-		.hfi_id = HFI_PROP_CODED_FRAMES,
-	},
-	{
-		.cap_id = BIT_DEPTH,
-		.min = BIT_DEPTH_8,
-		.max = BIT_DEPTH_8,
-		.step_or_mask = 1,
-		.value = BIT_DEPTH_8,
-		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
-	},
-	{
-		.cap_id = RAP_FRAME,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
-};
-
-static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
-	{
-		.cap_id = PROFILE_H264,
-		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
-		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
-		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PROFILE_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10),
-		.value = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
-		.hfi_id = HFI_PROP_PROFILE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_H264,
-		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
-		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0),
-		.value = V4L2_MPEG_VIDEO_H264_LEVEL_5_0,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = LEVEL_HEVC,
-		.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
-		.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1) |
-				BIT(V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2),
-		.value = V4L2_MPEG_VIDEO_HEVC_LEVEL_5,
-		.hfi_id = HFI_PROP_LEVEL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = STAGE,
-		.min = STAGE_1,
-		.max = STAGE_2,
-		.step_or_mask = 1,
-		.value = STAGE_2,
-		.hfi_id = HFI_PROP_STAGE,
-	},
-	{
-		.cap_id = HEADER_MODE,
-		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,
-		.max = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE) |
-				BIT(V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME),
-		.value = V4L2_MPEG_VIDEO_HEADER_MODE_JOINED_WITH_1ST_FRAME,
-		.hfi_id = HFI_PROP_SEQ_HEADER_MODE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = PREPEND_SPSPPS_TO_IDR,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-	},
-	{
-		.cap_id = BITRATE,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_PEAK,
-		.min = 1,
-		.max = BITRATE_MAX,
-		.step_or_mask = 1,
-		.value = BITRATE_DEFAULT,
-		.hfi_id = HFI_PROP_TOTAL_PEAK_BITRATE,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = BITRATE_MODE,
-		.min = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.max = V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_VBR) |
-				BIT(V4L2_MPEG_VIDEO_BITRATE_MODE_CBR),
-		.value = V4L2_MPEG_VIDEO_BITRATE_MODE_VBR,
-		.hfi_id = HFI_PROP_RATE_CONTROL,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_SKIP_MODE,
-		.min = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.max = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT) |
-				BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT),
-		.value = V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = FRAME_RC_ENABLE,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 1,
-	},
-	{
-		.cap_id = GOP_SIZE,
-		.min = 0,
-		.max = INT_MAX,
-		.step_or_mask = 1,
-		.value = 2 * DEFAULT_FPS - 1,
-		.hfi_id = HFI_PROP_MAX_GOP_FRAMES,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = ENTROPY_MODE,
-		.min = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC,
-		.max = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC) |
-				BIT(V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC),
-		.value = V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC,
-		.hfi_id = HFI_PROP_CABAC_SESSION,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MIN_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-		.hfi_id = HFI_PROP_MIN_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = MAX_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-		.hfi_id = HFI_PROP_MAX_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = P_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = B_FRAME_MIN_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MIN_QP_8BIT,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = P_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = B_FRAME_MAX_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = MAX_QP,
-	},
-	{
-		.cap_id = I_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = I_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = P_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_H264,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-	{
-		.cap_id = B_FRAME_QP_HEVC,
-		.min = MIN_QP_8BIT,
-		.max = MAX_QP,
-		.step_or_mask = 1,
-		.value = DEFAULT_QP,
-		.hfi_id = HFI_PROP_QP_PACKED,
-		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_INPUT_PORT |
-			CAP_FLAG_DYNAMIC_ALLOWED,
-	},
-};
+#ifndef __IRIS_PLATFORM_QCS8300_H__
+#define __IRIS_PLATFORM_QCS8300_H__
 
 static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.min_frame_width = 96,
@@ -547,3 +20,5 @@ static struct platform_inst_caps platform_inst_cap_qcs8300 = {
 	.max_frame_rate = MAXIMUM_FPS,
 	.max_operating_rate = MAXIMUM_FPS,
 };
+
+#endif

-- 
2.47.3


