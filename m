Return-Path: <linux-arm-msm+bounces-77793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC83BE9257
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 16:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68061AA2DF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EC533508A;
	Fri, 17 Oct 2025 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XuX5RrM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E102335075
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760710660; cv=none; b=dYRIAZP0A2l3OKU0JVp/ZUBsl3itNQxK9fMamGKy3wu9ZA7aGtgY3sqmj9z+kGJJUshjUNQM7o6AYwYAebB7avRot4Lf5sqwKMnBCyFViiJmfB1jv7vw4So00hKUJloqtodbssmGxGQWQqvwEFN3yR7HXfw8tS+35s75Gqvo26A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760710660; c=relaxed/simple;
	bh=XwjJpuMOMq7BISJ4RPudOTebpQlxQfmd6veQP0wZOgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CY80vFRppJUbx5Jzelp5PDMp5iXif8SsURvwiyJxzj+6u9k3X3dCF06gV7EmHC4GKNH9XnlIfo51wx+7Ykn7cRI4bowc/S4yXPg7xX7b/B48l+AQ+LiaQ0Fj+ykvGOyQHFEwo9ytxIOIRSo++kP2ErUtKRjXTkC+pueruLQjpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XuX5RrM7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H87S2l006554
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbK0nLOoJgC562Sre9RiWxXhq9DvCscrdLVA2y+RRqA=; b=XuX5RrM7PUduLgNo
	kTdfLsq2+/mYb39+XwzUjlRTUlbxLLhjMKqLPCunMuomgCV8h3yNDoBKgo+lSSAX
	ysoDFuMhR7FWU4Szfh5EfV2YeYgKGvw88+uh4lfwxBt7irUb34cLEiO7gg35MSFV
	Qy8IEUMFq3EgjCjnU1nDapQ9gErL9/0nwA+Zt46q/i24H72mzS0kgYp/vRXYys1J
	7tLnJZQL9jO1I2L+YpguGi4buiw2rpqFelRaX+QC0yC0L/Fhio9Ue4PKpqgG+rgr
	IzTSU/iFPooyoNg1APfR2iGTm1cSAzuYBuw9pnJJS2wFPOX9FkrpNnTJhL7RvbG0
	5C24Ow==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff14evv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 14:17:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso3608767b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 07:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710657; x=1761315457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbK0nLOoJgC562Sre9RiWxXhq9DvCscrdLVA2y+RRqA=;
        b=YEtRAEMW7gCBE9eVdDjvXzB1FDbH63F4zcJIV6qaFHw3xg/VHuYFSDx7XuSBDY/rgJ
         dajTIx+IYhDakduqKo/eFGwzZL3ZI2aRwzUQB3+ipAlGD+KroZ9dul8n3NSP9DoCr5cH
         roN+uyT88LBC5xTgRY8N0bkfdDJ+kXCYJAnW2sswhnkZTs8ydkrVq5MS6KrDPGgap11e
         GjnpRX4o/h8Tcvay3J0faJ3SrE568xM9y0XPVjzGvVP1qhcfvZDvhHATu9hmQRwKnFMl
         QKkCD9OO5HhJpFmDMw/pvgnT2N/BKlq3zkt9tBkiZZJbVYT992t3wc2AUYP/3gP3rRXZ
         MYwg==
X-Gm-Message-State: AOJu0YxCmlYgiDTYVCDgHftsO6tpj9hbzbVc1rTUmhUmWt3LPsBd3GyH
	oJrCAnwrxNR/anvQwsCKj2hofgak9KhZ4Gf3aDDmY4+hHj2nPGqCEyN4jNnkevbgi0cI0TnY+wq
	9Noav5OW92fGCistXp144UUtLL2CFcXXIEIoWNSw/0oQtQ9CSmLacUf43ECnjHo7yqXQA
X-Gm-Gg: ASbGncuCF8fGudhi9oMna2nmWtMQAqjBI9FSP2CtEFkI0hEKqwdFTnFdXQXq7ADIGUy
	7T+y/Y2cdH3hTjbnbfV5+xLlGhLSVwsf3DxUi7G63QJKaPij8GZxx3Gr2CAnNWPKM4CZrQFAARf
	e0sSVjuhlenhK8WulW9TuV/G7hX7tBAdv4dJ/F/HQ2p2EYyatK1QCT9KynpUUgD+9KWfKCRGnXd
	fa09eeex5U5o8+Uwij6Sms4kPQI3ckK8Fq+2YdNP2uyri5QtaDyaXPgrmGLGIebHl6714R1rNZK
	4pCe07z4OdOo7G9Wca5mYL7dVC1BPd/2gRzHWaEpZ/DkZnpDn9GiAV7XC8qmhTZCWi3mjRMiitz
	1Ao0pzWtTEb7SB+nBSIZiyP7RsISCGssclQ==
X-Received: by 2002:a05:6a00:182a:b0:781:8680:3175 with SMTP id d2e1a72fcca58-7a220adb84cmr3939306b3a.21.1760710656508;
        Fri, 17 Oct 2025 07:17:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuaa8+Dsf/MnYS+GbTx2sKQcxyr6H6Ypdpgab2zxTSrSkY6vf2MwCMQXh5GcliS/Sv+OiO6A==
X-Received: by 2002:a05:6a00:182a:b0:781:8680:3175 with SMTP id d2e1a72fcca58-7a220adb84cmr3939263b3a.21.1760710655979;
        Fri, 17 Oct 2025 07:17:35 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm25895826b3a.40.2025.10.17.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:17:35 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 19:46:27 +0530
Subject: [PATCH v2 6/8] media: iris: Move vpu35 specific api to common to
 use for vpu4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-knp_video-v2-6-f568ce1a4be3@oss.qualcomm.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
In-Reply-To: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
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
        Vishnu Reddy <quic_bvisredd@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760710621; l=14083;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=XwjJpuMOMq7BISJ4RPudOTebpQlxQfmd6veQP0wZOgg=;
 b=T4huyblTD3We+dZdsh6vTRkf3pnO8MMUjVfsUAqDrmuJtxmC4Fb1xN9agReSdwKrSQiUjnk5M
 cdzRvEQicC4Bmr7Df8lgiZEohkctpuzyPs7XOtv5Z/aHBfxzc/UBCaJ
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX6EMlDA4PxqJ9
 Kfpnbi1dGwb3oUXrZRT1S3YxjZZ6XasLLt+wamNzIKNoH58UViltN7OzpW6nhjP6WwqMYr5XUSv
 cAGM718imsV8zpOzb9J4W1VHYrVimwWhbGXN5hv8wAFukdVEA3EEWFWqPEkR0U5tY8H9A7SaI+9
 r2JsniDsy7x906tT1o2LJJ2Myfuvowxid1nwsg3JDcywXx+KsEed4RYJfs1rASUXgz963mcHG7a
 e/7MDPCPfbwBjYcPIUDXTmWcceixDVjEIY9bOi9UceFXQJOcgTfKWLOEVxM7ztpv8nKFnZwd3HY
 SNErzfpa0eTvHzarn+lWGEbUY8vYS2f6F4rtdZEnw==
X-Proofpoint-GUID: _BAX6J0kWVDd1MLhMkxWeVTvy9WvCDKd
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68f25001 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=PEWMjObkg-UKx6eyHxAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _BAX6J0kWVDd1MLhMkxWeVTvy9WvCDKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

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


