Return-Path: <linux-arm-msm+bounces-83903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F1C95076
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 15:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D1F43A2257
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 14:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A2B222584;
	Sun, 30 Nov 2025 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mWfZ8ww0";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FD+eeK5h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F1273F9;
	Sun, 30 Nov 2025 14:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764514214; cv=none; b=ZQDvdS4dLhHC2L8FISX6oj2gPdjFfoqY7iKcSxPsZncfZJPmgjRCTU5zzG2PItlAQwkDrHq1XiFFDN8zo1ntNu6ueFnpVuvHQUlzAJm9FcypV8YH9NBHR/bxb8Ldwwvu/5A3kLWWZK15qbZ+FxeEw51jcKTxSZwOLNEnzdNmTaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764514214; c=relaxed/simple;
	bh=Q9tYmc1ih8bX4BtCyC5RIeh8rysX18BmNYqx/GU4Ajo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ihX4Q1qAYiY2F99yKQLe4yOznUE5JLbp4pvu5c1VOdHT0H+7tIWtpsIA5Dj4um7o4W8IozWv/omDPFFcUiMS/OaogORVzns++hz7qT9Gies2/xN1FeXsH1Pd3qan3qgmvseDExrK3veqUYXC4JvlKPj852j6WMWavK85cIeZ5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mWfZ8ww0; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FD+eeK5h; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764514203; bh=pIe52U2aUz+9Gaqoklh6Z4G
	hMG+Ls3nIoLijABZCU7s=; b=mWfZ8ww0d+eKt8G/e8EMg6y8N+oDBL/mvegoQ8lGaqUHtHcrQK
	yhzCeQ5L0YnOuhRKUoFcJuKHYHIidFRk775o4YYP42lH3Zpm2nPmHe8ZA6LIvhcFRB1dPmSsB18
	MdR/JloXlC7yGCbsj3oEI/a6mPCnzVq0RawTATBqpHOUyBMUNbHm42ujRKiv3KtS8dbEeaAPEBh
	AmtlqSw5nr4zQcOF5ttpeUh8ehweDchZcucgJq0aHyE+nU+0Km5k8N9J/bix8dHdjsMmlwZncgC
	N1C1Bqw43umAeCvAxC04DKzNz/0wVKR9uU6AWHRVzl3ITBqPkX8yBMZdwaaBfo5hyKA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1764514203; bh=pIe52U2aUz+9Gaqoklh6Z4G
	hMG+Ls3nIoLijABZCU7s=; b=FD+eeK5hu6GfuKZqaoAdwDo/s8KK6sT9C5IRdadrBrgRfcDs/Q
	umR3OzEwWofIxY2RIKLJL88qy0v2z8lCSxDA==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 30 Nov 2025 15:50:03 +0100
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
In-Reply-To: <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
 <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
 <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
 <2220aea0-6139-4534-8c42-1331a642ab62@oss.qualcomm.com>
Message-ID: <f0be91fdde1b542b2c18702b0c91f26f@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-11-17 15:17, Konrad Dybcio wrote:
> On 11/17/25 3:02 PM, barnabas.czeman@mainlining.org wrote:
>> On 2025-11-17 13:17, Konrad Dybcio wrote:
>>> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>>>> 
>>>> 
>>>> On 17 November 2025 09:03:53 CET, Taniya Das 
>>>> <taniya.das@oss.qualcomm.com> wrote:
>>>>> 
>>>>> 
>>>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>>>> 
>>>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>>>> +    .halt_reg = 0x120a0,
>>>>>> +    .halt_check = BRANCH_VOTED,
>>>>>> +    .clkr = {
>>>>>> +        .enable_reg = 0x4500c,
>>>>>> +        .enable_mask = BIT(16),
>>>>>> +        .hw.init = &(struct clk_init_data){
>>>>>> +            .name = "gcc_ipa_tbu_clk",
>>>>>> +            .ops = &clk_branch2_ops,
>>>>>> +        },
>>>>>> +    },
>>>>>> +};
>>>>>> +
>>>>> 
>>>>> Is the TBU clock used on 8940 by a SMMU driver?
>>>> As far as I know no MSM8940 is using same smmu driver and bindings 
>>>> like MSM8937.
>>> 
>>> On msm8939, the clock needed to be turned on for the GPU SMMU
>> I have not got any qcom-iommu issues on 8940 but i think it could come 
>> when i try to add ipa2 driver
>> for the SoC until i do not know where to check it.
> 
> I can't find a definitive answer, but it's most certainly going to be
> necessary to turn it on
> 
> Konrad

I have enabled ipa2-lite for 8940 at downstream and it can cause gpu to 
crash.
I have tried to add TBU clock for apps_iommu but it not fixing the 
issue.

Here are the iommu changes based on 8937 apps_iommu node:
+&apps_iommu {
+       clocks = <&gcc GCC_SMMU_CFG_CLK>,
+                <&gcc GCC_APSS_TCU_CLK>,
+                <&gcc MSM8940_GCC_IPA_TBU_CLK>;
+       clock-names = "iface",
+                     "bus",
+                     "tbu";
+
+       /* IPA */
+       iommu-ctx@18000 {
+               compatible = "qcom,msm-iommu-v1-ns";
+               reg = <0x18000 0x1000>;
+               interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+       };
+};
+

