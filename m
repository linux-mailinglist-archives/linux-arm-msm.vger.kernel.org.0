Return-Path: <linux-arm-msm+bounces-76910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF5BD12C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 04:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A92B347922
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 02:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B022A280025;
	Mon, 13 Oct 2025 02:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3Y3KCFu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88DB27A93C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760321347; cv=none; b=AC3KRjRbDHqhylePGUUMGGSpzweh8J5cHQQ60hX5sAHrvjpwHpp3lFPIVPzb7MjDGCSDx2EAPRO32H/r59v64IZuGwsWKIPq7DDD/qhjQ5Umc+gMkelEfkrPg6GTH/nayE9tavfFpMrazdSjBrEVfo0etEEO60SBCxsuRhwxtMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760321347; c=relaxed/simple;
	bh=H/YOmdSqf4JIP4Cbg+JvuClkdIEqdkFL49DX9PNELTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtEvBSr+8Etvz33dRju283SjP1A84ryOqq7YXbT0ZnjteNuvF64cGQPSHYUYBRoSYYtBIwQxnK//4rSRyMNuyJ6f/9Uv/jfm7TTwNzVxM5MtJE+c4fEdXqzwlROdpsctEPOUCVRG9Y3ygdVWtorqhnQzWcH5AIiFW8yusnQW7Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3Y3KCFu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNoBQt030126
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+GsqBZNv4YoSJsUViBcXog6s0e/JdFXU7mZ+Ya8PEM=; b=V3Y3KCFuuOtURpUl
	XGtwHKU26HeiRVhFKrCoEDoCjOF7R9NFzpUo2irTrqDWIltzf6aa1lhu5Q+khKUt
	lY9ZwJ0DAMn8t33IS9clMXBJOx1Ka5MbNgmrJufpQ28D9z4bislBBgv8BWaS5Fmj
	VFq+6DOq5Ca1SOrPJWXVNPyqwJ3TM7UhnhjayVMHltw7NqYsrVggUgFPlU7tJ+ft
	c5m1TMi4/9Uf3HjJTm9HJrbTzgTpfItmb7A5fUQBjtLxndWFegeLUL2zFGRwTS26
	y0R3Ast2bFqIeiK2/eWd5NGCMRSIbMyG21vhrpQoNPOfZ+p2cT0ZLlaNF8vIKEic
	LBzaSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0btwbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 02:09:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85641d6f913so2329156085a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 19:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321343; x=1760926143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+GsqBZNv4YoSJsUViBcXog6s0e/JdFXU7mZ+Ya8PEM=;
        b=td1Yg5Awk7AG1KmeXdqkkex2x/anjgS91qI08h4uMUz9xDfnOyYfagVO9TE4kg/5Gd
         ETX5rnxZMb91fkqL5hHpT3ZLlBmDFLQ2nSdjWMtjYoHCXm1qf8HdnXBxftGreFiyd3Do
         in1LGHaqMFkVo+yLDWLR/nHTcVImrow4256Vc2/3xrTcQfINQ/j2V3YcLIhEcm43zpoi
         A/9HAD1nt2GgYjuL/boLo96ztmJfTMN4JsXclimA2LN86bOwTMoItbUxRS7v9PkA5ckF
         OL9jWsUCvo+soNg7k36oItNmhUxuFU7/2vq4bcybL9vB2tPf2Q+JsreAwidpVQqnbNaM
         YVqw==
X-Forwarded-Encrypted: i=1; AJvYcCVmvjvAClkHmNLbUE3fkSe2AGaNLO81LEeJ11+jwd8fN6Fc9PP8MKV4t3EowwxxXCpthpkBW39TQsFkPXYN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ePHrdwn2mhtd3+0pZaQ50akA/n8DIv63JU27+6r0Q/H0DjzD
	BLZBJZjmLZXp0hS2c2L53gKslQ6KT9tnKzJj65hmfyr4wmvgHz0PTCNRnJgUmaq/KTLZJgfnTiI
	GDjrqFDHIUNVpfEIo0INNCJeZxyAELP5O5YWOa/Npy0dgQgiOiGAf/1A1TOcFKaJkQND7
X-Gm-Gg: ASbGncvvMVkgkIkf6MxCYOcPIwtj78VH63ort5hUBwPoqJsLPRrYqnjk8P+A+8xGgO/
	YiR6xUrk2zRjkFvELTyOCp9khbmyJcRiHxAcJxVetoHpHW1bc/M2CrDWY9bdX+XuO1ReOOWoRQl
	69in3hTN7F/X0Mn6+hQjOdLvNEbPG5dTI5ubK2lyZf7weqWLsX9lcNRLZTQrwtSb+O6cbH04tdb
	p3SlD58k/W1lm7iyZfi88uSeiX29wH2DRix3ay7hpCETQynHagFxLPIy8a1ecLhalyHumHvi7PP
	SFpDnkeEBySBA5WIi4Ze3+b5Pm4p2qngKUOHEz0XEv5OsCzrFLW/bKZZDOaAaQ1b+0BYEX2PlbY
	SwhIcbZzge8oPtgscvGXWdVSb3k79ywAnw0LG5nVaZdw9n7XnEBik
X-Received: by 2002:a05:622a:4184:b0:4d0:d8f0:5648 with SMTP id d75a77b69052e-4e6eacb277bmr274397921cf.5.1760321342700;
        Sun, 12 Oct 2025 19:09:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW8jME1hgswBhgsFe/+bf/Vs3tSXnzptuEDV6/tjydEpZYYPwTpvszF8moN1lBmk8RoL/LMw==
X-Received: by 2002:a05:622a:4184:b0:4d0:d8f0:5648 with SMTP id d75a77b69052e-4e6eacb277bmr274397641cf.5.1760321342116;
        Sun, 12 Oct 2025 19:09:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4f99sm3563419e87.7.2025.10.12.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:09:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 05:08:55 +0300
Subject: [PATCH v3 1/8] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-iris-sc7280-v3-1-f3bceb77a250@oss.qualcomm.com>
References: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
In-Reply-To: <20251013-iris-sc7280-v3-0-f3bceb77a250@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4960;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H/YOmdSqf4JIP4Cbg+JvuClkdIEqdkFL49DX9PNELTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo7F85y/E0P4y+BtrRLaOLuoo/7OpPfKpH/Cuhz
 kWdyeIxbvCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOxfOQAKCRCLPIo+Aiko
 1Z3HB/9/G6YxaAkOVTI9JCCK3IfJ5gD21vmndr/+ICU3z9ZT8NfHlaqFSFoYzS0IhBkE6ZynbSJ
 FaxM1mGKYMj2VqbMZZOh5YawQG4DPvkWSeUQyIxcFFbpMfif44yeawflaPGwQTDcr/agRYyvoxM
 3flkUK1IC4scXeSGsKbCWamSXUTmc+sh5x3qP2NEggItM7Xu7LJtRoHQPpjWqfilLwN6z0kmp+X
 NR8g5Wi2KgcnXGxDPGGukCT4iZkIqrn9uZorRHI0GpJ+qb5Snjpmp+qalA6u9cC6Xk18flE7FWF
 4whjZY3pNYtleHjzNcV45ABjsSl/Ml0wBQ6Qi+p86RkdI+/S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Kiuk_VOEfle84BLeegLwDU9djufyMS6p
X-Proofpoint-ORIG-GUID: Kiuk_VOEfle84BLeegLwDU9djufyMS6p
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec5f40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4lT8O_Qwe5KXetiC_XUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXw6xob1zrfbhl
 SyX5/k2r5VO6GA5E4g5yr8C2QGvn7uBsYws+3VuuqoAsSQXnfBwqDOrO/Rqt6guqT7roNXIk2IS
 nyGFZx7KUpGUV7D0ss/PpW37Ncz0VZdrlPEmkPVbhjfu/dVPuXQqksImN9wk88sz/Em14wzUr9f
 qxI00dGgpEpoIBwO8kWpWCk/89SMSR0sW7hx7MhM6jfLWqxITS84UQaZp3SvZKK1ZkT20aAT/4M
 3IIZcWcd5mMAyLLdwPfA5By7ujrOywbXgLp4gn390GX4grHF7wYnOpr8dSRxBy+g9pmlDbL6C3N
 BJtMzYF1EK4yvwyhnSNdPGTPKRe4yBzRP6z+/h6OdTmgtCkHJiVDa5ZdX6GO/HUmf+EUnmY+GOO
 gEsc1K/i4hd4Rrzus0E2RGVs8YucEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Make all struct platform_inst_fw_cap instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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


