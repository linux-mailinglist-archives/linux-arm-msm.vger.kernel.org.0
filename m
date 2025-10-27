Return-Path: <linux-arm-msm+bounces-78896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E47C0D86D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1784C189A196
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 12:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D6030F53A;
	Mon, 27 Oct 2025 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCVI8MW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AD7302175
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761568032; cv=none; b=rbqA4ezoA65C9FpKMoK7uV4Ssset8Ce9R5A1iKtg6VIDEURYljK/4co2ZXmEXFLxXL7uZYjqknBXrbnDnL5x86VpXqo8/oh3OXG1FPWJrjKOwRHld2vLSfVRq/AMvlNYyOpIhcRXqjE4wQSbX7bgO9YVm0Nl4qvGR2p+9xE5LTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761568032; c=relaxed/simple;
	bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fi2kPbuh61SChSGx4n3pY+udR7zMnXq83+URcuD+yEmSez4JdctQ7IiFFBw5sH5s9xePGZyvj+pb+vJcXjUQFGMIXBRf+2MAgJc1Mulz09zdYqk2WBG/6WOfTH9bUojfQHxsqOLeZcRAZrOHG+ros55QNNyul389BJNRKpnaZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCVI8MW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8n80f1055958
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=; b=aCVI8MW3tUcM1t8x
	zIfn8mIioH9XK6Eg1Hj6/JSIIzmViCUKdjr57uPk+VeJXaeqyASOOoeMQyrIrpNQ
	PqTDWtHFObSA4SAmNcW9wBGxCz0jxw8OCpsFi9ETRsC5udJHt+vv9ZXhRIeO+f9q
	UUQa+kkqgjgb6aRjMr1nlj1wZ2b+ksS56RPkXi0cbJa2ixVCVSjNPiE+z7o/Rhfq
	n6PW7QELsJAUAPBQohipxnXPbuswce+FvF87y7jWE5cE1BH7XLDztPq+eCrr2O/B
	Bvs6OxuiUAElnRkwTWkcSfklT/HYTH1jIlA/+tPqp+64Yo9YobME2Jg5oU0c39yH
	fzcE0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nkamj6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 12:27:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e894937010so126479391cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 05:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568029; x=1762172829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=;
        b=DBVHlj4OQP5KgMk2lyLqZCe/GxY7Lz8sWJVTbe3aModNlCIusGByoH2AyvPWVBFDYA
         kQLanVWSQdCW5ivxtL7baCEpiYeMxxSMWLT11hI+Z5kJlFIi1DQ+QxCOmLjfObAT1cTh
         8XDLzmsYl5hx8yEzdxLNqBHMQ46iir7R8/PZUgki4Vo7sMo5iWrD3iPhJeDYwMQ4vsDr
         8DuTmK5ra4yEci++2up7afX56Ma5drxjipRtTM0Y8wKLKLWgEdJS4n7GywVmcMie7u63
         QF5Bw+/j3J/i3qmpbUbN7nYakq7lh+OgBLdYr0lLusN4NHOhDBFmiBdwSn0gSm78bJJa
         nUOw==
X-Forwarded-Encrypted: i=1; AJvYcCXDmu3jHuMoc619pTBEojjq+3okFzc2k7GgfBhN+0+Lgeldrrz+htmS2LB+t3Rs8Jw/hj27Xp600hU9ebTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hLuujD456lWQ+avKL3GQXNfw131jfea9lZqoBYY7InHf6RzX
	ve72+YW9nLETXy0ocjs5Ga0K6ch3Ca6mbx4MMqb+zpwbICau7dC+AFnrpjQo9KRXuNHFjBHxL+/
	dgSmE4wk3dFZO2+SSPeCqpj7Jjan33tl+oTBv5LHRWQ72j+jkL+O7gzjYhVwBD7Owwuxm
X-Gm-Gg: ASbGncvEt6F/XdQIuvHC5trWi5qIr+tYq3OxJfK9ZnIhTJhRgQkIhswoNB0bpoWly5R
	QzJiDsw48wbTJIC59ldDxG+xlXQWB50a+OwHtrEIWxa1MsS/TzIvLqN30fFUAdnsoPmA927ilBa
	DILTKEKge015rTRgGSX6aQr7/9bwqIQ0wfgAapuZ880RAPYVupZPi5seCxX3SteParKdFrRQbC/
	hvjAYDjvlKZVHX9MyaxyC82Uh97GDzAC1M+zS/fdI23lya8AcgpODnjmt29qtlcSoMsvyZ/VfBa
	zCUS6WMwiFobVW7TqnZF5rwDtLmYyQr2n6vXuhpsJQ8iYVWO7hMGtcU6Vf+d5VL0/Fp1HnyaPb9
	uxrBI3G20Zn2cHn5mLmACEQFlvr76H012pDciwmj37vOKIdR2CsmG1BqvB/piA8RAMxSWo+kNDN
	ucyITGl8TF93X5
X-Received: by 2002:ac8:58d5:0:b0:4eb:9fc2:791 with SMTP id d75a77b69052e-4eb9fc2147emr126089431cf.38.1761568027503;
        Mon, 27 Oct 2025 05:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcPSdiUDSlVMvky7hNGhRT/VQb6FqqH3OtzmbdmaiO2yoXvTHD9bnbqHMxNArUgUxGr0oY7A==
X-Received: by 2002:ac8:58d5:0:b0:4eb:9fc2:791 with SMTP id d75a77b69052e-4eb9fc2147emr126088211cf.38.1761568025520;
        Mon, 27 Oct 2025 05:27:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83cb5sm2253474e87.102.2025.10.27.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 05:27:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:27:00 +0200
Subject: [PATCH v5 2/6] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-iris-sc7280-v5-2-5eeab5670e4b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4328;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8b/VNFPG1JmsVkammmVpvIKW7hE1Pad9m+6bruj4v2zc
 vObTJadjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZjI66ns/2wNbH3Cb4nL5fx9
 pSYx7+aRy00nThubXuEICpyw0fFsafO9hiTWwOLQa9pqRVUqXtP0K9NnTlmY2VOyeU6Pj5zcTGb
 TtQ+1lugYXY0QfWWcP40zcPuKL1Yvd3bMi6rd8yVASkMpi2NnyBeeAMc7t3ScWywNH8yTNXNdeU
 WnJvNViLnkr6cZG4qjv8VP6/8eeL6n+0D04dAvUpflJz5c63XKX+zPz88pmx02O8n07OV+qnc0w
 HtTk/Bp+YlOR+y+yH39rd65te23vm+NUtUUiV7PPnVzmz2PpNJU69cz5XT+kc+64VA0OXTJgrre
 ponfp8ZujpLNe9X+cEmvdI9+cf5sBVPWQ9qtSqe2218EAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=68ff651d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vHBkZ3WG4vhFy3QD8MgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ddWWcuI2tJKl_yNLhqxzAZ-zUefSV5zq
X-Proofpoint-GUID: ddWWcuI2tJKl_yNLhqxzAZ-zUefSV5zq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExNiBTYWx0ZWRfXymkm0PQqg7GD
 QSNOMdKoMtGI92ACc/3/4FxYJK/mX6c7Hjsa+14iiTfn5oyrN3peGOhdghdyTwcjxg6uB+GhKg+
 TKQ/RWUkTlz4o6gHrjxEB6/ZpTMYKybIeaBE/zLSUes8oURBCDOMXJgyWcHS121ZeiGddCvsLo5
 c0yHxTTOkHP95LsjSGWcrJK1aXfC5OGo9o752MKXyJMX7tyg+x4I/r2OLOHl1FB1unbmmAIE9Vd
 0yt2bcOOWeRWPOEQQhpk8UguS5bFFwkUHf1zkOeJ/UhCiCCQgb+0/SWd7gUqnWeaW99+kbN/bfU
 4Ke626Rj/gxgYlTvfXRhJ4xD9qbFnMffBXHwWWscusXMyx7AHtWZdkSWihjVSh/8eN05RghQz7C
 2LtlyiFVS6x/UtZJC5Y1gRNF8FKzcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270116

Make all struct iris_platform_data instances constant, they are not
modified at runtime.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
 drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -41,11 +41,11 @@ enum pipe_type {
 	PIPE_4 = 4,
 };
 
-extern struct iris_platform_data qcs8300_data;
-extern struct iris_platform_data sm8250_data;
-extern struct iris_platform_data sm8550_data;
-extern struct iris_platform_data sm8650_data;
-extern struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data qcs8300_data;
+extern const struct iris_platform_data sm8250_data;
+extern const struct iris_platform_data sm8550_data;
+extern const struct iris_platform_data sm8650_data;
+extern const struct iris_platform_data sm8750_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8550_data = {
+const struct iris_platform_data sm8550_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  * - fwname to "qcom/vpu/vpu33_p4.mbn"
  */
-struct iris_platform_data sm8650_data = {
+const struct iris_platform_data sm8650_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
 
-struct iris_platform_data sm8750_data = {
+const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
@@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
  * - inst_caps to platform_inst_cap_qcs8300
  * - inst_fw_caps to inst_fw_cap_qcs8300
  */
-struct iris_platform_data qcs8300_data = {
+const struct iris_platform_data qcs8300_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
@@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
 	BUF_SCRATCH_2,
 };
 
-struct iris_platform_data sm8250_data = {
+const struct iris_platform_data sm8250_data = {
 	.get_instance = iris_hfi_gen1_get_instance,
 	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,

-- 
2.47.3


