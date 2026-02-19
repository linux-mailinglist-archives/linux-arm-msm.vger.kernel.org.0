Return-Path: <linux-arm-msm+bounces-93386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLxbLrELl2kcuAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:10:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076015EEEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D80A9302D96F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 13:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B8433B6DD;
	Thu, 19 Feb 2026 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dkTFADDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5D233ADB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 13:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506562; cv=none; b=ahE7oqdEwHUlt5eJxJd1LS4yGIyDTajN7UGli32l3oEFHEvXt0N7EwacGK6BRdMX6wp/WXR7ynhlKX5jLz6/3ENp0SH5eS88LwRPeFdnfRuO33uFcaCII+8CoCTCotitl24ADCzaoSlsVN8XBhKKHu45T3ZnoxMtPr3nhy93URs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506562; c=relaxed/simple;
	bh=UYkvLMGvPA7MkuJf5JUOikNfmvWfVFQgYk3tg5BhtZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdiYjC5JgnuLStTbuwEwVUkkQhT1Zt2Xv+DA0auMj8UWf2MGAa5O7DVouchUdOCES4WhxeIx/ZRgdb3m1Z9Mi3CKNUAnMTESG97aQ1esq7LRF167OlJei+OW88lXTk+xug2jaMf27IchvWYCUIcdRgC07fYGpeMmFS76HOe5+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dkTFADDu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837907f535so8512645e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 05:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771506560; x=1772111360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4kub5QJNASCFXe1LgXwlnQx+lw4e3+fCNIFcBdZArb4=;
        b=dkTFADDuPl8ATICVdlGErg5MG1xAmgv3eFwYwgkED8sGJPZuniKwVaHclghXfp1d0b
         pv9eZwWbcuXaJBLdNUu9V+BcGXEuDbmN62ddY7TwxWhl4qMxpfbuamH28XULqWYvtIBJ
         3JqLwHsgK974qKAnz0xCOCDpxkdRr4ED4G0XL4uhp7Xy+tnN4o1qxom2LfqHBgdmSSo/
         ACbhUY1C80LbOrk+DOdw5SnUpIlbDEJor0KMSLoraUlZld4ojowKg6sIcqHO1ivBuSta
         dDW3y3933ksM1J/GtJA3zIWF6+xb/zfvuqgGgq+9oFxYdgHk1nz64B199QZHg8c4Ahsd
         6dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506560; x=1772111360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kub5QJNASCFXe1LgXwlnQx+lw4e3+fCNIFcBdZArb4=;
        b=KGtyI2QLBAuJaO/vEDrvEptz3yKKrmI/2mJnWtxyBxi9WqsQJS1pqsk9dY8fqoUgCv
         ZakIncots/JcKckaHzUsGxSzJHEG70KJ63GQ1PVbtnONnlNQmmRxlAaj3c9HXOPxALpC
         cj1Xa3d+qxTxmwlmn+vIhE/ARIEoq2SuqJnlz7WZKu6ghSf5dFa0s6YURFF7gKKRVqHJ
         ISswT8IvMTyLycme9KT8AFWdaVHk40nL38mgGBMH4v3I7kMbNG5uaX0fcIpNN6dZrwg8
         okIFO7siocYRCi5rKVZfZzlPOzKOQlYzkG374NOoegIJUxpn98ewpp5j/e3DytbWybuj
         p+0w==
X-Gm-Message-State: AOJu0YxjY7CAsZc3R5CFjhbE3HHEB4AUlRgKGDD+YvCp5nu56kb/0jp6
	ke+xDWKt9N6oCdo/SkvxxsqOHExIbgPg5WW5VO4inaqYZ+CBkqLXevbiLiQKPmCt0qw=
X-Gm-Gg: AZuq6aLp01jm8VymarHpHaXHifhmEmIEz9LCC36bbnP1sqKltxxlFL6WrB20Fo5T+TI
	cnwgiZgBHbW+MONINDGkqBWZra1l1pIceTE9aGy5NXR83wtUyJm7M6bxc2zcMCBOKB1lFNk3fA+
	rFNpLwdK1gPLRW4XsmoKeHyJOddENtdaCNXpcL29aULxR+/3xB6meT0Nth0tsPVBl51PmZGF4Pa
	2/abS07TG166rqZ2PAnOfYB0awJcSZ6G5pXTsgOag/GYm0t1ATaxcptUHOpSUI7jL7op8zZoU01
	ml1NMKaklPps40B2Iotm3QKQkRoTQrOUUfchmGPFbhJ/BRFYkzQSIsLAoiFgoyEXSDPY+0NHYpp
	y1Xi1jHNREqZJiFKvu+OHrMdaIWFvySYIxZK7d2sAG335H92UiojdhWbBQnTUJnANgogMbr7o74
	Qn4umaMopIhCcmSQoErKUlkhO8YEOqajBi6Lt0cKjVfpUEldx7NXltOSnld+WV3n7kOS7LImtZY
	bw=
X-Received: by 2002:a05:600d:8444:20b0:483:7813:90d8 with SMTP id 5b1f17b1804b1-48379b8c02emr227767405e9.1.1771506559564;
        Thu, 19 Feb 2026 05:09:19 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839f96967bsm23697575e9.3.2026.02.19.05.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:09:19 -0800 (PST)
Message-ID: <efb88928-645e-464d-8714-572b9f8d48d3@linaro.org>
Date: Thu, 19 Feb 2026 13:09:43 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/5] media: dt-bindings: Add CAMSS device for
 SM8750
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 jeyaprakash.soundrapandian@oss.qualcomm.com
References: <20260119-add-support-for-camss-on-sm8750-v2-0-3e06583a0a81@oss.qualcomm.com>
 <20260119-add-support-for-camss-on-sm8750-v2-1-3e06583a0a81@oss.qualcomm.com>
 <406f2ca6-d136-4c05-bb46-65d39c1eedbc@linaro.org>
 <1bb6ddd1-54ec-4085-a321-a9b4f2b54950@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1bb6ddd1-54ec-4085-a321-a9b4f2b54950@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93386-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3076015EEEF
X-Rspamd-Action: no action

On 19/02/2026 01:08, Vijay Kumar Tumati wrote:
> Hi Bryan,
> 
> On 2/18/2026 4:50 PM, Bryan O'Donoghue wrote:
>> On 20/01/2026 06:42, Hangxiang Ma wrote:
>>> +      - description: Registers for ICP (Imaging Control Processor) 0
>>> +      - description: Registers for ICP 0 SYS
>>> +      - description: Registers for ICP 1
>>> +      - description: Registers for ICP 1 SYS
>>> +      - description: Registers for IPE (Image Processing Engine)
>>> +      - description: Registers for JPEG DMA & Downscaler 0
>>> +      - description: Registers for JPEG Encoder 0
>>> +      - description: Registers for JPEG DMA & Downscaler 1
>>> +      - description: Registers for JPEG Encoder 1
>>> +      - description: Registers for OFE (Offline Front End)
>>
>> This is a weird map - it doesn't seem to have a BPS ?
> There is no BPS module on SM8750.
>>
>>> +      - description: Registers for RT CDM (Camera Data Mover) 0
>>> +      - description: Registers for RT CDM 1
>>> +      - description: Registers for RT CDM 2
>>> +      - description: Registers for RT CDM 3
>>> +      - description: Registers for RT CDM 4
>>
>> I actually think these should be standalone nodes.
>>
>> I've done some prototyping work on Hamoa to bring up the BPS and IPE 
>> using the ICP and the HFI protocol.
>>
>> An absolute torrent of TLAs there but one thing that pops out of that 
>> is the current CAMSS bindings we have kind of match how camx works 
>> when there is an ICP.
>>
>> Linux/HLOS programs up the PHYs, CSID, IFE, sensor and then the ICP is 
>> tasked with owning the BPS, IPE and hiding away the complexity of the 
>> CDM.
>>
>> So to me that says we should keep CAMSS bindings as they are largely.
>>
>> I think its just messy to keep jamming registers into this map - it 
>> really is an enormous list.
>>
>> Lets revert to the simpler version and add new nodes as we enable them 
>> for OPE, IPE, BPS and ICP instead.
>>
>> OTOH I will publish the CSIPHY code you were asking for either 
>> tomorrow Thursday or Friday and I'd be obliged if you could review and 
>> ideally align with that.
>>
>> A humongous blob of a camera block seems like a legacy sin we should 
>> just fix.
> I am not sure I followed this entirely. Firstly, you weren't referring 
> to the RT CDM register blocks (although you added your comment there), 
> are you? 

I think what I'm saying is - lets leave CAMSS bindings as they are. We 
can add nodes like OPE, IPE, BPS, ICP as peers, along with CCI existing 
and CSIPHY - in progress.

This way also stops us tying our hands with bindings. For preference we 
describe all the hardware but, having played with the ICP - I have it 
booting and sending me a few cursory messages - I think extending the 
blob of CAMSS bindings is a "hiding to nothing" - sure it checks the box 
of documenting absolutely everything but it also locks us into a very 
rigid binding.

TL;DR I was wrong about that ;)

Secondly, I thought you wanted the complete HW description as
> it is supposed to be in the DT bindings, isn't it? I am not sure why you 
> think it is based on how CAMX works, rather purely based on the HW 
> blocks and registers available in the Camera sub system on SM8750 and it 
> is up to the driver, whether or not to use the ICP for offline modules, 

Yes understood but to me it seems simpler/cleaner to the use the ICP - 
for example HLOS doesn't have to know or care how to shift data in/out 
of the IPE with the CDM..

> although using ICP is generally advised for the stripe based processing.
> 
> CSIPHY nodes - sure, if you advise that, we can.
Feels like a nicer interim solution.

"Do the right thing" separating out the PHYs while giving ourselves 
scope to investigate doing IPE, JPEG or whatever - likely as separate 
devices a-la ~ every other SoC.

Rockchip and Broadcom as examples.

---
bod

