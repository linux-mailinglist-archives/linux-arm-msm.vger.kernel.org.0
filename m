Return-Path: <linux-arm-msm+bounces-87163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF281CED58F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 21:58:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECCC43006602
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 20:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB762222BF;
	Thu,  1 Jan 2026 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSTV7UUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3545C224FA;
	Thu,  1 Jan 2026 20:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767301118; cv=none; b=Tv5mlam1eEJj1M1OM7hJ+zc4A161vlrBxfQa+4GpDrLDnnGlnKHHGB2Ss33R/vkDfuJ9wwnizLnoPD9ArrQqYVoCECMO2l4cHZfZ7jpMrpKYB2C4L3x65kQAtbl1N5RtM0PMCMvBRAYIqKwWX6dSfBWrthOBbUyn/oNXfYfeUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767301118; c=relaxed/simple;
	bh=X8KXkCocbNuRb+X67/20nY1ut1Fml6Z0TAliwbhkBq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2RrzwbiBob+8p8PvcRFTiGxR1sJPyR5U2gTD9IlMrm4ToHR4tFeyTTqPaxySBpNf6sXn58FZkyyuTo3jdHxWjF5QVWyF7/OVH0rWTpAPvCmm3HOURcz203P7YQl7W8MpDQOmCtU5o1Ra4DggU8FMGhPxa05ywys7ewTHOHAUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSTV7UUT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B00C4CEF7;
	Thu,  1 Jan 2026 20:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767301117;
	bh=X8KXkCocbNuRb+X67/20nY1ut1Fml6Z0TAliwbhkBq0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DSTV7UUTKp/uwadTj7wswRt/Q+dVaDv8iLWLCDsGhAmDacEe/+KHyzU49mXaG31K2
	 L/ETKaucFic3PGf5i0YOhKdMY9055/q3eD1MfSDb8udHuGDjve1fSUj+Y6yEus2RUn
	 WwW97FJxs0t3H6ptCjauy8NY2zHciyVjub/ObmWTd4iRVAIhwntc/z1lQMLIe+v7Zu
	 TPYiZjc1x58Ol3L7MsZGGMfqHrx9wMx/mwOXGNgO/5fZz18AxjyThtmjyNrz3DEv9m
	 7W0T/igP2jxt5jWxe5wpYvlLZCaUoPxddQ3k7CUovXdfwwa63CmcMaI5AO2Se0DHot
	 cNKYvgqYis3nA==
Message-ID: <d3bcaf7d-06ae-4410-8d7c-970fdb196c47@kernel.org>
Date: Thu, 1 Jan 2026 20:58:25 +0000
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
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <a627abcaa38c0ba11c76c1f0c42b0c6b@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/01/2026 13:50, barnabas.czeman@mainlining.org wrote:
>>> +				for (; i >= 0; i--) {
>>> +					val |= BIT(i);
>>> +					writel(val, qproc->reg_base + mem_pwr_ctl);
>>> +					/*
>>> +					 * Read back value to ensure the write is done then
>>> +					 * wait for 1us for both memory peripheral and data
>>> +					 * array to turn on.
>>> +					 */
>>> +					val |= readl(qproc->reg_base + mem_pwr_ctl);
>>> +					udelay(1);
>> Isn't the logic here inverted ?
>>
>> i.e. you've written a thing and ostensibly require a delay for that
>> thing to take effect, the power to switch on in this case.
>>
>> It makes more sense to write, delay and read back rather than write,
>> readback and delay surely...
> This is the original reset sequence without modification, i have just
> moved it in a else case when it is not an MDM9607, MSM8917 or MSM8937.

Doesn't make it correct, we fix upstream logic bugs all the time...

For example a read-back to ensure write completion is only required for 
posted memory transactions.

Is this a posted write ?

Is there an io-fabric in the world which exceeds 1 microsecond to 
perform a write transaction ?

Anyway leaving that aside the bit that's really objectionable and IMO 
obvious a bug is val |= readl();

Why or the bit back in ? and then why not check the bit was set on the 
read ?

val = readl() is a lot less janky and shouldn't it matter that the bit 
we tried to set is actually reflected in the read-back ?

Failure to set the bit would certainly be a problem...

---
bod

