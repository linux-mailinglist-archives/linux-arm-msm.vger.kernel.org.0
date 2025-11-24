Return-Path: <linux-arm-msm+bounces-83076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B61FC80EC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 642803A38B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560BA30E848;
	Mon, 24 Nov 2025 14:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GRYIApSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F330DEBE;
	Mon, 24 Nov 2025 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763993354; cv=none; b=IV9F4Mygbfux3TiVzwlzAshq8lO491TYGMclxu374/XnOwJhLk3YWAUZcB1E3cGg4K3H6BanHMzGCW7URE7wfVbfxSH/01sQz/JeDMN4c1+pVlgRRd4/HONXMWkFuTPW5+JL9wuU95vzmTrwH+z8NyA9fA4PSUOP9Q5tgFJ2Bq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763993354; c=relaxed/simple;
	bh=81qVuUQOcJWW9bmm/GNGt0SacHqNEplwqj8EsRrjyqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS93ODvDodmCpgHxU78Us8I/NVJ3V/iZ1jlRQ0D3b1dJ2uRVcdb9WoCsgDphK2iyob/jGtG+FhrV458WTrRWzkNV3Gl5rQuJRZL3Tv7SHVCQ9atsK/kxAF7ZKBk2xKKUMCYr0hkqDyDFxgRo9XYtENfhAqOwDZEQryz91N4wrBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=GRYIApSA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 305A32FC004D;
	Mon, 24 Nov 2025 15:09:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763993341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=v17Tpo5hM05KxW3Nh0AVAf6mVxERMsABBofIDbiBR9Y=;
	b=GRYIApSAC02FiDdWS1o5mSi0Co8cqFBl+MPRI+2AuiOiaCYCGVlQqiM+gbu/pcq0O8owmQ
	FxqYDCuy0v5c+mJ78jBBJLw2UFn9wzh3WEsfA+i4eflPQETFZ48hGZxo57iklqJZskGp28
	8kobpO99c5OuweWsqbf0LAxrlgn3kEE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <f8ebe524-1f0a-4f54-96ce-aa36f8659adc@tuxedocomputers.com>
Date: Mon, 24 Nov 2025 15:09:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
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
 <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Autocrypt: addr=g.gottleuber@tuxedocomputers.com; keydata=
 xsFNBGgPWcABEACY/HWP9mAEt7CbrAzgH6KCAyrre7Bot8sgoTbhMZ9cb+BYrQEmeW05Hr5Z
 XsuwV63VgjR1rBnecySAsfl8IPEuOTncE0Ox7prT9U3pVKsY+v3HOYJiaB9UbQ2cMjXsKbIX
 uaQWYVkQNWCF0cQhiq0tmROq2WQjtc9ZbRgogi5G1VE/ePbGH8a+LQG4+aJdeRgZLeEQOm88
 ljnWfbnVbQNJXqq5IAyCjU9ZfnNtC+Y2o2KM4T+XC1NMfAWG82ef8WuXk9jNuRPDcIfwoI0w
 mnZGy/KSWLRJxOPzqOgNrpmmhjSBqykyQmiE9t9vjPGWlgF+s/ac1GaFuLTVJnYlO3OA5iLT
 9VjGu4RuHBjwzmHPvp1eHN7GncoE4571TMXbeW6TCeGngv+RTm4dBtB1lOds/1CFOxc4ENZC
 TnGJHzciO7/hM3NB4HM9tkg31LoKTAoWRLiEQvtMTLmtrqHukd5OJp9Zoero8RUEhykSnFt8
 ojjcm4mZYf25n7r47nTpUq5G73jAF84biNh6PDp8RFoyWbTgzXQpDCwtUUjX2TgVomQZ5t3H
 3gNYT5jfeLe5djxpR6as50k9XHE3Ux5wGlQvDqHAnY4bUq250WzzR0/RdJlKpzoczPaohAuB
 ggAXIHlmpVxcqUIBY9pTw1ILuQ+keia3DoBaliqwGrTam6lCBQARAQABzTNHZW9yZyBHb3R0
 bGV1YmVyIDxnLmdvdHRsZXViZXJAdHV4ZWRvY29tcHV0ZXJzLmNvbT7CwY0EEwEIADcWIQT9
 C+gw5/8BKoEjHTXh93ExJiZfygUCaA9ZwgUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJ
 EOH3cTEmJl/K+7AP/RPo5hpY2anSDAlB2/Zrdp9LhAc8H6xA/9JnpvBgrbUakoVs7Z+hUexa
 eFSu0WM4EOX5U0mfS2RcLjChVLcLqnFEXe80JzloZdRNzDCb7AoaUqb5zocPa4JKFLNlk341
 vbkm9G5FCoy+qAXG4KSOMaxEE0MaeZR1p3js9c1puFaazrJbdLEN/KU5O5KZ8Jd6+TdIXqf6
 Ujf8rgIpsgeABcbE9Yg6PiFBuCa/BoSLsk+k4L9Sef9xoqFAiJHhcGkxULuRr5gRpPn8uHce
 ICv8qipFeI/YDI1mpjSzP8Vd5FU42qvSq2SCvwAbF1YFrwL5/8yeuE7jVHZb6oWJ9PuCQ/gC
 Ik9HjNLFUS6lKW7TvBWlpBO6Qu9Uh+PrPmciXLRJEdOJFiXRJBWxnF4hJqBufWss77aWn8TX
 rf56+zeyle4RPULbOZEjcbF0Zu7UgSS/vimAIGYkpOBFWxmXCjamcIk4nnFIcu6HweDyzTba
 3ZLGx0ulHPyk/XkOaNNwJpAzqp0r5evQIoAu8m8XfKoDbx5sLQyHCihQjepKC37yE/FVOVSA
 QK0MjD+vTqCAnYAhiraXwre7kvUYMa7cxdGf6mQkyRkkvzOya7l6d9hBsx76XhCXuWuzYPd2
 eDd0vgAaIwXV1auVchshmM+2HtjnCmVKYLdkgWWwtnPd/7EApb4XzsFNBGgPWcMBEADsDpi3
 jr3oHFtaTOskn1YyywlgqdhWzDYHRxK/UAQ8R3Orknapb0Z+g0PQ70oxTjVqg/XopGrzS3yx
 Y3IN1bLHoRzfXXf/xhhZRsVu6cFATNpgw5133adn9Z35+3rvGPaZUh1eXr24ps9j9krKvzel
 XbcW1OrKQ/mzcleYOetMizmKK40DaxJdjpKVRU03BACvoIUdpWMUTqUyNkDqemt1px0nTyGb
 kObGaV6+3D1dXpz5loYjCG9MnDFFEll9pRgObTO0p7N2YrXUz9uoYHHG5OddD3HrGgSm2N75
 8P35jobO/RLpBcJtqIBR3zGGfDlWkahkUESGSnImqELA8X1gise71VqpLc8ETHoRENAiuSzi
 Rb8HSKzuMpXr20o602Y46CYXkgwb6KAzT2QbBFKi7mQ79u1NcbC2mPkhdeDiUK2nF7lR7mKt
 r2sfGOG1uoYt6h57Ija5hQKHcaqEXeRZLKnR2O6vMpabEsZBewLJymAtay4oLhSm6ya6et8c
 CBftq0Pigj7H+zcalURdr8g8Xa2if5EI7C8LIxRmq9U7eCBnQDHnczIudtDT856QMsIfqcb7
 nGJFLpw1HIBiwquNzfzwIGlEyfxSepM6uY16HlCwthK+nw7zFbxS/PNqYLVQxvyl8fBjqcNt
 ROZnd7IY9CECa9St892EU1SLk1OPIwARAQABwsF8BBgBCAAmFiEE/QvoMOf/ASqBIx014fdx
 MSYmX8oFAmgPWcMFCQWjmoACGwwACgkQ4fdxMSYmX8rbdA//ajzMle1dGtsnJC7gITmEO2qf
 mcvmVE3+n4A6193oPlStCePyET2AHyRWv4rAbY3Wl2e3ii0z4G3f3ONWkxjvemnzJFl/EjyO
 HoEX8e+cncr3lWyudw8IqXFVogdlPdMNfI6SX1EKekCVPot/dNoCKrZUqbn3Ag4pldHUehuD
 M6FaI6zDO3jdiDWY+MxwvY0isleNT7J/EXSVUEURo6pcA6hASadHqYs7lBBE/GmEJNqTbfMY
 wKWEzSoxWAV8nVWVLej1uqffmoSXJt2M8SV41i3OA2SaSVSnQNd/KAEPk9Uhn/d7ZFdBLO+L
 USSsfabGu8Uv9Ez5+gXF7QoElqrUjwJQ+d8L1BfotSJMbAuikij9XyBkBbRuj3FxM8Yfp9cP
 l5vI0gqfMbj36QaNhXZYl5kK0Erw+mwnK8a2p7j7RtvtrvEu+khfTLrDQCpgznTK2W8G7oLn
 iAVOWlEtKQXXVoSoDRDCETJV6bfOzuA9qVNjXgwaQQfA/QrFMusPKW0oOgmE3sobkmo6PZVD
 Cj0BY3cLZSuTw5fXtFuYf3rhyrDfzu7KYCMlwJiadQSrhUWU7hBG3Ip3bbgXayqcG3ytQb/F
 j2o6LfW/2XyMPLuL42mc+aKmuHqk5PqTkvlTr/pn0temEL/ofJ0c2ygkgSZqAhg/yr01AQcX
 bsxTTcOuRnk=
In-Reply-To: <280982b8-ce86-45aa-812b-ef1bf6e57e3d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Krzysztof.

Am 22.11.25 um 12:15 schrieb Krzysztof Kozlowski:
> On 22/11/2025 12:00, Stephan Gerhold wrote:
>> On Sat, Nov 22, 2025 at 11:16:25AM +0100, Krzysztof Kozlowski wrote:
>>> On 21/11/2025 15:26, Georg Gottleuber wrote:
>>>> [...]
>>>> Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
>>>> Snapdragon X Elite SoC (X1E78100).
>>>>
>>> [...]
>>>
>>>> Because the SoC is now outdated and some functions still do not work as
>>>> well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
>>>> will not be offered for sale. We would still like to submit our device
>>>> tree to the mainline kernel and thus contribute to Linux support for a
>>>> compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
>>>> Germany, this device was sold in many large stores. (An official press
>>>> statement will follow on our website.)
>>>
>>> For me this is unmergeable, because we do not take stuff which no one
>>> uses (no one can even use), and I am sad I put effort in reviewing AFTER
>>> this was known to be cancelled.

In fact, there are a couple of these TUXEDO devices, some of these are
already being used by people outside the company (by Linaro). There are
also considerations to give the engineering samples to
Linux/ARM-(kernel) enthusiasts.

>> I don't think we have any requirement to have a large user base in order
>> to merge changes. There is already support for plenty of cancelled
>> products with only a few (if any) remaining users in mainline, e.g.
>>
>>  - Snapdragon X Elite Dev Kit (x1e001de-devkit), shipped only to a
>>    handful of users before cancelled
>>  - All ChromeOS SC7280 devices (including DTB variants for several
>>    revisions of pre-production samples), never shipped to anyone
>>
> 
> I discuss here the timing primarily and I don't know the timing about them.
> 
>> There are also plenty of internal reference devices that only a handful
>> of people have access to (MTP, HDK, CRD etc). What makes these any
> 
> They are still "maintained" and "offered", even if only for handful
> (like 3000 EACH variant) people. That's the amount of board of each
> variant, e.g. MTP8750, and all of them run some sort of Linux, even if
> downstream. So sorry, but 3000 (or whatever number it is) is not handful.
> 
>> different? Ettore has been actively testing and contributing to the port
>> for the TUXEDO laptop, so if he wants to continue that, I don't think
>> anything speaks against merging this device tree.
> 
> I won't be maintaining it, so not my effort in that, but since you speak
> about that - maintenance is an effort, thus I decide not to spend it on
> cancelled products.
>> In any case, I don't think the time reviewing these changes is wasted:
> 
> I am happy that you do not find my time wasted, but I disagree on that
> because knowing this is cancelled, I would probably not care and review
> products which are not cancelled at this time.

Do you maintain your position despite the above circumstances?

>> As Georg wrote, there is also the Medion SPRCHRGD 14 S1 Elite laptop
>> that uses basically the same hardware design. I'm sure there are (or
>> eventually will be) users of that device who would appreciate having a
>> fully-functional device tree ready to use. There is an open issue in one
>> of the Ubuntu repositories for example [1] to add automatic DTB
>> selection for it.
>>
>> In other words, even if we decide against adding support for the
>> "x1e80100-tuxedo-elite-14-gen1", the same changes renamed to
>> "x1e80100-medion-sprchrgd-14-s1" would still be valid and valuable.
> 
> That's why you send such patches with RFC title and FIRST (literally
> first) explanation in cover letter WHY, so people can decide.
> 
>> I wouldn't expect any other changes to be needed, although obviously
>> someone with access to the device should confirm that before submitting.
> 
> You still cannot apply my review to that other board, so still wasted
> time because I would need to review again.

I understand your frustration, but I'm still learning how to contribute
to the Linux kernel. However, we may be able to find a constructive
solution. Here at TUXEDO, we have the necessary Medion device and have
already adapted the device tree.

Would you review a patch set for Medion SPRCHRGD 14 S1 Elite?

(This device is still on sale and can be found in many large electronics
stores, at least in Germany.)

Best regards,
Georg

> 
> Best regards,
> Krzysztof


