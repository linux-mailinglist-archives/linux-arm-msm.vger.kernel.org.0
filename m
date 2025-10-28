Return-Path: <linux-arm-msm+bounces-79177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5D6C1470B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:47:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C13B64048AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 11:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D992B30C626;
	Tue, 28 Oct 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLeANK9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB030C60F
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761651993; cv=none; b=s+UN5hmHUNVIVBfwJCsUBDkyHYyJSnFb8b2BwWKYnxiK6kLTEQfnxuZDyzuwEqAtysf5U793DZoo+UPL1JS0eqYlyuhd1tnw/0RSjIbuxKBLtrD14uFKzBxYO1D6qrd+EYSa+iMDvuqMu9IjkHID1aQ11uXgU/RXloFC6QJY8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761651993; c=relaxed/simple;
	bh=QlGdzJciH1h4gz5Q1SzqSd8IKkSpeYMEZtL7i2pFW/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Daf6XcTHpRhxkoh7p8z7KlWB89Skshh2hI6WSYzngKD+gn7X7wkAyvMSwzZWtz3/1YcC4kevuPDTgD2fIYRM+2G4rqjKzYk6nqVhWYuvbnJBlqfFvAHT8hdY+yfraH676gobInpCh/tbWLlmsMVgOVo+Qn4CBx899v7hTmdYonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLeANK9m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SBBBiF552846
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=; b=pLeANK9m+SiN0/cw
	zpNiU1kEnrYBsEXPTLsftK8CZEeAoDg2vdFqCkNCOi35qNmMW0uwX3GUxGgDuaji
	ShgpiR3rS7B8EXrqZ84MT1AFKOmibsXeEr8shyuojdWk88CsV6s+DCY0n35pDZQZ
	H7wIpnhzT2/oDWq4fkiy4SfRHOLKJ3BBD2ZKFm1/MU3XBVUM3eY5wOI3jJSJ5CGB
	+gd7lQOlYjLxBO6zZkiel+cJWGS5MD6JVtTNcShMxDX6hmYikFIJJZAI0zj1tRg+
	M3vy+mnTNflkVx9xf1aM8NKWU+lcWJO/89XvU6KJL56bSLwIFg9atGF+VfzoSMqK
	sjFRwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2pjf998f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 11:46:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88c912928so167984141cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 04:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651990; x=1762256790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9c7rVUQ+8XQDwfJNgLXJyZIItXH+75/qbByZsGVfLU=;
        b=vdDBdWlwSDFPD3BNBwooVFW0WXqe26VApDw36THO41CkVPw190kmCTGg5fVmHh5zWi
         TG90bZ3519VYUMac0iF4u3HXgGhX0FllGZrjbUTwI1MN1JVYy2wisUGwaxJnxIbVwh0/
         qJU9w1EQtV2pbeKc3zCtkb+y1oA6UsKfYB8NOUOgaY1fNx43M2aMoBnjpflX3P76nVAO
         N0Mkg8iApM2Q42uSkKZ8lpOM/4nVnv+32PyZeO6uT16HiToTUoXEnKo7kdGu9/RXjRge
         xr+R8CTClzs/xFIOy8HTnUoLGd4/cecAtqblIh+z20XcWHmIosxzKOvh+o0XQfJMQa0c
         Y+fA==
X-Forwarded-Encrypted: i=1; AJvYcCU7cCciWRj3wLA/oozyL+hGX2yFls+3KLvfL1KRPvFrHMRFrzbmbbq3aX/jMvRCyZGd/JAj0XgpcTZkDlxb@vger.kernel.org
X-Gm-Message-State: AOJu0YxskahMSXrnEiRMCAZskk1MdJ/Sa+xYzblJZWxF1UsX+rWG6rp7
	U7TzH6bG2oC675rak/bjNcodZMQwUtNlzE9JQMj7MpetnTDp/FrL2klM9lalHdhHCkhQfkLylk1
	gNJ+zMkDvQKEbHBI2Hx4W5YPIT31e+rAKLO44YB6SZYATTGLQFstfHGgOMoiq+GhXVDt3
X-Gm-Gg: ASbGncv5sJ9Z4orT5cpIBxuMoot6udfg0E2p45hwi4o4eka9Q6fq0nHgJYEB3/dO5yO
	lLoOdCS58rcsS0sP4HlRIcfgo/dbhXPaXKe9hMHxSnszFXzQsHYM+rlEkzbZuoI/YblzFFcBJBx
	uKvzpYXHLkS32N0qAq63Dmdb4NDbod66ybpaQSRwczyANqzkVREsFvg/nf0Pz8B4nce9QzyGLYG
	/Tow74X9QuvS+ws5NlZDDASUx5kLishWoj0ep9vMBMYGwUhv4hOBD8hqjvTPbi1RMEmVwTxncSO
	nsvkLUWuMHq6QSiy1NCvMxE+BAExXxlBYFRA54cv+s86DMpsDFx1luiCY9FoQO3J+aJCojaKBDK
	3jWx449X8Vdfe15cuWKEm1Vb3l9M8gWDN4tYGjnv9QEll13raaynG2FsRZur191Yj+V9LxUepvw
	xCwylNSFaIqPGe
X-Received: by 2002:ac8:7d15:0:b0:4e8:acc0:1e8f with SMTP id d75a77b69052e-4ed075be057mr45500341cf.47.1761651989933;
        Tue, 28 Oct 2025 04:46:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8Ecb2Qp+hq2U5FiqWdK6HvKabgSqWNavXCz9Gkg4IboGUsrt0FsZKBeUOQgiTiiyIF0Npaw==
X-Received: by 2002:ac8:7d15:0:b0:4e8:acc0:1e8f with SMTP id d75a77b69052e-4ed075be057mr45500001cf.47.1761651989440;
        Tue, 28 Oct 2025 04:46:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f41ce8sm3096564e87.6.2025.10.28.04.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:46:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:46:21 +0200
Subject: [PATCH v6 2/6] media: iris: turn platform data into constants
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-iris-sc7280-v6-2-48b1ea9169f6@oss.qualcomm.com>
References: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
In-Reply-To: <20251028-iris-sc7280-v6-0-48b1ea9169f6@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpAK0RtoydYarBLClwNT7bGfnqxxyYGWps5K8YC
 yvBOmQTMjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaQCtEQAKCRCLPIo+Aiko
 1QOuB/9nGiy5kH/neKk/uzz+gVGA5k0aigNMTkWmKZcRP9u8Gby6DZ5jsbjV9PZaAHy3kFZ+6Kl
 9xXgcEQG0YplYqZ7Ti+q6us6jzFZVG9Jn8ruMHax4L6fJPsyGdHy2RC+nVyNzM8Fa228A9yBQPw
 SWmRO5CtX0Ckbb0GGyvwUjfht7+DtD070BqQ8ViGmi/kM1cMpXbG02hgkOJgK/04efPFrErExlh
 zP7yNAo5cV38ekvsNZzhqggWhp8iwc3ygfZ5QjJUKfZ9chpTPuwQgHmafbu9wp7gZmi85tX5rBT
 6fEx5XxXm/rJqfZws2psFab79OPQMzatStNUCfSX3iwXiKs4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Ut9u9uwB c=1 sm=1 tr=0 ts=6900ad17 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=vHBkZ3WG4vhFy3QD8MgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA5OSBTYWx0ZWRfXy9hK1EpNp99y
 Ufr8qmMIGnMOhNbko8GXsynU3VoJBxbYKomIXODguNrK9RNRjQjwqbm9S7FkqYlQ/kcaCkgqR6X
 /HRuRx2L6csxrOSqf2H/lIScMEmW2GR5mtWixsca5vamv/9IfZoNlgpId8FBIyC//94pnZgrG2P
 iA0+oLZbtxuxm6SUYHpOZQBYqaC+a4T+VnoJXg3w7kBstsapXjpWOOodyL00cZEd+DsguE/ag7T
 Tw2iXgtsWTuhB5pLtkkOgA1ZpOjPhNzFEAZUXUo59frzwWwRkQUCqXipDrnXl97fw4U33guFGsU
 ZiGI/5EsZrLrYg2+qQs8kds9/9knQ7+kSw2rYTb0YAo4Pm3sEY2vSqEBMNJOmgjRcNATr1WtMbW
 7B2IgVB+SlOc/x7do/8TKxAUoRZbqA==
X-Proofpoint-GUID: 2Hm4IJzQCnQmcR7ZveeqUmkHjbNddSGX
X-Proofpoint-ORIG-GUID: 2Hm4IJzQCnQmcR7ZveeqUmkHjbNddSGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280099

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


