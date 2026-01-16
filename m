Return-Path: <linux-arm-msm+bounces-89328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85183D2D312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5013300F670
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 07:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42860350A07;
	Fri, 16 Jan 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGZEXB9B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UA36ZYBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21A34FF7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768548468; cv=none; b=EiJrN9i43qgYU2zj+Tec5NEoHA9CdsJbV9/Ax+sgEgDBKXgHJGLMVsrvqSUNClGMX0EUnQf/My6GaY79JlgeAymQesZJaSbAjaAk1+hgwZd5zKvSZe0bYZivCliEiufcBouicUE9s7sTRnrHYH6BozMufaoX6w1AcSiC8syYqQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768548468; c=relaxed/simple;
	bh=NJlond/l+pvaPzxG2+3Rh8GZXYyqIPyIRMdtfABwyGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+FvBz3xDKjx4Yeey9L3/1zk9nZi2/4BwwCxEY/Jk8AD220bbU1QKXHwWrKW/SpUujBSaqka6+1KjFcZISRs6GrOFtsW4wItlqDVfg4WplwDm3V8KoakrGOEb2pf1iVZZbNiRunoTgDvhiBRZ8MPSHyIzm/MCBcy2p9B7PQEOcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGZEXB9B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UA36ZYBb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMaPX23192399
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=; b=GGZEXB9BsJS4YR1q
	GnMo0rSPqCuU8Q5EyQrs0btXMall62kDALqebtciHeKdkwepXXXEbiNNREK1OPNs
	wz2JfiMAObgpNCcXUk8t1aoQ+6pxsOQhFlScJGXkvnvE16R9+zAxBq+E1dL27j6S
	n+rbd3ODrZUioKpVz3j3Eg2H0lGLEkQt0rWguKQWLL1XiPGSDeJA+34+sL9P6IVg
	x5Yn9qPYYszKqDz/gM/1d+63oRt3uuL526GaWXnALtpE/gJaf9kjxnnJDFuTqD/Z
	ZJnAkM37LS6Vm8xf36nmGmmSw6S3bxuPUllr8j90lk8QPkzUz7GHiBdxemORLUhH
	8HtMhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968h804-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 07:27:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so786897585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768548465; x=1769153265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
        b=UA36ZYBbONJ6ks97SJHJNmBh7htTPrZEiVj8Z5lBQEqD/Ze7lcM7VkutcjNOJU2J5e
         l35kUTUZcUdXhq3xFU18xql5zxLnjZOxoZgW9G+tz2IkOE2/eBylRM89L8O9BEgasYfq
         NN6DnS2kw8HPYRK6x6pRuou+nPJt+gdemcqNByRAemauA3DLloJD3sy6tAY/btwPh+LW
         PETVRyeceOEPkS1JR85Hf0NWP5+h+NlVdI7nmdagju765jW0z/8FtlA+OnN4J4aPWqYE
         F9GKVD/VosUaRnt8XDwV+jzO1bh7vSHr+jd86aJqRWSmx+D5cOGBG9xkCZtlHLAWXPIK
         MhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768548465; x=1769153265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
        b=PM/mtrlCLX16rvaMdHdheIveYBvoJPphKpswr1rI7EgAH88NhuUAtSXsbpWp5sx3kV
         HJZ1bC33ClNsP3j1ZQNYACEHZYvYP0xz8L7QsydTWMMRahum6rZjHVUSUibF+pTuDSFe
         6iMI9OQnsXBozLTLcPSG5J6SOM+eC1JG4IhBdlY2ciHbRWw6J9OWTYoUFjQPC/tmgZVJ
         uIlZwDWxo8BiZMWjkb55f7d/hmoeEdYiYQrdsEYTD16kiCNEuHT6S2U6LwAH9etCqsnP
         HtyxAT5gSYVgOm4R4e354/7pyf+IIq/tkqkoGMpmWNnZqJlE19Ed3lujJF/MrFZLyRzL
         NYNg==
X-Forwarded-Encrypted: i=1; AJvYcCUFubZdWIrl4EMH93Jvsukhkp9Jf1ImcTxTlZZN2kBzOGVgyT8NyIKxM0X9kS5rXj+QsDpV+OJjSuiG8BGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKhz2U1K4OdpRYfBFNFRY8w7bvOSNb7v17P/Zpae5AUs/fHslL
	vOK0SvA7JgGq0+52ZlT/ZX/P4TaTAOwLlNaFIgdjA6FsDMAz0ymKb+4QXhOdTSbL6WpZR+hqi/n
	sunU1TT7ug6oiS5pPU2sAUmM5uwAU1cnAo7D758jBJTFLnnP5VAhbr0HF8457F2fLkxFw
X-Gm-Gg: AY/fxX5482mibwt4FaoItYP0ElRaPXeN432g3V2BKwq1z0BBRqve7lZ3NUiXVDXevxI
	bNphcT1EpR4evcfe24lUD1/sT39kAihycuhCxu9hX97FO4WtIeh7F/WeZxPFie8yDULMlEv7uho
	AW4k2cir/4mnh6oiN/shQadPfLVMkvPbv7vxKYy4Rs2lPuma8qXoNfsH/GPDjSZgYbUEqtQz22J
	aDY9wywsMFoSW2LdS1Ye8FyVhyK96JxwXiYNiYEwhy4GgefcmRGeW3eFhE39y9qWySpByZm72i/
	MYaexYNofSGP2+DkciHtFxKveSX6/AzhIcWkSe9e8ASM2njfym3f5EfBKyg5wNt+vTtzwxC5Fnc
	TUzUBniRNmoXWiHp+JI8ap9j8Ef/X0GR7TuT+L2k4+ga7ndL4dp22uxM86XWoexQDWvV1wW2Z21
	2pZxn/xEorDwQ4g+4fqt1usJo=
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id af79cd13be357-8c6a680c591mr276449585a.0.1768548464917;
        Thu, 15 Jan 2026 23:27:44 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id af79cd13be357-8c6a680c591mr276446785a.0.1768548464351;
        Thu, 15 Jan 2026 23:27:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:27:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:37 +0200
Subject: [PATCH v3 3/9] media: iris: retrieve UBWC platform configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-3-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJlond/l+pvaPzxG2+3Rh8GZXYyqIPyIRMdtfABwyGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpSLK7eOuMmp9/+kNLG1ooHmenK9K3vg4xt
 jzmr6bz2tiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1dThB/wKfxVwqr2XC5pORtSw1x3vtVL2Rn5Xauf2HTownr4jUtpxhFHFEG+8gh6dgZl1VQz/cA6
 mi92iIz8/PSP0oHvNMPpENoQi5RU8GwE4gdeVvCMcVcZqQEe4B2PTYOdLzoZJ5HhV9TiGcWyGQ1
 nhoMse1XdTg6+Qp9C7VKoQF6WbtrpicZMXpL4o3YO2LO9dIJYFxokCgs9ac0wg7oI404iK3j2ne
 Rm5pIPj/Xv3heMl5ooTMOGWCHnghyBeJTltAu4nK06CSKPBkAIPzaYRi1Z186TWcDzQh/G/hU/G
 zRx7tgHbbXEE2ckLyWH33YKnzu86ZGI23xhBwyGcO5OWuyfo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=6969e871 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZgEyZQssxN-7temgAJ7d4SQl---xKNWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX/GI+KKnG0wls
 EgXQ39dVvT/LR33ujgbW0hvxgBjPE99QA2FBZ4wsPKOoiQkmsWHUhBPgTE8MbPUZwMqaLyZT5cq
 1GcNpm5UAa9fUWEZaB/Tx8ZDuJvSVJDDk4UZgpMqbPeaJKyS4TJ9guJ0g7rRrR9Dk8mwQpzm+Qa
 tDIpi+lrX5J9DQ+dqo1QEmeTiirrpkJ8zUxBgLrdchGKimfWuBqwznuExIyQKshB8cOIBl3t/06
 bb7tojzzForcNlv+Xyz1BnqkhNTzCwm6gyj5bgGhwBFEulYi1PzB26s9gJJzMQTMH0JP0UfbSVj
 5qOwIJ74jlEDztd2yhiYWEU+1dvXvvHaeZK1XvNgvwYiX2sn126qeSosgbKZnDDh/3YZet4/ZPG
 OSA1W1zGD3sI+TbFGm94Y9ub7y+6emyJ92wEqKZ3pUSnxChEyb2wuWG0vmeU5e9V1YmmTSp6zmr
 X6aySE2fitaiLJnCU9Q==
X-Proofpoint-GUID: ZgEyZQssxN-7temgAJ7d4SQl---xKNWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
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


