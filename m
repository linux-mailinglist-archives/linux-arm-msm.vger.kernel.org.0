Return-Path: <linux-arm-msm+bounces-88367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DEAD0DBE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19D4B3065226
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AA828850E;
	Sat, 10 Jan 2026 19:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meN+wm9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsW3tfod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D2252917
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073892; cv=none; b=p9nKGMJ5ZYzTAX5c/ImIjvVsFc7QrCVkzhilMQAXJAdaaeOqA3NFPadfElLqFEid+pkr552GCm8dpYEJegohfAs6fW6wbmqY4gDubNA2c+xeQYieoBXbds3Vcz2khvr7wAVmJdM8nY+f3JK2KFgeQomGuagbYsiQc0lmzjNFAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073892; c=relaxed/simple;
	bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnErGrx4JBb3+BKHbqfHKn6cro5bbbE/XxQHKq3vzb5FrdPX34m4M54AnwLmkCAhnIKW++vj5PtdXx2ZyKhMIhKoMdXNcB3XP6YUaVHMVDbg5jefnfyn0j/pkSHlRt3HGjwfQCy9SfmdcJ3NDiU1fZ4TD7GdjAqkj/Xu5yB8Vjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meN+wm9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsW3tfod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AF20oc4189633
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=; b=meN+wm9HFNYDDdz/
	bah9j1YQ2f6Yckc/k/3X4dNb1O7NwaR/boY+2gbznFpxUv+4YCfN/zmPcwlBo4/p
	40ACkzEieN7VwR10VYXfV+E47z6sEfS1Exh6/BTWrQ5H6tgccXpCbfh7FvZqhXFx
	gBar0a9gdXydIEKs5Ip9HqVcAOTOazT1Hx+CLlfC4BDN6G9Y0ocHYbntLzXAsxPC
	bclZoPq+URZoiAVAEXBRMuNkLcKFZLFtVspepeP+QPYd3lfMgdO6OBFjaQMrSLDa
	rOlT5hmuV8l6mtCF5oAS+b83WrDga+BduJ+0Pd8u0N22iKN79SjVUGON8sr3+WKY
	vyGgIw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so62142976d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073884; x=1768678684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
        b=BsW3tfodR/PdfPCbrJ01KXzocYUh1dJiHyJGAIwj4aFW509Fgqug6IP6rNl5hT8hRr
         lWHBctIhr9ngnRpqXcC98XVM3yxSlK0A+oVfcYFDK+dfkHD68Hrxe7KydYLqlm4hgfH6
         tunSdJb53dpNrIkWt1xOU/xlwpCDS/znfq227NKYxGrcove4nOvAjEUHRFXsbcPwGe7v
         kQhDWmKsUKoWRfHg2AS38KGE0bQ/MBcbWmGHdtV2G3637xev/MtmuFGXC6/GBhm40Dsv
         szAKXhwaDoSD+CZLDPJPXtJ+WiTz34IjgeKDXTBITToUEbWwU9/vAA6Tncr8/XLvoYhk
         tLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073884; x=1768678684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=phFObqSVTNQ2TW4bvrM5rdj1a9b0rssNIUHLJzOhHY4=;
        b=aVLO9YONFwnn1iWo1rC6weD91JSwoEy4n8FODY5OHzTvLW0Qyxk6k2Jket1VfL6efx
         Z+b+bI6ednQPi5A9zCnq8hYTtD1iTFPdaJxxEyPER7cZtZ/pMct2CtV7I2V647PxLZwU
         i8x4N0rVupFDI9GBM93QvE9Xt6M6z/LtMtDm2foKoOiP1bXt3Qrjpu1nBQmyx9DchNBJ
         3Uqdi+GFPGgFLqwLKsLUyLn/ziWPsGlG6icDT2JcVsrEsieqqLeV5iX1ck6Uzeb6u2Ib
         p7CyTJQej2RU1QBNf1Kq/ZNbr4Ieh9mmsXw5ZmreNTLerXOUCnmClDnf7MLRSzEdboiC
         5QAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbZo1y2yEjbqPkPIL4UozBlkUSjk3G60LPOGVTmOTcrMxQChg+5J4LR4QdAG2wUiYKOSsMfoJAESApoVju@vger.kernel.org
X-Gm-Message-State: AOJu0Yywk/+vhS3+tWAZ3TBCCDojTGoU5cyGmYSpGIOWHK1NgV9u7WcT
	ubIKI0sRZAM+AjCNG6ohve3j7XRY1qT2bNWCBpXccUy51rNvbV5PzJsVoO/EJx4hHcgbdd4srD2
	iw9COC8csPCWWyVbJdfiTZjx+P+lA73Qbhu5/nYWmShND5X03pYszqustZNwG/k/pPtEW
X-Gm-Gg: AY/fxX5iHzSFQl+NTasjy180TONx2vtBmF+CQmC1GSWXPfrM1ro0+/88Fq5g5+K8Lzl
	1yjHoOHW90piXRO6ZxXtZi4Mc6oxV3LnR3oJ9N4DEbk2liOmTVMJ9YtEw+jhM2ZUztBkqG2xQ+A
	wMM8dsJsbCz/LQ6mwP9x9ULV193Oewk8hiBpQjYL5FLLkqtwuBqxtcC0r6sSGwpTLIa3Rb4/59Q
	esc48nbjMHlc3NTx30AQlTAlZIua5OsceqGN86ar+tQEdgIrsk/msHp+aPGr9+YBVU6HWGK2lD6
	LiM3v+nGElk16b2b179vp3B5Tp2MUgixm/TPhawCSNUY1T658V9GjDeSDanWGWs5Df6AOMiVCGg
	FVB9yh1cEAf4qVK546BBlMl4RGWNNiKfzKvdZ85iAb3pbl+bnusAiGpNTlAHB/sZmuSd6C46y5C
	rfdoc0lMmDUG8C2awddxOqg1I=
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id 6a1803df08f44-8908426ab50mr179708496d6.45.1768073884410;
        Sat, 10 Jan 2026 11:38:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrvCJxK5E/lItE74kRDCtOeI+UlaEXrEZFIHoPd9qyQkcxz9NSymG2Cfr+eVovwlWWnTIhyg==
X-Received: by 2002:a05:6214:202b:b0:87d:e456:4786 with SMTP id 6a1803df08f44-8908426ab50mr179708326d6.45.1768073883937;
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:57 +0200
Subject: [PATCH 05/11] media: iris: don't specify highest_bank_bit in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-5-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2205;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vy9tVwOAA5YcL1Np1wJJTKlwneoNR0tSHzfBWTZUVqY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqTpbtQDEaVekUIxIorLinJK+7zjJlGSZMwM
 IVJk9KPFVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1eHlB/4kUeCqrKqRYoiDCTdAHwW+RQxJdDp+scPXwVIAisZhOAeXVsPpYM+t0YOd1l7pRcUZ1nh
 KKM5HfETppQXrnooOWhfprp32HjTruoZvQ/ySA7bMZk7n8IaLyW+Z7Ute1JeebTfVfWWm+p+Sc5
 nAOeI8+T/0TxChsPUAgiucmG8gotqLveV4inEzeyoUVZTuZ7abJUn/3CG5NmlakEt321MQy15VI
 80fRTK63d3lAwlw1js6cuGlSp1PTyWK2bk3B56afJghYwHnKg3mwE6nK6FVjrJ8gf+4EEMNGB2r
 NahK5yVFqDXNOzCLivlIoHa9GoccIsmhk01fIiI6MXDJQceA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX29/iXbXgnzaG
 SrLHneXUX2z2fzFzjDOz02cEDhPgUexSyqo6MOPGK+flrLDJs5mduqfUf40xGjp3MFAe+yMyRLN
 twuqa4C4arhn7VEsU2J3qyakOrVri+gRFVOe4RKnmduXN+RKyOsNge0HEMQ/o1tPw4jsjeoFSTN
 VDPpSUZIJoJtJRrigFvIunUquGBeLKv6EcJfsG+9jYUEWBwo9XlErujrLwd6FC510C/Ce9wVYZu
 uWB2SCtE7DP+WVZLPZ/m3NSJsEG+GRkuz1P9KQXylJT+/kV3RhWO3SI+Dy9+RZBiwT6KpOcFbk4
 2ztV5ZGUbuuK8RaOdQLhCFQVU1DEcsG3B2m1vTeS1k6a6pc6NiMTO19LNnwc85+53UpKClFxNqI
 wmP/4FKpF32fziKmd4Yagb5rnmq3/i338R6SJ5xodw8CC01Fb0et0ONfBPit1vBNQ6kkyXPFA3o
 3+ut2XJOVbLC4xyWL6Q==
X-Proofpoint-GUID: MI-laOgClce1EG4zrbn_OemE181P5D7D
X-Proofpoint-ORIG-GUID: MI-laOgClce1EG4zrbn_OemE181P5D7D
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aa9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The highest_bank_bit param is specified both in the Iris driver and in
the platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 878e61aa77c3..a4e60e9d32a4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
+	payload = ubwc->highest_bank_bit;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_HBB,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 3c5f3f68b722..8421711dbe60 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	highest_bank_bit;
 	u32	bank_swzl_level;
 	u32	bank_swz2_level;
 	u32	bank_swz3_level;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c70cfc2fc553..5ae996d19ffd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.highest_bank_bit = 16,
 	.bank_swzl_level = 0,
 	.bank_swz2_level = 1,
 	.bank_swz3_level = 1,

-- 
2.47.3


