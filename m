Return-Path: <linux-arm-msm+bounces-79178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A211C1473E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52AB04FE20B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DCA30C614;
	Tue, 28 Oct 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBcJd9b3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F87F30CD8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651995; cv=none; b=P5H4d/Vb3ONSCxzduC9ORjtivmW82zqOSpQDAKMg89wlbOxzdV8AkaXmjOcISPEUuc9PgHQNv1oPkRy+d4B1ECpTpLGsk61rZkd5EYtJkWuG+kzcebYVKsh1x9ovTvTl7Jl0rObcPBPnblz8VwtuB8Vs2yCSu+sqklc9hYFEnow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651995; c=relaxed/simple;
	bh=OrNUcjAP0/mVj5wLtyJrkEUhxSXagTtUC+k62RnvC3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kRcP+ByNGs1hlNKwpUkq1d1bPy+4IO0w5Z2g8XI85C71kzDbtZ2KDJKyIfQtT/Gr6Cq6G0ENes/3T4CoIPcuDsJWC3Jw9L9WFjAtOp97sqXE9mSZ5teLK/+NhGwzyhlVxMZh/PcVaFHKmydoKpgey/cV1CJZJppLbSqVcVPL61U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBcJd9b3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7dVVO1032894
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etuHGzHwtyNg+xWeOYWZVVrjCtlDmyW1Mkpygk3U9Q0=; b=DBcJd9b3S+FCSqfP
	oNop4H5x5kUVMkmWrjVFtQGVosQmsb/QHwlEEPPLRTQBbaOBHjoeaJE/E/x8bjM3
	mj6hRwcfXC9OmHjBap0+KIU0rDRFgpF4dmDL9qAqVY4VPCfyXi64tippAbApnfRW
	aIXUYz0EccoH+ukLbGtgv6Dbs57I5ahLmHSOfkErLO0bNyNWVs8EWo4pefEA1J+B
	YAOu9IXV8Svyp2MYTXA0ov9JdhvxWmtKQM617xrvy+b2y3djJUw43fzdBKxnewGC
	1whJ+mjMKpzwE2WhaH/S0zzp+2FH2H446erS2mBJ+9hf8iMZW9zIXpYd+c+o2DZL
	B6Cgkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smurr3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba120950fso93920471cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651991; x=1762256791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etuHGzHwtyNg+xWeOYWZVVrjCtlDmyW1Mkpygk3U9Q0=;
        b=up4q1BjwG8S1vgF9TsriGuukS3xSKKb9qvTaK6Q1oFiHzVooiXJBs+ka/uJpXEd1Za
         nu+KsBdhDSziGj41ctIcvQv3gZcVa2pwhrGeN6lOWRALZtHRA8leKobj0s8bNvaoaXoT
         Q+VSQXPoqGsUYFJcZwx7eDpwAbfaplKK9I4zOuv/EmNSAQ9YYcxlrC+4R1rxE7rnyx6m
         b+fMMgVzeRzQl+9mp5HOzmikoeI7q5W1Hdwuh5ta57pEuG0nEmWYVM90E6UCZN7JO3W+
         cFuMs/xF2sd+dDX7qZlKX9lApOHdNoUHsizWqDWnvLKEZqRgHYF+JqkaqiUUz2JPH02/
         zJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCU+xsalUVu4Urlb8JRe0pBnTt/36yLyN61hy+HcUcIGLNiQeTqAeJ5oyEuPFLDKgujd3dNLZsnB1aEn7uv3@vger.kernel.org
X-Gm-Message-State: AOJu0YwfHIZBSfp3uB716XxOVYz6CF7PiHmYOuaVdNL03D1izM4j8BMz
	lt0raK9j2gcbCUt6TPz3IXGk5w7Q8i38AiJthCv11wRVJTjDijgvxbxlQRgdpvUmsl6b0h289oo
	hB4eV/Zh/mugaweyeLsMC+ZieezOBNv+nZPZwdXdmVuuOeGGvpNCEeih2L4ooRs+Ozf1L
X-Gm-Gg: ASbGnct8c6Nvz7HgdrEAAnBWey50/1XyMR8uXmG2V6ugFIa68xXdYUOguJ5YT764rpN
	vheVofEDqtxmD0I8j43HSrYmvsRfUQH1vORGhKVDFUVrfJtenzzDUtjhp/fyM1VlXlq8RBRpxmX
	8DrYhpNupEBIc+gLbMlk6A3W4QrrLT4lOCmG2z0kTHL8jHm7pRtAbR1r4kZ49QJ9z4KYiwWPVK5
	9o+rUGG3EI/xHPUfSHWpJJd2ilFJETr7Lh2BPz+wPZ8N9Kvw4pdtsDo3JMFzuTOK9IUtTcipq6b
	d5aQaVxn5a8uVt5engtGLNUSE0jorQKlm6k+XOLEvP3m7GIam1evV2eUK0nJbUcht/Zg9dfphsi
	b+346BpQP99mVVWL3abU8q5BBV2BIPqPHBNBfCLQeM1cDtyzBhIswuYWQsF0ibRniDO5j2LdrHE
	LcgKXPL0IFKrvS
X-Received: by 2002:a05:622a:2489:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4ed0756e86fmr53141211cf.50.1761651991030;
        Tue, 28 Oct 2025 04:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIU/k7XUCuDQw01QgAVR96/HOedMb02J+alxeiL+wGryMoDPaa6RzoXRYU9W2EoZCif/x/nw==
X-Received: by 2002:a05:622a:2489:b0:4d1:ae10:5b1b with SMTP id d75a77b69052e-4ed0756e86fmr53140771cf.50.1761651990619;
        Tue, 28 Oct 2025 04:46:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:22 +0200
Subject: [PATCH v6 3/6] media: iris: stop encoding PIPE value into fw_caps
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-3-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4358;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OrNUcjAP0/mVj5wLtyJrkEUhxSXagTtUC+k62RnvC3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0Rk0Dv/AiRxc1ErJIwDakxoKX9HWaRyc9i2
 xKpQxRlrwyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1ZyEB/40dxPik2yqkhQqzFjyXYn6rrT4nHsvMPoULZoJ1Bphjb3CkexIm3LmXVuX9sAocm8Oali
 9YsZ+hYEsqnMs6BuaQw4Gds8XQ7egquz905SHrtbeu93S1tuR4hbyD4QF+R/UwldA8GOWMJIoy5
 B4EABRcSOdHZUg2t17ZC2NoTuJU3jhbpNxpPHKPqTOBxAQ8XRBQzQPWGL6ohefkDDU5nHRm4xug
 ZfSAqzha+n3zwQbRxsXMCkGSJaMezBumSjd+/R8D3/zdFVxw6S252EzPQpsavJOBm1FVp4FNuk+
 bpBlusrWWcoluDcydH9gclU6O/9TfOS3mdGUDs18061/4TPF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: dBGQ1PA2XuziQrX0qQtasIrFsKIxp4bW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfX109GwtgOXHeo
 v0gDigiOW0niV+s4/V2wjjvPIUJv0Zq25rCZ5B8GYGdfEg6bJoVxrbVCLLqHcuLPOiXbjPrplhq
 aqPftiCW0Je7n30prRjok0SSZRy+oe39BgJcWXxns0As9eFTnBlIwsBrMH+Kso1RsDVj5yfenlT
 i/M1tWI2DBupea1FFf7f4gSwRWp6jKBxA32ufQSwFKB6+qZFEVYTGeAqMf53mE2l1xOVuB17mX+
 otel7EOQECq6hJiVmu/+Hu03IE25Rh9neG/ptBcyyuozwKnMJvRQBlRUhJ8SqZX1HNxTMfK7ZtU
 NQq0dZAunIilGeWdZ0g7GWGjrfznr9hHJ+OlpL0movaWtO8feWCZnVTXJX/KNpQI8EimX8/NKEZ
 mAF4gaqNP542InrM4wLEBeZBgi7XPA==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=6900ad17 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=SYGkZlDhJRt_0546ciQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: dBGQ1PA2XuziQrX0qQtasIrFsKIxp4bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280099

The value of the PIPE property depends on the number of pipes available
on the platform and is frequently the only difference between several
fw_caps. In order to reduce duplciation, use num_vpp_pipe from the
iris_platform_data rather than hardcoding the value into the fw_cap.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c            | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_qcs8300.h |  4 +---
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c  |  4 +---
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -313,13 +313,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
-		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
 		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
 		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_dec[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_dec[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_dec[cap_id].min = caps[i].min;
+			core->inst_fw_caps_dec[cap_id].max = caps[i].max;
+			core->inst_fw_caps_dec[cap_id].value = caps[i].value;
+		}
 	}
 
 	caps = core->iris_platform_data->inst_fw_caps_enc;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b444e816355624bca8248cce9da7adcd7caf6c5b..fb3fa1665c523fbe01df590f14d8012da3a8dd09 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -160,10 +160,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
index 87517361a1cf4b6fe53b8a1483188670df52c7e7..7ae50ab22f8c577675a10b767e1d5f3cfe16d439 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
@@ -146,10 +146,8 @@ static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
 	},
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_2,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_2,
 		.hfi_id = HFI_PROP_PIPE,
 		.set = iris_set_pipe,
 	},
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index 66a5bdd24d8a0e98b0554a019438bf4caa1dc43c..805179fba0c41bd7c9e3e5de365912de2b56c182 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -20,10 +20,8 @@
 static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
 	{
 		.cap_id = PIPE,
-		.min = PIPE_1,
-		.max = PIPE_4,
+		/* .max, .min and .value are set via platform data */
 		.step_or_mask = 1,
-		.value = PIPE_4,
 		.hfi_id = HFI_PROPERTY_PARAM_WORK_ROUTE,
 		.set = iris_set_pipe,
 	},

-- 
2.47.3


