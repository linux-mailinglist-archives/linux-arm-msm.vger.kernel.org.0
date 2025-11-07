Return-Path: <linux-arm-msm+bounces-80729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB92C3F422
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 10:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A0D9234D41D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 09:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112DA30214F;
	Fri,  7 Nov 2025 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtC50B3J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJof301a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C73064A6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762509024; cv=none; b=K/ZSHXhoQtwfbcGBYPCg7gkg8juj/Ob/bWsU4Wo+f1t+43fs4DAofFjnDkBro4dwx948XJUNqPq6JGU4Imcd4v4eUEHfMqw00ZRz68yEPN5xcLmfNHy6jqvmI76ZHfgbJO9W39Ws0orA9MgCS9MpbSBY4uKQMrFuy86VVHFYtAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762509024; c=relaxed/simple;
	bh=6P/wa49Qtf472vl5A2xDzZB6EbGtxlO88vWP6G0OA7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpGFfFAnHvUnk8PmcY8okkLhEvxVVqSPrGvM/UH43Pw6J+0gBSnavHPejwhCcfz039rbfsDj1Vu6fSSgLNCmWLfCdlLNPHkQi+dPZqgceBVw9gvz78iYNx1d8YBRXiyxsIN+CdodNcG+xMpSdOqjpjeod0uzlb1e8tDeGW8tBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtC50B3J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJof301a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74F3Bx583635
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 09:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNQWy9Wb32Vt/5WVl8jiZo6GiOHz/Awe2xB2GS7iemU=; b=gtC50B3JDCBMyiu7
	ZdjV2NDGhwZ9mhqQlZuUTi/dPST3fuD7VZqOJd0GcHd8NEQhDEmVjCp3qArMoi5B
	kxHPUHQKuemlrBmeKuZG8lmf91btvei2LxPqUQC98Uz6snT3pvxv5Bpbl1izMbHU
	Mc44L6uqbEGNSOiMC6GtA6D98+8S9P6XetskCNoGahsSk+cCvgyAtcKgKSjKDyYl
	Ryr/Y85qUgVeaedzA5IZLgj0XsQBVOIyHN1JYGoGXfHr6s2gmLw3hOklcW0lHXjZ
	tMWLNUh8anuvpSAAB3Aljim0zu9zuVHfnlPgDvwq5vOI2r0OZlBgB5dc+4oY4kfk
	QbAAqA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjm1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 09:50:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29085106b99so11938145ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762509021; x=1763113821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNQWy9Wb32Vt/5WVl8jiZo6GiOHz/Awe2xB2GS7iemU=;
        b=aJof301aGyDQrY8eU6VRzm2e8zGJY4mQKSuaptnnS1jZfUt43pAu4EiB/PxhtTZMzv
         h3IC+/7Im9U7pmfH81ct2tUd0LWcYrhaCWn0b2nRqhDFp1r/j0wE2wqyTY8u0h63pJ1v
         T46CPNhQoF1fiUTVcDRYq3CKhVEDGaJLrm5oMCpHeW3rjBSg/03V5/XrYJEU4iCcMOfK
         vu49RMRRnrMrzxDQ6VaL5B/ZpSSpto/HSWX5yd4kD2WRatve4aayYrjiTMi55fMZQAOl
         JNxLURB5pBS4UtHpKpgRbPYf3+F93Eq2wO3TEpgvveN5rtKQH+fIA8ufwCjtbgeOX4vD
         5EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762509021; x=1763113821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNQWy9Wb32Vt/5WVl8jiZo6GiOHz/Awe2xB2GS7iemU=;
        b=kZHk3stQTwANWyp5H9C17xbipqXXQHpiw8IR7sFUHeafZyAgdGHIBJT/nOkn106McW
         rGYcxwa4eyEtdxsHrF5mxHDVjxPJKaByMGv0fzPIP1OqWXUslHL+T6u422BtpkJIOi6+
         3kLUcBt4whK4fD24x67tzXfmA9W0kjAEZ7bDu93gdI+I1c+iSESGIVEB2zARpHp4Ay85
         sZfrlSNVymo9zhnsHRTZPG/n9Sa0sKx2XGlxoOFtGMwNGSeTvjsVXWHV5vdg/PwyfB1O
         YVqnfBmF/SUMjSHwiIAhRacLhAyEinR+4AHhAqQzfqNnlcIW3Az4P2dNgYEJh/uUEgx1
         JWNQ==
X-Gm-Message-State: AOJu0Ywa2f1XQEsqyu4RoUnGS1kkfw1sJ63Rc7zPe0zo4PaH9d98Om3y
	1+2ussL5zpiSTO8Zrlfdf7Y9jrHjwrD9Y5fvFiCrzTPvKvOG6Lq++4LX2uBP2uqMtwZNvGp3Hcd
	Z6ApPjSdcws1duAcYdsefM2pT/eCCmP1wrvgus93q1VnySv4ZLUZ02iN6pidATNS6BUP9
X-Gm-Gg: ASbGncszOa4fqWhXx3QFTQsNNdsO944YxJJYjcBgJZtAY+QcK6oCdsfIfR4pad0+rry
	iwnU5FLFYUe1SQeLHDopq0LXqWT7vXRQo6Mtg3f+QG3ZTjS5bsImWDkrElxgjHG83mPPQVz+iT2
	wvPFUiDtMB7VmMndxVxtlJ65PpJAB9aDeOABlYqJezkWCh5U2f99kBSwQNPh2kJOdS01AV5eVMY
	IbgIyVM/ybuAFxJ8EJxdK+ucZU3eurvyiOIuOlpjQ6cj/VmGuCu1rnU4TAXK0vaSCUftp+v/MHu
	+s/Wb7wTZ96ZFmEEuRuruqyYQ6wrrg+6VwgYsDYQ/X5HK1+XwB6z6RasK3Zf6BUHRIUzyk5uylw
	O1YvQjDJcNMSsGvNlUxrWTYSJ1+kLrHRD1Q==
X-Received: by 2002:a17:903:fa5:b0:272:dee1:c137 with SMTP id d9443c01a7336-297c03bde03mr36791095ad.13.1762509021106;
        Fri, 07 Nov 2025 01:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA0mmgQM4xvrCtOCmHy0CD2UOrJmYhzM8Ywz7NPTofWuXKaMDwC6ZULOFtH9lesh6h7OwzOg==
X-Received: by 2002:a17:903:fa5:b0:272:dee1:c137 with SMTP id d9443c01a7336-297c03bde03mr36790465ad.13.1762509020445;
        Fri, 07 Nov 2025 01:50:20 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5f011sm54975895ad.25.2025.11.07.01.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 01:50:19 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Nov 2025 15:19:40 +0530
Subject: [PATCH v3 5/6] media: iris: Move vpu35 specific api to common to
 use for vpu4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-knp_video-v3-5-50c86cbb0eb8@oss.qualcomm.com>
References: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
In-Reply-To: <20251107-knp_video-v3-0-50c86cbb0eb8@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762508991; l=13761;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=6P/wa49Qtf472vl5A2xDzZB6EbGtxlO88vWP6G0OA7w=;
 b=Kwth83k+xMZgmB4SQJjkuv+/GXzt042k1QCb+zKMGuhawXxgseg7IerucUGAtkUfYxCNYjVra
 OreiSno6oH4CUtAnH6aX/0VvTWvpbUcKvb6vVEjJKWV+5VZyztPuEU5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dc0de cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=PEWMjObkg-UKx6eyHxAA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 6FkUYSWkH8W5P6tJccMXTjQAHfZ6uKoU
X-Proofpoint-GUID: 6FkUYSWkH8W5P6tJccMXTjQAHfZ6uKoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3OCBTYWx0ZWRfX/EDSwzd+FzzO
 sxqT0y6gxf+ETG7RqYSc7JctG1vz1CLA/LoOghYki37CfnnqQNMldy8TLFR6ZVLQJ70FLUkRqIU
 wpvtL32mudrhKxpV2wso227MT1yInhVstD8vlojXiiLPkebOXrdw9LyIM+F7V7jekFaes56CJP2
 qHilXGuXNVpGWqxDHn+fXSdKlRAwrn/V2R9CHxqmBMrHd4vYOl0nD5q8RVOK9MJ+2pxK9ednx79
 K8xgulMxhYAMzUUPOah3dLkQt1VQhS2awfNj3JI/bKTvoDmvn4RB5TuAb+IrgnR09iVzz+N5koX
 1PqX12eWOWBZWTAz1cqFr1GVRjix+LRXAVsqHjTYl8/GuNRMwbkfxOwl72u8UzP32Do+PQgTT+G
 EUclNTQaiAhoUa4KblEVimmhkMXMHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070078

Some of the sequence and calculations for vpu4 is identical to vpu35,
namely power sequence for vpu controller and the clock frequency
calculation. Move those to common file that can be shared for both vpu35
and vpu4. This patch prepares for power sequence for vpu4 which is added
in subsequent patch.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 157 +--------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 141 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 3 files changed, 151 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index cd53bcda3b3e1d6f234486df49a51150a7ec9799..fe4423b951b1e9e31d06dffc69d18071cc985731 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -16,8 +16,6 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -262,155 +260,12 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 }
 
-static int iris_vpu35_power_off_controller(struct iris_core *core)
-{
-	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
-	unsigned int count = 0;
-	u32 val = 0;
-	bool handshake_done, handshake_busy;
-	int ret;
-
-	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
-
-	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
-
-	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
-
-	/* Retry up to 1000 times as recommended by hardware documentation */
-	do {
-		/* set MNoC to low power */
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-		udelay(15);
-
-		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
-
-		handshake_done = val & NOC_LPI_STATUS_DONE;
-		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-		udelay(15);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
-				 val, val & BIT(0), 200, 2000);
-	if (ret)
-		goto disable_power;
-
-	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
-
-	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
-
-	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
-				 val, val == 0, 200, 2000);
-	if (ret)
-		goto disable_power;
-
-disable_power:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
-
-	return 0;
-}
-
-static int iris_vpu35_power_on_controller(struct iris_core *core)
-{
-	int ret;
-
-	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
-	if (ret)
-		goto err_disable_power;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
-	if (ret)
-		goto err_disable_axi1_clk;
-
-	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
-	if (ret)
-		goto err_disable_ctrl_free_clk;
-
-	return 0;
-
-err_disable_ctrl_free_clk:
-	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
-err_disable_axi1_clk:
-	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
-err_disable_power:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
-
-	return ret;
-}
-
-static void iris_vpu35_program_bootup_registers(struct iris_core *core)
-{
-	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
-}
-
-static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 height, width, mbs_per_second, mbpf;
-	u64 fw_cycles, fw_vpp_cycles;
-	u64 vsp_cycles, vpp_cycles;
-	u32 fps = DEFAULT_FPS;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	fw_cycles = fps * caps->mb_cycles_fw;
-	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
-
-	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
-	/* 21 / 20 is minimum overhead factor */
-	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
-
-	/* 1.059 is multi-pipe overhead */
-	if (inst->fw_caps[PIPE].value > 1)
-		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
-
-	vsp_cycles = fps * data_size * 8;
-	vsp_cycles = div_u64(vsp_cycles, 2);
-	/* VSP FW overhead 1.05 */
-	vsp_cycles = div_u64(vsp_cycles * 21, 20);
-
-	if (inst->fw_caps[STAGE].value == STAGE_1)
-		vsp_cycles = vsp_cycles * 3;
-
-	return max3(vpp_cycles, vsp_cycles, fw_cycles);
-}
-
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -418,14 +273,14 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu33_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
 	.power_off_hw = iris_vpu35_power_off_hw,
 	.power_on_hw = iris_vpu35_power_on_hw,
-	.power_off_controller = iris_vpu35_power_off_controller,
-	.power_on_controller = iris_vpu35_power_on_controller,
-	.program_bootup_registers = iris_vpu35_program_bootup_registers,
-	.calc_freq = iris_vpu3x_calculate_frequency,
+	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
+	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
+	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
+	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 4e574502d5139eafb13b124172ae6e5b85b72b60..ba1888705632a9ad02d7de09436fa53681249844 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -8,9 +8,12 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 #define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
 #define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
@@ -289,6 +292,144 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
+{
+	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
+	bool handshake_done, handshake_busy;
+	u32 count = 0, val = 0;
+	int ret;
+
+	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
+
+	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
+
+	/* Retry up to 1000 times as recommended by hardware documentation */
+	do {
+		/* set MNoC to low power */
+		writel(REQ_POWER_DOWN_PREP, core->reg_base +
+		       AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
+
+		handshake_done = val & NOC_LPI_STATUS_DONE;
+		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
+				 val, val & BIT(0), 200, 2000);
+	if (ret)
+		goto disable_power;
+
+	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
+
+	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
+
+	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
+			   val, val == 0, 200, 2000);
+
+disable_power:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
+
+	return 0;
+}
+
+int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
+	if (ret)
+		goto err_disable_axi1_clk;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_ctrl_free_clk;
+
+	return 0;
+
+err_disable_ctrl_free_clk:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
+err_disable_axi1_clk:
+	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
+{
+	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
+}
+
+u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 height, width, mbs_per_second, mbpf;
+	u64 fw_cycles, fw_vpp_cycles;
+	u64 vsp_cycles, vpp_cycles;
+	u32 fps = DEFAULT_FPS;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	fw_cycles = fps * caps->mb_cycles_fw;
+	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
+
+	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
+	/* 21 / 20 is minimum overhead factor */
+	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
+
+	/* 1.059 is multi-pipe overhead */
+	if (inst->fw_caps[PIPE].value > 1)
+		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
+
+	vsp_cycles = fps * data_size * 8;
+	vsp_cycles = div_u64(vsp_cycles, 2);
+	/* VSP FW overhead 1.05 */
+	vsp_cycles = div_u64(vsp_cycles * 21, 20);
+
+	if (inst->fw_caps[STAGE].value == STAGE_1)
+		vsp_cycles = vsp_cycles * 3;
+
+	return max3(vpp_cycles, vsp_cycles, fw_cycles);
+}
+
 int iris_vpu_power_on(struct iris_core *core)
 {
 	u32 freq;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index d636e287457adf0c44540af5c85cfa69decbca8b..7cf4304604cca590544a938c7e811c202cea3d93 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -33,5 +33,9 @@ int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
+int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
+int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
+void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
+u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 #endif

-- 
2.34.1


