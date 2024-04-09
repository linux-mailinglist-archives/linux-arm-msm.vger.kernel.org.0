Return-Path: <linux-arm-msm+bounces-16895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8E489D7CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 13:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE44A1F269EE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 11:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C040B8614D;
	Tue,  9 Apr 2024 11:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eT1chbw7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A085C73
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662066; cv=none; b=DHtIWCQn5UTS7h6Yvpp1i16ROAVeMnjwHcLjeS13x7Aenq8HdF+GFsLVA3M3Zvfv4Gt7VMfcfWbr5w7EH2Q+HR2RNBXAQu8ubM8jG9bdeecNgzCb6TLwR0cTPzwBP2JFSw5a63XwiBLEzn1WZUKg3Scb6qK+GkkbY1tXLJSaEag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662066; c=relaxed/simple;
	bh=NwfrGcY93qjkTjFtbURfuzBNVuSNrsz2BL96d/crmpw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH1d88rMm2MM1PAeluzZS4YAZhhMfqepwFXzyKVxD2i8pTaFc13A556qodNqFrPtpiF1BhoiIceusuXv1exgoQiTdFuzJoKnJzrMVPzR9dGV29NTYgZwvOOSki2pEV+wBpett7MPlgu0XUd/yQ5zw3Tsla/69Pd9TToRQ5vk7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eT1chbw7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3455ff1339dso1863706f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 04:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712662063; x=1713266863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7rSBxf+r+Gu/NRlDCb2V6v8NWBTd2ZyB6ufbMqjXbc=;
        b=eT1chbw7cq48/MUg/aQbpEBeJP3twUbN4Ctz4gyzHmXcR05Njb10pjtj1xeHr7mZ5E
         vFU4AvVGlTI4coM+IzRDT/StzSQLFi49ANlH3Ix8AZEa8x1PwjTA5VZMJ1jI5KNM51fR
         gmDS2mJdtSmOHfchiTbTP7ahruVKKrMPB/qOt95OiUeHqpRl2zsGr7/A59yA93SddTNL
         +9KFuIw4CrUdkmCCE+65nzujThmdEISTx3pewq3gWrv6JMelZu0QCZ3CXg0ysbj7MeoV
         1XFWXjTETd8R2iVT8Rdb5XKkTWHvtMcLvPelI4TE/IEolaB0UQPEXuwEjBSm41BcoxCH
         1VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712662063; x=1713266863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7rSBxf+r+Gu/NRlDCb2V6v8NWBTd2ZyB6ufbMqjXbc=;
        b=euSjCUmdsLkXNkQIIQBUUe2Tc/oSPm7W7CRc8DelF9IycapUHgKaGhvBL15R1gmloh
         Xb5yB5llCssPVRE98TGUsT/VkTBYzw9fv3KedpaEh8Iu6hvb/k0ggLSLVo632r60JjTL
         YO0b1341xJ62LOWgav0Bf20z5Oe6DOL8gpKgfHcUe0McKchO1Xswc6BrufavSJU/fSrM
         Fo/SoTcTTQ2khPZm/jQ/4GK9uxApveqUroQDdspYdEDmSkUvkJENZyRv6beNNBH2R/2G
         MaUf8OMZ2LBvrRou14DyHcQvBYdMCLwUcCWP3yMH3zWPpTSVChxYS38u1SobF3D2UBuG
         TKww==
X-Forwarded-Encrypted: i=1; AJvYcCVkT3/BRak3OjX5+AXS26yadsm/221tVBDdl3QgHR1dtVLrIe35MJL4EcrLXRPVUxqHZHm8VPbo/sJ7Unyc9RT4tXJnZIoVOS31fjZw4Q==
X-Gm-Message-State: AOJu0Yz3/jZqDmxncVc+tr3kUqO6p/NmreogYsxbp2L57Q8m91yIkgDn
	0E6qBfmjMW4nsJu0xf5wCKdwFMdqa3pP8vnZFSMTjl+YXsagkEGkhb33+MfTCRg=
X-Google-Smtp-Source: AGHT+IFc3CHe4SvVPDno2EzgH/cO657z8BNxuarw3RMRafSBmQilr3QFX3lm1ocDMwECacVr96rtCA==
X-Received: by 2002:a05:6000:1864:b0:343:7654:3e98 with SMTP id d4-20020a056000186400b0034376543e98mr12022149wri.43.1712662063007;
        Tue, 09 Apr 2024 04:27:43 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id y16-20020adff6d0000000b0034335f13570sm11224468wrp.116.2024.04.09.04.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 04:27:42 -0700 (PDT)
Message-ID: <09bc9231-0e59-4cb2-a05f-02e2fcaf3d15@linaro.org>
Date: Tue, 9 Apr 2024 12:27:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media <linux-media@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Pierre-Hugues Husson
 <phh@phh.me>, Marijn Suijten <marijn.suijten@somainline.org>
References: <0843621b-386b-4173-9e3c-9538cdb4641d@freebox.fr>
 <f6e68756-72a1-4c32-968d-3d6adaa153c9@linaro.org>
 <CAA8EJpq=G21h87W69_4U-BZ=Sa5VEs15Y-zE-G5x9VxVx4qjsA@mail.gmail.com>
 <81dc6452-4039-4eb4-92ba-df248215fca2@linaro.org>
 <b8325dbf-67c5-4898-bc23-ff093ae6e14a@freebox.fr>
 <87db77f7-fda4-4cf7-adfd-8545c40c3365@linaro.org>
 <10fe67af-0572-4faa-91c6-fce9c8f9dc92@linaro.org>
 <6342e92d-eed0-45c2-8f04-3779aa2e521d@freebox.fr>
 <4ab95e87-c912-469b-b8d4-be0cf0e4710b@linaro.org>
 <a8c5b27c-47a9-044a-78e8-51c67acf19a6@quicinc.com>
 <c6a9c20e-02d3-4334-badd-2efe5be9ce7e@freebox.fr>
 <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
 <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
 <3914555d-3c89-a5c5-2906-0bd24d0bf735@quicinc.com>
 <72741d2e-5165-4505-b079-d7b5d1491888@freebox.fr>
 <edb29faa-01b3-3b96-7c05-3378eb3af073@quicinc.com>
 <21b833cf-61c3-4fb5-8c55-492aac0fd3b6@freebox.fr>
 <8170522f-b813-19a4-3f85-f2880809d9a5@quicinc.com>
 <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c2ce34ce-d532-4039-bb9f-d4d1b2fb23b0@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2024 16:39, Marc Gonzalez wrote:
> On 29/02/2024 16:32, Vikash Garodia wrote:
> 
>> Not completely sure on these configurations, but certainly both the
>> video_subcore0_gdsc and video_subcore1_gdsc should be configured in hardware
>> control mode in the gdsc configuration.
> 
> Hello,
> 
> Still trying to land support for venus decoder on msm8998 in mainline.
> 
> This is the patch I have at the moment:
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 4dfe2d09ac285..67b8374ddf02f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -3010,6 +3010,55 @@ mdss_dsi1_phy: phy@c996400 {
>   			};
>   		};
>   
> +		venus: video-codec@cc00000 {
> +			compatible = "qcom,msm8998-venus";
> +			reg = <0x0cc00000 0xff000>;
> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
> +			clocks = <&mmcc VIDEO_CORE_CLK>,
> +				 <&mmcc VIDEO_AHB_CLK>,
> +				 <&mmcc VIDEO_AXI_CLK>,
> +				 <&mmcc VIDEO_MAXI_CLK>;
> +			clock-names = "core", "iface", "bus", "mbus";
> +			iommus = <&mmss_smmu 0x400>,
> +				 <&mmss_smmu 0x401>,
> +				 <&mmss_smmu 0x40a>,
> +				 <&mmss_smmu 0x407>,
> +				 <&mmss_smmu 0x40e>,
> +				 <&mmss_smmu 0x40f>,
> +				 <&mmss_smmu 0x408>,
> +				 <&mmss_smmu 0x409>,
> +				 <&mmss_smmu 0x40b>,
> +				 <&mmss_smmu 0x40c>,
> +				 <&mmss_smmu 0x40d>,
> +				 <&mmss_smmu 0x410>,
> +				 <&mmss_smmu 0x411>,
> +				 <&mmss_smmu 0x421>,
> +				 <&mmss_smmu 0x428>,
> +				 <&mmss_smmu 0x429>,
> +				 <&mmss_smmu 0x42b>,
> +				 <&mmss_smmu 0x42c>,
> +				 <&mmss_smmu 0x42d>,
> +				 <&mmss_smmu 0x411>,
> +				 <&mmss_smmu 0x431>;
> +			memory-region = <&venus_mem>;
> +			status = "disabled";
> +
> +			video-decoder {
> +				compatible = "venus-decoder";
> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
> +			};
> +
> +			video-encoder {
> +				compatible = "venus-encoder";
> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
> +				clock-names = "core";
> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
> +			};
> +		};
> +
>   		mmss_smmu: iommu@cd00000 {
>   			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>   			reg = <0x0cd00000 0x40000>;
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index ce206b7097541..42e0c580e093d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
>   	.fwname = "qcom/venus-4.2/venus.mbn",
>   };
>   
> +static const struct freq_tbl msm8998_freq_table[] = {
> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
> +	{  489600, 346666667 },	/* 1080p @ 60 */
> +	{  244800, 150000000 },	/* 1080p @ 30 */
> +	{  108000,  75000000 },	/* 720p @ 30 */
> +};
> +
> +/*
> + * https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi
> + */
> +static const struct reg_val msm8998_reg_preset[] = {
> +	{ 0x80124, 0x00000003 },
> +	{ 0x80550, 0x01111111 },
> +	{ 0x80560, 0x01111111 },
> +	{ 0x80568, 0x01111111 },
> +	{ 0x80570, 0x01111111 },
> +	{ 0x80580, 0x01111111 },
> +	{ 0x80588, 0x01111111 },
> +	{ 0xe2010, 0x00000000 },
> +};
> +
> +static const struct venus_resources msm8998_res = {
> +	.freq_tbl = msm8998_freq_table,
> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
> +	.reg_tbl = msm8998_reg_preset,
> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
> +	.clks = { "core", "iface", "bus", "mbus" },
> +	.clks_num = 4,
> +	.vcodec0_clks = { "core" },
> +	.vcodec1_clks = { "core" },
> +	.vcodec_clks_num = 1,
> +	.max_load = 2563200,
> +	.hfi_version = HFI_VERSION_3XX,
> +	.vmem_id = VIDC_RESOURCE_NONE,
> +	.vmem_size = 0,
> +	.vmem_addr = 0,
> +	.dma_mask = 0xddc00000 - 1,
> +	.fwname = "qcom/venus-4.4/venus.mbn",
> +};
> +
>   static const struct freq_tbl sdm660_freq_table[] = {
>   	{ 979200, 518400000 },
>   	{ 489600, 441600000 },
> @@ -893,6 +934,7 @@ static const struct venus_resources sc7280_res = {
>   static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
> index f9437b6412b91..abdc578ce988e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_venus.c
> +++ b/drivers/media/platform/qcom/venus/hfi_venus.c
> @@ -945,6 +945,7 @@ static int venus_sys_set_default_properties(struct venus_hfi_device *hdev)
>   			dev_warn(dev, "setting idle response ON failed (%d)\n", ret);
>   	}
>   
> +	venus_fw_low_power_mode = false;

So instead of this workaround, @Vikash is asking for HW_CTRL similar to 
what we have in 8996

8996 has a top-level "magic" GDSC which 8998 doesn't appear to have.

I think the CXC stuff would still be valid.

diff --git a/drivers/clk/qcom/mmcc-msm8998.c 
b/drivers/clk/qcom/mmcc-msm8998.c
index 1180e48c687ac..275fb3b71ede4 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -2535,6 +2535,8 @@ static struct clk_branch vmem_ahb_clk = {

  static struct gdsc video_top_gdsc = {
         .gdscr = 0x1024,
+       .cxcs = (unsigned int []){ 0x1028, 0x1034, 0x1038 },
+       .cxc_count = 3,
         .pd = {
                 .name = "video_top",
         },
@@ -2543,20 +2545,26 @@ static struct gdsc video_top_gdsc = {

  static struct gdsc video_subcore0_gdsc = {
         .gdscr = 0x1040,
+       .cxcs = (unsigned int []){ 0x1048 },
+       .cxc_count = 1,
         .pd = {
                 .name = "video_subcore0",
         },
         .parent = &video_top_gdsc.pd,
         .pwrsts = PWRSTS_OFF_ON,
+       .flags = HW_CTRL,
  };

  static struct gdsc video_subcore1_gdsc = {
         .gdscr = 0x1044,
+       .cxcs = (unsigned int []){ 0x104c },
+       .cxc_count = 1,
         .pd = {
                 .name = "video_subcore1",
         },
         .parent = &video_top_gdsc.pd,
         .pwrsts = PWRSTS_OFF_ON,
+       .flags = HW_CTRL,
  };

Can you give it a try ?

---
bod

