Return-Path: <linux-arm-msm+bounces-87246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182BCEEA2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FACD307D84C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 13:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0F331A065;
	Fri,  2 Jan 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eAsmHAAE";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Hy1HVCli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DDD318151;
	Fri,  2 Jan 2026 12:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358224; cv=none; b=VwGBoBl7Pyl93Ji2uzQ8zHkEZ2zLL9KUQnW6L3df/pYgqEwwK2/8dnTGNzR/vKUpWzEp5sAn91IwOiS/ZYDTC8m64tz2bX0l3gCIVReU3LrEkZ3N3bxUr9SgwSfK5vvOaSLjVsno3E6H4kpclh3J+bY/KzLVl2ZGVRam8MZgd/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358224; c=relaxed/simple;
	bh=l0nvEewHd32nUePNbBRoImksGQg/5aJkOOe8cGl5YKg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=K3J9REdaXWIiGx7WGCWNMJ+DiPUh/CiUP5rWPE+KmmGSghZjCftvFe+sf1gtEiZELwkf5r6AZkfFhU4yvZQTtZv4G5ClKCLzZXtcyfJ6CmIn67JI3+OGT9vfdh12YpQDSdbGn0znSofxsIbO6XXimx/sFUa3C/STiVLooTa+TzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eAsmHAAE; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Hy1HVCli; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767358213; bh=4IO5b7fdkTdbphmH2D2abcH
	DRoH/AxtF8i7O7SFUu50=; b=eAsmHAAEedscxokpuWI6HTku3UkKKAhCbg+fLhWh/n1+BXQYg3
	LsGW9vyXjXBlyQcufuGO43b8/4Ws1ZKYx2SL6WYq0o7l1iop5gLqZMAYD24i4WpPv9nuAJOGyEO
	R+oGDDd+cmBpkeNLac4Hvp5mBErx8MO48pdlnuPR14hULMsHyGAIZXU/K4cElGMCZfmBoTrkrD8
	RZM66JvGHnmedCXKNPudH90Zs8AWz5yanQC9FjnwGVT17EPxGaKTVCXn0Xeqlim6JpNAKTGl4ny
	9wInsPiDeFUPgbIjSCKO6QLMRcHN0M+rv2mn9hwQidqjxQ3b6GsubvJmBkbtyo5Q4Gg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767358213; bh=4IO5b7fdkTdbphmH2D2abcH
	DRoH/AxtF8i7O7SFUu50=; b=Hy1HVCli94uHRJ7/i1z9KQW43cm5QlLPl8oPqdRLhVCIkEW6zg
	WC9sCOYDkcx72RpARUPk8kBCQhMhYV5bBwDw==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 13:50:13 +0100
From: barnabas.czeman@mainlining.org
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephan
 Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
In-Reply-To: <c104d173-6316-4bcf-b89b-62417d0b30c8@kernel.org>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <NLGulU4z-1Wrf5120YfX8CYJ_8DSP-9-DhaJ3KAIQCvqF9Qf184udOzFoEQH1qgJDZUl9cxEpsdyztfhcz8G-w==@protonmail.internalid>
 <20251231-mss-v3-3-f80e8fade9ec@mainlining.org>
 <6bfc790d-b0da-4c5b-bd2d-ceed9a75bb24@kernel.org>
 <DEGDp05xNKls7EO30mtT70wJFIkDT0-248vPaBikWJGkFf--YvzpyJ_h5sc7RSH1y9hkCKdFRBIJwQUNE9Rlzw==@protonmail.internalid>
 <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
 <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
 <MdF8n8gAaT_bieezcdxrSQouvHzG8TbGRiVRjHHXdc_Wjpr_GbDod8rUNrthtLEfOkycxxO5SVOfSPmyHe2C5g==@protonmail.internalid>
 <73d028cfdd514d6c3f073bb66fdd07cf@mainlining.org>
 <c104d173-6316-4bcf-b89b-62417d0b30c8@kernel.org>
Message-ID: <253bef3d40b48913c151ed4832f2d3c5@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-01-02 10:55, Bryan O'Donoghue wrote:
> On 01/01/2026 21:57, barnabas.czeman@mainlining.org wrote:
>> On 2026-01-01 21:58, Bryan O'Donoghue wrote:
>>> On 01/01/2026 13:50, barnabas.czeman@mainlining.org wrote:
>>>>>> +				for (; i >= 0; i--) {
>>>>>> +					val |= BIT(i);
>>>>>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>>>>>> +					/*
>>>>>> +					 * Read back value to ensure the write is done then
>>>>>> +					 * wait for 1us for both memory peripheral and data
>>>>>> +					 * array to turn on.
>>>>>> +					 */
>>>>>> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
>>>>>> +					udelay(1);
>>>>> Isn't the logic here inverted ?
>>>>> 
>>>>> i.e. you've written a thing and ostensibly require a delay for that
>>>>> thing to take effect, the power to switch on in this case.
>>>>> 
>>>>> It makes more sense to write, delay and read back rather than 
>>>>> write,
>>>>> readback and delay surely...
>>>> This is the original reset sequence without modification, i have 
>>>> just
>>>> moved it in a else case when it is not an MDM9607, MSM8917 or 
>>>> MSM8937.
>>> 
>>> Doesn't make it correct, we fix upstream logic bugs all the time...
>> Here is the original upstream logic
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/remoteproc/qcom_q6v5_mss.c?h=next-20251219#n823
>> and here is the same at downstream 3.18
>> https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/blob/LA.UM.6.6.c32-05500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L451
>> and same from downstream 4.9
>> https://git.codelinaro.org/clo/la/kernel/msm-4.9/-/blob/LA.UM.10.6.2.c26-01500-89xx.0/drivers/soc/qcom/pil-q6v5.c#L518
> 
> Plenty of downstream bugs...
Here is the commit where that line was introduced 
https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/ffc6ee0242ec4caa69687848ad3ac5f376b3d005
> 
> Let's assume those are posted writes i.e. the IO fabric equivalent of 
> UDP - I'm not sure I'd say the downstream code is consistent in its 
> treatement of write transactions..
> 
> But aside from just pointing at downstream - how is val |= readl() a 
> correct thing versus val = readl();
> 
> ...
> 
> I mean its just not
> 
>> 
>>> 
>>> For example a read-back to ensure write completion is only required 
>>> for
>>> posted memory transactions.
>>> 
>>> Is this a posted write ?
>>> 
>>> Is there an io-fabric in the world which exceeds 1 microsecond to
>>> perform a write transaction ?
>>> 
>>> Anyway leaving that aside the bit that's really objectionable and IMO
>>> obvious a bug is val |= readl();
>>> 
>>> Why or the bit back in ? and then why not check the bit was set on 
>>> the
>>> read ?
>>> 
>>> val = readl() is a lot less janky and shouldn't it matter that the 
>>> bit
>>> we tried to set is actually reflected in the read-back ?
>>> 
>>> Failure to set the bit would certainly be a problem...
>>> 
>>> ---
>>> bod

