Return-Path: <linux-arm-msm+bounces-117578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1D10LSUoTmoLEQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:36:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B42724646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:36:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=yCd7Wac0;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117578-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117578-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A164D3034A02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8799340BCBA;
	Wed,  8 Jul 2026 10:28:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C59407CCC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:28:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506535; cv=none; b=cOhYNUZ6E4tndyhgPhEyeM4q0iEoVzp2FrqVfDuPhpXDu8XNyX1mrfHIzSMMFHnW0VwigBFwDjAvPV/ZXFNM3jWGnK26XcFvqufU1aHp8vK0qLgTTLhSvgByzkMZmTbFUsnZoqaw0Wn9t4SECQAAwGgrKrzpMPDyLMWKyJKn7EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506535; c=relaxed/simple;
	bh=T+YudoEqU0gmjCwLQrrgsNuIsIATGlpgiIivT5AysPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RiS8fgFq0eCj/hzvoYjGvt9rfcsVemipELDrT1XzDCE1jA49OiH4Q83g26crHuQsyP7Mpn9tT1fJqdnElDuCWh0Jtc7JwuCCx+qj8353GqaySt4E+aCNh3+CwCm0vfReQpr9A/98aT2ZH0bTgXLaWiUSMnQgu9C1y9U65yxWads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCd7Wac0; arc=none smtp.client-ip=209.85.208.181
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c618799e4so127321fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783506528; x=1784111328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xHPnRrFIoOTHJ0es5XHY5x8jGBMXqt/1gGu6E0UmX+s=;
        b=yCd7Wac0Cg6Ji+PrbRua4XqGttMDamrIUcGwlNipvN9PayLsMGXI8VpbCgJUO4ygk0
         oKO2aCWeNx4OeMIaGCyiO/hP0vQ5O5lkUL8iq8tOGwML5FMHyKR2Acc8uKV+5zqAS4Hn
         0EyvFC9dU94vNbcteREPOITaZw97H1stdcK6j/QjtKh1zH1AQYKdPzs89dyHH8PpY5hR
         xuXO5fzxENiHu3ABFM9RmMJ44CTMENRxbsEErXtkubnCPyGX5UOYszLW1eh86+qJsKlK
         RtAkJeHwBuWbEd0r7vJcmYsdROiUoEnG9gO4oT61/7gdHCW/482goXiLnJYWhZHtO54x
         wYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506528; x=1784111328;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHPnRrFIoOTHJ0es5XHY5x8jGBMXqt/1gGu6E0UmX+s=;
        b=OLLU+2WyoI6eJJ2cU2tja+heBdZiID2PnTE8UAiHPAmgZ1eMeV8v56puGSKdgmbkrX
         upjy8kYqTuDvIZ/uIs0s1nFQ8tXDC0I1LKG9b7MlAKEzmWknv8wz0ijNNqZaS9soYpXa
         udLLsOkPcZtH8zZAPawmurOAsH0GUcWiopMZxkUKwgVKDusbhPIZJAEKcIA6dmBGiB/s
         +kFvDmpuC9LiUmYLqIg9v5hQuhPs82to1wRjzuhWUphpdBNn4cprpaCyNapgJzu2CO4X
         ldLyhqwuAMraM5P0CVL9WGkzMy0vgkawgmlmKAnVOtzEZhIRF+lUTyiB02TEQsN3aivX
         HlkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrmtprm81Kv40pXMeW4Dy6CZPCPvouVwP9c7azt7STa4rAkbgledh2NARVxwT5lVQH937nD8Q3MD1CLa6iF@vger.kernel.org
X-Gm-Message-State: AOJu0YzntlpRIjj9AKv+GW+KhUsYZwQMshX/h8Hu9MyIg6VinChKgypG
	PP86ZfHRSGmYyYlCp0WoA3U8u+/y+yqv/Tb7IjQMURhk3NOTSH9nmG37/taggl1fLInAEmRrwF8
	62h5g8Tw=
X-Gm-Gg: AfdE7cmf9NFtnxlzvd8zZMVPcBYXBiWc/2fJq7VgjdCo3V0rMLLBB+OXKl+x3pzSy8w
	nSNlUqk6VqZ98wCvRYe+jW3k+kUogzIBRyx3MSHqBl/ybxpfKwbNsVT5ISx8kL+9aJIbC00MT08
	reOxWEsHkbDc2CGNXOyE7kPMMxfpAmCHiHxjvgI9fy4H5GMnSK+khhznhIyHBQ+FDcqRVdy57Mk
	x2qZBD9+TbUVd7ibgsbBqoqHzwo/ZvFR18Ta/bXMMlrN/Q3PKEMIPjBqcnkh6lul2BoEUFnVoAv
	IbNhPUYwRzPI/sSjo6VEfFtv25gZw9aNtSodx1oE3aeq5qI5E7kQfwEv4EoZmcqOgaPlNr35EKg
	Ptac3QJAJPECaXvV5opuZZ4pMBYfzJWWUod/q9FD8X7PtTHID5S/5R6v7CtjhDGbgCmLqHdAcUU
	JNYc6pPmJj7Tqw1M71EZAE882CzeoPJMXCVbvkoZVAaiiBfoYMu2GIDwbesLLGjhPSdNWtetpzU
	TBaUg==
X-Received: by 2002:a05:651c:1473:b0:39c:754f:eaf1 with SMTP id 38308e7fff4ca-39c796f1452mr2908571fa.2.1783506528197;
        Wed, 08 Jul 2026 03:28:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1bdbasm34252791fa.5.2026.07.08.03.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:28:47 -0700 (PDT)
Message-ID: <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
Date: Wed, 8 Jul 2026 13:28:46 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117578-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gjorgji.rosikopulos@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B42724646

Hi Gjorgji.

On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>> Hi Gjorgji.
>>
>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>> Hi Vlad,
>>>
>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>> <snip>
>>>>>
>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>> QCOM_ICC_TAG_ALWAYS
>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>> QCOM_ICC_TAG_ALWAYS
>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>> +            interconnect-names = "cpu-cfg",
>>>>> +                                 "hf-mnoc",
>>>>> +                                 "sf-mnoc";
>>>>
>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>> the device node, they are found and should be allocated on parent's side.
>>>
>>> The interconnect has functionality to handle bw requests from different
>>> clients.
>>>
>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>> to vote
>>>
>>> on that (actually it is possible in icc framework) but what is the
>>> benefit of moving
>>>
>>> those to camss? Is it not better to create camss icc. I understand
>>> you want them to be on parent side. But how to vote on bw? Most of the
>>> time it
>>
>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>> at this point of discussion.
> I agree but there should be an API for icc voting which Jpeg need to use,
> currently it is fixed to some values, but voting need to become dynamic
> at some point of time, because it depends on runtime parameters, resolution
> format etc.>

Sure, but I believe it's quite clear that any software implementation
should be discussed only when the hardware description is fixed.

>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>> could be considered as a "bus" device) to this new JPEG encoder device
>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>> get hardware descriptions as children device tree nodes of CAMSS parent
>> device tree node naturally.
> I agree the device tree is best to represent real hw topology. >

Well, it's not just the best, it's the only possible way.

>> Copying of the same identical information about clocks, interconnects
>> and power domains from the hierarchical parent device to children devices
>> is not needed, and practically it only lowers signal-to-noise ratio.
> Here also i tend to agree.>
>> Since information about the actual defect in hardware description is
>> reported, the problem can and should be avoided, the handling of a better
>> hardware description and dealing with any kind of complexity will be done
>> in the CAMSS and/or CAMSS children drivers.
>>
>> If you need to get a bit more formal point of view on the matter, I'd
>> prefer to see descriptions of hardware properties organised in a tree
>> topology rather than in the originally proposed star topology. By doing
>> it the system complexity is reduced from N to 1.
> 
> Maybe I'm missing the whole picture of your proposal, but I want to add my
> point of view on this matter.
> 
> The JPEG encoder HW block has no dependency on the other processing HW
> blocks in the camera subsystem
> 
> It shares resources like camnoc, clocks, GDSC, etc.,
> but does not share anything with the other HW processing blocks. For me,
> the JPEG driver should not have SW architectural dependencies on CAMSS.

To move forward there should be a clear answer to a simple question,
does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?

If no, then JPEG encoder device tree node shall be located outside of
CAMSS device tree node, all resources needed for JPEG encoder device
operation get their descrition in this stand-alone device tree node.

If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
device tree node, and only resources specific to JPEG encoder device
are described in its device tree node, because other resources are
already described in the parent device tree node.

> The shared resources within the camera subsystem are reference-counted,
> the only exception is clock rates, which are set based on the last set_rate
> call — but I think that could be handled by migrating the clocks to be
> represented as an icc-clk provider, to keep the higher clock and maintain
> the needed policy.
> 
> What I think would be best (just a proposal) is to introduce a new camera-icc
> provider that handles all these resources — camera operates on bandwidth
> anyway, and rate calculations should be done in icc, since the  infrastructure
> for that already exists in the icc framework. But I think this has already been
> discussed with Atanas, so maybe there's no need to go over it again.
> 
> I'm not sure how to move forward with the JPEG encoder changes.

First of all it should get a reviewed dt binding documentation, let's
do it, and a software implementation will follow the agreement.

> I see two different proposals:
> 1. Independent sub-nodes (Bryan's direction) — I honestly like this one more.
> 2. CAMSS handling the resources currently managed by the other frameworks.
> There are good arguments for this too.
> 
> Bryan, as maintainer, can you say which direction to post next? :-)
> 

Here device tree bindings maintainers should share their view, if
hardware properties should be literally repeated in each child device
tree node and their parent device node (star topology, N copies one
for each child), or not (tree topology, 1 copy in parent's node),
this is a generic question.

-- 
Best wishes,
Vladimir

