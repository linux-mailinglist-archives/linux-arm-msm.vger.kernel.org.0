Return-Path: <linux-arm-msm+bounces-78894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E21C0D819
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 924414F27E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBE3303A38;
	Mon, 27 Oct 2025 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSDLxgRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7B302759
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568029; cv=none; b=S7LIpp3pgBFLOhjRxaKkzYrG+7T7ZNhGyrZ6S3Tu43Hwjm+JH4B43JLQPQjtpfWY8wdaQQW+bL0hWkaOMOYPnxlXpQWmECeg59/ur62OvKRXk9rC1sPB64c7sNtL2a+dVwRhzAv/otmF+k9gEIz0GPv4E0ksOFLdSJj09uZR0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568029; c=relaxed/simple;
	bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwpQqyFStBB0Y2iCESYiG6upImjVnXOtWXSZluZgxQH3ooqzhSLvKGNe+xwMvGaBa7d7XuEU6sU2+iyRTNRnBG6JmDCQ7s0Z0Yx1e5+xXxkAJRQ9acAlqZmSK0/3QgHvomQjTcOHt1iZ6J+pKrXJgWP1z7kvFl+D/Ynpjf6nIrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSDLxgRI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCL5q62752398
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=; b=NSDLxgRIO7oVdKY3
	bw3pXd1J1pkwGSAIV03Xm8hO2cjBMYtQaiAQ6JQT5qQu2z6heznf6pBfp7e4Z7GQ
	YI3MYcyTGi6NGefIADHTqxtKMbWCqxXUxbOejRedtCKY+DjXbxKg1Mmt+wyYdiQQ
	KsNLOBETrowWd3TMImnyjqOrB0ynJAeMOpxoko+ndtqB5E4gXakmpnSORrwi1PHD
	PXtEglHDo/QiqZY4dTZLjsaO78iteJmSfgpKM6UZWL1Oq7AawtMFZGdlnp2PqPb5
	MhP3H45r/+6e284o3Ed89W/4M98IG8aaEWS7y54GXPNehrZEP7H1mg6t/V61ErKz
	xfIEnQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsr0fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e89f4a502cso137651551cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568026; x=1762172826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sFi95zbIL6V8R4aDxrgHCEKkWfw05sk4v9zJGzSxic=;
        b=rd7L7vcxwJVKG8nBxwhP6IbuK8d/DViNbjHfdodNyP1oS1BGBbK1eOXeiDrJfgyq6X
         3dUPQ2kEPTT26228QI6WtAS0UY/WHmeV/Z3jZzrDv+p6Fw6zTJoVk9JBQfbxv9iw6jYP
         tJzDJqDcuHQOOWBc9Cg3e54jk1+ZpPJkf79fldB4zwH2V5yH0MAY79KFdPP2/8ie1QFh
         8yMlqZOpcBb59bvJ4U66iYiIqRBh3Yku7KX6beJPm0gm0glXgNs+92S0qOkjvA4pisgZ
         Ac9mSBSya48Sr8j+a2Tzu4C8PzWZgroFHWU036ZhHIxBMFrDEIMC6clUn/iTmdfZqyDU
         153A==
X-Forwarded-Encrypted: i=1; AJvYcCUJB+HCctY+yFu7dClGcZZNyByPhdI4GGvKoQD6B4+fA3jUWL+vFlXNXSZxTJuzrPrFc2lC0dZMDUnw63/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwxGnnOhRdZxFQ+udbzT4oRUHZvnnqf5Syw9Jz29HYReOhbbymH
	6ddCu6ix7/zdf249+tf5sGyhKK5os/sM+T57HB9vXhpBJI0/QuxwBF2MVSqxxPHm+ktdlijmUbr
	DLhklwKX3wBDA3HkXVpla97Lao/4zot88HVuP/zzpCBob65J3vC25BMLXlVyc8WjEeJ6D
X-Gm-Gg: ASbGncuepVDeskomiLQG1vvOTM+Wkkg5FYnu20enCxvJA0aNPEHAdvDFOiCyytfrfj+
	Dfx+Eefl/dfPTIl4gWelWrk/JMJdoGXXbPG9ZDvpLbJuEunjj4H5IY1GCDJloRGNVDJS66jLw5M
	aOmvI+0HYR9DRj5bEKEqvWBYD+/RtTgZ8CvRS8bjkNACyltGCow5w2P8DGq0EBPWbYDn//3VoHE
	ltjhqpOEPvH85v/wMglSi1mjT486Y2p1HSmFqHTq1BrWqR8LA+XmSSPMZpwa5HzLi13Pu82z/JJ
	EyNyB6XjsdX4x3P+BIQ7qCV5QhPc/ZuCTd3UVn8f09g08CzQuhqNj/6zQMPND8nCQxwYd+wXNjN
	u7VNnOH6dqEzOigHYDwcPFpIJDEe5ruQYzYHDPk5ez5QiERjbpU+7fkGuc7EU+lfzy1VLQowmx+
	sfYor+cOmfAAyJ
X-Received: by 2002:a05:622a:8c03:b0:4e8:9e8a:294e with SMTP id d75a77b69052e-4e89e8a2d7cmr420613331cf.6.1761568026223;
        Mon, 27 Oct 2025 05:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA1VQi2AqzCgMmnFVsnc9Klx/oWqFgMMvGA2NeD7Ke3xKd1zXHX3q6b0zno2C+ky7UPVKaUg==
X-Received: by 2002:a05:622a:8c03:b0:4e8:9e8a:294e with SMTP id d75a77b69052e-4e89e8a2d7cmr420612111cf.6.1761568024171;
        Mon, 27 Oct 2025 05:27:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:26:59 +0200
Subject: [PATCH v5 1/6] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-1-5eeab5670e4b@oss.qualcomm.com>
References: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
In-Reply-To: <20251027-iris-sc7280-v5-0-5eeab5670e4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5023;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ldL9oE1EfZtAElQ9+XdqptYGe8dQAepD7NU7eZWefTg=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8b/VBEWvxWb4suvTi+02PKHK9kjyNuk975OXzBjZd/Zk
 8t63z7pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEcq6z/5XUOevaZHNYxfHl
 6esd0+9WflnYe7acJy9hocfjpf+sy+Mcpe/sV1n9cF6o0HfjVzd3+DAlPeTwkMr/tkNDMj3/rYv
 qN9ZzW6UV/A3sMi7fWv5+0TSG2qq1WSLmGQmKRTVmN/fG13N3prX7NOVZMZwsnBXfOUe90GHi/L
 WzBA8b7JZZy3566gHRO2v6V184E2bvL5kYrSwo+UT9yj6WwsR1H/hMYhctDCr0bDpbqG5vPOsDx
 0qFijX9mzov6XxKXRYtWDtjB+8dl3N11RxHYl+HPpi7P6LvmEg4U65258efxwRWVb/xZPua/vE3
 2/U6y+i/V90e+q6/GrDe/XRENAdLqnGjTkGPbFeyi+ktAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfXwNxsNfY+r2xt
 XKVaBERj/6aZ4/fFZ+nWbFcQftTuMAaR7ugOsL3T3wfQ6tevdxElC0qQEMmS3UEJOnkK4BSMZNy
 Do+4rTWvuaOU/cMOTB8shcaYetfT7cf6tp0ZRhCZMzlMNR1HQokvcps6uxeuGzv1ipDVcSDMjhB
 lJvq/s0dJAI340APynVnnXbPckEBhbTMLThyVrMKsn+2LA7EwuM5Tt6RSkZrCfk2RsMH7To8rTi
 H3KQaAQR1xLhnGghcUHej+n1ReCskoGjHb5B/wOVyGv/rWOtcspgH4ldPrKvxu/uYMe+II3Bjch
 /Tz/t5WdviLcOPsLO4rybN/DQlObANUuIK/eQgUEe//mm9Z9hqZt2o3xTn24y13IiMKBXCCeCEQ
 ZIYGfb7oaOFBfAw/eGmAHx0swqOBHg==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=68ff651b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4lT8O_Qwe5KXetiC_XUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: e3IkY6sb1mOK-KMp6whPOo9wUnZv33lR
X-Proofpoint-GUID: e3IkY6sb1mOK-KMp6whPOo9wUnZv33lR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

Make all struct platform_inst_fw_cap instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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


