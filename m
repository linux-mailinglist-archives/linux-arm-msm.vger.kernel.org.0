Return-Path: <linux-arm-msm+bounces-77890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D73DBEDFFA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 09:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C14AD4E703D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 07:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251D0236451;
	Sun, 19 Oct 2025 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYD1yL3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66117231836
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760860624; cv=none; b=gwz52LIlUxmVWEbE4NJpH4dr195AAp0U+e74Gu6inHTKKxR4OPhkkq3dn++e0HTu5Rfj2sYhatV5+9GwVrl3fzG57efrWvgCQo+lJKOdFkqqT0kn7S4lRtUvQx5mSEIMZmw3jVqI93bQ6zVR0fsU6nxEjq2j0RM04ePbse4jqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760860624; c=relaxed/simple;
	bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dP1Z/rOX+NVSivtBEfKIj2tbonsd7SmYrXhuPOsFGl+fqXIVL52xqfkQ9ZE+FYFlmiGPC09dCGBnzd5k6VX/EYTdteQCLI7hiUGvQYb1hsO7hTVnf2d2Jb6a1NRopZLmtLep3H8km38qxal1Et7LM+WJKZRslbmlyMMFolqgmKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYD1yL3y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J6JOKD005076
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=; b=eYD1yL3yeg0p1FPL
	QHVsiuOImEeGI2T+ihBXdOEdMWtNNlVDg6iS+DDbp18wBQQUtbrbtUTHf5x5+LJY
	MxKa0meoG2iu+WrfXVF0rmOFZZpTsTeI/EF6UrsM7MKrZXsAA82XOBAq1QcrMS9s
	t0OZwu0DJ3L+CMU8u/tb4WJA/pPShu6MpbTQs5MyyxLBpyjZ9rsPqXbKazYUHvSc
	Qs9K43gN3JQEQi5/ux1yY3mzwfKOykjJnzbK6X6AFR9A0m18u34LcVpFg5dNZKN4
	fQPk1+kQyHbNjudmZdDB0nqYN6VKOYE7bpwPJigv94ZW8++jlKC046qhVajkjfwV
	xJuRWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7t4nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 07:57:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1f18cbc6so182606836d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 00:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760860620; x=1761465420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=;
        b=GwIHDWOWXS7YuAJ3QAOH/cFzmPJxq8MW21rXNr0ByTIv/aWzoNT4fG3Cj+3C2APrEb
         8gexEupogHgcRzO24ninoxSbPcKr5egpWWcSDpRoUziSntZ5mUhCXsr3pNvzgLiI13rF
         3ObY4S5FOwH5vB1+maGX9kYRfukJtmYIKTrgA2GgMjQWXx0+nxW4KmvZ0tGRHYYvYlnr
         Yzm//NUaennHd7F1+bclaZAI4hU4IugBcnMsy6AqOJwMIQmUTt0n3oInWnICqTIkw+AP
         JcdHmOnSsTN9x0TGbhmAba+EjxmZuyZdp6E1oAMFwr5zHeww0BC2iD0lz9Vx8gkcRO0l
         mrOg==
X-Forwarded-Encrypted: i=1; AJvYcCVKo0TLO2/A4dsxOSuNZtOqHopxQQi3g3oODFUVuFTbvL3qr11NFFwwxzKwdPymngcsdBKhb5x7WSRLXFkY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdyi6pLq56HA3ugWML7aFRV2Rk9cT87eOggNUBY4k/aGezXFKc
	S3RRh3k+A0kzTIQe8T5E8dIgDtDMf/bnFW3OWtPWzpPlW7DSmdU9cOKdi3tXht6nYfWwdeJobFi
	Il35o8MoJz5ijkGBiHSxxgimnoHoGJLYlkDrd75EYLopkr+iMIfg2i9XSqrqR4+wqUSbC
X-Gm-Gg: ASbGnctYt5eujcpqdJTVeVXeXE4SsfaGJdlbVLGuHdKRkubrWXPJfJCci+hGldtRpD3
	ryfcSaDF6PQgVJICmY0bslL41mG8aFvP5/tpz8JlZ72r+XbnD79heeXNw03yg9wYMCoNSkH5Qhm
	du9mP0VSSi9Ttz4jZvNJVogdNNb9vWVhRSn93wUZTeXDscN1UIkXz5gEotSpmHnxzJmOO5bjw69
	etiZFkazcJpVgcqih+tLgm/Q2c4IzIlC9rYPGYLWYIx7om+t/BN2qi2XAd09HHPAxpzhavDpHAD
	/ZXiUbip8TUSHSXezk/vxrUMpkOUlqkhwtRIDytMj3CgkiB3zN0+JjPOF39EpJVuRrLPjny8YVj
	PzoCX6EUY+xS4cbuHiRAspSY4phTjEE78uLp/zT5CHMdvzkVGMV+N+7UfCnwW2keEjT6qlYagiM
	dBd7x1k4eWkCc=
X-Received: by 2002:a05:622a:11c6:b0:4e8:9c58:3283 with SMTP id d75a77b69052e-4e89d2976d2mr149921581cf.33.1760860620460;
        Sun, 19 Oct 2025 00:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBT/JGLHhnA0pOKRiG1vcO25nwlo8WWyYXAEig0c5KOlC4TxFjLNtH3p4yEXMlLHugw2n/WQ==
X-Received: by 2002:a05:622a:11c6:b0:4e8:9c58:3283 with SMTP id d75a77b69052e-4e89d2976d2mr149921491cf.33.1760860620046;
        Sun, 19 Oct 2025 00:57:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaf4cesm1357027e87.30.2025.10.19.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 00:56:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 19 Oct 2025 10:56:49 +0300
Subject: [PATCH v4 2/6] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-iris-sc7280-v4-2-ee6dcee6e741@oss.qualcomm.com>
References: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
In-Reply-To: <20251019-iris-sc7280-v4-0-ee6dcee6e741@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo9JnDFE1Kbou+2TUTGrtA4wh8atM7aEdFOLKXd
 UaBUgXEBi+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaPSZwwAKCRCLPIo+Aiko
 1YBPB/4rCALg7iHH73KsSaCsSpsxPyN3NVo105FoTcDHiHe41tCxf+mTxb9yBZdC7BM1lu+xFxF
 1t2leMeL8woyXZJCccmKfWf342dinXfqBYzqVazjz7zHWzWB49FcuZkZRZR19pettzSEamWIiH9
 8a21yS3fVkrhVXQPf+3cpurKai832ATFs83Fi8MHqi7eFhkE4QG+4HV+jpLjri4wJR1/FQgajeq
 T1MYNWT34zP6LN+wH7Pof2yuNmR4fssTRaNhMepScYlO5K0f64gUMupVTldg+C6lHHuwfCwrxqP
 g1JonHNwl/VyLFSpiMwWj3na8NHWAJXt1zRBMsIJVyl9E+1p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX9Nc5tK19hrO6
 hVzc2NPXOwaUC6HCy0rAAr9HkjNgCgsCAqPfOFY2+8yrZy80++KlCWYy2lgdj7t1ARZi1ccEwXQ
 BQ7GR2auOzRkqjiEUGtVuplaGEhUMnMdOucPSvpxyb3psoJ+OIhNnAOGfIzfWIwVahgfkUWXOWW
 PCCLc7IyrvIc8Ool1Wuf2fDquza83BfC2Ymm9uPq3Ym8JPeeDAoH+owWEdK+cfKqlbNbt7Doxns
 FhlNauesLbQOi9fSXggYNSMQBz3sLwNoDKlwbGzVtST7ItVv5Qv3g27l0bLY7IXCuGl0wMyOyf7
 eWyufnr5FWDAfjyB3i1fHZoserF20nYIFE8OH2IMYhuHez8Et9K8abTbKLMsc5u3myPzvVoVuTX
 mFB7SAWtXcYWGWN/OWStoGlOeWaCXg==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f499cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vHBkZ3WG4vhFy3QD8MgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: z1e979wbpZ-Wrb1XxgYTbtgCri0zex9O
X-Proofpoint-ORIG-GUID: z1e979wbpZ-Wrb1XxgYTbtgCri0zex9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

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


