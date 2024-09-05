Return-Path: <linux-arm-msm+bounces-30900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5323396D8B6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC421F27ADF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A3919B3C1;
	Thu,  5 Sep 2024 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1O7vPh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B83019AA72;
	Thu,  5 Sep 2024 12:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539755; cv=none; b=HWhNK2OWrsZW/+Jr3g3bBOjw+yim8xqkEl9a1xdUZp4gwK0p6h8p0uljf+i3slqi5AgjDhe9/U/dXfJ+0dtMjriOETk7o6MpOseDFvHgCDnKrY5UwuV0PoP6nwrkJ+QEuQ0ACtM8R+VEIGUN5layrYOvYAURg5xwtKs5kNI8T9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539755; c=relaxed/simple;
	bh=KTqQKsBdJ9gRS0tkGSzy4Ng7crzV4JM8xmW8P4ui1QI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eM2vito6DEw8Zf4k9y9horgKGx6icjRhbg/1lr+p03GJlLh02NYqo49CNJLot8c2PF/iZTCBxa462y5DPfayrtYis2SII0srthmGQeISnptkB4u8g0mwV/JzxLB1xfV1kJboPdfH8mipMHfU+5MFVoftj/vm/Cvq2LHf0g/jy9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1O7vPh5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5590C4CEC3;
	Thu,  5 Sep 2024 12:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725539754;
	bh=KTqQKsBdJ9gRS0tkGSzy4Ng7crzV4JM8xmW8P4ui1QI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K1O7vPh5gWZwwXO+0u2MSOT/SxjeQRBXp1SJnyJcDjAI6SQvAzLKsBPFuXQu8qrDo
	 g14hy6tOnNc3am3vP8YjHvKJQ0+OyBqvmbYtPSU6eFYt+RtCtarEhZI5vhHV4qC6kB
	 17yDaO7Wq7armkjoJFyqyhNvg5N/DEW2I+sNY8EIBAGhYNpWkYhE0U/OodotrOV+eM
	 y5R0aoVEF2D+NrsTWhgjAip4rPkIyUDzkPXcnC4kshqyGWcR5zXFDOflEjrA1vihgC
	 KAhKeLRXG3/oBFzGEtGEK8P1hYdpM4spX26Bg3Nf1q+5cRonORW76xy37RpMm+s+To
	 yjXJaUpV9pAmQ==
Message-ID: <42cfe883-5411-4948-b36d-c0c3dd3d1294@kernel.org>
Date: Thu, 5 Sep 2024 14:35:50 +0200
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
 <08e8f26a-d87e-4d3e-9896-b809d5f0c3a0@kernel.org>
 <6267a1fe-0073-4aca-ab19-a63a7565f116@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <6267a1fe-0073-4aca-ab19-a63a7565f116@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4.09.2024 8:55 PM, Dan Carpenter wrote:
> On Fri, Aug 30, 2024 at 05:31:14PM +0200, Konrad Dybcio wrote:
>>>
>>> There are a few things which we could do:
>>>
>>> 1) Returning -EPROBE_DEFER to an ioctl or something besides a probe()
>>>    This is a bug right?  -EPROBE_DEFER is basically kernel internal for probe()
>>>    functions.  It tried to write this but it was complicated so I gave up.
>>
>> Maybe call_tree.pl can somehow be used with an if name[-5:] == "probe"
>> or something along those lines..
>>
> 
> I wrote the call_tree.pl script before I had the database.  These days I tend to
> use the database instead.
> 
> I've implemented this check but it only looks at ioctls.  I'll test it tonight.
> 
>>>
>>> 2) Printing an error message for -EPROBE_DEFER warnings
>>>    I've written this check and I can test it tonight.
>>>
> 
> I've done this.  See the attached check and the dont_print.list file attached.
> The line numbers are based on linux next.  The false positives from here are
> pretty harmless because calling dev_err_probe() is fine.
> 
>>> 3) Not propagating the -EPROBE_DEFER returns
>>>    This shouldn't be too hard to write.
>>>
> 
> I've done this too.  The false positives from this could be bad, because we only
> want to propagate -EPROBE_DEFER back from probe() functions.
> 
> See propagate.list.

This is great work, thank you Dan!

Konrad


