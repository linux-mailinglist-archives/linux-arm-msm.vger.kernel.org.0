Return-Path: <linux-arm-msm+bounces-84942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACF9CB41E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 23:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C1BF030117A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 22:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640B12D3EDC;
	Wed, 10 Dec 2025 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRvvkcwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830927A10F
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765404338; cv=none; b=Mln4FFY9zsw/1Z5XvyIS3dfKtK0D04lFPwuhwIQOo7Va7dA78DYqt8Pm43/je6eua6gMEYfZGhl1lo/Ai2wcBtLwEfC51fAb3Aw8o2rQo/MWkGTjmjL8DsOi+HenNTN8YU52Yy5zh3Kr8MHN683kMKodJOlzeFjtuRUrehQh4Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765404338; c=relaxed/simple;
	bh=afgIP1WZS5HbqRBspQa2oUUooNIXpXxeQSniqBBD/sY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GKF5aUBbO5z+Mcp1V85/6YoumMz8BmQPP4EPEnNoVnf9F7qk+rjcMSLmxlSTGDHtz58HgPxcWIUYce23AevuRElm9XTgYV/c3eanKUJV/PCSxXKHj/06O4mvDUgDc8/6urCnLjtdWf9oMZDOY+FhRPT8rEpX7GkbK442dsC7NgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRvvkcwQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so345894b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 14:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765404335; x=1766009135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+3Fp0e7+CAe2qx3ZAGyWsh59Da2Z8lZFYYhFOen7e8=;
        b=JRvvkcwQu194nX+k2c2eWlCdHxsFMCtuwltHvER0Rh8/RodaYEaeTq85wpUHn7kyPE
         1daCfqqwMGGldqzEnCM2nhwkJUjnPvxwyKCBo0Z+xyJD5bpcFn/BT2NVZWi22hS++AXV
         uF8jbZnv74GWyB+bL56SBd/AIGdizqfdM7sX32OnE1lElCv2CExjNE6Z9P/XjaUxZRDt
         VQoQ7HV2/xx/5k5zLKEJ6XPmNF6dPwdDO0xf+7AKQWpY267UyKn6kZ/Bfsb9SX7/kIzP
         7kpbv8/Lzhqrqp0HOvCykTe9vJfcKf0rbZpwvFfPfJRYWQEHSF9QaG0RXCsdYbL04Jiz
         E3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765404335; x=1766009135;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :reply-to:cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+3Fp0e7+CAe2qx3ZAGyWsh59Da2Z8lZFYYhFOen7e8=;
        b=HuXsKZyXROPKW+Sv6qijCNpvN/tY+aNkzCUL6qGlPHERupakoQcU4COenBzDE5pcFh
         YeTMsqJLniL09WO/ziLv92rgIYqyAOY43StDO9zfNSPTf10dSx74Sl9MLBipWgp7yN8o
         cfML7VoveOf8XeRhDLxYqxy+K+qWbvqzxJQLg0kx+pTUeEawFImo/+K7zT9U+Uqn25rD
         uGT1Fygng5OSjItRkphss59r9KM/tpPV5aGdzOUmycfEaMN6t4z6TPp8nEID8D+4B9O7
         eW8JgPF5MiMIW7Pj1dkWsbZ94XogkwGE1KhYIP9Naj+n1X25lkMgQBVlSe2pOii7sIen
         q/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTLmBjgs/KMRXxw/ObIvQKNvBj2xa1THtaSMsCBlBbxVu9MlfPu734LKTmBGk567mLg6lz838BT+St1ycO@vger.kernel.org
X-Gm-Message-State: AOJu0YyPt2igvh61MbpcqVxCTvBzinK26wtM6ze3JRFAi/aPWKu6lV04
	kFKnRT3AhYcIpXyc84fguqwnS47YmYQuLhoqxnGvQTjb6uNYEjMJSIuVWQCxcns86gs=
X-Gm-Gg: AY/fxX6Z48rk2wCCuQCFe3/98WE8Dy1bYjHPdN+5lKm0ftVaTEQwwmClKTx6gYI6p4L
	NeG0Ry8+QljP0VmCflmJv0MaCN3VXd0X4uS2hN2zig2AioKGKrJQOvWWFmAein+WxXxQPkfplAD
	bvREQcie5MWOa2Zv0SZ4ZGBltM0vcEac54XLiIANq7ozcizm7WdJIA8eLwMmBOxIRWyuoTVjFcS
	PlpYqIfkc0lS/p/SsBnK04bzEZmBbWXP2xLp5tvaUbXHrv/yoMqW1pQT0gwfCM2gLS19EFUlHGR
	XOnSxr1Sn0sYuZId8sf8NdON6IrHxYsTZKk4VqFUUc6OUc6iOwgN87IvEyxmRbCDxY66Sv06InS
	ZVTv8QavX1zvU0/Jdwrtp0+AFuJE15a6uKJsVCgc6+IncpA5hDFdHUksVwizsEUEAGLczc91p68
	vXj3KsD1fJoNzlqKRtsryq1GRtIFS+Jk963d/mKpjkn+WDyg0DqTP7h2B0J7M=
X-Google-Smtp-Source: AGHT+IF3KUPFrL4bHbOPu1WT1G49RqczR26kcOyX6K5VmloGDfvztYKpxQz7JT9Y1I3PBOjTJ7628Q==
X-Received: by 2002:a05:6a00:4fd3:b0:7b8:3549:85f9 with SMTP id d2e1a72fcca58-7f22e58a573mr3528819b3a.30.1765404334727;
        Wed, 10 Dec 2025 14:05:34 -0800 (PST)
Received: from [10.237.118.45] (M106185144161.v4.enabler.ne.jp. [106.185.144.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c2772a51sm481675b3a.17.2025.12.10.14.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 14:05:34 -0800 (PST)
Message-ID: <a512b470-4e8b-45b5-9cbc-06501e21163e@linaro.org>
Date: Wed, 10 Dec 2025 22:05:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Reply-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
 <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
 <bf54a030-ee01-4b66-97d4-37f50a75d93c@oss.qualcomm.com>
 <r9iYRcJfz-QPlUHxIU_8vaHC87ctBayyOGVVtAbWEODCJjLkfQWv9rEX4b1zAIA_AWa47FcqNCmr7HxCetwcQw==@protonmail.internalid>
 <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
Content-Language: en-US
In-Reply-To: <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/2025 21:45, Bryan O'Donoghue wrote:
> On 10/12/2025 19:36, Vijay Kumar Tumati wrote:
>>
>> On 12/10/2025 11:25 AM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
>>>> On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
>>>>> On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
>>>>>> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>>>>>>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>>>>>>>> +  interconnects:
>>>>>>>>> +    maxItems: 4
>>>>>>>>> +
>>>>>>>>> +  interconnect-names:
>>>>>>>>> +    items:
>>>>>>>>> +      - const: ahb
>>>>>>>>> +      - const: hf_mnoc
>>>>>>>>> +      - const: sf_icp_mnoc
>>>>>>>>> +      - const: sf_mnoc
>>>>>>>> You know... Failure to look around is a sin. What are the names of
>>>>>>>> interconnects used by other devices? What do they actually describe?
>>>>>>>>
>>>>>>>> This is an absolute NAK.
>>>>>>> Please feel free to correct me here but, a couple things.
>>>>>>>
>>>>>>> 1. This is consistent with
>>>>>>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
>>>>>> I see that nobody noticed an issue with Agatti, Lemans and Monaco
>>>>>> bindings (Krzysztof?)
>>>>>>
>>>>>> Usually interconnect names describe the blocks that are connected.
>>>>>> Here
>>>>>> are the top results of a quick git grep of interconnect names through
>>>>>> arch/arm64/dts/qcom:
>>>>>>
>>>>>>        729 "qup-core",
>>>>>>        717 "qup-config",
>>>>>>        457 "qup-memory",
>>>>>>         41 "usb-ddr",
>>>>>>         41 "apps-usb",
>>>>>>         39 "pcie-mem",
>>>>>>         39 "cpu-pcie",
>>>>>>         28 "sdhc-ddr",
>>>>>>         28 "cpu-sdhc",
>>>>>>         28 "cpu-cfg",
>>>>>>         24 "mdp0-mem",
>>>>>>         17 "memory",
>>>>>>         14 "ufs-ddr",
>>>>>>         14 "mdp1-mem",
>>>>>>         14 "cpu-ufs",
>>>>>>         13 "video-mem",
>>>>>>         13 "gfx-mem",
>>>>>>
>>>>>> I hope this gives you a pointer on how to name the interconnects.
>>>>>>
>>>>>>> 2. If you are referring to some other targets that use, "cam_"
>>>>>>> prefix, we
>>>>>>> may not need that , isn't it? If we look at these interconnects
>>>>>>> from camera
>>>>>>> side, as you advised for other things like this?
>>>>>> See above.
>>>>> I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
>>>>> should be ok?
>>>>>
>>>>> Or the other option, go exactly like
>>>>> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
>>>>>
>>>>> What would you advise?
>>>>>
>>>> To keep it consistent with the previous generations and still
>>>> represent the
>>>> block name, we will go ahead with the style in qcom,sc8280xp-
>>>> camss.yaml. If
>>>> anyone has any concerns, please do let us know.
>>> Krzysztof, Bryan, your opinion? My preference would be to start using
>>> sensible names, but I wouldn't enforce that.
>>>
>>>>>>>>> +
>>>>>>>>> +  iommus:
>>>>>>>>> +    items:
>>>>>>>>> +      - description: VFE non-protected stream
>>>>>>>>> +      - description: ICP0 shared stream
>>>>>>>>> +      - description: ICP1 shared stream
>>>>>>>>> +      - description: IPE CDM non-protected stream
>>>>>>>>> +      - description: IPE non-protected stream
>>>>>>>>> +      - description: JPEG non-protected stream
>>>>>>>>> +      - description: OFE CDM non-protected stream
>>>>>>>>> +      - description: OFE non-protected stream
>>>>>>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>>>>>>> This will map all IOMMUs to the same domain. Are you sure that
>>>>>>>> this is
>>>>>>>> what we want? Or do we wait for iommu-maps to be fixed?
>>>> Yes, when it is available, we can start using iommu-maps to create
>>>> separate
>>>> context banks.
>>> It would be necessary to justify removing items from the list. Wouldn't
>>> it be better to map only necessary SIDs now and add other later once we
>>> have iommu-maps?
>> I will let Bryan take the call on this. He was the one who wanted all
>> the SIDs in the bindings. Hi @Bryan, if you can kindly share your
>> thoughts on this and the interconnect naming, we will go ahead and push
>> rev 10 for this. I believe we have taken care of other things. Thank you.
>>>
> 
> Since when are we delaying patches for future patches that may land never ?
> 
> I'm fine with whatever clock name changes you can agree with Krzysztof
> but it seems a bit ironic to me to be given feedback to "align with
> previous dts" to then have the result be further change.
> 
> I'd like a bit of stability and consistency TBH.
> 
> ---
> bod
> 

My feedback is

- Include the full list of SIDs
- Stick to previous clock and interconnect names

Your other alternative is to suspend Kaanapali CAMSS unless/until 
iommu-map is landed.

As I say though "change your patch until my other patch is landed" is 
the opposite of how things are supposed to be done.

I recommend you focus on your own series. If iommu-map gets merged 
first, adapt.

If not, don't delay your work to accommodate stuff that is up in the air 
which for all you know may never land or may take six more months.

---
bod

