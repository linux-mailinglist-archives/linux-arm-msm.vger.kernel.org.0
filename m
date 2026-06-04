Return-Path: <linux-arm-msm+bounces-111170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3CEHJNGIWqOCQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:34:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C97863E936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:34:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=f9WtFGKR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111170-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111170-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2001630E4AA3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148593FBEC2;
	Thu,  4 Jun 2026 09:20:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE653F44CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:20:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564852; cv=none; b=VvFaBKhdP7HNpyZ4ZrPUNdZ9j9OTM/su05o3DPFxIETlU2boQrEZUZLJ6wf1kxzMWkeo7GplZt2YyebH1kOZA9bPm5qJjoXhSaiYkXc7AX4KDdZOdUFKlNY7v7FZol5psZTlh1O2TwaFxqwotyBAGo2e6lFJZAwbBib2L60lB0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564852; c=relaxed/simple;
	bh=WCmb9+DZHNXcKsfaqnMvmzEYr12OVR4soMLhduJC3Es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChKZokRWkdefmxj7ZERMqQsocc1z4e2o7CPFbsiy0hUQ5ZXrHuxil3VGZc35+3Q/Dk1zcQr/8+1MRgKBvN8kq5zScconTnpCdcJiMjz6WhOijZUjSdeUV46JJhGF7rjq1HYci6FBaGOvnOk0qszrKrGvRvWyUyMxrRRneKuKI5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f9WtFGKR; arc=none smtp.client-ip=209.85.208.177
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3968b1e521fso546461fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780564847; x=1781169647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmJhxd6Spss8k56OkvnPH6btFz24l1uTr3gxaOR02sU=;
        b=f9WtFGKRkPuBnHZtizCUjJYzQaa3Nc7lgf4zXaBa3y2ewSm/pcdM0fit55u+mhYF9c
         CEao1AWAk4oSxOu0OAcDiFy6vafnMR0QKNtWNjrx+9lv1Jp+EgkfoWoXGsTn9HY5MY1T
         a/EJcMZlVUiY69YPwSLsBSxouoUjSgJSq7nWMtTk8riY48ObMVk8c6iwNZtCoVS87tp6
         //jscplnHLdb1GwMRe8U1JIB8aYl4KRkxQXluOnQyIuR4X9Zos+Eytidq7PiT+k/R0l0
         AZqgpOcEkp5BuF1nOtzmtXW8Qdrax/kNLwv7YDRQDGc2ak4TIO9Wy1ZMhx6vN2TddOYB
         o1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564847; x=1781169647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmJhxd6Spss8k56OkvnPH6btFz24l1uTr3gxaOR02sU=;
        b=Wpdt4r9ug4f+gCmXqOdOxOimw8JCpd/qisKLHByuSdcy/LwmsGn+Y2RRMCS5RCZdlC
         baG7z2HrhoX5LTaKopirXsRdxBpn+kHS60HQ9BIaWdMnUFqpJALi7bouFPgGLPNSuFR/
         h0nGIYC/N6SkiSKBJYjPsV6ozh7lopKOUiAnV/eL9SrxApxlR58qAZ4uo6JUhun4H5NZ
         qPjXyGi5H6HjZABkqwKwBB+7i/t8OE/qfVR8vYUXSBCCkueARQozw3kGPPBLJcqILYF0
         FlttURNFi05oIt08wvoOuj7Q2IgGnrKHSJ0w5p6xGjBiG0zdoiZs9mKFoQLFrudWF9Cb
         tBHA==
X-Gm-Message-State: AOJu0Yy0NR3QuiExOpxXrSF/XpJrmFwTDG5tC4BZ1RtltZAq6CZHB87t
	u/cWvyHVDIKnzgK9fWiN2MTw/LsTcmlQfyjR/6nqju0wPqZM818qzSz64NnfL4RcvqQ=
X-Gm-Gg: Acq92OEwAwqINBXWVwKrzsSewfxLEKGIuZoxbmFs3KmL4uuskwXGC0vZHdqkmvg6wTK
	TanEmt0s/S+eGbvslRKEWEpaJjoedgTh7vKc8Be33FZHum5Tjhc5y7+jeOEteoX3NHuR1uF5sa+
	z3aSj90i74Q5pCM7MZxSeFnCDJtBp5djhsim85E+wz3AR2wrINSGWwKCx2w/wA7P2NYqX7M3YpS
	I8dV6oSfvi40yoW5H54CjS0xYwvFNW7fMtfGAUl6lacPjtFwg8PZ0FWQRqI9PlA2jkOYaXwDI1O
	C7l+uVLur3Avu9Sq6w/2lbkFziFH9A3QTebt+uOnZuqSNhgHvs4f9pX+jMg+UWP7Z6Tj6rRLbFl
	kFWGjaZTSBCmBmJTybFWGOwyYobCVzNNvHkMJ4ofiAywPEGhjbcX2Htk85TNOQJctkRbfHwZs21
	Gi0nK+qy6Q8gamwnQyWYEOWQH1QWvnqid2u3xTMvAvko6bmL9vrj2fVnVs9K3ys1Luuq53Jf+Ws
	oaiS7zNMdtWrys1YDCmEkDp5VI=
X-Received: by 2002:a05:651c:2108:b0:393:c17d:9cfa with SMTP id 38308e7fff4ca-396bf225a0fmr2871101fa.5.1780564847147;
        Thu, 04 Jun 2026 02:20:47 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d503fsm14959581fa.34.2026.06.04.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:20:46 -0700 (PDT)
Message-ID: <9ab0d8f4-e1b6-415b-976b-721ab7a29194@linaro.org>
Date: Thu, 4 Jun 2026 12:20:44 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org>
 <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <rpnNMsR9GY8gbynzeBO8Zm61JAOq3ubt6sp0x3WDPPwkMAJzlcofECD1kabN-IUoK6sSwP5P6l28UIZLFCOpjQ==@protonmail.internalid>
 <dda32577-04e0-4507-acaf-a5694f4f31b3@linaro.org>
 <478df3ed-d4ef-43aa-bb84-e2075798542b@kernel.org>
 <ec98ef2f-02b4-4086-8b4b-07b6953dbd20@oss.qualcomm.com>
 <514cf213-5778-45e1-8d70-d3fe27991fcc@oss.qualcomm.com>
 <7JNJ4dUNz4ennJ5dkzhfLSuVo72JpfZAbprICPRqlRYnSzVDJw6x3h-1nESd_PK-3us9f1V3qOiLiywsTqP8vQ==@protonmail.internalid>
 <f01c0e22-4e5c-44e7-9ea4-4bc8d53aea2e@linaro.org>
 <29e8491f-20e8-4082-8943-66bee7e3af1d@kernel.org>
 <5ca611b1-0663-4975-bd56-b1343851e5fd@linaro.org>
 <83c12dc5-fcb4-4089-9917-9f0fcc4f940d@linaro.org>
 <1b107aca-a857-4e58-a763-39c82af67747@linaro.org>
 <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <67b6f6ae-bfca-4afd-adfb-6ec1741105d8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111170-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vijay.tumati@oss.qualcomm.com,m:vkoul@kernel.org,m:kishon@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C97863E936

On 6/4/26 12:06, Bryan O'Donoghue wrote:
> On 04/06/2026 09:46, Vladimir Zapolskiy wrote:
>> On 6/4/26 03:30, Bryan O'Donoghue wrote:
>>> On 04/06/2026 01:07, Vladimir Zapolskiy wrote:
>>>> On 6/4/26 00:18, Bryan O'Donoghue wrote:
>>>>> On 03/06/2026 21:51, Vladimir Zapolskiy wrote:
>>>>>>> Actually, one more thing, Why isn't TITAN TOP GDSC here?>>>> +
>>>>>> If CSIPHYs are true subdevices under the umbrella CAMSS device and
>>>>>> well
>>>>>> described as subnodes, then likely none of power domains are needed
>>>>>> to be
>>>>>> repeatedly described in the children device nodes, since this
>>>>>> information
>>>>>> can be obtained from the parent device by the driver.
>>>>>>
>>>>>> Technically 'power-domains' property can be safely removed, I believe.
>>>>>
>>>>> The policy is to describe the power-domain dependency fully since DT
>>>>> describes hardware not software architecture.
>>>>
>>>> It brings no contardiction to the statement I've given above, the needed
>>>> power domans will be properly described in the parent device, and there
>>>> is no
>>>> sense to repeat the properties it again and again in every child
>>>> subdevice.
>>>>
>>>>> Also for a very practical reason a sub-devices can probe/run
>>>>> asynchronously of the parent device being active so in fact we do need
>>>>> to describe the PDs fully.
>>>>
>>>> In opposite to the above this one is precisely a software centric
>>>> argument,
>>>> which should be excluded from the consideration, as well it's not a big
>>>> deal to make a proper async initialization, removing excessive dt
>>>> properties
>>>> is worth it.
>>>>
>>>
>>> Right look forget about that.
>>>
>>> - DT requires you to describe your hardware. You're not entitled to have
>>>      some other device vote for a clock or a PD you rely on.
>>>
>>
>> Above are two uncorrelated between each other sentences.
>>
>> A device ("consumer") can ask another device ("provider") to behave in
>> one or another way, this is the only possible and thus natually selected
>> system design, and nothing behind it was asked. There is no justification
>> for the proposed flood of multiply repeated data, it's avoidable.
> 
> CAMSS or rather the components of CAMSS modelled in the current node,
> is/are not the provider of the GDSCs or the power-domains, it/they are
> consumers themselves from CAMCC.

Well, this is the argument about software, and software can be changed.

> The producer/consumer model is CAMCC to components within the Camera
> block. Some components depend on say MXA, MXC, some do not. Nothing in
> CAMSS itself is a power-domain provider.
>>>      That's exactly the type of downstream short cut we are trying to zap.
>>>
>>> - In our case we also need to vote on PDs individually when the PHY
>>>      is active.
>>>
>>> In extremis say we are only running the TPG then we have no reason to
>>> vote for CSIPHY specific rails or operating points in the parent device.
>>
>> So, TPG shall communicate with CAMSS, there is no CSIPHY in the equation.
> 
> Right but it would be inappropriate to enable all of the PDs for all of
> the components in the CAMSS block when we can do so more granularly.

Whenever it is actually necessary, it should be possible to split PDs into
generic/parent and subdevice specific groups, it's a part of software
implementation. In some cases there might be no need to define any child
side PDs, likely CSIPHY falls into this category.

> If you drive the CSID with a TPG you shouldn't be voting for MXA or MXC
> since these are PDs related to the CSIPHY only and TPG and CSIPHY do the
> same thing from the CSID perspective - input data.
> 
>>
>>> We could make the parent power-domain argument for CAMSS and CCI but we
>>> have TITAN_TOP_GDSC in CCI specifically because we have to model the
>>> hardware - including the PDs for that device.
>>
>> CCI is not described as a child of CAMSS, here the situation is different.
> 
> CCI probably _should_ be a child of CAMSS given the design we are going
> for here.
> 
> Leaving that aside it doesn't matter if a node appears as a child node
> or a peer node - the DT should describe the hardware setup.

If a node is child or a sibling is a hardware description, different
hardware descriptions bring different dt properties, this is normal.

> I can't imagine a patch that would remove a power-domain from a device
> being accepted simply because the node being moved is expressed as a
> child of another node.

I strongly believe every dt binding describing actual hardware will find
its way to be implemented in software in a proper way, it should be doable.

>>> If tomorrow we put CCI as a sub-device of top-level CAMSS, that won't
>>> negate the need to include that GDSC.
>>
>> Of course in this case a phandle to Titan GDSC will be marked as obsolete
>> or unused for CCI, no problem here.
>>
-- 
Best wishes,
Vladimir

