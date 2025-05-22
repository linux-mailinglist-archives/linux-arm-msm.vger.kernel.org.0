Return-Path: <linux-arm-msm+bounces-59131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E2AC1474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD8FA42134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63F22C375B;
	Thu, 22 May 2025 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2O6AG4B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012412C2ADC
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940694; cv=none; b=lnL85dW07YVwkA9T691eSgj+8pzfvzBRCW0PVDry+qMlgAYZxE+gLthm5NqG0HA5fgOMFmLDNtm40uGH9K4vOCMn0ztZHniJ2isldPQjyd9yDYFIlSNelQkP2Cuyibqa2toCbnu6FxBo8fy4qNL1OMiOabKb2LxgSTYOgQMbNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940694; c=relaxed/simple;
	bh=mG5V+769NARywzQDqSO98sMatrgNsrI0dLaZUKofTIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaLGGGvtOliPf806XrKSQ7fWlqE9VPwea2jYhHZL9NW0TF1AYkzLAFa7Mrutt7mvIQEn24PQuel5IQtmX9NgLJCKvdtj4hpvVyzYMbS76sPHDrQRIepTA7CLsq1K5zwaNZDUsFhCed/MQ0AnVllubZzSW11niy2hYV2PwKtM/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2O6AG4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGesdG029048
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=; b=o2O6AG4BqR36OSah
	Os5j/CKCuMjniY/YOCXrzXhTb9pWpQUm6kHw1ib4a+mT/5oeAIOcaqm9BV9M09xC
	W0eJmNNFFSZG+PhcbUumFQCuY089KwXlQScmzw1P7kr3qFit25MaKSFGIy1cT5b6
	FRjDIiiDLpzNBFHDIop7Y1yy6QZ60KD8cwUbsLdIPVLGS0tFvdiaOwUVeuSyxTuK
	sp1GRjtT4owvk0b5+hb9gYU4oAAGQZGEqHSWQREM2l0lBGKkpbhmKMOCLQyW+IS0
	o5zgRlCjhLIklqtPTVWpT5Og2NYqz8jzNoTFn/TdUJ5rW9Pj+IAtDDVXfjlqWvbn
	aE76AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf47k83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so1363557485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940691; x=1748545491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0eWB31rocmlfRu/RyQnz8gUXEh7OH1MltE8TFCrHLU=;
        b=YSIPyeeLG8SWIgrQSNet/IDdnK3Su3/KRsaT/O8xqpnxmiozzqyp/Zh2d8m/GG0zpc
         KEcpvvUwUKheh7yrfAogevX+vK8eTKbUWezDQmcQvSlTBl/CdzD3/w15KiFd2U5+/IvW
         X5pA6+vNT4bshS8D0uGIPp7wqCsD7QHaJe2ggcMa3gFkp4G5unIerGvmZf5uF+emnrSK
         GaMzihMM3ZaPaHVdlODQYkW1nzSXBfSuQyR1bzD3RCY6TpUbfE1L73RwrBHVIiSSoaPa
         ODok8d5DVWn9EnjKANnZPVPhqfYpHkP0UpRZ0j5yrNLr32sKvpCUaW2nFJKHcmlEYbvP
         aAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw0tTIUIG0ONWMxcw4KuCrFJY9rzYZ4xO3x8ymRjT+ivGwC/rzA9IYYacSIVYAWsb/1HqK82L40TNKi0YZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ5OqtsNRBcquN1mB92K03rAtvC8rhIXKcx8I8F9k18ito/fMb
	D9b3cP60uCzhmNTCTnB8BjIVqXUcsnNXaadfeq/ZwpIe4eiB+W61UM3ZZiw/ZEAKIy6+9sokRwe
	lnobYeCVzjnw9B4DK23pW6JG3NIOkS0tLybJsiuU+MDE5/Lgj4EUYVZ3xsF71eDzkFO9/
X-Gm-Gg: ASbGnctE3wILiPUETqUtgRU0WOQxWaCLqmPsWHm0evg3MX9v4gp+ymRbJXKyISKRQDr
	5jhxu7m2Fo6AS8r4uDuBMkSd+7jjwYqaeYmnOr/O3MjMae1tPMHmnjxXVrnMg3Ev5Y8egbgKTfN
	QKikPOpGEA3K8QcHdKAIZnnlTeDfRkrafdj8pY1JL9RRFOxDZyBPsWYBj3c8825T7/aTSkJg/kY
	iqpWtPyues4iUoxQvzLWKSOSEeOWAsEn5FQPeGZ3ct15Z9H95QzF5weRV2YSddggH1IQuiVnqiK
	JIMAaBt4x805xXmEEuDaaNEhGo4JVsEucqUCsKQeuAMvggZOI+m2EDMpzjPFYHnnjW2/DPAYuz/
	ERQWsM7wtDa48cvIDY/KavS9t
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7cee31e2c20mr8933285a.7.1747940690938;
        Thu, 22 May 2025 12:04:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWeyT8YuS206JhKQP1qx3xAjKuJP2j0TQhVWUYqJTT2hjs7OvTMzPQ9H3knJ10UZblpdlMPA==
X-Received: by 2002:a05:620a:244d:b0:7ce:bdae:8a6 with SMTP id af79cd13be357-7cee31e2c20mr8930485a.7.1747940690601;
        Thu, 22 May 2025 12:04:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:46 +0300
Subject: [PATCH v5 27/30] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-27-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9X7zCyPLMB9JgfInfLiu//0xvw9FvJ2BmQNEpS7pFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/AMM2dpp5tL4YM4Flz6AU5HNexuGwt28tU
 dtIqZZI6YaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1Y8IB/49tAdM/XYV37ASC3Z3O1NA6waaBgF47TaEVpZcrlm3Z1HhAkvOMKlsx46o0ipm6Kvh9ms
 L33cBcEyAuP0UT7NOGdDaXOLI5KoOdliuw/DFVwDqEeWcynPbmrc4KdL08GvzisqwMNM00i47PQ
 O8UtxIttLYX/SUdFzOLmTFBYsb1wIzIYYVT5na7RkcB/aIxYiH+AjIYx907zHuL40NRKRma7X+X
 RlBGn52T+7fP11hDCaSrHg5n7O+/8jTHJA5pddr0Q1tdkcdSpX8dDXQjpQI3O3joZchVP8beuNs
 l1b+HQ1BB7dZrefz8PjvzLk2Lfc8tY+ZSgx2ZrVGz3YnbqTf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX/KzcdQIozCo2
 sQxYAqezxu8rvWSb0LpNBk7444v0xKl/JdwvTQFfp1Dk/1H2xRBVqupf247633hlXyqgiq7wcTM
 Am2idHsGUtHoJJINC3ufen6SHsy+2zxxDl8rwlmNLn/qXZkZCyCsweAyWGe5Gz4fxvAxoFXKxNF
 2uKrk0RDuZMwUFj8VklXFPCpBQeadbAozPhiLda0/ylMp7/VYSVmFSKsrNUYx3kP2OTb5oS8oEg
 e7wORhia8HcGiWhN1WxQ8NDFEz9dHGHbJ6TNGPHvYGtZpnlvo4wOQP/V5mqU+tuQ8awU/Qilb9e
 UzHzKEakfHJnApvCqV1gMoBwSaQvC3o3XSV4Dth0C8OVEGrRi79BVKW0f9R4t0XnW+opssHC7Dz
 E3ESkxH0AUhZNqmV3kdLaTRKGqFPzEbB7aPcPcsnT1SnG1cu/F021bU8n5mAhz71jv/sYOOg
X-Proofpoint-GUID: _FABvRZQWr5r15tOPHu4hDDw6eke9Uwt
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682f7554 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8brcGD95nZB0FecW0AkA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _FABvRZQWr5r15tOPHu4hDDw6eke9Uwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=802 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9..9658561c4cb653ca86094d67f7b5dc92d36d38cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5


