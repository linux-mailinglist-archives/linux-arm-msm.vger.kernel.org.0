Return-Path: <linux-arm-msm+bounces-117555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Mx5LvsQTmrsCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:57:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294D723636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 10:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="RxrPX+n/";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4DC23043FCF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D4D403E9E;
	Wed,  8 Jul 2026 08:47:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9474028E8
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 08:47:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500474; cv=none; b=kDssW4MtDUfCfOvsvvUqC583UlLdtEBTfUsn9hx49u9jB7mpOvptY88ovcayLPRUd5S3V1nkOnfPCK+kZoslWH7KHfjHAmSlXtDQjhpcujOgf2/q/dpf0hExAPkYxhmRo03UjllOzqDBdXzKa9JTcpw2wKVGm9nlt6T0G22IxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500474; c=relaxed/simple;
	bh=pgTToACliyhAjJ+F8jyAnPofAyk5eqWaiRJY56YFv2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFKDrYdi7zpouqu2+2XFD0olUQF64hbEFRk06B22MItUJ+8hI+g9ZPFiWGtFa3npjL6ugCR79rRNbfkGVk3vfp746dJHLJlePf1Cx/fw2sm8LGFzN2Z6HxAbHF1OX46jvwq5q1DJ3mBs29MNsZ3N751tJ8NFEc6+eQTybyKX11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RxrPX+n/; arc=none smtp.client-ip=209.85.167.47
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb99bc721so56248e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783500471; x=1784105271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5slyaMHZZ5o7vhI3SEoNR1OWEg/jwQ9URJD1346nvf0=;
        b=RxrPX+n/A4GaSldXQp+I096fAYHlqrydyT8tuWtG28E3lwqFhWYygJQKp6e6QXuWmo
         ndmEdg5CS/bwCRJxOU9DbDW30+xWb8URzDvgGwD40yBZz9zjVynfu+NCwWTJ7XmL+IcR
         S+eiCmqRHF3gb6EcMXXWQgT95XU/rHwkpg6as894WpfVVr0hfT+3B6tKW8Z9OgJ4BgPp
         dLlhZbJDhmtLiyAjh9C/5a1qc8hm6SBVKombKObAv/ug2P9RpkgG91wqGhBLfLnOyQBh
         mpohm4Ctswd/cFeT8WKgIrTrV0CvpyGQ8vUQaJH94TBCLX833HVZHc0fHIBJmizTdxO7
         l0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783500471; x=1784105271;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5slyaMHZZ5o7vhI3SEoNR1OWEg/jwQ9URJD1346nvf0=;
        b=kjVI/LHCSa2p9aO9U9sHIRO2ntg+sZzbPWJItwGMzqUPC7ewc8wJIvZvhFB/jS/hqQ
         jSPtmBCqGJaUcSEMqFjrx+1rzDJBeBaYsyKHqq2VDEody5YZRDlj4bzukmjSqs6BI6fx
         nkzaUGzimMSYLKLgwmeU+Y7EfNiRW8Q/FvMW+vJXULBz4hKw8I8jYKwL9bdmqwVBCrG/
         u3XEW1Ad3e59/T3KEN8LcEnjXSitxTkfB8jVfcgnGFM5kYn5KQnmCl8vu1VJ6ru7JxnK
         UmdECF6XpuOPsdxMiJxx0KRlo1ga5e4SN/nVijxtJ4uoXCKuaChjh+HqzjNdrp15SvLn
         KZBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3qzH7+gAQaAWNk6U/DXhb+M+cFct46viON2QTWTuJcK1xrzzdB+37WmBfJimq/LZciOupRoaHUOi86x/m@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8U4hW2SJzq2x8LzPvhdaUrd2AhsTXrIgLdq9j5VKgta1RmzN9
	eQLiNwEZFSn9RLS41uS8xaqFJ4qzkJeWU4HBpdvpM5M1pwt98IsRdfIGIsoZF89wgY8=
X-Gm-Gg: AfdE7cm79onC+TA2KQAGEiRWuK53b5gnWxTmQi7js4leZ3U0wuAgH34xPJwmemmsf2a
	OIjLkc/77A+WOSvw0e6BKlwzk0wyMuZYjzU9sYuKtu1sSIwaNwtv27WQo3vEu1lF7JX5jomdw3M
	oBe37yQ2kJlTg6l8sfxMqTsysiO87l7Z/2l+4fOAOC2KbuVV9JVIWZsaQ9T0FboxezFoogheIZP
	ulA5RonykYkm6tUwMilIrDjMy/19kmkeK5/nFvuKMZk29bYFeNNbN/WQAn2m0Ow6dzRkPWdHxKQ
	I7x3djprX+q+WUKZrtHaoA+hor0xHKTCUS8WIdqVXTFL5JKST2HXUPcjxfClyT88V6gZizLOKdg
	/0opry5VS/EBeHEwzK/yQKQQPv09SvvCRpBTZJQgCKC+IkInuwHI3w98HYlDdIk4gQTMl1NqHdg
	mQigccAC4iPT47OpRrL8H3wc+iUqmau9YZlcwDHVHkQAvfVTywp+ZjRSKkEk/x/vjDejA=
X-Received: by 2002:a05:651c:2228:b0:396:8c78:3d53 with SMTP id 38308e7fff4ca-39c79832ce7mr2061261fa.8.1783500470732;
        Wed, 08 Jul 2026 01:47:50 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad18b5asm29411131fa.9.2026.07.08.01.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:47:50 -0700 (PDT)
Message-ID: <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
Date: Wed, 8 Jul 2026 11:47:22 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117555-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1294D723636

Hi Gjorgji.

On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
> <snip>
>>>
>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>> +                             &config_noc SLAVE_CAMERA_CFG
>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>> QCOM_ICC_TAG_ALWAYS
>>> +                             &mc_virt SLAVE_EBI_CH0
>>> QCOM_ICC_TAG_ALWAYS>,
>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>> QCOM_ICC_TAG_ALWAYS
>>> +                             &mc_virt SLAVE_EBI_CH0
>>> QCOM_ICC_TAG_ALWAYS>;
>>> +            interconnect-names = "cpu-cfg",
>>> +                                 "hf-mnoc",
>>> +                                 "sf-mnoc";
>>
>> This is the topic, which may raise a disagreement, but I'll repeat my
>> position about the need to remove all "CAMSS bus" specific resources from
>> the device node, they are found and should be allocated on parent's side.
> 
> The interconnect has functionality to handle bw requests from different
> clients.
> 
> Yes the best will be to have camss interconnect, so jpeg and other hw's
> to vote
> 
> on that (actually it is possible in icc framework) but what is the
> benefit of moving
> 
> those to camss? Is it not better to create camss icc. I understand
> you want them to be on parent side. But how to vote on bw? Most of the
> time it

Let's concentrate on hardware bindings description, no APIs, votes etc.
at this point of discussion.

There is SM8250 CAMSS device, which serves as a hierarchical parent (or
could be considered as a "bus" device) to this new JPEG encoder device
and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
get hardware descriptions as children device tree nodes of CAMSS parent
device tree node naturally.

Copying of the same identical information about clocks, interconnects
and power domains from the hierarchical parent device to children devices
is not needed, and practically it only lowers signal-to-noise ratio.

Since information about the actual defect in hardware description is
reported, the problem can and should be avoided, the handling of a better
hardware description and dealing with any kind of complexity will be done
in the CAMSS and/or CAMSS children drivers.

If you need to get a bit more formal point of view on the matter, I'd
prefer to see descriptions of hardware properties organised in a tree
topology rather than in the originally proposed star topology. By doing
it the system complexity is reduced from N to 1.

> depends on the jpeg encoder configuration based on resolution format
> etc. to set properly average bw.
> 
> So i dont see how that can be done with not explicit dependency on jpeg
> with camss and some exported
> 
> API's which we discussed with Bryan they are preferable.
> 
> Maybe i do not understand properly the proposal but can you just add
> some pseudo code
> 
> how you see the things?

Let's define and agree on hardware description first, then the path
to its implementation in drivers will be clear.

-- 
Best wishes,
Vladimir

