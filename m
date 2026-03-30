Return-Path: <linux-arm-msm+bounces-100709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBRkJuM9ymnD6gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:09:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36227357DF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6C1C305B379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE623AE709;
	Mon, 30 Mar 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dgg3NII/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CFA37F749
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861357; cv=none; b=bQa9GueA7qCjQreCjayZTV0x3be1YGNEtT6233W4nXMbA4efpcSp58EGTQIxXmByk+wNUoZrJmavhcvBcieWUL/AFfnwUTgrjGGar0wme8zjA3MlYV5z8U3zyRHmLAtNFxgnKGpXvxb/7va+GVyn0hbUdue5FsM1M6s5ThXILDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861357; c=relaxed/simple;
	bh=ZZT+BdvWtv0IGu5tZFso5VNXIsNQv33LmBSHM/iliNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSrGnIz2r76FkXasi14UMpvYfpfgp0YPpI844shv+3ZwAvqxR39TAF62lKxIgdTAolcJI9PQwOtigwpUYRqW3XQgHotsUAaGA5Dqeb4P/vGGc9oXaKXw4/vzyUjAbWzq49U06Hi+oqZTYD0cWeUEL64XJIJdh3eZyv7s8XTax2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dgg3NII/; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9358bc9c50so567131366b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774861355; x=1775466155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ta07eiLe/pVnHnMt5yIA7myVk76JrlK9RRotd9Crmig=;
        b=dgg3NII/WftjIMiHgwgNlRq2c4WGVfY1c93P8OIuqqVIsg/eXLT0+Fkrl2abzU8g4S
         /DlzGLXyYmlQF31QzMmfzsA558YX9LemKFj/Kv5VjcoJVloLQ2cZHIdFAP1OVxMqCozI
         Lpw1YoZDeXLggOKjINlEyoXltr7tPVvka6ivHdfNB10fe/QtFhsAuLEWQE8HPs8u8euC
         ceVmYqS1gMpiVnxx8Wgai6WKWvzt8KI7I4G0jqHTOpdQyrq1cAZbES1I6JTSP0GwkMzY
         mKVQIuoSn2Z4LZBNE0OIolpZJnJueLo2/py6fD+dEXDAOdGe073jBEh7naPbGvAqDLxo
         eZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861355; x=1775466155;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ta07eiLe/pVnHnMt5yIA7myVk76JrlK9RRotd9Crmig=;
        b=fXNiSRd5hDnwOXjV3Uaxx0UrdA3Lt1K3vTPYaNgK6b28D0WwsEFunM5Y/0N016+4vL
         toWALwYJVx7+A515WvC26fynpnPucL2GAonvNSOhoQFGO0RhbGaJ4nNFWktuFMOip6GL
         9DTC3a00Awf2WZUXQFxysvPtEA/nZ/IeMxE/qPFqYNJRWekj3Q+wclSmqODBlaYayEKw
         WOnbBifphITe1y5t1IxDQi79mWAwzYRkzRB7fT2A2vN/+S+kVxybPm19D0Y8QTBgiFfW
         sYVg93+2M85b1f3QJJpdCjwT9MukC0Bb/TXR6fCb22xjlhfoub+BlUwQGgBZzhMvyXoR
         /BuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPzDnRRx2JtzUCAtGT0iqw3JnVPEXAbVDOjC6ckwXxqdXLQROvvczAONXjqGF7E3N5cfjDvIebfmI3pnBk@vger.kernel.org
X-Gm-Message-State: AOJu0YxjRr4ChAU4EawNEJigs+1wxa/xzUn9gtiI1aJqN2xFGnKgvp3/
	pUJjP5S3Ea/MCijWBqFkesg/tvZv+BhIPGzElbduaxo4T1J04DzToYgwF1psFDKbQaQ=
X-Gm-Gg: ATEYQzz+w/zxSzlIoXWMZPSg5jAq+Qz9U+iurA6JSbRYl6zQoaojYDHsypQpH0VbfQh
	ByvPh6hMeZZ7dqXY/UZnBuGjWGVxHBZxcaTbYRrXxU46Agx5jOGhqohw47+1wko8U8c5jwR3R7c
	qODdhc0Fvmm+1up5g0rC8E0B9bhalrUZq6O3QLAmcBb+ehvZNI87nD2c4xY7P5nfn++YtDgZ2pH
	Tk69/J0KT+C2R2s9UeA38CT/kwAkWFWjcGTH3EyoVotlmIxXeVdF+6PlJL6RaOc+2LTX+vp0YZQ
	vd1VYDc8mUjENVQa4V/msOpciZ9xNWgUrLITcxfZvXYev/tXjg1LPWbsbTIaQmD60wU2xfD/cyp
	ffK5Gn3oCdVr+KkET+WvmCiOuqNg9WpjrT5a/B19q7aN5+vAbH+ewrsbC+vSSPIhdJx6br2PEhV
	Vsniakhtgb4LGsdcdP0nS6IzB8F9jovbQFoC1b
X-Received: by 2002:a17:907:7b9f:b0:b98:33c5:1bb2 with SMTP id a640c23a62f3a-b9b503b6f2dmr693893066b.25.1774861354146;
        Mon, 30 Mar 2026 02:02:34 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.241.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5924sm263387066b.32.2026.03.30.02.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:02:33 -0700 (PDT)
Message-ID: <456ded59-d13e-4b61-975b-97ca48b5e771@linaro.org>
Date: Mon, 30 Mar 2026 10:02:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-1-0c0fc7f5c01b@linaro.org>
 <7712fbdd-a225-49f0-aeb9-ebcbb9d5abac@oss.qualcomm.com>
 <da3ed78d-fb5e-4820-95d6-527d540cf03e@linaro.org>
 <1f38187a-9464-4aa9-b70a-03b767349d56@linaro.org>
 <c5278028-dfe9-4d09-970a-a25977967bdd@linaro.org>
 <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <016c03b8-27c3-41dc-a630-8e7095db1f88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100709-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 36227357DF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 08:49, Neil Armstrong wrote:
> On 3/27/26 18:42, Bryan O'Donoghue wrote:
>> On 27/03/2026 15:28, Neil Armstrong wrote:
>>>> To be frankly honest you can make an argument for it either way. 
>>>> However my honestly held position is analysing other upstream 
>>>> implementations connecting to the PHY means we can't make the PHY 
>>>> device a drivers/phy device - it would have to be a V4L2 device and 
>>>> then for me the question is why is that even required ?
>>>
>>> This is plain wrong, DT definition is different from software 
>>> implementation, you can do whatever you want if you describe HW 
>>> accurately.
>>
>> I'm not sure what point it is you are trying to make here. Are you 
>> trying to say drivers/phy is OK with you but you want an endpoint ? If 
>> so, please just say so.
> 
> I'm against using the "phys = <>" property in the CAMSS to reference the 
> PHYs, a "PHY" in the classic terminology is tied to a single consumer, 
> and if it can be shared to multiple consumer you must model a mux or 
> whatever in the middle.

The CSIPHY-to-CSID routing is runtime-configurable and is already 
managed by the media controller framework.

DT describes static hardware connections. The dynamic mux is a software 
concern, not a hardware description concern.


> The PHY API as an internal software implementation is probably fine, 
> even if it makes implementation of split mode much much harder and 
> doesn't really solve anything, you can just call init()/poweron()/ 
> poweroff()/exit() directly from the CSIPHY media callbacks.

Great.

>> I can see an argument for that hence my response to Konrad, I just 
>> don't see why its a Qualcomm specific argument and of course 
>> understood stuff bubbles up in review, we have a public debate and 
>> come to a consensus - that's a good thing.
>>
>> However, I'd want wider buy-in and understanding that endpoints in the 
>> PHYs is a more accurate description of the data-flow.
> 
> It is, and it was designed for that, and extensively used in the media 
> DT representation, so I wonder here you would not use it...
> In an ideal world, you would add nodes for each CAMSS hw elements and 
> adds port/endpoints links between all nodes to describe the data graph, 
> this would be used to construct the media controller graph, and make it 
> much easier supporting new hardware.

Yes but be pragmatic Neil. The first step in making the monolith into 
sub-nodes is the CSIPHY.

Once the CSIPHY is in, we can follow on with adding new nodes that way 
IPE, BPS, ICP, JPEG whatever and also work on implementing the old stuff 
in that new way.


> 
>>
>> We've been applying DT bindings aplenty without that so far. So we 
>> would establish new CSI2 PHY bindings should represent the sensor 
>> endpoints.
> 
> We've been using a dummy representation of CAMM in a single node with 
> only endpoints connecting to the sensors and hiding all the hardware 
> layout in code, it doesn't scale and makes supporting new HW hard.
> I mean this is common sense, why would we continue to stick to the 
> current CAMSS bindings ???

We _won't_ I just don't support a big bang integration. Progressive 
changes over a longer timeline make the transition manageable, without 
accepting endless sub-standard stuff in the meantime or holding up all 
new SoC submission unless/until.

I mean there is a CAMSS meeting which I've been running for nearly a 
year now that both you and Vlad are invited to where we have been 
discussing this for months...

Anyway one conclusion of that is we want to transition to individual 
nodes for everything.

PHY is the first step which I'm taking because its easier for me as 
CAMSS maintainer to convince the CAMSS maintainer to take the relevant 
patches.

drivers/phy notwithstanding.

>>
>> Is that what you want ?
>>
>>> The CSIPHYs are not tied to a single "consumer" block, they can be 
>>> connected to different consumers at runtime, which is not something 
>>> classic PHY devices are designed for. So they are de facto a media 
>>> element in the dynamic camera pipeline.
>>
>> The existing CAMSS binding and media graph are not changed by this 
>> series.
> 
> This is not my point, I don't care about the software implementation at 
> all, I care about accurate hardware representation. Using the "phys = 
> <>" property does not describe hardware accurately.
> 
> In other words: The CSIPHY are not connected to CAMSS. This is _not_ 
> true, tying the CSIPHYs to the CAMSS block hides the real data muxing in 
> software.
> 
> Please remind DT is used by multiple operating systems, and properly 
> describing hardware in DT will help have good software support over all 
> OSes, not just Linux.
> 
>>
>>> And actually Rob Herring asked use to define the complete data flow, 
>>> it was a strong requirement. I don't see why we wouldn't here.
>>
>> I'm implementing feedback from Rob.
>>
>> https://lore.kernel.org/linux-media/20250710230846.GA44483- 
>> robh@kernel.org/
> 
> Where did he ask using the PHY DT bindings ? Is he aware those CSIPHYs 
> are muxed to multiple consumers which are burried in the CAMSS code ?

I freely admit to taking the initiative of phys = <> but Neil there is 
_no_change_ to the media graph and the "mux" is a runtime configuration 
that is one register in the CSID.

You seriously want a mux device in the kernel to model one bit in a 
register ?

No.

>>
>> To me, here is where we stand:
>>
>> - Individual nodes - we all agree that
>> - As sub-nodes - I think the majority agrees this Krzsztof, Dmitry
>>    I'm fine with it too.
>> - drivers/phy - I think we are accepting this is also fine ?
> 
> Like I said this adds a supplementary API layer for no reason and will 
> make life harder, but I don't care personally.
> 
>> - endpoints should flow into the PHY and then back to the controller
>>
>> I get that argument. In fact I _like_ that argument at least I like my 
>> conception of that argument.
>>
>> I'll stipulate to that argument meaning then that, new CSI2 PHYs shall 
>> include endpoints for this purpose globally.
>>
>> As I've said before, there's nothing Qualcomm specific about this 
>> discussion, really.
> 
> There is, because the current Qualcomm CAMSS bindings are insufficient 
> and should be entirely redesigned from the ground up to properly 
> describe the HW.

The long term plan is to do that. Discussed extensively with the Qcom 
teams delivering CAMSS, even invited community members along.

Here are the meeting notes - its all in the public domain

https://docs.google.com/document/d/1yUwWHaKLuovKVgGTzvKm68K1zS6xBONVzjOsRjDl03U/edit?tab=t.0#heading=h.mtbm7qfohwfs

---
bod

