Return-Path: <linux-arm-msm+bounces-78228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FBBF93B3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 01:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C789B19A5B9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2662C0F93;
	Tue, 21 Oct 2025 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFrlPpKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604792C08AF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 23:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089366; cv=none; b=o/R+Sqz1XGaUpCKxtAQvWOxu8FKFgvyGKThb32yF9DnLbg+661m3vaFA7XkPkIXLKIIp2zihjQmSdglQan2Xv8j/HfcBV3z0GC8Q4RkiVpVvjpc+LCDoV2wjbv8d5NUj3+x235lDfHPvRQfZ4BVcstcC5r3B74TntLCEq+Qlhw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089366; c=relaxed/simple;
	bh=YiQ00PfEVe/ppBZId7C3yI+O9veQpCNxtgG44l2FUIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkDa0/HUU1wyYB4ALOlveiLQ0uOyH+J93OsxeJasMPNIVDRmmiwHmM78tIv4lsP1kDc3xmUa23pm4rtkcvJXy80f9hc4ZqtDnmLBpNQ8yh8Iy6N5Z4Nll6m5u1z94+M4WEROY0tJGjhQ1TzKDUW+4Y0tELG+eiPCyG6zfJSOnKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFrlPpKe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4270a3464bcso3301080f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 16:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761089363; x=1761694163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FAyZeaoohpS3+LaKQX81UzP2EtFamTxJm01ohQDDaaE=;
        b=KFrlPpKejI5BJjV0J2TGaHxQZt8IPkRanUNmlGEqP2yVE2AmbG/p4P9dTyj2KDPtEg
         WBSIyKCK6Lz3hxPz2SByzokcbErqp8wvj0KXNm3TXHmya3iIGkIuiZfchLVppFDkZtb2
         eteHcaxZDf+KlHPnkf1APrYXYqju5DFJ3UOMbhNeA86R61Q2OQ4+aOgDPtRm/e9ncKov
         zkLeIsPmaTir3KuO0HWb/facpv989goth0kin5UaZbDchP5izxT1bv9tdbyimb+XHVk2
         BYb8hkEZJj5JJPO++PC/X4DLomiexSJdIdTM2333zyWpOsKPBApX6gHf8AFe3GknZH6L
         4hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089363; x=1761694163;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FAyZeaoohpS3+LaKQX81UzP2EtFamTxJm01ohQDDaaE=;
        b=oOLZZdzfmH/GeJW5Jouwv8KnaQhwLWSDWdUoBwRIZDhMZ/xpHDclV0w1AIxZwGGNKH
         mUBYbW5Ely5NUNMLXOh9MO4xqdtGKXA9GO6jqz7FzKfsLY1pEs3Al/ZWkBDAczvzPb72
         aonnDMSGsJWvy5/bsouhwNG0yydV+DBsT0nAMafZ+hg47RHPc4F5iRhQoUw+H2oprF5k
         jHPe9jmxNvyxMIM9o7XSwFHuR0dKl8gPtj5qXWvmIzP+Ua8Q+A+tzx6MoznEWUwnNJiN
         YOz/Vgf2y99JCtC3oXldX9ibDfsV0VAlIQrJXCrFf/OxnDgGkJ8hRPWyC3/vSzGVvgXp
         mMZg==
X-Gm-Message-State: AOJu0YyV8HUhAB7fUaUdye8nlh4ttX54m/dc4FynK+QUJ9SITdrvMe2t
	R1FG/XlAXZYm05DVHYBAWKEiRj6GqJgeNtDo4e/Vh8kSLSwpSBhiqe+Icfnp/GLfSRk=
X-Gm-Gg: ASbGnctbsVDv3Zon0BYBFKNSJoGKh0r91PbHomoXouQ88Z7bXEf+AgCNJMa7JblibYq
	EkJA+5hjQ+HNmwSO5uITshCBY0S8sxR26/s2VloXzq+H7gpOZzSq1B4WaFxFOOwh899gNuNk5zI
	8eaGJ8pPu3vO0G+avc4ST/BSV8rhoAQrD0PxotcnJXEs1waJumcgFWIxw1RdWAotDzUTg1v21ZW
	EeRhURyMzkNGL9tDHiaWeaT3NS5zr6srtZW9941UH0O1PT/FNDN9w3rH5o6slFD1S6ty2j4rUkn
	zoS4AMW0awSRBRAXkgo5rxRwHLO0duHDN7jCsJbW1IXOBVvfuiHF4lGvWPw8van2s3/InZEJaLw
	gjfYH75dHEGZVtM/AkONhIL+0W+8Hz2GMMY542xddUN4BEIdkMyhKkApO9kA0iuaf1GTOtf6pZq
	gcvaDH9W7AUstpT290MdluILrks9prqxndfrV+ZkX799wvySgnr6cxqg==
X-Google-Smtp-Source: AGHT+IHWzjXNf79+J8aLTry20W4/lygdn2za8gdSboDCpo44LAcAQwR2pdJvA2zh6AmSrxgxe8gfIw==
X-Received: by 2002:a5d:5f82:0:b0:426:fb28:7962 with SMTP id ffacd0b85a97d-42704dd3690mr13737820f8f.61.1761089362534;
        Tue, 21 Oct 2025 16:29:22 -0700 (PDT)
Received: from [192.168.0.163] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-474949df22csm27535345e9.0.2025.10.21.16.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 16:29:22 -0700 (PDT)
Message-ID: <43580b96-1b68-413c-9a1c-9ce66c20a856@linaro.org>
Date: Wed, 22 Oct 2025 00:29:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: iris: Move vpu35 specific api to common to
 use for vpu4
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <iptBLGVWieCJzMJ5EeIz_W-50FdfdIDp_WI0go73dC9hhg9SgtkAOF-SxawmD4nV6m50_dHpszKGk4JhHMbXAQ==@protonmail.internalid>
 <20251017-knp_video-v2-6-f568ce1a4be3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251017-knp_video-v2-6-f568ce1a4be3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/10/2025 15:16, Vikash Garodia wrote:
> Some of the sequence and calculations for vpu4 is identical to vpu35,
> namely power sequence for vpu controller and the clock frequency
> calculation. Move those to common file that can be shared for both vpu35
> and vpu4. This patch prepares for power sequence for vpu4 which is added
> in subsequent patch.
> 
> Co-developed-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vishnu Reddy <quic_bvisredd@quicinc.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 159 +--------------------
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 143 ++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
>   3 files changed, 153 insertions(+), 153 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index 0ac6373c33b7ced75ac94ac86a1a8fc303f28b5d..3abfb74dbb10974c8fe3cedaf67e8b4fca421015 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -12,8 +12,6 @@
>   #include "iris_vpu_register_defines.h"
> 
>   #define CORE_CLK_RUN				0x0
> -/* VPU v3.5 */
> -#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> 
>   #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
> 
> @@ -22,8 +20,6 @@
>   #define AON_WRAPPER_MVP_NOC_CORE_CLK_CONTROL	(AON_BASE_OFFS + 0x20)
>   #define NOC_HALT				BIT(0)
>   #define AON_WRAPPER_SPARE			(AON_BASE_OFFS + 0x28)
> -#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
> -#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
> 
>   static bool iris_vpu3x_hw_power_collapsed(struct iris_core *core)
>   {
> @@ -268,155 +264,12 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
>   	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>   }
> 
> -static int iris_vpu35_power_off_controller(struct iris_core *core)
> -{
> -	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> -	unsigned int count = 0;
> -	u32 val = 0;
> -	bool handshake_done, handshake_busy;
> -	int ret;
> -
> -	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> -
> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> -
> -	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> -
> -	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> -
> -	/* Retry up to 1000 times as recommended by hardware documentation */
> -	do {
> -		/* set MNoC to low power */
> -		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> -
> -		udelay(15);
> -
> -		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
> -
> -		handshake_done = val & NOC_LPI_STATUS_DONE;
> -		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> -
> -		if (handshake_done || !handshake_busy)
> -			break;
> -
> -		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> -
> -		udelay(15);
> -
> -	} while (++count < 1000);
> -
> -	if (!handshake_done && handshake_busy)
> -		dev_err(core->dev, "LPI handshake timeout\n");
> -
> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
> -				 val, val & BIT(0), 200, 2000);
> -	if (ret)
> -		goto disable_power;
> -
> -	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> -
> -	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> -
> -	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> -				 val, val == 0, 200, 2000);
> -	if (ret)
> -		goto disable_power;
> -
> -disable_power:
> -	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> -
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> -
> -	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
> -
> -	return 0;
> -}
> -
> -static int iris_vpu35_power_on_controller(struct iris_core *core)
> -{
> -	int ret;
> -
> -	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> -	if (ret)
> -		return ret;
> -
> -	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
> -	if (ret)
> -		goto err_disable_power;
> -
> -	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
> -	if (ret)
> -		goto err_disable_axi1_clk;
> -
> -	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> -	if (ret)
> -		goto err_disable_ctrl_free_clk;
> -
> -	return 0;
> -
> -err_disable_ctrl_free_clk:
> -	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> -err_disable_axi1_clk:
> -	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> -err_disable_power:
> -	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> -
> -	return ret;
> -}
> -
> -static void iris_vpu35_program_bootup_registers(struct iris_core *core)
> -{
> -	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
> -}
> -
> -static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_size)
> -{
> -	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> -	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 height, width, mbs_per_second, mbpf;
> -	u64 fw_cycles, fw_vpp_cycles;
> -	u64 vsp_cycles, vpp_cycles;
> -	u32 fps = DEFAULT_FPS;
> -
> -	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> -	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> -
> -	mbpf = NUM_MBS_PER_FRAME(height, width);
> -	mbs_per_second = mbpf * fps;
> -
> -	fw_cycles = fps * caps->mb_cycles_fw;
> -	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
> -
> -	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
> -	/* 21 / 20 is minimum overhead factor */
> -	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
> -
> -	/* 1.059 is multi-pipe overhead */
> -	if (inst->fw_caps[PIPE].value > 1)
> -		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
> -
> -	vsp_cycles = fps * data_size * 8;
> -	vsp_cycles = div_u64(vsp_cycles, 2);
> -	/* VSP FW overhead 1.05 */
> -	vsp_cycles = div_u64(vsp_cycles * 21, 20);
> -
> -	if (inst->fw_caps[STAGE].value == STAGE_1)
> -		vsp_cycles = vsp_cycles * 3;
> -
> -	return max3(vpp_cycles, vsp_cycles, fw_cycles);
> -}
> -
>   const struct vpu_ops iris_vpu3_ops = {
>   	.power_off_hw = iris_vpu3_power_off_hardware,
>   	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
> -	.calc_freq = iris_vpu3x_calculate_frequency,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>   };
> 
>   const struct vpu_ops iris_vpu33_ops = {
> @@ -424,14 +277,14 @@ const struct vpu_ops iris_vpu33_ops = {
>   	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu33_power_off_controller,
>   	.power_on_controller = iris_vpu_power_on_controller,
> -	.calc_freq = iris_vpu3x_calculate_frequency,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>   };
> 
>   const struct vpu_ops iris_vpu35_ops = {
>   	.power_off_hw = iris_vpu35_power_off_hw,
>   	.power_on_hw = iris_vpu35_power_on_hw,
> -	.power_off_controller = iris_vpu35_power_off_controller,
> -	.power_on_controller = iris_vpu35_power_on_controller,
> -	.program_bootup_registers = iris_vpu35_program_bootup_registers,
> -	.calc_freq = iris_vpu3x_calculate_frequency,
> +	.power_off_controller = iris_vpu35_vpu4x_power_off_controller,
> +	.power_on_controller = iris_vpu35_vpu4x_power_on_controller,
> +	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
> +	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index a7b1fb8173e02d22e6f2af4ea170738c6408f65b..dd0990d143a624d83e241d9970297ce1abe37f74 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -8,6 +8,7 @@
>   #include <linux/reset.h>
> 
>   #include "iris_core.h"
> +#include "iris_instance.h"
>   #include "iris_vpu_common.h"
>   #include "iris_vpu_register_defines.h"
> 
> @@ -48,6 +49,10 @@
> 
>   #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
> 
> +#define WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0	(WRAPPER_BASE_OFFS + 0x78)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL	(AON_BASE_OFFS + 0x2C)
> +#define AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS	(AON_BASE_OFFS + 0x30)
> +
>   static void iris_vpu_interrupt_init(struct iris_core *core)
>   {
>   	u32 mask_val;
> @@ -309,6 +314,144 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>   	return ret;
>   }
> 
> +int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core)
> +{
> +	u32 clk_rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> +	bool handshake_done, handshake_busy;
> +	u32 count = 0, val = 0;
> +	int ret;
> +
> +	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
> +
> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
> +
> +	/* Retry up to 1000 times as recommended by hardware documentation */
> +	do {
> +		/* set MNoC to low power */
> +		writel(REQ_POWER_DOWN_PREP, core->reg_base +
> +		       AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +		usleep_range(10, 20);
> +		val = readl(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS);
> +
> +		handshake_done = val & NOC_LPI_STATUS_DONE;
> +		handshake_busy = val & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
> +
> +		if (handshake_done || !handshake_busy)
> +			break;
> +
> +		writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +		usleep_range(10, 20);
> +
> +	} while (++count < 1000);
> +
> +	if (!handshake_done && handshake_busy)
> +		dev_err(core->dev, "LPI handshake timeout\n");
> +
> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_STATUS,
> +				 val, val & BIT(0), 200, 2000);
> +	if (ret)
> +		goto disable_power;
> +
> +	writel(0, core->reg_base + AON_WRAPPER_MVP_VIDEO_CTL_NOC_LPI_CONTROL);
> +
> +	writel(0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
> +
> +	readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
> +			   val, val == 0, 200, 2000);
> +
> +disable_power:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	reset_control_bulk_reset(clk_rst_tbl_size, core->resets);
> +
> +	return 0;
> +}
> +
> +int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI1_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_FREERUN_CLK);
> +	if (ret)
> +		goto err_disable_axi1_clk;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_ctrl_free_clk;
> +
> +	return 0;
> +
> +err_disable_ctrl_free_clk:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_FREERUN_CLK);
> +err_disable_axi1_clk:
> +	iris_disable_unprepare_clock(core, IRIS_AXI1_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
> +{
> +	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
> +}
> +
> +u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct v4l2_format *inp_f = inst->fmt_src;
> +	u32 height, width, mbs_per_second, mbpf;
> +	u64 fw_cycles, fw_vpp_cycles;
> +	u64 vsp_cycles, vpp_cycles;
> +	u32 fps = DEFAULT_FPS;
> +
> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf = NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second = mbpf * fps;
> +
> +	fw_cycles = fps * caps->mb_cycles_fw;
> +	fw_vpp_cycles = fps * caps->mb_cycles_fw_vpp;
> +
> +	vpp_cycles = mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->fw_caps[PIPE].value);
> +	/* 21 / 20 is minimum overhead factor */
> +	vpp_cycles += max(div_u64(vpp_cycles, 20), fw_vpp_cycles);
> +
> +	/* 1.059 is multi-pipe overhead */
> +	if (inst->fw_caps[PIPE].value > 1)
> +		vpp_cycles += div_u64(vpp_cycles * 59, 1000);
> +
> +	vsp_cycles = fps * data_size * 8;
> +	vsp_cycles = div_u64(vsp_cycles, 2);
> +	/* VSP FW overhead 1.05 */
> +	vsp_cycles = div_u64(vsp_cycles * 21, 20);
> +
> +	if (inst->fw_caps[STAGE].value == STAGE_1)
> +		vsp_cycles = vsp_cycles * 3;
> +
> +	return max3(vpp_cycles, vsp_cycles, fw_cycles);
> +}
> +
>   int iris_vpu_power_on(struct iris_core *core)
>   {
>   	u32 freq;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index d636e287457adf0c44540af5c85cfa69decbca8b..7cf4304604cca590544a938c7e811c202cea3d93 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -33,5 +33,9 @@ int iris_vpu_power_on(struct iris_core *core);
>   int iris_vpu_power_off_controller(struct iris_core *core);
>   void iris_vpu_power_off_hw(struct iris_core *core);
>   void iris_vpu_power_off(struct iris_core *core);
> +int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
> +int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
> +void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
> +u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
> 
>   #endif
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

