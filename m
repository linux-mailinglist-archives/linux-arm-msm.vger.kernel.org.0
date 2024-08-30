Return-Path: <linux-arm-msm+bounces-30273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 844F19665C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 17:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B75761C20DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 15:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B90E1A287B;
	Fri, 30 Aug 2024 15:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqGpU9gN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D613345C0B;
	Fri, 30 Aug 2024 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032048; cv=none; b=NxKDF6RTZNUA5k0Je1OBBamQQviiuNA7YQLLa5ENNyZICzwHaugGE78UNPqM3wc+ZhiDxPd/E0KK7N86/KriZx/IYR0gkuVK9tJW5MbMNXo6Z9znIhpl1cMkWhDSHcRNZuRAzw8enq4DIWe+Px1hCu/pHZCp0cAWKvnb0sfb9/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032048; c=relaxed/simple;
	bh=SnJjIE4aJi7goKoUT2vPrbpSERDXPoBU01P8N44zpQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EawfVmnnxkcZk4aWhpx8kc7YUQesIiMGpTgj24GipgzacME4zJHJ+hf2qty5m43EMQA76cbDQlpis+Gi0Ice87V3Hiir+ZULXi0pUZjj/ITxtoN/VZ5VAjlFjVDGKdcDWjWsoOMcKRJd1AnSrK20oJch0s9A2UuL0b4vMay76rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqGpU9gN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388ACC4CEC2;
	Fri, 30 Aug 2024 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725032048;
	bh=SnJjIE4aJi7goKoUT2vPrbpSERDXPoBU01P8N44zpQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aqGpU9gND0Xkx2vgNd9t5Za4V97d9Cg8CYp6r3V1pI5XqBX+ryJTGfCYF393sgWMp
	 udA35bMV+/RdjUSCmPILaQrP6QypMGkGC+euyaI4g424v8sG6ypwp0brztQhsqmyU6
	 3SFQz52gQWvXzyBlMVXkjYGhqkoA09zryH9UOuHTd88LxUwufiAWvt/a/NZuBJPxRh
	 NoYh6oe8XulWJgdVcK6gOrL1g1L1eR1PSyfKz1A9TrPvHXxfqbxwdmf6pOGQ1Tj0Xw
	 aXhzfEp8HUWWVLEvAMBBHyOUNUeBEG1RWsKWxypYCNAFCi91wekdFo3uBkA4Krafvk
	 MKc0PyGl6E6cA==
Message-ID: <08e8f26a-d87e-4d3e-9896-b809d5f0c3a0@kernel.org>
Date: Fri, 30 Aug 2024 17:31:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: pbs: Simplify with dev_err_probe()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Yu Jiaoliang
 <yujiaoliang@vivo.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 opensource.kernel@vivo.com
References: <20240829124813.3264437-1-yujiaoliang@vivo.com>
 <894145dc-46fb-451f-a461-d0b9ff1e50dd@kernel.org>
 <10fad15b-d2a6-4ec1-8af7-bde8f7bf39be@kernel.org>
 <63162b67-22ef-482f-9600-861e9dbaf4fc@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <63162b67-22ef-482f-9600-861e9dbaf4fc@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 5:19 PM, Dan Carpenter wrote:
> On Fri, Aug 30, 2024 at 12:03:20PM +0200, Konrad Dybcio wrote:
>> On 30.08.2024 10:08 AM, Krzysztof Kozlowski wrote:
>>> On 29/08/2024 14:48, Yu Jiaoliang wrote:
>>>> Error handling in probe() can be a bit simpler with dev_err_probe().
>>>>
>>>> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
>>>> ---
>>>>  drivers/soc/qcom/qcom-pbs.c | 7 +++----
>>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
>>>> index 77a70d3d0d0b..ab9de12ec901 100644
>>>> --- a/drivers/soc/qcom/qcom-pbs.c
>>>> +++ b/drivers/soc/qcom/qcom-pbs.c
>>>> @@ -201,10 +201,9 @@ static int qcom_pbs_probe(struct platform_device *pdev)
>>>>  	}
>>>>  
>>>>  	ret = device_property_read_u32(pbs->dev, "reg", &val);
>>>> -	if (ret < 0) {
>>>> -		dev_err(pbs->dev, "Couldn't find reg, ret = %d\n", ret);
>>>> -		return ret;
>>>> -	}
>>>> +	if (ret < 0)
>>>> +		return dev_err_probe(pbs->dev, ret, "Couldn't find reg\n");
>>>
>>> This cannot defer, so not much benefits. And you ignore other place in
>>> the probe()... That's like a weird pattern with all your patches change
>>> something irrelevant, but leave other places unchanged.
>>>
>>> That's pointless and churn.
>>
>> Hm, that's a good point.. Maybe the static checker folks could come up
>> with a way that would find functions that call something that can defer
>> at one point or another and suggest (not) using dev_err_probe with W=1/2..
>> (although that is probably not going to be very high prio given all the
>> other static checker issues we're still yet to resolve)
>>
>> Unless we have something like that already? +CC Dan
> 
> I believe these patches are from people writing their own Coccinelle scripts to
> do the conversions.  There aren't any published scripts which care one way or
> the other.
> 
> device_property_read_u32() can't return -EPROBE_DEFER.  It's documented in a
> comment.  So this is just a question of preferred style.  There isn't a kernel
> wide preferred style on this.  Some maintainers prefer to not use dev_err_probe()
> where it "doesn't make sense because ret isn't -EPROBE_DEFER".  Other maintainers
> use it all the time even for error code literals like:
> 	return dev_err_probe(pbs->dev, -EINVAL, "invalid input.\n");
> Because "it's cleaner, more uniform and only takes one line".  I think Julia
> said she didn't want to get involved with this debate and I definitely don't.

Personally, I don't mind either.. so longer as it's consistent within
the file

> 
> There are a few things which we could do:
> 
> 1) Returning -EPROBE_DEFER to an ioctl or something besides a probe()
>    This is a bug right?  -EPROBE_DEFER is basically kernel internal for probe()
>    functions.  It tried to write this but it was complicated so I gave up.

Maybe call_tree.pl can somehow be used with an if name[-5:] == "probe"
or something along those lines..

> 
> 2) Printing an error message for -EPROBE_DEFER warnings
>    I've written this check and I can test it tonight.
> 
> 3) Not propagating the -EPROBE_DEFER returns
>    This shouldn't be too hard to write.
> 
> Let me add a KTODO in case anyone wants to do this before I get around to it.
> 
> KTODO: write Smatch EPROBE_DEFER warnings

Thanks!

Konrad

