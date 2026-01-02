Return-Path: <linux-arm-msm+bounces-87225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8DCEE6C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 12:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE0D9300D147
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 11:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1111E7C03;
	Fri,  2 Jan 2026 11:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKj9zzYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8604C1531C1;
	Fri,  2 Jan 2026 11:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354650; cv=none; b=MhyxyNn1HEvrkuteshsMSXQJIgVpfn68Gk87URvaMar+mXkPq01aInzUVdsdMacIblj4mtp4uhwcbKt5Ky4EdbR8QvaFPK44VkZm3VMA6NsWr2LFd2233Zyywot+cR+HAK0KHhIG6k5xn6XZLKS3ys3lBzNOMxKwUufEB9/JKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354650; c=relaxed/simple;
	bh=NI3SzsjuWcgU5cANBKZgxlCShIX/y2kHDzhAzbLM5rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf1rk4zKceeaGIgHukxd73FPmLBrWCBsgC73IW3SH8oD+qnYZFhH1CzGL6BpUS8Bph3MsFzCeIZI/+1rsFM+RoiwHRjMnhaI2AvPUvrVmhrAgv2c0V7OyXEwSn0nsOCImrxgi+xRXDpUGVcJR3C9BTA+E2IObAWqBwKHhTLycrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKj9zzYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54845C116B1;
	Fri,  2 Jan 2026 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767354649;
	bh=NI3SzsjuWcgU5cANBKZgxlCShIX/y2kHDzhAzbLM5rM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LKj9zzYAuY0dlvSKVTjZg7/uiyaQDDC5K3dWuxs8oSShkwPqQo4FjLKyPOVka7Xua
	 0SIwozBww7W/Ms1KlWkQzJcbKkTQ0d+XN5iEr3f/B7Bi4sB9ScpzJnL42qes8F6/WG
	 IPn128Epi2a7AZ+zcjgizWNhB8aVP5B+YRC7ebDrk+2ybyDnb7Jhq48RY2ouHiq9ac
	 abhkHAsFEhXsI28lM+pTMEKbXKfGMxKRuzCNIO2fGfRf7cx9OTuu0Yflp5B7/mvQRs
	 BEaB3rdmxj7JuUbXFSSrjmPaUymnGqaRKd0Hhi5VUYYV6Cyw1URdGUl3RXU6CfMdVh
	 D8P93VGTnKfPw==
Message-ID: <9c68b403-f11b-4395-a564-8172e7db5390@kernel.org>
Date: Fri, 2 Jan 2026 12:50:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa884x: fix codec initialisation
To: Johan Hovold <johan@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260102111413.9605-1-johan@kernel.org>
 <20260102111413.9605-4-johan@kernel.org>
 <18f646c0-00f3-4460-842d-cf8811dddecf@kernel.org>
 <aVevbmfwoHCqrnQF@hovoldconsulting.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aVevbmfwoHCqrnQF@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/01/2026 12:43, Johan Hovold wrote:
> On Fri, Jan 02, 2026 at 12:31:21PM +0100, Krzysztof Kozlowski wrote:
>> On 02/01/2026 12:14, Johan Hovold wrote:
>>> The soundwire update_status() callback may be called multiple times with
>>> the same ATTACHED status but initialisation should only be done when
>>> transitioning from UNATTACHED to ATTACHED.
>>>
>>> Fix the inverted hw_init flag which was set to false instead of true
>>> after initialisation which defeats its purpose and may result in
>>> repeated unnecessary initialisation.
>>
>> Either it results or it does not, not "may". 
> 
> No, it depends on whether update_status() is called with the same status
> more than once. So "may" is correct here.
> 
>> If the device moves to
>> UNATTACHED state flag should be probably set to "true". This is the bug.
> 
> No, update_status() has:
> 
> 	if (wsa884x->hw_init || status != SDW_SLAVE_ATTACHED)
> 		return 0;
> 
> 	...
> 
> 	wsa884x_init(wsa884x);
> 
> so if you set hw_init to true then init is never called when status is
> changed to ATTACHED.

Uh, indeed, so this was supposed to be !wsa884x->hw_init... or indeed
your meaning. This also means that this was never passing above if() and
the init() was never called.

regcache was probably synced via runtime PM, so at least that part worked.

Did you test this driver on actual device how it affects the behavior?

> 
>>>
>>> Similarly, the initial state of the flag was also inverted so that the
>>> codec would only be initialised and brought out of regmap cache only
>>> mode if its status first transitions to UNATTACHED.
>>
>> Maybe that's confusing wording but existing code was intentional and IMO
>> almost correct. The flag is saying - we need hw init - that's why it is
>> set to true in the probe and to false AFTER the proper hw initialization
>> which is done after ATTACHED state.
> 
> All other codec drivers have hw_init mean that init has been done and
> the check in update_status() reflects that too so this driver is still
> broken.

ok


Best regards,
Krzysztof

