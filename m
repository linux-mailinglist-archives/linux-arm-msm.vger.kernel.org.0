Return-Path: <linux-arm-msm+bounces-74713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70662B9C7B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58CF6382F2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22BF21ABDC;
	Wed, 24 Sep 2025 23:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khff/Shm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535412C3268
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755779; cv=none; b=mXeAYTYwEz6wdwepkyYVKXbFd+NmTQ9ECm30WXSZXyQEJQWybtoKFOzVRMVsIJTXmoXpKco1o3ZiYmM/5cvWBvEQrVjPI3Uyx4Luu8YjkzcR+vmjmM7gFpYNb6v9UkccKGj6pnS7IJAMA0fi/sS0sl1+5zGTt/B0HWAtmKP6ZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755779; c=relaxed/simple;
	bh=XwjJpuMOMq7BISJ4RPudOTebpQlxQfmd6veQP0wZOgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dK1bihHUILKUgRJFHGWPQPpNBameO5oWx+GBtScofDZm8L6B9es+B3qyYD5y67XqwcYvcBabQsunEhc95OHCMSNfNlmwoqTTekBmqjgDTnic7XhjjNB7gO9wy4ZA/ObcGXt2se7AnG9xbZZSNF4aNBm0nvHr63M0OtdZF84Kn9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khff/Shm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCeTTu016436
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbK0nLOoJgC562Sre9RiWxXhq9DvCscrdLVA2y+RRqA=; b=khff/ShmExBMYWnY
	xIVqfTZ0ZytwaOZT6LVaNkLJVR+dWh68va1YtCLJbu0QRp7mXsXkBkKVIc0ZQmhl
	ycbFsKU9IwqZa7Z7MbXtRZflPfGrAxWVTO2DLmnHCxHKt8E03JWWE3wgQxDwWOCP
	wb+i6X443CihWVDJyuulJyLiF3G46K6bqJn0bs9DYReyebpoipV8sTG6LlI7fe9X
	08E48oV+pR1X3H3TJsUfB2sQNXsZA5ZxWcyIo029WbkANswwamyehDoAqbi6ZdZP
	2soYD3Q2Ia8TYF/ORK0A5vEEFMi0sqpyR0GNyKmw6P7JSxeKbyBdpkUMdfGNF1bt
	2E/fOw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhtrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:16:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-244581ce13aso5357105ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755776; x=1759360576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbK0nLOoJgC562Sre9RiWxXhq9DvCscrdLVA2y+RRqA=;
        b=aW9LvfGDzPMYDNJ5ExPJNiDnb3Wb0gLjv5LNt3beF5dTJ6jj5NhRjXK24GmJp+MxYf
         ATWrAPzuar5Sv0Bv2gzUkGHh4wi6xVrJcR5B/TyQpW1JbtB2dIQIZ5h1awW/cTTu8Dme
         xZbOJQDSML3s0d9emEZQcb/DnKAE31JdPoNycibkXoU4U00fQyoz512lfgB7C9vvTn50
         C4uKtLlMsFH+NQt7X/P0a2v+AQ0Pe73hAFz4Zk+AQtT3wLHMWeFrWa5DrR+/3lADP8BO
         rK+o6XF+7UxBj4h6NXoDHmu6+9eQMf8TFbGTW/4C4N7/rwsOmAcNvLxO5UNT4QrjCjU6
         v1gw==
X-Gm-Message-State: AOJu0Yzx+NUxM5UOcU0qCheK24cT+eZfoldjbfmLXZQnDjOXyiBHFmi/
	6FnCbrq3B/E7FeWXbAhoSCamqostQpMQ+g6Mkw1+JTH2p3be5OMMjdhjMr82G66KH8/nrgRHChf
	0vcbFvTKS2Pw/D4OwbnsI1xld4CdbrwwvP4b8+BuADMAMBme/Pb3HbHowK4CyHmnnDCe2
X-Gm-Gg: ASbGnctu0jH6onM9oi0ZnjbJKg7Jo+VkDALIkH6AUT4DcFpUDNrPFr7z1Z/iZG54j4x
	4/slWQY5cGWikRHoqy2f5g1dEl4/zy2sJsNbGdV+Fo+2kueVoSH2XO0J+Gtj1WpyxyShFzb83eD
	3M/AUxMfeBH3oovRrT1AaAZA3rzo+Af0ueyIsVSMkfcUp7QNiMO3KR126ZI58E/hPnRGSHqZq97
	AAOv96xef87Kkp/DCgc1afMB0Ctv8mu1Nasg8GrDf7JPbfWUHdzk8smjYE3/TXL6i3CqHR2Fs+4
	QeojTzLW2PrsGWExOZy+emBMEhUdXJfxBtNA22CnRuTtx32SyB4I5iKPkKSNK0mqEvwHLl40l9g
	=
X-Received: by 2002:a17:902:e806:b0:267:e097:7a9c with SMTP id d9443c01a7336-27ed4a5ec6dmr11996615ad.53.1758755775486;
        Wed, 24 Sep 2025 16:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEspf9bWDL3/QSHrdIwndVRfADOgG8bMSPMELvLNd+5MIS8VU3fMe2eoZF0lZ5mcH2efMAybg==
X-Received: by 2002:a17:902:e806:b0:267:e097:7a9c with SMTP id d9443c01a7336-27ed4a5ec6dmr11996345ad.53.1758755774912;
        Wed, 24 Sep 2025 16:16:14 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671c156sm3964175ad.50.2025.09.24.16.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:16:14 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 04:44:44 +0530
Subject: [PATCH 6/8] media: iris: Move vpu35 specific api to common to use
 for vpu4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-knp_video-v1-6-e323c0b3c0cd@oss.qualcomm.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
In-Reply-To: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755747; l=14083;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=XwjJpuMOMq7BISJ4RPudOTebpQlxQfmd6veQP0wZOgg=;
 b=cFBGD36A5tYXkyXIrWkQzr6QQZQl1w9dg5fLc8YEO6UEX0smRkfaNxr6fdNJgk4qMJktJTw4a
 GMytH/9Hb9dCtN5uiI+UpvylqhUjVASqr8tShVtRQ1yCWGA4C0+09pc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d47bc0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PEWMjObkg-UKx6eyHxAA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KHgNGY4sbOiU_wNXoJP6_BUrYbRLnOSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX/MC2wsXdGhLm
 Iu/WaQMhsy/oI3AZwnLFl7xjljFvpKuibOiQF49owSoMws9pNMXcjdZfPJ0ePyOUQe1bxnCVkXL
 qromzN1vCKa5KlqFOUhyj+YPbWkcR7BKkC1HV7vQuK42FMCKjtWA8sfY3aI5JFt1+SovrzzIN6f
 26ZG2vmZQ1UR2YDYUAz4RVAJEFQSkkrFaeF1HPrlEAmxlK6moHycus0vReQ5b+TieGjpHn8lVvo
 6cbtf0KD29sn7UkOpXVSTLmsddFNQ0cD2wFKSIiSkE7y7W0wZQsPbGNejJ4/D2ofSnwbxAOtXjM
 2efj2UQgN+FzPOyjm4JTRlWbauQZO+j8Ksz6/NAwt4CXHLBk64eTW52/qQCNN1oRuZ/kgawCEBV
 SnZyGSJo
X-Proofpoint-ORIG-GUID: KHgNGY4sbOiU_wNXoJP6_BUrYbRLnOSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Some of the sequence and calculations for vpu4 is identical to vpu35,
namely power sequence for vpu controller and the clock frequency
calculation. Move those to common file that can be shared for both vpu35
and vpu4. This patch prepares for power sequence for vpu4 which is added
in subsequent patch.

Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 159 +--------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 143 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 3 files changed, 153 insertions(+), 153 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 0ac6373c33b7ced75ac94ac86a1a8fc303f28b5d..3abfb74dbb10974c8fe3cedaf67e8b4fca421015 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -12,8 +12,6 @@
 #include "iris_vpu_register_defines.h"
 
 #define CORE_CLK_RUN				0x0
-/* VPU v3.5 */
-#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
 
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
@@ -22,8 +20,6 @@
 #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
 #define NOC_HALT				BIT(0)
 #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
-#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
 
 static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
 {
@@ -268,155 +264,12 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
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
@@ -424,14 +277,14 @@ const struct vpu_ops iris_vpu33_ops = {
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
index a7b1fb8173e02d22e6f2af4ea170738c6408f65b..dd0990d143a624d83e241d9970297ce1abe37f74 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -8,6 +8,7 @@
 #include <linux/reset.h>
 
 #include "iris_core.h"
+#include "iris_instance.h"
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
@@ -48,6 +49,10 @@
 
 #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 
+#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
+#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
+
 static void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
@@ -309,6 +314,144 @@ int iris_vpu_power_on_hw(struct iris_core *core)
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


