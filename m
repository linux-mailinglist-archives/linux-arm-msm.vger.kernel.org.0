Return-Path: <linux-arm-msm+bounces-84082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0685C9BA2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 14:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A605D4E33AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 13:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BE7314D3C;
	Tue,  2 Dec 2025 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ZwqqWzxy";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5xSxb8nk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC92BE020;
	Tue,  2 Dec 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764682857; cv=none; b=j6NQgt+Et82Av6/rFPg/m5dttf4Kyp+tjANVv/FZeEtpAc/Suq5jnBHz9FUrn2j2IBI3LFPSqOlzIFYztYbS6DeeAUPWm05EziYXJACc52hYiiu0yMpr45/fb3REGZuNuf5+DCz0OupjcVUQ2EpQrFAfC/dlLEgJN8ca2xaOQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764682857; c=relaxed/simple;
	bh=hmfl8Sjsg+hFjutE8F2JTdr5DTHIUHxBLQn9sci01Kw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=uF2Hw0lh9cXpzMASlsm8IfYH2gN1Jdh1Yy56JVQE8vq0J8WhmnGvR3YtvXhxy0rjYxAshGmydLVQpwMxPeyZXKLktwC2EZgM6uGN7VQwL3sbNE6ztYDCcELsvXzSd3Cp9lNrvydD0KifIatGdBYzWZSLHRq/c738oXWdD1wmy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ZwqqWzxy; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5xSxb8nk; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764682846; bh=F13BqT16VWqKico9Z7yQuR4
	8uJ9Wd8/l/hScm3Hrpq0=; b=ZwqqWzxyjrZfbpA+TOTt/A+lrbNNxuLu2b5eoYBePkTs/fpiux
	oHJqYjjRhsFpuix13XwnIxv/BdFuDLfuQGkRTf/pYJmSKbpGJkJiBTaeMVvsIiiLRupE8whZ/rk
	qooroWwTm9ZOVvdlw+40jtdZAWXcdGc+jiMcrpfnYiREY2usMEK8IKO649AMCw3ABynSmypJ0U0
	HqsmiPHFac1B6kkXr+LNnC+TV6tmf4zf3G1iap+0OK29tdYLvWvHihEe6+3NSCxnTWSGgt3Src0
	RoaYTUkF/qBDzCcBcCSvLjxMCeNqZIHQGtFIbJMsUn4WbUuZLBt0PcMmU3SBDllH9Dw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764682846; bh=F13BqT16VWqKico9Z7yQuR4
	8uJ9Wd8/l/hScm3Hrpq0=; b=5xSxb8nkitVHzOHzNuYp1tr6TOiJPp78okHVPKEEBrzKZFNU4h
	rKEnMA3ekNoozbiPOgbd4uTOnScTqqJtWpAQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 14:40:46 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lanik
 <daniilt971@gmail.com>
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
In-Reply-To: <13b44a8c-357d-4f98-8762-640179fe3ff3@oss.qualcomm.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
 <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
 <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
 <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
 <f0be91fdde1b542b2c18702b0c91f26f@mainlining.org>
 <13b44a8c-357d-4f98-8762-640179fe3ff3@oss.qualcomm.com>
Message-ID: <14c40512a19b20199acd902bbe5f4598@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-01 13:26, Konrad Dybcio wrote:
> On 11/30/25 3:50 PM, barnabas.czeman@mainlining.org wrote:
>> On 2025-11-17 15:17, Konrad Dybcio wrote:
>>> On 11/17/25 3:02 PM, barnabas.czeman@mainlining.org wrote:
>>>> On 2025-11-17 13:17, Konrad Dybcio wrote:
>>>>> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>>>>>> 
>>>>>> 
>>>>>> On 17 November 2025 09:03:53 CET, Taniya Das 
>>>>>> <taniya.das@oss.qualcomm.com> wrote:
>>>>>>> 
>>>>>>> 
>>>>>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>>>>>> 
>>>>>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>>>>>> +    .halt_reg = 0x120a0,
>>>>>>>> +    .halt_check = BRANCH_VOTED,
>>>>>>>> +    .clkr = {
>>>>>>>> +        .enable_reg = 0x4500c,
>>>>>>>> +        .enable_mask = BIT(16),
>>>>>>>> +        .hw.init = &(struct clk_init_data){
>>>>>>>> +            .name = "gcc_ipa_tbu_clk",
>>>>>>>> +            .ops = &clk_branch2_ops,
>>>>>>>> +        },
>>>>>>>> +    },
>>>>>>>> +};
>>>>>>>> +
>>>>>>> 
>>>>>>> Is the TBU clock used on 8940 by a SMMU driver?
>>>>>> As far as I know no MSM8940 is using same smmu driver and bindings 
>>>>>> like MSM8937.
>>>>> 
>>>>> On msm8939, the clock needed to be turned on for the GPU SMMU
>>>> I have not got any qcom-iommu issues on 8940 but i think it could 
>>>> come when i try to add ipa2 driver
>>>> for the SoC until i do not know where to check it.
>>> 
>>> I can't find a definitive answer, but it's most certainly going to be
>>> necessary to turn it on
>>> 
>>> Konrad
>> 
>> I have enabled ipa2-lite for 8940 at downstream and it can cause gpu 
>> to crash.
> 
> Really!?
> 
> FWIW the clock on 8939 is called GCC_*GFX*_TBU_CLK so it being related
> made more sense. Here, I see no connection :/
> 
> Konrad

I have find out the issue was caused by the interconnect, removing 
sync_state callback
makes the ipa driver working, the ipa tbu clock do not needed to be 
enabled by smmu.
> 
>> I have tried to add TBU clock for apps_iommu but it not fixing the 
>> issue.
>> 
>> Here are the iommu changes based on 8937 apps_iommu node:
>> +&apps_iommu {
>> +       clocks = <&gcc GCC_SMMU_CFG_CLK>,
>> +                <&gcc GCC_APSS_TCU_CLK>,
>> +                <&gcc MSM8940_GCC_IPA_TBU_CLK>;
>> +       clock-names = "iface",
>> +                     "bus",
>> +                     "tbu";
>> +
>> +       /* IPA */
>> +       iommu-ctx@18000 {
>> +               compatible = "qcom,msm-iommu-v1-ns";
>> +               reg = <0x18000 0x1000>;
>> +               interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
>> +       };
>> +};
>> +
>> 

