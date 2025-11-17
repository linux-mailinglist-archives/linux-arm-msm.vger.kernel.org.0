Return-Path: <linux-arm-msm+bounces-82121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627BC64956
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 15:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CA1D134CC3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B595021A447;
	Mon, 17 Nov 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oknZHplC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="O7Oajh90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31C334698;
	Mon, 17 Nov 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388218; cv=none; b=hdntdQQAljcs70a/vj09erTQ4Gx4UmK72gXTttsDHNP2jnKg8L8TOMBVc6NAnqZzGXE2m7oa39XkMTCuGVRDSowbLOHCywAo4kVentuHS1Xi0Ish5LoOeRWXs2MpY44BCcVbIKzjZuhPnNaZXY6BGMMJmv0dPkjFYFbt+UTIoI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388218; c=relaxed/simple;
	bh=/GtzGB0r3fFuQ5wzKnrj65IypZRGR14CC9UEvm88kfk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ExMjdTRdwlVlSxWbB7Ob9IVWsYEEyQdUc/vBXWm5wDr7y2wHF4fkcv/HjDEabVNc68ivfj11NGxXL30OsgiTGOiHb0BIydYnnSd6mMSMG4Myvwc5Uu9kQuXoi+D0E12RwzWQmEqRHLoGDBkeP7Ku8CtruqZtNDFbdgHEm1CpfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oknZHplC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=O7Oajh90; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763388166; bh=LHm3cg2C0US7f0V9jl72z6L
	PinGW+PGoSnAYxJsOnrA=; b=oknZHplCKd7YOvzPIpvp+dssELX9e2vQ/r7D0tmUCPvjxPgSz2
	/H3otkytSjLrItP7eOvfMQ6OJH25r+p1vb/tITIQTp1MnpdAk5Flk/3Fe8oqOp6ONMBx2dpDoED
	vSLvPGqpX4zvdnyz9wCL7KTYhDkQ7M0Nq5Dyhgg10CoWhDIlGsHqv7sqI3l9lrg4kSJ+5KXhTno
	hKGi6POAgvQJSF/yy49d0KoBeyvjs0ELlN3F7F2U+88LdYM3bRiB9zKzGJIe/+DByxWbe67+G6G
	DonHOwqyoPVaGZQL5qBtrqc71i3qvHEiesYFq/Mp6Sc1WIsZU0YzA6OwYIXXtWSQSrA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1763388166; bh=LHm3cg2C0US7f0V9jl72z6L
	PinGW+PGoSnAYxJsOnrA=; b=O7Oajh90hKXJ1cqrJxCPZ+ysRS1i+pLw+Dl/EfWigmMNKLwuJc
	GQiYaFC5o0/aPbuyqaPWDSJ0JKghcNnUGZDg==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 15:02:46 +0100
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
In-Reply-To: <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
 <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
Message-ID: <869028d628bad9e1c37c3d9ea8346ba0@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-11-17 13:17, Konrad Dybcio wrote:
> On 11/17/25 9:51 AM, Barnabás Czémán wrote:
>> 
>> 
>> On 17 November 2025 09:03:53 CET, Taniya Das 
>> <taniya.das@oss.qualcomm.com> wrote:
>>> 
>>> 
>>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>> 
>>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>>> +	.halt_reg = 0x120a0,
>>>> +	.halt_check = BRANCH_VOTED,
>>>> +	.clkr = {
>>>> +		.enable_reg = 0x4500c,
>>>> +		.enable_mask = BIT(16),
>>>> +		.hw.init = &(struct clk_init_data){
>>>> +			.name = "gcc_ipa_tbu_clk",
>>>> +			.ops = &clk_branch2_ops,
>>>> +		},
>>>> +	},
>>>> +};
>>>> +
>>> 
>>> Is the TBU clock used on 8940 by a SMMU driver?
>> As far as I know no MSM8940 is using same smmu driver and bindings 
>> like MSM8937.
> 
> On msm8939, the clock needed to be turned on for the GPU SMMU
I have not got any qcom-iommu issues on 8940 but i think it could come 
when i try to add ipa2 driver
for the SoC until i do not know where to check it.
> 
> See 5bc1cf1466f6 ("iommu/qcom: add optional 'tbu' clock for TLB 
> invalidate")
> 
> Konrad

