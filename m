Return-Path: <linux-arm-msm+bounces-88845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0470D1A797
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 17:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 501EC305BD53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27439350A19;
	Tue, 13 Jan 2026 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oEN4LSf/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea86nPAR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668A735028E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768323455; cv=none; b=U+3e/KIop2fq++xhBYwgVxsmXG1KdEQI/6mhI+9HPb7IRim3aDd7Ws+EVhnUCeNIV/yE0nQD8jyoCs+1pPuk1p7CWb2mT+rt//PivdnYDbcZkWpRE4qFD6a7eyz6mL7u8qoAdATE8QwlAVk7fz+VqHng3a8W04kiOF6p3B/iGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768323455; c=relaxed/simple;
	bh=HxFHaMd8bpe8kcSdhwDEmlVS7rhk4N3Se+Zkawib6CY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fhrnnep4yvQ3b2oY+BSnNdLNPxBOG5+VAucKgi9rjcpDQjA6xSfWW1y+3QLcto84eBRzmq4yx8ohrqKjbUJyRhSI9uIzgtaX16Yl0vSC8uwJjd8lbJfZBmAGzgcTGijYsQVXu1kN21GHUTYGDZ/6KBwAQaq0NJahCSG+jxEX7XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oEN4LSf/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea86nPAR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DCX5Y53810382
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=; b=oEN4LSf/uh3mgGvI
	JCHyBf3lbKGN++C7Jb9zdIeogeT9ndns0wEy7On3NA/ag02QEaRLTF9R/Gkd5I/0
	UhM3le1hj6yabFUg/RLfphzP/Oc32aHNk+7UcyMLo9Snj94O5zpVLnxIKt9iXmEy
	WMnZi+YOZXoqjWpphuFqyDpSjNE8vtexAtBb1wQ8CY6gW9EThcO+UcZlCvqwzRQ2
	gDh3sEW7QyuUF0zJFDrc16G/ZdJD4Wqx7hSX2jWTtfGUZ6ND1eqpesThkcGB2D4j
	DHT4yKyQxqGmVOf5lnwDmZfyjSBh6a9vu0UoKECAA4IPAejiYTRKq8FxpyI83gyL
	3Lb4qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55t7a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 16:57:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2194e266aso565785585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768323452; x=1768928252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
        b=Ea86nPARXDHm4An1WLjSCoWqblDF6uRbh8IFb2P1+X/8zFbZ7zBCOhu9W4MkhGhZna
         uw8mjv5sKFtcZ8aONfUY9deWii/68s92sUjgWCb+CjW0OR8brU3EY5hbmuZh+tAKYK/Z
         KytgmiMllLGs9JzIgJdvnuPMVo6I3Iur5ZDzTp1TYXqo1T+WcSBWiW42+dZLOnAtq1PY
         w4jTS0kn5qCA/f+j73FgAcXBgAGuMrGwwkzSalQ4qXGRJ+W8B6gq+x+SdC06TgN/yfUp
         NOKfV6AQvNKd/X5qcgElZf96lLCmgmyiCytj5Zxsaq6myG1WV7cdATxKkPZieuKFw1LF
         qkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768323452; x=1768928252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ro+3CJlEZW1JxIMktHpjPjGXooS/+lR4TeEfoGxJw10=;
        b=CZSg9+/aS8vNk3PzT5tnBC5UF+lGmCB6kQmNsvLKbn+bSFD38tLjpt2SYUpSgFwmzv
         kTAgzpCN0SKC2du2YzrDtF/u2UmCV6Su7mc/eEoQ2r1CBmW8ZFJY0S2ZHZdbQweZdCz7
         1+AUYQAAMYSNCIp+N4DudPJy8Sj2KbOZQ4rlQh8TNmCAV1uDoEYCOAV1RDkxsTtKlwoh
         spCBusEOnDakKIUvWD9HbayN4/wWMHpXFl6BoVWjt+JW7RICe2Rgs4NuFdtMCqHdGejx
         kUFrhJNIIse3DfU25ugMkQzwUZQNeWfT2xh3FGX8pwYIyyIPXO3d4XF/m392kswqKuwe
         C1Og==
X-Forwarded-Encrypted: i=1; AJvYcCWH57In8VaLhZ0OMX+YnNIAasHnC10tch63zXdA4U9TIEfCV4g/dijCndSgk+JqyVkNI0nL6lfrqJeSOgln@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHtH8D2j7PK5q1WEWjyf0JqlPIi8QEWcVGabu7iBpY16wJtQA
	s1qdoyYeZJAzAkCwR5lO5dFHTAgMXJuzK8knb5Fw/AW6lLDZB96thockv8KstIx5I6FYffvAKuH
	vhFHGjHms3223OVsc0qc+OlCc5pNgdGfyaPmaoexQyMNaRISeOfr7Gm77Xo+cEm/RhmGo
X-Gm-Gg: AY/fxX59rOY+oqcViW+NyO5VdxA36NleCLYQDAC/VRtWpG3dFR9rt2qKMfx5UIMpVp2
	Zp+KRp7DV1cW61BQg9X2CmvDTH1FhFiH/DdFrNOFbtXa2ZyFAYGv4HaUOMUWzse8xe1vRG0dM51
	Ib1h32N39yRC29CXWXJFIHoAsaNxcOU2ZEcsWtwmkf/fg+7ccKigNVv/b3OKHI+xZruONC926z1
	zGd5TGIj8LtlM1Unr2hyuLapHnejDx32lDdjvU2FliD7tBhDpifAU1xnZ2Cg9Ob8F1UXH8srqPB
	u57/WrzhbAkkbTYYZm7jakzEYfUS62eWNb4K8Sh3KabEof9/n9zTU4CRbUH7/OuFs+BYCtwuWgU
	OALVetIEC1Ekk8gTUV79RovHbvSL9m+QwD/V1XfvFJetnAFo1NzOcoBNgnOE3c7bHlzfW/7PgtR
	kxEKWU+NxR3E/FJV6MOXt+/vY=
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr3069766485a.33.1768323451783;
        Tue, 13 Jan 2026 08:57:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPHLZZnThHtTThEN8TS1xdqz6/f67rjIpBLh9wnaWrGH00fV2A1b/2bIaew/04IQxVVL+JJQ==
X-Received: by 2002:a05:620a:410d:b0:85b:cd94:71fe with SMTP id af79cd13be357-8c38939d0b3mr3069760785a.33.1768323451032;
        Tue, 13 Jan 2026 08:57:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:57:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:18 +0200
Subject: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3148;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HxFHaMd8bpe8kcSdhwDEmlVS7rhk4N3Se+Zkawib6CY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlzPuHC0ez/0yoHc10b5Tkr41czJWLTpbCaa
 hgBcrNbGT+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cwAKCRCLPIo+Aiko
 1eZUB/9+N0Ywz0eY1QGt5LDLkbXaFL0+wZkWQlc8fWbBMZ+R/ROFJY13kyW35e+x+2EuVe/w8S0
 BLMKr+OCrK3VcH+GPkUwfu0XeMGQAzGE6LxGg0vmHgYXhZNt5ivjMYIEjLv8Z5uFMQmRwA1A6XA
 pfZjiO92Dt072IUGnIlqlLZWauMNFX+U1GbZAdQerwamJ7mkjJoU5Yq7RDazTNfENgvLWXnGsRF
 eVm8hwK0a3Ukv+E6BJaT6JguMAagAyzjYALEFSwMLBfYwcUEWikDUScPfCgkFbtjns1YfExJgQY
 +vlkETBKu38DBiJutiZc3IErf1Ll3g7sd6GfFZUeM4cOpJKz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3S5bepcxKcyJqjuHwsUXEgfLKStcAPiD
X-Proofpoint-ORIG-GUID: 3S5bepcxKcyJqjuHwsUXEgfLKStcAPiD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX7LcjxV9rb4+x
 lboOc5WFRbtljuGgWSzU15Nl8Pk7MqrOMy6K3Buhh6HQ69LcYt37WOMmn9BaYpY/c+r4Ry2kq4c
 dDarzotEEfGISQF8EYAr6Mx5mFvc1U+vgrOuXXbd+/6V4i07gvDKdVdUYDlYDG9jJVD4w7+orfj
 Q3k465D8fFaOaBig0BAgjM/S5V/lOn+mNmBtipH1xc6A7NyNGRLYKWXcpzC68vOW60FzldHD0i2
 i+XZzy2Z91NB+iF/GXv/5HvYCQ5hYf9RtKzUOMYi1xVKi9ldPf530e/zTQVMqPeDPGf0NODbitY
 ldPf00+1dGjP2mRHxhOxV9cnBXs8swZWELpa4E4CUek3pa9yFg/xovKIjYdqUlC4nAOKyHOIh5f
 CA5Y7e6oSTK4eVMmwOSE1cMvhy8Y1Oei7oX4GiuxFK7hbW+QNFCHcgO0Rm7FDqvghdfP7MRskSc
 ga7Fjl9mpFp9N8LQVmQ==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6966797c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576..85e531b35ecf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3


