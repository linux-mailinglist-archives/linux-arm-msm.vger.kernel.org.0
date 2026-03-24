Return-Path: <linux-arm-msm+bounces-99574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC1gKZtMwmnvbAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:34:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A83DB304B5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8466E3239E82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 08:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DEEC361678;
	Tue, 24 Mar 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nooFF0DD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD83C141E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774339678; cv=none; b=IvZjoNY/nw1GWs1cctyeORn3XMrniQRWfNVNMUXfUQK2Wh8EdPcdeZ/EEqelaLM8MxS8JfbbGyhrYtIhXmSKFe/MNox9Ic7PWQ+gnv0XkA3RFAYKKEB+A+MEupJV0H6Aznob2EgKlPQt+hs7zVamgv9W08aB0+ScKD3PORDxkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774339678; c=relaxed/simple;
	bh=IceAUN0OJIIAbe19yvKfIpOhT3L2MW8JFDntDXdVY0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ntNbXCohHR3eTjqn1DqhcvrCEej7SimHnzEUE4/JUwikHLEuRJM/UaXHFMhInaHiQTqaik1xOCmVQoB4KDKOL5iJ0232p9Wsq8nO39jOSYNjIYbh97r9HMliMAk7cSndp9dl+3LcJM/duGCWGhCI5CFYQrTIKJHWMEIT+xdxZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nooFF0DD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-668e8df29b5so1107769a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774339667; x=1774944467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU4A868t/KxQ8kSoseiIZSNGuwyJwQACouL71HeRn80=;
        b=nooFF0DDlWn3Xwd8OeeEkkhVBO18PJvGJFaweNxgRiO2KJbPXWL7L3SXtnPnoJkEFj
         0KXQyGk6VSxP8Domp+J2O83zhz1NEnInV+3hr/qdCsaeVgRy8LmyDY4upSYdZxhpLoVx
         pICFCvdP4a9lyJIWd0cnJS2n2zVCLdPsV1wWy8FlsDRkcGoSix4Co75yxNgm2Ry2yu3I
         USs20T7rG5A35iXfNIBhwBEWbqKUfC8dOMZaAPSafiC9ef5CLO/9byt/Pbeoc/cKuxW6
         L4CDagq89oyvmU+lmu63q4NGKnt1/oglSvCqnYRJ2BmLFNIrmAI+CqxT3mpNIT/sdbuz
         qYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339667; x=1774944467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU4A868t/KxQ8kSoseiIZSNGuwyJwQACouL71HeRn80=;
        b=WfwY6AFalPc2u24WsYocYd9DUePFhYtghT3yJYZE1FbvzXPb+bCTA393WTRURmdbbf
         seDPgbiRiKuw/Gu48NujoIVt8HDSBdsagD0BITNhMNAp2mRdJh7+FjQ8ugDBRya5FOhS
         uvpz2Cu+9PZREj1PCTNJb6m9sznlyONO0nRI8rxstSyPbog0Sk93Ft1kM2fdJOGU9+2c
         eEOFqCmdbQAu1djL/qCOrRj/5+fldZxi9megPH50oWVnTf6kMoNl1uCYL2LRxY9ZqjzI
         M97pP33WJ9DvPDMCvPzHXyrjD6N9zU8Gy2hR0ZAmqEj5GLEUfqUlTuZru1u7DQMMpUHA
         yrAg==
X-Gm-Message-State: AOJu0YykfPaW6+yUwi7HzoytfyPuIsEAsOzpMrRTGzQ9bSTf4tsePxUh
	Q42k12d9Xdiq14ZOTOciGS80pm73b/23wRJKCUs3/DqrTeFavbfBNDvB
X-Gm-Gg: ATEYQzy3neudZn4hnTomWJWJVFg8Nej3do69WenJJ52sE3gySJl7aWXXX8YfQAoiJoT
	JgG0gGoW9L+DjapuNqMELZTCtEHkcdLOfavoYVUi0E9qp/cCcGnHor6VAHbYr3mlIfGoET40b3I
	c7J3tOrSqbMSbAgDY6WyARzHe4pCiRCFzSCn3Tan61k7R5DLvZKXLKFgQVHsd0ibHGI3kEo4CTz
	ZweLilYugcUVCunKkfN3SQtjrhN+rLOjh5H4h/QzSGZUIv4K9WhWob2Zpyv0NWtPLIuU8v2C4Qb
	mdRDFZoyQ1nxjD4eDH8EM+IJc3owKG1zNBT7LzWjeRonoO5DKTNjEeoi6qLituJFYQaNrKoFQ4K
	iTIn2mwLb0DGLC1+2faYN6221ZqCx5M75ai4Ywnp+sxYW3L+e1Y1Kx6dS5jDUMkluZXwUI68d+5
	yrt5zNZUCejkk7+2fLjIopsTKCiQ==
X-Received: by 2002:a05:6402:2342:b0:667:2fd:4ead with SMTP id 4fb4d7f45d1cf-668c9b206ffmr10183916a12.27.1774339666291;
        Tue, 24 Mar 2026 01:07:46 -0700 (PDT)
Received: from [192.168.1.31] ([178.230.175.206])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-668d219abf6sm4487923a12.20.2026.03.24.01.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:07:45 -0700 (PDT)
Message-ID: <2fd29380-468a-4f09-853a-f63c67a3a3aa@gmail.com>
Date: Tue, 24 Mar 2026 09:07:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Val Packett <val@packett.cool>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
 <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
 <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <02913b5c-ce09-4fb7-a3dd-71bf7330439d@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99574-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: A83DB304B5E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:49 PM, Val Packett wrote:
>
> On 3/23/26 05:04, Stanislav Zaikin wrote:
>> On 3/21/26 8:36 AM, Val Packett wrote:
>>> Hello again :)
>>>
>>> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>>>> Xiaomi 12 Lite 5G is a handset released in 2022
>>>> […]
>>>> +    touchscreen@0 {
>>>> +        compatible = "goodix,gt9916";
>>>> +        reg = <0>;
>>>> +
>>>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +        avdd-supply = <&vreg_l7c_3p0>;
>>>> +        vddio-supply = <&vreg_l2c_1p8>;
>>>> +
>>>> +        spi-max-frequency = <5000000>;
>>>> +
>>>> +        touchscreen-size-x = <10800>;
>>>> +        touchscreen-size-y = <24000>;
>>>> […]
>>>
>>> I have noticed this previously and started wondering why the size 
>>> was 10x higher. Now with my own device (motorola-dubai) I actually 
>>> found out why…
>>>
>>> With the actual 1080x2400 size, the mm values reported by libinput 
>>> are 10x higher than what they should be, e.g. touching the bottom 
>>> right corner with libinput debug-events:
>>>
>>>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
>>> (1067.00/2370.00mm)
>>>
>>> (2.4 meter tall phone! :D) which was mooooostly "fine" except 
>>> Phosh's on-screen keyboard was accidentally detecting super-fast 
>>> down swipes as I was typing normally, and suddenly closing the 
>>> keyboard as I was typing.
>>>
>> I wonder why some other devices with gt9916 (there are a couple in 
>> mainline) that specifies 1080x2400. I don't think we can make this 
>> assumption unless there was a mistake already in those mainline dts.
>>
>> Best regards,
>> Stanislav
>
> Not sure what you meant there..

I meant the existing dts files that use gt9916:

sm8550-qrd.dts

sm8650-qrd.dts

sm8650-hdk-display-card.dtso

All of those specify 1080x2400. That means either those boards weren't 
tested (by physically tapping the touchscreen at least) or that there's 
something else.

> I have not seen other devices do the 10800/24000 thing. Please set 
> 1080/2400 (actual size not 10x larger).
That part I get and I will.

Best regards,
Stanislav

