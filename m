Return-Path: <linux-arm-msm+bounces-88850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0090BD1A7B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 18:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 704A43020243
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B633C350A25;
	Tue, 13 Jan 2026 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oY6JolT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJVP0tPz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04B73803D1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323469; cv=none; b=Lpk5Mu3gK1LDtEyoTm0L0vy1Zjlw0q0G93f4j5L9B5Jo3Mkha//tCGcI+QrmIdTBNySu/Bq7gvV5+ChTp97PzqKEqAE1xNBcMDJGWu1ivZ9S9sk7/CybJxn29fQdrL0Cuyr2lJTyD+UUM3sLXC0TX4A3clJX/MsHvWU9McU+vMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323469; c=relaxed/simple;
	bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yf8nBJD9kSx5KhXrpUh+vENN0fu8UX8gvEoF80dCBVSDPPb9u7RxqAtSrcCo70eNLo/jy0lj5g1Kby6XgCoQiwf5hLRolf1LAan85ou4urCtQUhWaokqT1TflmsRE/vsO1cZElu4ktlPD1ozfQ+7op/MgsL7Og33NLXNcDMyXbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oY6JolT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJVP0tPz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DFGZvQ4153520
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=; b=oY6JolT9I0bdB834
	OAkCxvkKSxiPh82IaeQNhYWatcuEMtj4MG+fJwYXVG7SZMjTuQuDN2WZ1K/B8I6V
	QcDxoABgcx/p/6kotNjkK/B9Wp+zQKeqgQ++xVHXBb+/O4cbc1mHFEzYt1s5Inpz
	OK7O2WUGzBIIwXZkDa+AqeZLidq3c/4R35TKi/PTwuN77ejXKzW/BOT5Xlug06OA
	k7HIBES0TJseoaaAIULW4eVbGiI8LisYVSDun+/wjcQMbV4MOsZg60P4l66MENSt
	BZPzKF7EgeVlylR+dZEuFa4dGc3e89PaVVNslg3YBfjjFGIPjdB+wO3VfPQyJ51I
	rsUlCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e8fps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so2016715885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323458; x=1768928258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
        b=OJVP0tPzWF5CEd6UFDOt+6wGXVMNm9B0YbW/vwEgKjsk0cvWHFROjMbw2ohITfaIwu
         x0J+tnwX1EOEupYETe0N1BfLwr6qTM4Tl1Gjk93O7eBRz2PZrBtmygKQGF6sYCj19Hlg
         emy36uhHl4T0bPEduRR8SUpsaAQbdQG9nqU0R4Q9WN2yQ8ya5BB2O0t/YBwMVukd3yUD
         oSyaHiYz5vkVxyA/Y4DiyXLjiTkPtCw0QmOQIIojZND8v1R/pZk91i2Ngc9JOW+ckAXe
         2uOIOERb+y4QJ9viW3AmUG9iNfJ75fqKppUc1GTEKc2O0454/cFgj59ia/IFKeVTkP4c
         N6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323458; x=1768928258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRFOrzDHl7Bw008RFEPBz4bPzE+gcbq5KL52MRaHq/8=;
        b=wVxaScdsLwRWN5pWSe32f5nhKKDlpI9+y8Aqq7W/HtoKBIraysAtBnKtmUbxxjIy7o
         ExBLvy7yVne11Vi3NpjbfJrACSN4EjQZ3aLvCoGePNMNshUtQHP84cRSTICtA/O/RC8x
         R07H7RFQRhsLPqKlBVwuQIbU0iVMlYKmOGH0+z/UEjSTDaH/QyWCgOsbf6XN6BgaXsAp
         Cu6IMTny3gV4MVkhf5YBrtR2aTzoRJ9/MC1Ctjsk/upOGoq+VG1tFxpH0ZA03yutM4Zx
         /snOuK3VyDHI2QKtPcliHC5P2F7hlLNgsYf5nx/0B03NwVXkYEmTzd0nK81ByouU+Fc7
         iZIw==
X-Forwarded-Encrypted: i=1; AJvYcCXG7gOL+46TrrqVX2bSyKpm0sJHlcDC9DP2He7Gg4ZW0qj+i906Cd67/XBc/bhBSBQiG2KOyAPULvUtBZSb@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOhmL+N5DgDoGEZfZo5LIitBayHI2zagen5RR1O5vzP7jgVx5
	J0vVx609x5XyuZUaVJgyXlMqEQFiDEcLt9KPeJ+sskaLG9rDzpTAKJaN2sm6Y1SIqBdw3HWbD9L
	xQA1UJqszu08GraDsOdjPwNrzpuLGDYXhc3tvK8AZAbwOyaZHVn7IAL2EZpJXlTQYnbCj
X-Gm-Gg: AY/fxX4nnVQJw/ja44t8muOBst5V6kH0hTGQfMmLERECaH79c7uyt6y2/IFHXs26pxe
	52gAj59+iaNubk2uevvp1Ue7jgG69YmsbA1s+8ZeTJ/IelslhHQGyy23GeQ4ewQ65oveB3iGST0
	AwBphEj1cfQKdKjb+abtJqb1dM8EbXuDtbzB7U6I51Kf+borCoGzLdFhTLfi/Sr4yWc49FS9TRj
	48zElydO5UBU2dBMPonmoVS79PYeEtoY9nsTdMVHjmFmiFpzeWF4IwueKb9vd7Hx+d5awqnyjBE
	TUT0rhFcbB42sfZfVt2smea+vl6xWQRSJ3GV64XIWiK6DvlXxG4x0FgRetpwHu5mL/L9Xw3I9wW
	l2mYsLl2o54LIbTQutX6RTWAzm+iAZI80wtLaPHYVk6H2DN9cQDGmAASjlGuWbRfnM9rZoAZxp3
	9JbbF/aBIdem7erQbpDpUdPhg=
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8c3893eb52emr3097258485a.47.1768323458067;
        Tue, 13 Jan 2026 08:57:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCnhBVZqobojQVLXPQjzAAmSKy7O7umppS6eUXYFfY2Ev9oYVzzadqdZ3a+yy/xKodNNnH/g==
X-Received: by 2002:a05:620a:1901:b0:8b2:1fee:4029 with SMTP id af79cd13be357-8c3893eb52emr3097253985a.47.1768323457373;
        Tue, 13 Jan 2026 08:57:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:21 +0200
Subject: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3157;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fQxY8GjWVfh28Faxz0ICvLnZ7XfYjrCODr7t/XZ3IT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlz+/4rfxjX3nufGM9uL6JiabX0uiE7N679R
 /W3MXRZu8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1ZtWCACFa3FyEBbxtmnzw4nZsrVqgP+RQ90bdi2noxWSxt9Jv0Vu8dID28c57bkGJ4DXg7W5tDs
 whZCQvQgz2ACep+5MFJnQsVedpWDix0GBymlqJ3ddLERrjK0oYRvnxjAEG1INCvyBCn7krhos9B
 BGU+msHovll5fZ4X2aKmQsJ6AMulnTjzYc83msqWtPdQInGJe2qu9/eNY595ydBEGmkFPXaG32K
 lOamVuI9Zv8s/UuBg+cbiP9Lb08iqRiNhxnqVME9haId/SuHGiTMdmLgrUNWJoPFBd+jzTeK5f6
 pyCQEVprkq3/9sBHMdsi7Bq+Nw2c8/EJcc507SDOxQ/IAndn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=69667982 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=19NtJfuW7GRvGFya53UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7G+6NRVN3DGp
 NMUKJ8PsL83s25RxoQfqSUUy7ww77x0e20Tg9csewjuzlijQBXRzlhfG2aK/hg504ROkZB8DyOf
 4E7AMQjsVpdtoO/az8pozxjAcOoKpg1X3SLz1t/NvTZpLQ2bQqn4AKkFbSjFfI2uzyT4IsdQytC
 UT47bmz94zm1GIMYE+ZHn7D+7rHSF1TS0ZS08qDBTX6v/Q4QNuDvoxosv+2cpKQTdYc0locDyVl
 n4v6xbwCxqN6pwrajJ8q4KMSiZv3txMUZs+B/KXb2Pdbu49eJRwude5jlhS0Q5SVaLkAiSJJPdg
 HlyEzFtCdqGDmYO3OEoxzdfoabmTmILoa+S40FFxpvnHrXeiBuabW+fugthQj+duLEMYGlLzndg
 I48vgsby9C+aEORGXxRgRAG1aJCA5MjQkDN/yN/gdEPjtSHUyQw8ILvHgo0wdhSt6DVoaa66/MA
 A9RgCmBMWtGRzl1CGDg==
X-Proofpoint-GUID: w8VzXbwpUGAk691GcBSj-B4KVPHnXWLQ
X-Proofpoint-ORIG-GUID: w8VzXbwpUGAk691GcBSj-B4KVPHnXWLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

The UBWC swizzle is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a4e60e9d32a4..a880751107c7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
 				    HFI_HOST_FLAGS_NONE,
@@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
 				    HFI_HOST_FLAGS_NONE,
@@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
+	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8421711dbe60..9f9ee67e4732 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,9 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_swzl_level;
-	u32	bank_swz2_level;
-	u32	bank_swz3_level;
 	u32	bank_spreading;
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5ae996d19ffd..0f06066d814a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_swzl_level = 0,
-	.bank_swz2_level = 1,
-	.bank_swz3_level = 1,
 	.bank_spreading = 1,
 };
 

-- 
2.47.3


