Return-Path: <linux-arm-msm+bounces-76852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB6CBD0765
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 18:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D357D3C1C21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 16:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF622EF65B;
	Sun, 12 Oct 2025 16:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzr6W/RF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E412ED86F
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760286231; cv=none; b=Y633Q45lz+V6gJXAHY636RMaL72+J+BAhvhXU8z9OoWHDPL9gLlRxnLptK6WIYYyDMUeK+5DAh4zKcayXL51+0uWTxg3DCjCukmMziNloL6d5Z6YjsfoCUhAieMBm+QDZKx8Han9Ci6pad2rOK6U7o5IDWDHU7pBYYECVNvCfag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760286231; c=relaxed/simple;
	bh=H/YOmdSqf4JIP4Cbg+JvuClkdIEqdkFL49DX9PNELTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOH2hgmbn8enaCqdl6kufj7a0Cuz7QphSOQUbA/JGRs1DCDGZzp916/klE7jwTXq3M1xliXTVC9lidrcWok3g94gMehnEwC9cUAyNhPV06THf+99Sk/oHoRjjSdASkWSeweElSWphKCY1eRSEGh6iVclWOlt8uR/1dxX/VCYc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzr6W/RF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CDjpCn008395
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+GsqBZNv4YoSJsUViBcXog6s0e/JdFXU7mZ+Ya8PEM=; b=pzr6W/RFCbfwLAFR
	Nfz4MLuWSWXWYdr5aEvGF72KHe3IOO7+QUopvQq7oBb9CWdfpgfNKXQkZCoIxdv7
	GSiQiJp8fS7cq363wLmF98coOTn0WBimuGp9P9EXiDZCjH8brPnqRJ340trPsBU1
	2StAndudBJrNMB8GyJshDo2/Jwk1ARKK8n76xZQ9wu4P5BzYMhlU5B8b5tCHgejw
	+NJ1aTHrCAuKQx0M2vPB6NJ/8wIxWWsqDf8512HsRUhwKzxtyWU+O3Vt/hNL5xGH
	SLbPMzGq7QwbXTGWyZHZfL+2PJ8DTRhbjYja1sJiChkYNJ5gZBHfnz9K1NUkJUhV
	ZaB4aQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh625rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 16:23:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-828bd08624aso1879776985a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Oct 2025 09:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760286217; x=1760891017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+GsqBZNv4YoSJsUViBcXog6s0e/JdFXU7mZ+Ya8PEM=;
        b=UuuYMeoVj4uowjMkuGTSzEIwaz25dsB5U6BoAl19BoaLiLkhGznmarlguDwsUw34wG
         /ZtRClTIjv04HVzhU/5wJQG11HQne5rJ1cZeTfkyVJsilttZECWaGQc61gr2wyQWLa5R
         TaJ4yib9vNo54V+QqSQLHqnLbg0chyT7NexqWiyPzqDjgrzPQAUryAvCznB54PfPxFbQ
         TRGWbFAdkbSSaLmgQSU25xZy7SzsFT6y0IbJdT7CThHBn5PW5kJfQV+eiGR2te9/qpLJ
         J7wCehoDNhoab35hbSFsK55lBIEk0JOvdvLXcHxTgUr2rwaueosEPbHAWWT374ZHKbDs
         tU+w==
X-Forwarded-Encrypted: i=1; AJvYcCWItSJMAoVvufy0IYKvPjPj3/VHKwZlrmTbgpjPkTl/YS6iVskXNsM5RbjvqJLapC64erPm8Dob8/Uc+d13@vger.kernel.org
X-Gm-Message-State: AOJu0YyFl1m8pSkQeOiHUPVEnohdBMamhEp/U+DfKiWLwaFX1qbu5lOM
	dvxFeK9RRxNX41PKMe1hhNiYjHvv+1FUPxfNqs3Mq0sc8FINEc6IWpsCVewXTfX9OutCiRwtVig
	TFaDB3OCj3hjOQ//JFVTAzhXL+YY//iaguh/Q/ZqzHJcVfejYvGkIVCf6CFSG9NZPEmQDIkUt/p
	2s
X-Gm-Gg: ASbGnctuP1uCrpgKXnuj/pIccrc83PhgbtAKUqfxJpjtBoNAoxmttu3UKRgzA/m2YSX
	UoYeU7hUEytVDFbRN2inXqXja2wAz0YfLDsbwtffM4SyjvcXnTeTlUCch8dpBUiyGJ2ksAN5lT5
	IUVkFlRpHHOK4xWj9RjyOmkdW9KfcGBWKNz54f+ikTw1j3iQh94rPXMDpXZaoH+csp/pbF8AO5P
	T0lgt/lfyqdqkoPKPNjpfZua14QUauAP1kJ4C9echRdWsqxyeqgHvXiqhwZPNRrpubZnf+PmosU
	B6Vkg2bMPYFBr2/8dfrSMQKFcAupgRwU5pKyIrVyRvPCBL5+Z0bEXROkRkGyHvCHiLl8kO6yBHT
	pOTbW1lsZF6Yv3DNyrO8Lu1FAPi2aqps98FVybFCYovM+wucMoO5C
X-Received: by 2002:a05:620a:4492:b0:82f:6b85:73f8 with SMTP id af79cd13be357-8834fe9988amr2032709385a.5.1760286216427;
        Sun, 12 Oct 2025 09:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZzIK660VRivJl+L8V8xBNzZiGjpj6iqRVflDvMd1ltU2WxrufRd26sSCpytlTdt/eutMDjg==
X-Received: by 2002:a05:620a:4492:b0:82f:6b85:73f8 with SMTP id af79cd13be357-8834fe9988amr2032707085a.5.1760286215918;
        Sun, 12 Oct 2025 09:23:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881fe5besm3112637e87.50.2025.10.12.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 09:23:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 12 Oct 2025 19:23:28 +0300
Subject: [PATCH v2 1/8] media: iris: turn platform caps into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251012-iris-sc7280-v2-1-d53a1a4056c3@oss.qualcomm.com>
References: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
In-Reply-To: <20251012-iris-sc7280-v2-0-d53a1a4056c3@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo69YD0bmP7HA0ZV2aD+koYyognzHJGtlvTDHoC
 tV/FoESiDuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaOvWAwAKCRCLPIo+Aiko
 1WVbB/9pVdzoBHDyCNGLOwGtKDIx8k8eX5JXHicpqYiIT6rR9YzoUtRQ6N8Ztmw2sUIG5nArl7q
 nkYllH7XvXhMsEFo2aJ348JTJpnyh5LZhEIEYsd6H0T9ZLKvKoa7mQYUyLJP7JkJjUY+60ckZ0f
 so5enh50GITF1junbwGwyjoNex57WdbgqKDBU53MtT+ADqGLWrdMpPZbVum2mWz6RXtBmzJTx/h
 oufr4XeyU9zIgSFpHGTkyvimsyyDk4DOf+lI6nZe4o7xofVPVP2sIDbDB0tPqlLEK9yGsTQl7fV
 Z6frkejYNpE5hGIHWT8FfM3typuMJKEigcyJ4+q26je7zqB1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ebd60a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=4lT8O_Qwe5KXetiC_XUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfX7Zs0lkebSSME
 Y29BdNxVCvK5UujdjSYMvUcdZLyIsgZE5VMk9+oh0NuiTlEUXCq4iitqdQgzraOHmB5hCq/bm16
 /LBY3g5RACeO4Vt7VUhS+20ESY8xogl9VkrJtoRCupD9F97ZqlLLigfy3Xyv2wshi+Qm+XkGKvV
 VBYi42GWpyLsqLvpCQ/Vu34ra51svXRS1TcynELd2+sTEH/+ndvBQkwlkX1n25Ci6ivifr/2sE/
 0jY2SfWWsvvSDZXKmkVWtLh9kvtpFEcP5ClTG4U7FzqsYewPC3R9i9U+fdTn6mO7DFlqSmkavbl
 1dbDq/YFd4uMdxb86+sc7Pl0/b1XzDqk51AJLcmpGS8yBOH5decaKdzMsTUAzc0mip5i4j1tb46
 kxMW4rl9wssP8gsvP6phGrF/W1H7aw==
X-Proofpoint-ORIG-GUID: LDf8uHsVmhULKBD9GvZOtd5BIt8418Ju
X-Proofpoint-GUID: LDf8uHsVmhULKBD9GvZOtd5BIt8418Ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026

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


