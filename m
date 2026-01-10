Return-Path: <linux-arm-msm+bounces-88366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFC8D0DBDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 910933038F70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA8F280318;
	Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JDQ3fhvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NevQ3Z2E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019D22BEC45
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073891; cv=none; b=uCqzjw/X/BoSoNh8bHx/Mj5HlMTzBTo3pweJiZJBT87jcxqgUcF7ExYsHr8f/qKEsqloaOdYp2SvhuB+KTiefbj2NNbfL5H4rc81+77pbA+9rG4NXzv1PXlODVt0LerNbKoDqAi8H04iP6O2MnvEQPCp0hp8KjRlGiOMxUa56mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073891; c=relaxed/simple;
	bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nYyXQKXi04pAXbLLC7/3eQFSnkkI+PBicim2F2+RRtx7mrTpd6tsSdl4pX0B5mX4YEXrMUoE5Y+lD8ftXKzffO7r9wVmtmqcXTRGDmSy1yF6YmBf2CaCef0u4plcw0WOmensChDcp1hyDdHrwo556yYIiI6jNv434i+KVqtVRSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JDQ3fhvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NevQ3Z2E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AI8XDa3884337
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=; b=JDQ3fhvxZFqJs7+7
	/xyl9fTT81ulEBVhF8rYgpfULcIkmuo0v8hQvjdIv2SA4JYb5T3td1Sy+XUL6stH
	mW5rhlzU3+qxFz4BLpW7eHL5sIq9L/TY3Mq9QPO6RJL/lkFXsGzP/vAW8sa6hzMJ
	t5FSWA8UV7df9mUp0BhBeVfkfdUHRJ/5+ZmisFjCMSX5DwVU5MaRGGNnT5OpYuHB
	5H4V/CDSp6iC3K3vw+9eTwY/VNsZyO/00Q3K8xreBtkfGn7eqw2UDvH7WmkAADoq
	yHvGPXXUi/p+JXYmPs4T8NqFsgK7O1r4+TRatwN+Hn6pEnrIOuMY0HlNHdTJqRLf
	sXIMQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem0pmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fa6f808cso1499602985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073883; x=1768678683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
        b=NevQ3Z2EUdT975tPTVLbnd8f0XZ1DdcKXbXTVDfvY9oGJ2aRmgHeCgNoOOGIMb7BIC
         lcmFjLbzGRsYz+tLcv66Z/XnXUMiI9xtszE1Rz/D7ujeFd8PwT8D24DsHIkPSo8v3ted
         TQ2bURuEZvbdh+yp/jjcVM4IoNAfF7lFU3wl30K29R0dTHquUw6FxUnlpl9sXsKgvqY3
         owQR4BirsHRMLZOY+ajlB8mqN/+pB5kcTUmPzuWHR7FaZ+rShRdxutholqBKol7crgb6
         MKCgI5ctmizsCss3BQaNFR7WaJ51zxUcSg/5Ok+fpIaZcWsAzVOVKLlx28FbSxkH6IZn
         +IIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073883; x=1768678683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TlhwL1AanJnnOonkZZ2qXptmUOEaroWb0NZ1rA7+PLg=;
        b=VCTpyktRDrvYw+TD3uqhQcga3SVvhXOBdbGqIo0tGwq2IwsSAQNmGD1T1wEpn/QC6f
         lEPF+XdLoY8/33TJ5mS3HxN2G8vsYPAA6Je8e5croRCwsiS0T5m+VjOvbPwagb9ynv03
         fKw7cxWE9ICHpsZ6XtPj2huskNktOqA+eBaqReWGg0FMceoOfNQwu0N3o7cvme/u90se
         RlrXxESpD4uk1+vgpfD4SnCzy49eLn3QcTEPyE9TVcbv+3B2Yvc6WpNnk3degXWoc3w8
         XYyrOUAaL8cawqAtM73ANT3JgRDQ4xyKGbxt8Ra01KzmYc3QN5g+dpDy8C4HLuU8WryY
         AnSg==
X-Forwarded-Encrypted: i=1; AJvYcCXL6YU+ofWlaJh8jpaBc0HzoPkJke7xX5oW7DpSUwxOxT5hFjwQotMAKMfLiJplI2U/TdExXkgn+pMnlZPw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd25LTQ4TOJvY/sh8oZ5f3JqwXuzWgHrExPTsnN6JaNdmopFgQ
	eACsOMe7XgtQQHXSlxs9VlyMSwdMvbmehdkM4SLbtV4GdcfyVlhnxvlEwXvNfY9Fkk6atBLHOEp
	+9323jgdQaZ5GltyDedw9z355yAt1nfbp9CKGbtdMt1w8I/1WzXy5vV7G80gPIVe9QKjX
X-Gm-Gg: AY/fxX72kNcjot9T8z2mLfJLmD9U8fDrqbyCRl3mHDFidxX3OzutXMsyMYkUsbW9M2e
	3CjVVgG2pL7rAvAQEXe+VIH7xEZ8SXM9sS+Jl1RyS7VXzoOhQygZUz9pLmfg2gRQzLu92zfYmRQ
	sr34aaQ54COWo+h4FZS7Yng54hTwpyFn2qBaLXMaZPuAapl01mjUDEOLVq5XCI2qkdD5i0BNsnI
	W/HZWoTHHOQpxE9r9VsvZfcX1BdkrFC/ofokzH86h5IAdEamN58Vas49GDR4EGIzset6FijHOEY
	PUzpOH4mmQ30lhab0UbncwMGcs8W6JJdM6OSWwXP08D0iUl3CXqCd1GoDKOXZCbRp3t2wYkPnSp
	Bq21h4x7/KxBR0fCknDpsXApmefcX2Ia6GAjnp+LyszeOewFwgD3De+xRvwq76WPwWtRCE8Azl0
	DZ2gj0VXGSigmi/eFXZVO7B2k=
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c38938409emr2071093785a.25.1768073883289;
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7Fhu3fI/rHF+8/VARZB58+5uap/6Yh/hs4XYGBO8bGPn2y09pUiKUokJLfjBWQZIQw3Taxg==
X-Received: by 2002:a05:620a:448a:b0:8b2:eb83:b94 with SMTP id af79cd13be357-8c38938409emr2071090085a.25.1768073882841;
        Sat, 10 Jan 2026 11:38:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:56 +0200
Subject: [PATCH 04/11] media: iris: don't specify min_acc_length in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-4-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
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
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gpcocHCUXsXafKyVqfZhuRHgjdviZ0p9/GuqdmQE/lg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTjEmTAg2fFw4dXnV/yfZCtjbevCqTOR4Lv
 uzYk/iRzDKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1f6gB/94jLwTW2nfUZCMX4NIsS6AIuAIpXej+mAyN67FL9OzGClBIulunDjh5KAOY9TL2ZD9MAe
 qFofyQrofFYiIwZAGkQ6qyYd8aM+oADSU2ZkO5Avrh24VWvBSxdTKIsf8Dmf8wtx6MntOqml4xT
 8dXMnM5arSSOnfp5PTuNojYXC3bddT5YDktG5A9dmzIfAY+MXls8cXgYhFB6ZL4vy0OMOtlv00/
 g62jUUaEu9b0M1c8vWmB7KVcIWVtMcXxv7Pha6PPnZkjNfuZBNn192MPA9gYvexhV8GmueIzNKL
 nD8KeY/C/ra1QsbnaR+9ubdRo6ZQwAZbNqO5y3NoCbHgeKuu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _ZzzZNAOrrrUX1kTKl4DDzw8zPUqq-tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX8HJ1Xcc7RxfA
 UWjtc4Xz3rEqJVZotqUUY6iDdx5WY+k2nuUkhmNQa3tYFd9ZuSwWnkruu4N+YQRYLG70/NPh39a
 kz4WPTfPmqt0tZmUfyqmejE7ipXYvvBdUowrqZGAJTy7Fg/JQgtp5UHJ/vAhas7+HBh8nJ+h7eX
 4acd3VI7CLE0asiWeqkuIcNoB0Z1j3sda6Obt3lnOnT+d42EgGyaBVbHz6hAC/XJf7HjY4G8PFH
 GqkDeMzAc8MIfta6oT7YIqwUwc2sbu5+M0202V8VDlUk5plPkc6giXP6JpALUzy561sMg+/OeS5
 VdNG2VJ7r2oKfp6E562obHobjvd5IrBpEYxty3drMVqyWWndtv+Ry4xKKtib8D2pQI7n6Z5j5n6
 wGRwDu/SFB5yVxtDseAn81HeLSNR9xwa/EniPo15FSbM3SiX4fwJw6PyWIsAihqSKBzi1RvNpYe
 YuFOCkH+Q1b+dm8PpoQ==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6962aa9b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dSCyfi1qUYuBuoX4_vcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: _ZzzZNAOrrrUX1kTKl4DDzw8zPUqq-tx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The min_acc length can be calculated from the platform UBWC
configuration. Use the freshly introduced helper and calculate min_acc
length based on the platform UBWC configuration instead of specifying it
directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index d77fa29f44fc..878e61aa77c3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
+
 #include "iris_hfi_common.h"
 #include "iris_hfi_gen2.h"
 #include "iris_hfi_gen2_packet.h"
@@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
 
 void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
 	u32 payload = 0;
 
 	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
@@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->mal_length;
+	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAL_LENGTH,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7..3c5f3f68b722 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	mal_length;
 	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248..c70cfc2fc553 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.mal_length = 32,
 	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,

-- 
2.47.3


