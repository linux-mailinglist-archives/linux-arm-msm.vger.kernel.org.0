Return-Path: <linux-arm-msm+bounces-87183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D54CCCEE1C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 10:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80A2E3005FE0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 09:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CB32D7DED;
	Fri,  2 Jan 2026 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqr3h3ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CD149C6F;
	Fri,  2 Jan 2026 09:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767347708; cv=none; b=mqpKB4NAw8kTEEk7Un2u0Dk7Rqc4quLT4YgnTvI07PyLCS104oLOeKf8D/gJywJiyTXqmsfNEF2d7n99/mhXwZ6guI70l0hGVGfemDyd9UgtuxUq5gK96EXCLdsD73OThpFf6fTVEZx2tLwnF9LAAeQ4VVlM/Ux5JuQRCuM/m7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767347708; c=relaxed/simple;
	bh=9Nv4Qa2PE9uSVW8OnUTuV1TBsV2uWxhkQ80yf+tBGpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFipgyI5fzXmMQhwGSQI/DHAvbvVf/ePc1lGhTZpAJD3K61v7K4/jHRUrzgedXHQ87TSaak3ZQX1Ta7xyhWy9th8JNBg2FS0hTajJ006OAzXPyzpFwW9MjsJ+6nShQbJE6rLqlyqXvZcClU1KqhOBck1FMPnAiU/7m2l2IJVebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqr3h3ut; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDCFC116B1;
	Fri,  2 Jan 2026 09:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767347707;
	bh=9Nv4Qa2PE9uSVW8OnUTuV1TBsV2uWxhkQ80yf+tBGpc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aqr3h3utE/v48xE/ma2SNVN/jjBSherCuVuWapoIiyk6jbGl9wejzy+vnTbTzDyMZ
	 E6hXDLcG3tk/XeGeV0XgLGLh0bfK1TbZLS8JIN1Mov7JHTT9mdgV6odjOtz/CoECsA
	 71Hrv7pHkmcpAOfkjPzFwlQfON2jwJh1URmi8khPa+y26VHq9i3f+HuRCmuLrXatV9
	 8TroyP9fwF/LAEYK7xNe7dE+Aa7kh2sr7Fx5fMmJ3jP+3JEzdB89lqPzXfnOvf3UBa
	 n9k8K5e3KRUcM2BN4AWoAnwdEYNDpNYp9EQTflum47ryKGlvjCML95RO+RW4ugnXNn
	 /CpNReYsRMBJQ==
Message-ID: <c104d173-6316-4bcf-b89b-62417d0b30c8@kernel.org>
Date: Fri, 2 Jan 2026 09:55:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
To: barnabas.czeman@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <MdF8n8gAaT_bieezcdxrSQouvHzG8TbGRiVRjHHXdc_Wjpr_GbDod8rUNrthtLEfOkycxxO5SVOfSPmyHe2C5g==@protonmail.internalid>
 <73d028cfdd514d6c3f073bb66fdd07cf@mainlining.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <73d028cfdd514d6c3f073bb66fdd07cf@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2026 21:57, barnabas.czeman@mainlining.org wrote:
> On 2026-01-01 21:58, Bryan O'Donoghue wrote:
>> On 01/01/2026 13:50, barnabas.czeman@mainlining.org wrote:
>>>>> +				for (; i >= 0; i--) {
>>>>> +					val |= BIT(i);
>>>>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>>>>> +					/*
>>>>> +					 * Read back value to ensure the write is done then
>>>>> +					 * wait for 1us for both memory peripheral and data
>>>>> +					 * array to turn on.
>>>>> +					 */
>>>>> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>>> +					udelay(1);
>>>> Isn't the logic here inverted ?
>>>>
>>>> i.e. you've written a thing and ostensibly require a delay for that
>>>> thing to take effect, the power to switch on in this case.
>>>>
>>>> It makes more sense to write, delay and read back rather than write,
>>>> readback and delay surely...
>>> This is the original reset sequence without modification, i have just
>>> moved it in a else case when it is not an MDM9607, MSM8917 or MSM8937.
>>
>> Doesn't make it correct, we fix upstream logic bugs all the time...
> Here is the original upstream logic
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/remoteproc/qcom_q6v5_mss.c?h=next-20251219#n823
> and here is the same at downstream 3.18
> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L451
> and same from downstream 4.9
> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L518

Plenty of downstream bugs...

Let's assume those are posted writes i.e. the IO fabric equivalent of 
UDP - I'm not sure I'd say the downstream code is consistent in its 
treatement of write transactions..

But aside from just pointing at downstream - how is val |= readl() a 
correct thing versus val = readl();

...

I mean its just not

> 
>>
>> For example a read-back to ensure write completion is only required for
>> posted memory transactions.
>>
>> Is this a posted write ?
>>
>> Is there an io-fabric in the world which exceeds 1 microsecond to
>> perform a write transaction ?
>>
>> Anyway leaving that aside the bit that's really objectionable and IMO
>> obvious a bug is val |= readl();
>>
>> Why or the bit back in ? and then why not check the bit was set on the
>> read ?
>>
>> val = readl() is a lot less janky and shouldn't it matter that the bit
>> we tried to set is actually reflected in the read-back ?
>>
>> Failure to set the bit would certainly be a problem...
>>
>> ---
>> bod


