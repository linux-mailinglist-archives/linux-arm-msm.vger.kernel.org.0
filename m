Return-Path: <linux-arm-msm+bounces-103055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNt3Ezjo3WmulAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:09:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B33F66B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5EF730B038A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 07:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFDB35B64D;
	Tue, 14 Apr 2026 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nVl9FLh9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57212342519;
	Tue, 14 Apr 2026 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150342; cv=none; b=nJX0ZBgTmOl8uuK7lDND/hQlOFanV8pTT+pirT9HEgt2yPwd6hDLKV/G6L6Ni23jHiJR7DdzriLPS065KfPZo9PAPxXJtgz3JXdaN8TgpFuaSks5c+Z4S+Hku7mr8w4eF547hloBW5pKJ44nwcqJtL3jbSZCn/SDQFT968xUdyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150342; c=relaxed/simple;
	bh=RPkgGlZiCHcWal52nPhWopxIa+KLyQVGU21nLwjz1iM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APWvjAtXVf8dF1mRFcWY6seBC5seaGdyx/tT7UQTbnzqoDqqKxqfctW9ud3pMLY/wufnXysG33bjrSqK+VoABoVedD8FMf166JFnx7+CDzAENC6wQirtLMZ2EuWMNKvzkpOqnZVmA1+yuvkHUPdG5MAtLaie4o/f3NDHeGGEtR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nVl9FLh9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D51C19425;
	Tue, 14 Apr 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776150341;
	bh=RPkgGlZiCHcWal52nPhWopxIa+KLyQVGU21nLwjz1iM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nVl9FLh9TvM0WwqObP40Ese/zlAP3AIcQZUTZLHOjxItflSaO/kpbg/UWEOMZAVf1
	 /GhY9SDEfPv/bOLo0ghgkzZB0rKilQ778kISKm18QtXa72njbvzKXndBrA03Tr6UOF
	 uEH9l0S+KgQg1Yxllu7LqXblpd9tqbDqQaGJJB3UED4hyS3ALa3DPPry2ZU0CClDP5
	 uKZtXdjYIzx1rAsetC2qmJ820dh2UKCMXvsA2cQiQCffUmCH50cT2mpGkGvSaQIyqe
	 wde8Umt4vpzuUdZ+fnq9/POGEJpGzD0kXJmpOuvCjlpaHLWMTmp5Dx0rCsp5mgjKI4
	 2NtGZ6wUVh0rQ==
Message-ID: <0afae218-a9c3-461f-a6c5-f984e8dbb78e@kernel.org>
Date: Tue, 14 Apr 2026 09:05:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
 <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
 <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
 <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103055-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[get_maintainer.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A38B33F66B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 08:59, Shawn Guo wrote:
> On Tue, Apr 14, 2026 at 08:23:12AM +0200, Krzysztof Kozlowski wrote:
>> On 14/04/2026 03:21, Shawn Guo wrote:
>>> On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
>>>> On 13/04/2026 16:34, Shawn Guo wrote:
>>>>> In short, there will be Nord DTS using the binding coming, and I do not
>>>>
>>>> Maybe there will, maybe there will not.
>>>>
>>>>> think posting them at the same time should be a requirement.
>>>>
>>>> Well, it is a requirement as I explained previously, said that
>>>> *multiple* times on the mailing list, documented expectations in
>>>> mentioned/linked email threads.
>>>
>>> To be honest, I can only read the following from mentioned email
>>> threads.
>>>
>>>  - Binding and DTS should be organized in separate series per subsystem
>>>  - DTS should reference binding series by a lore link
>>>
>>
>> The links told explicitly to organize series per subsystem/maintainer.
>> Who is the subsystem here?
> 
> Rob Herring <robh@kernel.org> appears at the top of get_maintainer.pl
> output, so I guess it's DT/Rob?
> 
>>> These are what I'm trying to do, and I'm not just posting DTS
>>> simultaneously.  I do not really read the requirement of posting
>>> binding and DTS using it simultaneously from the email threads.
>>>
>>> Taking a step back, even if the requirement is mentioned in an email
>>> thread like this one, I'm not sure it's the correct or well received
>>> way to define a requirement.  And that might be why you had to keep
>>> repeating yourself.
>>>
>>>> It's also documented in submitting
>>>> patches in DT (although not with that strong wording).
>>>
>>> Either I'm blind or reading the wrong document.  I failed to find
>>> the requirement of posting binding and DTS using it simultaneously
>>> in Documentation/devicetree/bindings/submitting-patches.rst.  Could you
>>> point it out explicitly?
>>
>> Rule 8.
> 
> This one?
> 
>   8) If a documented compatible string is not yet matched by the
>      driver, the documentation should also include a compatible
>      string that is matched by the driver
> 
> Are we looking at the same version of the document?  How does that map
> to the requirement of posting binding and DTS using it simultaneously we
> are debating here?  I'm confused.

Why is the rule there and what is expressed by it? We do not discuss
posting binding and DTS using simultaneously. We discuss lack of user of
a binding.

I even asked earlier explicitly:

"Why do want even such binding?"

Do you have a user of this compatible? Not a single one. So apply the
spirit of that rule. Or if you cannot get the spirit, you could apply it
literally.

Best regards,
Krzysztof

