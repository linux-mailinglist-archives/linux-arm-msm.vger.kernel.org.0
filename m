Return-Path: <linux-arm-msm+bounces-90719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YO6fFuiYeGkWrQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:52:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E49932F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34E8D3017F93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBBD345CA0;
	Tue, 27 Jan 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aNbn8eSA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C4344D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511063; cv=none; b=HEkSCv3d10GeKMB+pKm5HEV5KVw5ZpcGW/Nvjk4cw+IybUwFVMQT5k6FzwhliokUNSyRua+SXZUv/RJOTxaWkvy3rCEz1Kigs0HwJIJ3BuzutWuxSIg+K5QtyDhPK/1cAf0VUBPiN0LIP9067y/GrFsotSv6KGrnx497mdjuhco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511063; c=relaxed/simple;
	bh=+etMcs8OfTqbmSnmSalt899smLj2FSpLdlldqCFDiMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a378dcqvDjxCnEMg/1OEtE1IQPPpvEHLUfWvsHVjYaL3cXJF3oLxI6XyJualRvnT8ZSmAfug2bgH4O7vn16mPBRJOTqvh4PWhIGHW4J0l/dqN0Cu/6MMZCW4+ADUYtquJC0CpsHFAVsJjEzgNO9Gn6KOKuD5z121pLrBUoJHsFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aNbn8eSA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so43473465e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 02:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769511060; x=1770115860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERraehmyVah/gZPRjTcSR0AEBFgJhaOFY+kyMQqOX3k=;
        b=aNbn8eSA9H69iMgg8JS+9obNYObv2y2BIj/II/EIWmS2k+9XMFiI6oAIY9oItdLk0B
         4phqq1HkJENvKBkgJmrZ7eddyGhyGnq0Djt5JadiaXVWWGjDlmb7zoFbe+7IPk3CCtwO
         eaU8dR7KtI57gMb/MqMvgRc/O2L4ZJNS6eEsnPCaXZO8BU3qQVrgyy6Ryr9JePSsrmQt
         je9PtdiohGv++8u1X/o2jNQzmpje4O3ZvLGspusGtJaFNTGHSjuT4E69cyy6+PLrx8vs
         cFChZRbMsJSGhlVm54AS+yyPqf9IKspQk8WQvlO6J+h8bSpBnmwkVYw9K0JewEU318yz
         OSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511060; x=1770115860;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERraehmyVah/gZPRjTcSR0AEBFgJhaOFY+kyMQqOX3k=;
        b=iVqvvNReW7LyISqFHuKPeO+tiBbwcHE3PtVMWKy0OluCNaT+rwBi+8bGYUlzdibObC
         mlcuqu5TGlEHQ/FEh4MmQrbouNpcyYQFWhEGdJeY7LT/bLdORy07cZnddJixMfvM1ZCr
         1exSdRNq4NgLyXV2pUZAHvEcmglswRko5Wxqqj2Ooljg1o/nhNZwXVXQj8yUXJNsH59o
         AJ5ttNMGOvdhMIGH9U0/2QB0UAam43ijYdt8FC4nUSNwuDKGyhvIAbYk+LiB/7olLoyD
         QO329q7MarUV+7Og6t/IVMqI/JexSHhHsi64cj5EtkioAVQWUOrGrD+7qJ4WzCMnam2d
         Z2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjYf9tXc3UO5AXWHeydiLukBCNJO166hbCDL4Xf1UoAcA5i1SQGOeFuasLFoKGm3pQ+a9ZTIi8KRRBi5aH@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8kygZf1re6cghyRHlqdFvp7g01xMo84v/Xwmvu4FQM+pmaUO
	j84ysmp8vqrdh46sgtuVJcHuGB7SzcRrJiSPKeruISduycmwnjh7qKL/H598CGbc+oY=
X-Gm-Gg: AZuq6aJJUfuNvZ7rvMgxJhG71LB8+JjNdlLglxH4GgKvX54j/4ylpmaMUC/c2hjIX30
	PK3mDy/Hrnt+4xP1IzOFThbtFY/3JV03mn83bl5v5Rf+jaf+5+sm8U4cYUAHqbjhrOOHQO04E9W
	fiiasRtAClcnCemf5bjdgR09ZxaWJbl0/s7pYU+dx2vrLnRPx6/Lg1LPhjGENUMA3e5multOTxj
	JBhvhzQbUzuZukfSigzqFr4yF24+zNCkyweLOxTCXMMyz6X25d8fjJ9v0yICnj3629s8GPBKatq
	YNnOKAEiRawa3tXItgO75cLSe8aMr5k/2yb5nclSSbkIE6a99Kh9fFJ5aCwsLiBEISjp1NktBna
	DqtylAOsKUmXXxcEJOHF7XiVBb+2Rcg6QJErspEnJcaxAGsEPVEFSlZ98MRjkY5cmsJ9eQGnbkl
	1LY4dZznvtyiRR4Cw/ts1d1R04STByCbIQU8+KEbJyBb42dT8XUaBc
X-Received: by 2002:a05:600c:4f0c:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-48069bfaa18mr20483835e9.7.1769511060324;
        Tue, 27 Jan 2026 02:51:00 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806c4c9a07sm198375e9.5.2026.01.27.02.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:50:59 -0800 (PST)
Message-ID: <aaab1d32-9375-47d2-8524-e80e076b864e@linaro.org>
Date: Tue, 27 Jan 2026 10:50:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: ov02c10: Use runtime PM autosuspend to
 avoid brownouts
To: Saikiran B <bjsaikiran@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 rfoss@kernel.org, todor.too@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
 vladimir.zapolskiy@linaro.org, Hans de Goede <hansg@kernel.org>,
 sakari.ailus@linux.intel.com, mchehab@kernel.org, stable@vger.kernel.org
References: <20260126173444.10228-1-bjsaikiran@gmail.com>
 <20260126173444.10228-4-bjsaikiran@gmail.com>
 <900cc5dd-c39d-42f6-9531-016f62da81e8@linaro.org>
 <CAAFDt1tsyvtAa84bFK2Hq5yG_F15SUUseBd5Xi-DB8GnUj7+7A@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1tsyvtAa84bFK2Hq5yG_F15SUUseBd5Xi-DB8GnUj7+7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90719-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 19E49932F6
X-Rspamd-Action: no action

On 27/01/2026 10:40, Saikiran B wrote:
> Hi Bryan,
> 
> Regarding the 1.1s race condition:
> 
> I have implemented support for the generic regulator-off-on-delay-us 
> property
> in the qcom-rpmh-regulator driver and set the constraint to 2.3s in the
> device tree for the Yoga Slim 7x.

Yes but please listen to me. That is an extraordinary delay being 
introduced.

It is indicative of a serious problem we have not root caused. These 
LDOs are used in mobile phones which are aggressively designed to save 
power all the time.

In fact the whole idea of voting for clocks and bandwidth is it mitigate 
the default assumption in these class of devices - switch off the power 
first.

What is that 2.3 seconds, why is it needed. "Brownout" but why ? I don't 
think we have really established.

> I tested the 1.1s scenario you mentioned, and it is working fine. The 
> regulator
> core now correctly blocks the enable call until the physical discharge delay
> has passed, preventing the brownout without needing logic in the camera 
> driver.

The physical discharge delay we have _not_ established IMO. Have you 
checked the CCI pins ?

I think we should stop pushing patches until a root-cause has been 
identified.

For example - we can interrogate the LDO settings via SPMI registers to 
see if the LDO is really switched off.

Similarly we can interrogate the LDOs to see if they are set for active 
discharge.

A fix might be to make a platform driver to set those bits for the 
relevant LDOs absent a firmware fix for the same.

I'm not comfortable pushing changes predicated on papering over an issue 
that hasn't been root-caused.

> 
> I am going to drop the Autosuspend patch entirely and verify the clean
> driver one last time.
> 
> Plan for v4:
> 1. Submit the Regulator/DT fixes separately to linux-arm-msm.
> 2. Submit v4 of this series containing only the cleanup and power- 
> sequence fixes.
> 
> Thanks for pushing for the correct fix, the regulator approach is indeed 
> much cleaner.
> 
> Thanks & Regards,
> Saikiran
> 
> 
> On Tue, 27 Jan 2026, 15:16 Bryan O'Donoghue, <bryan.odonoghue@linaro.org 
> <mailto:bryan.odonoghue@linaro.org>> wrote:
> 
>     On 26/01/2026 17:34, Saikiran wrote:
>      > On Qualcomm X1E80100 platforms, the OV02C10 sensor experiences
>     brownouts
>      > if power-cycled too quickly (< 2.3s) due to slow passive discharge of
>      > regulator rails.
>      >
>      > Implement Runtime PM Autosuspend with a delay of 1000ms. This
>     keeps the
>      > regulators enabled for a short duration after the device is closed,
>      > preventing costly power-off/power-on cycles during rapid user
>      > interactions (e.g., browser permission checks).
> 
>     But if you try to power the sensor 1.1 seconds later what happens ?
> 
>     With this commit log this submission is a NAK, for example why do I
>     want
>     this change on an x86 machine ?
> 
>     We need to root-cause the failure not paper over it.
> 
>     ---
>     bod
> 


