Return-Path: <linux-arm-msm+bounces-117609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XBK6HBY9TmoLJgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:05:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A9726207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:05:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="agbpY/TL";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117609-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117609-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49FF13010168
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC65543637A;
	Wed,  8 Jul 2026 12:01:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17053425CEE
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:01:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512095; cv=none; b=JjCpmCgDC7MSfn6B9xxaW/y/LYWOHw3llMQPk1vEVolEqSb3EgL9+abGbIeR3cGVqD/xTVcMY/C8+3vto+EwDC07Woc8FLfBbyQdwr55Rh8/0yAAAYhWhgoGo6uy35sxOMLX+yNW8lQNJJb/JWePytVNKJ2HVsLp8EOjk+3goGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512095; c=relaxed/simple;
	bh=/a6IYbpWnGbUzqL0WVdR/2GwZ+Glpr8Tc4xAeYCi4cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAfg3rXj52UdHoQKzkwAmuZzsiyhxry/XGq20Zfhi+MX++7FVua1V49YYMmq608hskan2H0HIK/ORFsIEAvI+u1GD+hn9kaBbAiThypTmzbIdf9RSAZQIwEx3l9GCO56igWxRxA8UopgZrfifagl7nRzM5ziBLamxywMRhCkO5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agbpY/TL; arc=none smtp.client-ip=209.85.208.181
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39b119855d8so225091fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783512092; x=1784116892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4i8K/LEMzhnhSZqG+2fTmIR6QB4CQ+QcJMkt3W3IXEw=;
        b=agbpY/TLvcUiZWsLEQafWQxClTjApWb9UXv1pjQZSXrCOGBjeu1fJhmSgxz/TWm/Uk
         Eb1TXzSQKh/zEhBxc2gMBlSNhcoPg4jQ7tghDDM2VlP/JcWGpePq6+VoeKHuhaHIQ4WA
         eHmZELBfWzoacSUfZHiYkjqvJg3cS29fyS6LbjA4YEG1e/onCNhIknAQ9Sl8Af1KL2jx
         GjtXciIw1GkWBvfBnFKJ6cAzRpP8SvaSOlorEFc3EdC/bzGdU1UsjVf08F56V5/HnSs8
         xpmxFkwsFoVzX0X2V6X12iACcqcL67fa3Khl3zkjO8ymh+pfdq5E+Yq9SoFUJ1FT4kKr
         pv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512092; x=1784116892;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i8K/LEMzhnhSZqG+2fTmIR6QB4CQ+QcJMkt3W3IXEw=;
        b=lbTx+ATvxxwzzvJcr9tU9oZLgwLgV3HQIyoewIop4DGavXmm7aIM+Rx928GRMPcpC5
         4nd5EgA7+X/M1AgrZmEUDNfogGzLjdBuaVdO4tU0yoRkeV/yXIX5uP/yPaCDZV60WKlS
         XHX5w8yw0URL4vULhYcEw0NZQoNZof8GdVA38IrInm2Okp6eAnxyXq3kepYfic23ecMV
         TPgLE/Sa0aJzjfnelzRPqO0VgU3DlQPG+zKLj9Wqn7h0hi4aaYcE05UxhKnxTJmlW/5l
         TIVkvVQDlDUDw3W1Sk+N096PRep/cdLAS3Sn+ceSM3s/MfdMTbgfbBSh8rcou8/hlcy8
         J5sg==
X-Forwarded-Encrypted: i=1; AHgh+RrSrJNlaygb+oAWpR5Zdu8kl/ZpVE0oX4WArMfpyP80FAZm9zuGlZ29UQOcZ5hyflJS7k42BpLl6pMzag0s@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp+4hnXQHKebGklOPIHua36D2DhPcwrAKn9JaQiEiqZZI6D1+b
	7NylzZAzfto/XBEN4rDphoxS+EsjRNHkR+XlQqArxYJlz1raxr5wDKo1ItlOP9p/j3M=
X-Gm-Gg: AfdE7ckAK+OWVmjWkRBoEicxMUgas3olPlq2dBF0xQcpzv3LdtBA7FJFkqIOV49RQrn
	UJtC3UBWpn2nsmeJUKM51X5gGrVi75Rz0ZYZAUCnDkEviUc+XhKfnuOeMJ5Iwdso5BFydl06+Mi
	a3Ig38YQYoxfsxu1Xj45bPVe7CI6zYd9wjQ2ffZ+D8cciZOibAiyukNH60aSjYwv7fteg6VDv3P
	uhENdFYw5BqBw7k2rHppDo3pfllQLpsVJaRbLpF0iPlGpZECOx+zgR4OOZpm58BDOWwTZN8+9eg
	cshM88NN0bws/13zTv92K53sNW0cmaoCGcmXc7kX3y0f8Ist0LoEZOTYBShA4pk4XLHGQqHStAL
	QkUWRUIb1Nka4UANolYg0Ia1lTDlyMfq5zdU0aKYjRfAGljFEtZ3Aswbgwd7EZIMsVTjEWRltbn
	K38mHAlrtw40a24l47iZhz3lAumTfe9B/+yDfu6O7y1arhOyyAyvYNeVC8+rRrZQo4sYg=
X-Received: by 2002:a2e:a5c9:0:b0:39b:90f:b1cb with SMTP id 38308e7fff4ca-39c798269e4mr2943241fa.7.1783512092081;
        Wed, 08 Jul 2026 05:01:32 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c6f682129sm7596531fa.1.2026.07.08.05.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:01:31 -0700 (PDT)
Message-ID: <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Date: Wed, 8 Jul 2026 15:01:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
 <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
 <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117609-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:gjorgji.rosikopulos@oss.qualcomm.com,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC4A9726207

On 7/8/26 14:35, Dmitry Baryshkov wrote:
> On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
>> Hi Gjorgji.
>>
>> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
>>> Hi Vlad,
>>>
>>> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>>>> Hi Gjorgji.
>>>>
>>>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> Hi Vlad,
>>>>>
>>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>>> <snip>
>>>>>>>
>>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>>> +                                 "hf-mnoc",
>>>>>>> +                                 "sf-mnoc";
>>>>>>
>>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>>> the device node, they are found and should be allocated on parent's side.
>>>>>
>>>>> The interconnect has functionality to handle bw requests from different
>>>>> clients.
>>>>>
>>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>>>> to vote
>>>>>
>>>>> on that (actually it is possible in icc framework) but what is the
>>>>> benefit of moving
>>>>>
>>>>> those to camss? Is it not better to create camss icc. I understand
>>>>> you want them to be on parent side. But how to vote on bw? Most of the
>>>>> time it
>>>>
>>>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>>>> at this point of discussion.
>>> I agree but there should be an API for icc voting which Jpeg need to use,
>>> currently it is fixed to some values, but voting need to become dynamic
>>> at some point of time, because it depends on runtime parameters, resolution
>>> format etc.>
>>
>> Sure, but I believe it's quite clear that any software implementation
>> should be discussed only when the hardware description is fixed.
>>
>>>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>>>> could be considered as a "bus" device) to this new JPEG encoder device
>>>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>>>> get hardware descriptions as children device tree nodes of CAMSS parent
>>>> device tree node naturally.
>>> I agree the device tree is best to represent real hw topology. >
>>
>> Well, it's not just the best, it's the only possible way.
>>
>>>> Copying of the same identical information about clocks, interconnects
>>>> and power domains from the hierarchical parent device to children devices
>>>> is not needed, and practically it only lowers signal-to-noise ratio.
>>> Here also i tend to agree.>
>>>> Since information about the actual defect in hardware description is
>>>> reported, the problem can and should be avoided, the handling of a better
>>>> hardware description and dealing with any kind of complexity will be done
>>>> in the CAMSS and/or CAMSS children drivers.
>>>>
>>>> If you need to get a bit more formal point of view on the matter, I'd
>>>> prefer to see descriptions of hardware properties organised in a tree
>>>> topology rather than in the originally proposed star topology. By doing
>>>> it the system complexity is reduced from N to 1.
>>>
>>> Maybe I'm missing the whole picture of your proposal, but I want to add my
>>> point of view on this matter.
>>>
>>> The JPEG encoder HW block has no dependency on the other processing HW
>>> blocks in the camera subsystem
>>>
>>> It shares resources like camnoc, clocks, GDSC, etc.,
>>> but does not share anything with the other HW processing blocks. For me,
>>> the JPEG driver should not have SW architectural dependencies on CAMSS.
>>
>> To move forward there should be a clear answer to a simple question,
>> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
>>
>> If no, then JPEG encoder device tree node shall be located outside of
>> CAMSS device tree node, all resources needed for JPEG encoder device
>> operation get their descrition in this stand-alone device tree node.
>>
>> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
>> device tree node, and only resources specific to JPEG encoder device
>> are described in its device tree node, because other resources are
>> already described in the parent device tree node.
> 
> 2c from my side (for both sides of the discussion). Please keep it
> separate, if the block simply uses the resource which is also used by
> the parent (e.g. there are no special requirements on the AHB or sleep
> clocks) or if the device needs to actuall cast a vote on a particular
> resource (e.g. for this to function at this performance level, the MMCX
> needs to be at the turbo level OR for this to function at this
> performance level it will use 123 MHz of the AXI clock). In the latter
> case the resources must be described as a part of the device.
> 

Even this "description as a part of the device" might be not quite
necessary in whole, let me try to explain.

No doubts resource usage policies specific to a child device should
be naturally described in child device tree node, and it's applicable
to any kind of hardware policies (like opp tables etc.), but a list
of needed hardware resources still can be obtained (also by a driver)
from the parent, whenever it is found applicable and unambiguous.

This is to separate planes of hardware dependencies and policies/controls
needed for hardware usage.

-- 
Best wishes,
Vladimir

