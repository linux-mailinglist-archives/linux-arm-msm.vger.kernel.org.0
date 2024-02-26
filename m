Return-Path: <linux-arm-msm+bounces-12564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D5867610
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 14:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B35A28B08E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 13:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336B47A73D;
	Mon, 26 Feb 2024 13:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ohgxPwaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F574F888
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708952965; cv=none; b=h9R83b27F+pf4/UQQ+DFq1fVSD4847MRwAlXLw/bKgCh6UpEZqAjPEHeyENreqBYW7M/6jzwQ+ZGFilUfAMPsk6zEEPpMRo1Uj3B/XnFHfg94mBHp1w7ctgG0MoCP6OmCDeHQw2Ei4E1qYSEJ6/bboSOgdyqrg7opEoCBDhpmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708952965; c=relaxed/simple;
	bh=AigPdH8LIBkBZnNo2k33Nm7pz+Rj7dbzEvXzaGsro7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=neo0DDT4yNqr90JUyg68TJon89W9IRcDRwxU619Mumz6sk6v/xcLwG3Yh4ZDadXuFz4n/pNX4CPBd+xY54z912fflYj6rskFkzxdDJondqq6S6S4oPTtCEHE2jU7lnzs4Z3PJUPqfqVAtUAoQ492itbGhgZVcnXIYJZXX6eHZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ohgxPwaK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4129ed6f514so11007675e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 05:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708952960; x=1709557760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NasxQXxlF1BVrh1m9D33ixboybQ40B3Epj/kMXP+pVU=;
        b=ohgxPwaK4knFDQGAgjh47grRLloL9gORLT8szQMqZWlMuCsGStSrQrPXsJ39mFAFvW
         733a1TK+ewLZrZ6Cy6CzOAqlkoLWRksk9ZxDYI4viUTPM6le+6Ato21ohfRDmR71P2/c
         MaQegf4f5dlALOnX8jzsU8Lb+wSYSrvq8810nuYdztWVZhg0XDhrUWO3th6rvRBWnZdq
         JNhu7zX6w7wkOK61z1VRP9sB0w4VTXubu5/dOAyt8xBnawOqFoB9xMCLJgPLKGzzBS+A
         DKZrycAzCKSDdL/kqdR6XaUnHVaGhXwrJvRNjV2DAjMbH6pow3Gx4nBihDVQtkW91Bj1
         3YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952960; x=1709557760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NasxQXxlF1BVrh1m9D33ixboybQ40B3Epj/kMXP+pVU=;
        b=RX+viBEAC/jPwQJg14OCv8u7DZkKihBekiJnZhSxPBU4DibMFKretqW+kLhudRlU4P
         wEkVSzIppdJvZt1qpwDjTmdShevrTxyGq4wJPhFE3vxKw6x4OWJbyUsPyxy5fZB+bDJh
         NGkrzOWjNDrWXAwUR0SBADCB6r5pKL3rfkAbi77g66ehQHNg73l80HpkfDkOVhhaQdOs
         lv05n8zstuNiJ33dxzcXOPLn2cuwnuYYbAKZh4+JEiwELekwzeA5X9Qg+dn2hekevOxK
         N3mKjVDCHA/xF0sLu4CYm/PBUWB4H7HFoFGk32VBJrvu/KrmL8O7lyBRNT27QEM35l89
         rAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcDO4aoSC0fPtvgmj22qKgnm66vCSDMG9/zlY7HA2vHfxBZDXn4WSt2t87C7WsuAdj8DsKm+710mv3h/9FiRFacaIkWDeAqt6/NRPY1A==
X-Gm-Message-State: AOJu0Yyj5Nr2bprGLq7tXeHrBA8I9j+BbHrx4sAxEgEDX226yytiFSdO
	b550f1J62NtBk0BB2fcW4r0/RCj3qe4nSDkB06qU1pk94Uzuj+dopzq3ya/aNGM=
X-Google-Smtp-Source: AGHT+IEGWa4r5IymlVvSdz8JQ/h+UlZbOuFONE2brDm+Npj59E8l0EqUIdpkX4ARpdQkbUSd3Z9W/Q==
X-Received: by 2002:a05:600c:4f52:b0:412:96e2:2ada with SMTP id m18-20020a05600c4f5200b0041296e22adamr5305759wmq.11.1708952960360;
        Mon, 26 Feb 2024 05:09:20 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j34-20020a05600c1c2200b00412a10d9f7asm5764588wms.42.2024.02.26.05.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 05:09:20 -0800 (PST)
Message-ID: <33382ecb-8a73-4d2f-96b1-8048df7a6414@freebox.fr>
Date: Mon, 26 Feb 2024 14:09:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC WIP PATCH] venus: add qcom,no-low-power property
Content-Language: en-US
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: DT <devicetree@vger.kernel.org>, linux-media
 <linux-media@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phh@phh.me>
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
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <d5abf142-3a2b-454c-660a-249c0fb25208@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/02/2024 14:48, Vikash Garodia wrote:

> On 2/20/2024 8:15 PM, Marc Gonzalez wrote:
> 
>> On 20/02/2024 14:53, Vikash Garodia wrote:
>>
>>> msm8998 supports configuring the VCodec (venus core0) GDSC in HW power control
>>> mode. Could you please check and confirm if the driver is configuring only the
>>> VCodec GDSC and not the venus GDSC. Look for the attribute
>>> "qcom,support-hw-trigger" in vendor dt file.
>>
>> [ Vendor DTS for easy reference: ]
>> [ https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998.dtsi ]
>>
>> In the queue, we have a patch enabling the Venus Decoder (VDEC) in mainline.
>> (It is using the previously proposed "qcom,no-low-power" mechanism, but that
>> might not be necessary, if I understand correctly?)
>>
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 2793cc22d381a..5084191be1446 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -3000,6 +3000,56 @@ mdss_dsi1_phy: phy@c996400 {
>>  			};
>>  		};
>>  
>> +		venus: video-codec@cc00000 {
>> +			compatible = "qcom,msm8998-venus";
>> +			reg = <0x0cc00000 0xff000>;
>> +			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
>> +			power-domains = <&mmcc VIDEO_TOP_GDSC>;
>> +			clocks = <&mmcc VIDEO_CORE_CLK>,
>> +				 <&mmcc VIDEO_AHB_CLK>,
>> +				 <&mmcc VIDEO_AXI_CLK>,
>> +				 <&mmcc VIDEO_MAXI_CLK>;
>> +			clock-names = "core", "iface", "bus", "mbus";
>> +			iommus = <&mmss_smmu 0x400>,
>> +				 <&mmss_smmu 0x401>,
>> +				 <&mmss_smmu 0x40a>,
>> +				 <&mmss_smmu 0x407>,
>> +				 <&mmss_smmu 0x40e>,
>> +				 <&mmss_smmu 0x40f>,
>> +				 <&mmss_smmu 0x408>,
>> +				 <&mmss_smmu 0x409>,
>> +				 <&mmss_smmu 0x40b>,
>> +				 <&mmss_smmu 0x40c>,
>> +				 <&mmss_smmu 0x40d>,
>> +				 <&mmss_smmu 0x410>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x421>,
>> +				 <&mmss_smmu 0x428>,
>> +				 <&mmss_smmu 0x429>,
>> +				 <&mmss_smmu 0x42b>,
>> +				 <&mmss_smmu 0x42c>,
>> +				 <&mmss_smmu 0x42d>,
>> +				 <&mmss_smmu 0x411>,
>> +				 <&mmss_smmu 0x431>;
>> +			memory-region = <&venus_mem>;
>> +			status = "disabled";
>> +			qcom,no-low-power; /*** WORK AROUND LOW-POWER ISSUE ***/
>> +
>> +			video-decoder {
>> +				compatible = "venus-decoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
>> +			};
>> +
>> +			video-encoder {
>> +				compatible = "venus-encoder";
>> +				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
>> +				clock-names = "core";
>> +				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
>> +			};
>> +		};
>> +
>>  		mmss_smmu: iommu@cd00000 {
>>  			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
>>  			reg = <0x0cd00000 0x40000>;
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index a712dd4f02a5b..ad1705e510312 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -585,6 +585,43 @@ static const struct venus_resources msm8996_res = {
>>  	.fwname = "qcom/venus-4.2/venus.mbn",
>>  };
>>  
>> +static const struct freq_tbl msm8998_freq_table[] = {
>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>> +	{  108000,  75000000 },	/* 720p @ 30 */
>> +};
>> +
>> +static const struct reg_val msm8998_reg_preset[] = {
>> +    { 0x80124, 0x00000003 },
>> +    { 0x80550, 0x01111111 },
>> +    { 0x80560, 0x01111111 },
>> +    { 0x80568, 0x01111111 },
>> +    { 0x80570, 0x01111111 },
>> +    { 0x80580, 0x01111111 },
>> +    { 0xe2010, 0x00000000 },
>> +};
>> +
>> +static const struct venus_resources msm8998_res = {
>> +	.freq_tbl = msm8998_freq_table,
>> +	.freq_tbl_size = ARRAY_SIZE(msm8998_freq_table),
>> +	.reg_tbl = msm8998_reg_preset,
>> +	.reg_tbl_size = ARRAY_SIZE(msm8998_reg_preset),
>> +	.clks = {"core", "iface", "bus", "mbus"},
>> +	.clks_num = 4,
>> +	.vcodec0_clks = { "core" },
>> +	.vcodec1_clks = { "core" },
>> +	.vcodec_clks_num = 1,
>> +	.max_load = 2563200,
>> +	.hfi_version = HFI_VERSION_3XX,
>> +	.vmem_id = VIDC_RESOURCE_NONE,
>> +	.vmem_size = 0,
>> +	.vmem_addr = 0,
>> +	.dma_mask = 0xddc00000 - 1,
>> +	.fwname = "qcom/venus-4.4/venus.mbn",
>> +};
>> +
>>  static const struct freq_tbl sdm660_freq_table[] = {
>>  	{ 979200, 518400000 },
>>  	{ 489600, 441600000 },
>> @@ -891,6 +928,7 @@ static const struct venus_resources sc7280_res = {
>>  static const struct of_device_id venus_dt_match[] = {
>>  	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>>  	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>> +	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
>>  	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>>  	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>>  	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
>>
>>
>>
>> @Vikash, are you saying that perhaps the DTS for video-codec@cc00000
>> needs to be written slightly differently?
>
>
> Certainly yes. For ex, in the clock list, i do not see the core clocks listed
> i.e clk_mmss_video_subcore0_clk and clk_mmss_video_subcore1_clk. You can refer
> the downstream video DT node [1] and then align it as per venus driver
> [1]
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-vidc.dtsi


If I understand correctly (which is far from certain),
we should base the "qcom,msm8998-venus" DT node on
"qcom,sdm845-venus-v2" rather than "qcom,msm8996-venus" ?

Regards



