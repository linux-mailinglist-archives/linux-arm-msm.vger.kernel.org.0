Return-Path: <linux-arm-msm+bounces-30684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2896B84A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C9F8B27194
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29831CF5F2;
	Wed,  4 Sep 2024 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHzbyYeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59E7433C8;
	Wed,  4 Sep 2024 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725445388; cv=none; b=mVVDFbp2rfbRQgcQNO746OEXCuJvHGmlvfemVeha0hxVS5h4zJiZJTIJ+ThTxlyQpv6l9ad/F/GppX6A5gXZ/7Q3IBrR9skHZ8z0p4E+ZEQopCj0YecISVLM/sXRVokI/e0/ZjeeoNAAD0giYp9x2Zj/I4jPEYXClCsepjM4Wes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725445388; c=relaxed/simple;
	bh=KusyjP40NvPPNolgPZoiAXBlqo5QAWZawLu7DwBCzhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTpiJnnbq6aj0EWALxw/exMU03Nn/hkVthqgMT5ha+ghc25LQg0CdQoNY6pHELap1BK9sfpvgI6kftD1Hzjca1UpA6T8GPl2DO6TCou54u+xqShsILHsoOGLJSQBqlxWBlpTFFnqgcLculee/PYtGj5bzBxgDxJUDyHrO5ZT7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHzbyYeA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DFCC4CEC2;
	Wed,  4 Sep 2024 10:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725445388;
	bh=KusyjP40NvPPNolgPZoiAXBlqo5QAWZawLu7DwBCzhc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fHzbyYeAoq0O0eGXRwa0QXMyEwV9wyAL6PsWkDpyKlREy5/47pC3aKy4ipVL22ixl
	 4Lx7Y6CM8HPnBwN5eO5SCZ84KuyawoDGPq0bTR/pFPUwLqwfB3+oqzSmuMSXpoldrU
	 kOdLpwkBLALPf6WrJamCyslVZ6Hq+aWNnU1vWXjtTP1iwM8KOFegQnjk8llIrIJ5mp
	 gIo92ajWRXa/2l9YRlOv4db5kzFuJvRRNbGGHbFDFvCl114EdD/y+i/28CLdCWRWFX
	 9EHbDesYf7GZzqkKJv/QlpZeqwOVcbrTyjzbhXOiJknMBEeWI06SvxYs2D1sVdBkJ9
	 b+kzceb1M4Faw==
Message-ID: <22657edf-5df9-44dc-b2a8-134ae613d819@kernel.org>
Date: Wed, 4 Sep 2024 12:23:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add base QCS615 RIDE dts
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240828-add_initial_support_for_qcs615-v1-0-5599869ea10f@quicinc.com>
 <20240828-add_initial_support_for_qcs615-v1-6-5599869ea10f@quicinc.com>
 <22qkvfravm6sxiq3xfavahg2u6b2pwlyzqbqvd55zym5zef3gi@m4bsqkdvggty>
 <17d0017e-b55d-4b32-9fd3-1a1a84e5ebf9@quicinc.com>
 <0ec92d59-0648-40ed-a522-307152b5c37d@kernel.org>
 <148451f2-6b1b-4616-b703-fd52e7afa2be@quicinc.com>
 <90c98fee-770c-4b83-9e05-6f04866094c2@kernel.org>
 <729deff2-d5df-4409-b941-af22de408521@quicinc.com>
 <9ded31cf-5b14-426a-a10c-694f20d4fb9e@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <9ded31cf-5b14-426a-a10c-694f20d4fb9e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4.09.2024 11:32 AM, Krzysztof Kozlowski wrote:
> On 04/09/2024 10:35, Lijuan Gao wrote:
>>
>>
>> 在 8/28/2024 5:34 PM, Krzysztof Kozlowski 写道:
>>> On 28/08/2024 11:31, Lijuan Gao wrote:
>>>>>>>> +/ {
>>>>>>>> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>>>>>>> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
>>>>>>>> +
>>>>>>>> +	chosen {
>>>>>>>> +		bootargs = "console=hvc0";
>>>>>>>
>>>>>>> Noooo, last time I agreed on this, you told me later it is different.
>>>>>>>
>>>>>> In the early stages, enabling HVC is to more easily verify clock and
>>>>>> PMIC related functions, as it’s difficult to debug without the console
>>>>>> log. After the clock and PMIC are ready, we will enable the UART console.
>>>>>
>>>>> Working serial is supposed to be part of the early submission.
>>>>>
>>>> Okay, I will remove it in the next patch.
>>>
>>> Can you post next version with proper serial device?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Hi Krzysztof,
>>
>> Can we use the dts without console enabled as the first version? When 
>> the clock is ready, we will submit new changes to enable the UART console.
> 
> It is very surprising not to have console available in the first, early
> submission, but it is not a blocker for me.

Lijuan,

I see that the initial submission is very slim. GCC+UART+TLMM is
usually the smallest we tend to accept.

While hooking up these drivers may take some time, please consider
at least describing a subset of the clocks and the QUP UART, as
everything non-SoC-specific is already in place.

Konrad

