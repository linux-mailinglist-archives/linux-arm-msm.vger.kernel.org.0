Return-Path: <linux-arm-msm+bounces-82952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3FC7CE06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 12:15:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E5A33A96AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 11:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A32519E839;
	Sat, 22 Nov 2025 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpSa+eAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA51219EB;
	Sat, 22 Nov 2025 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763810146; cv=none; b=f4V2E4T5DhyXowEi32pZjvijY/TInoOQ9ohLvqDIt0uwtAXK+m2Deit2JhIdCelXGD7RZ22EcjbmFbvoVYhxWq8XleiS27s1DP8HdfngZdl9Uvev1oiCT8k4evE8x9LsMpnzECuk/J6NEbHijcQhKdhmnTQSGpcaQ6qRScQQfhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763810146; c=relaxed/simple;
	bh=5vrxjnx51zxB+v5UZpcUFOyOuKmgI9qmvzbtwXGINQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2PLmURoSvNG3r4GIvYWwj6SmULo9GxEQZgJU29QCMAcKuySXjH2bqWrlncTPCUOdmKJhpP8gp3aK5adcZdCBdE8IeFBLdMTG6s/OHtsrNUyDU+OVo0NHOOWZeiGJDTS/wFnySgu36ctQ4S08PjEujhttQ3cgR4VuU6rWOGBo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpSa+eAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89576C4CEF5;
	Sat, 22 Nov 2025 11:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763810145;
	bh=5vrxjnx51zxB+v5UZpcUFOyOuKmgI9qmvzbtwXGINQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bpSa+eAjuiVmQMfJf5YPUdxad1dB4+2jCBcuQz2j9dhXIe9vkT/ToqMHxZXX0KLeZ
	 sC+3vNhYYF03daIVNNjeiSVc5y2cP4hW9FL0BXxlzdbODL4JI552tt6ksV5iVSOZoc
	 2CT4mtUw9vrupgLY6dd/mIsmWAz8cpbWSS/5HzMje8uYvAdE6UlK7WBZ1Gan7b0g93
	 IYB6DVFDsCryjOXTPyW6oWMYPAhg5ZS6sKJ9I1tYammEmSA8ZiM1Csh3VcQfcYNBV3
	 lrOfvscRm2F5oeIhLvhwIN2AZDN3dEXjVp0J3P6brnzR7b0fm8IyYtBr8MJEfwfX6l
	 iQyrQmvluzKvw==
Message-ID: <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
Date: Sat, 22 Nov 2025 12:15:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
 <af3d3295-1340-417f-8682-7d7e2bc6c812@kernel.org>
 <aSGXu7IhPDNSkYhi@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aSGXu7IhPDNSkYhi@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/11/2025 12:00, Stephan Gerhold wrote:
> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
>> On 21/11/2025 15:26, Georg Gottleuber wrote:
>>> [...]
>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
>>> Snapdragon X Elite SoC (X1E78100).
>>>
>> [...]
>>
>>> Because the SoC is now outdated and some functions still do not work as
>>> well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
>>> will not be offered for sale. We would still like to submit our device
>>> tree to the mainline kernel and thus contribute to Linux support for a
>>> compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
>>> Germany, this device was sold in many large stores. (An official press
>>> statement will follow on our website.)
>>
>> For me this is unmergeable, because we do not take stuff which no one
>> uses (no one can even use), and I am sad I put effort in reviewing AFTER
>> this was known to be cancelled.
>>
> 
> I don't think we have any requirement to have a large user base in order
> to merge changes. There is already support for plenty of cancelled
> products with only a few (if any) remaining users in mainline, e.g.
> 
>  - Snapdragon X Elite Dev Kit (x1e001de-devkit), shipped only to a
>    handful of users before cancelled
>  - All ChromeOS SC7280 devices (including DTB variants for several
>    revisions of pre-production samples), never shipped to anyone
> 

I discuss here the timing primarily and I don't know the timing about them.

> There are also plenty of internal reference devices that only a handful
> of people have access to (MTP, HDK, CRD etc). What makes these any

They are still "maintained" and "offered", even if only for handful
(like 3000 EACH variant) people. That's the amount of board of each
variant, e.g. MTP8750, and all of them run some sort of Linux, even if
downstream. So sorry, but 3000 (or whatever number it is) is not handful.

> different? Ettore has been actively testing and contributing to the port
> for the TUXEDO laptop, so if he wants to continue that, I don't think
> anything speaks against merging this device tree.

I won't be maintaining it, so not my effort in that, but since you speak
about that - maintenance is an effort, thus I decide not to spend it on
cancelled products.

> 
> In any case, I don't think the time reviewing these changes is wasted:

I am happy that you do not find my time wasted, but I disagree on that
because knowing this is cancelled, I would probably not care and review
products which are not cancelled at this time.

> As Georg wrote, there is also the Medion SPRCHRGD 14 S1 Elite laptop
> that uses basically the same hardware design. I'm sure there are (or
> eventually will be) users of that device who would appreciate having a
> fully-functional device tree ready to use. There is an open issue in one
> of the Ubuntu repositories for example [1] to add automatic DTB
> selection for it.
> 
> In other words, even if we decide against adding support for the
> "x1e80100-tuxedo-elite-14-gen1", the same changes renamed to
> "x1e80100-medion-sprchrgd-14-s1" would still be valid and valuable.

That's why you send such patches with RFC title and FIRST (literally
first) explanation in cover letter WHY, so people can decide.

> I wouldn't expect any other changes to be needed, although obviously
> someone with access to the device should confirm that before submitting.

You still cannot apply my review to that other board, so still wasted
time because I would need to review again.


Best regards,
Krzysztof

