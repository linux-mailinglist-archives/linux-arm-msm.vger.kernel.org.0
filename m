Return-Path: <linux-arm-msm+bounces-90949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIJGL+LneWl60wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:41:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCD09F9DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949CC3002296
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18B7274B51;
	Wed, 28 Jan 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VnlHrM2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2730E276028
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596882; cv=none; b=YdrkDl+CGxSQnaAvKLqZU+ffUIirM2LYsU3UPrJ4Sa2BwahRhaz9Sv8lTH+MdJcTp+I1umP9m6uCD01ofPd1WZwpqS3yy1RpFOB+Iu28Nn6wsD5tCv/57sEixGsScSLH3/HEwymJULTzAT2DUXkiDlm0iFZpn2hPX/ve7qztNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596882; c=relaxed/simple;
	bh=BF1Tk583OYnavcumB+Q/6k0kWYo9Y1pbJOM2dT6gFmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XaVMV4+qHE9XvwbXWiVjE+1vI9f2Q+4QSiDcKHWPrbvZ7gu+PW9FgTGj/F5V1CjuqPxUtfRrmf0cLxPZgW48XW1P20Kkb9om2BZhhQZwDhLcNVj9LnPX75GkSVoWAYfbHG9unNVovhKwS4ehFisNdeeJJFqRcvzTgt4VtrX8+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VnlHrM2J; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso10292914a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769596879; x=1770201679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=64aHssFZr7VaxSK0D6/XN0631oo5malDp14UZIFT07M=;
        b=VnlHrM2JEg6Uz+TMM5YoIigbkc6mWf+dZoQAiHHHj63jmlxqj1uedrDQId1msZFFXw
         ZTmpDRTlqiBUHE8JMgsVdiLbmZ2WFwJOGcJNtuTt2a+3lqNt0Eja10SPtKa9qP4oEGYD
         1t3HQBgAyV+8FMRFc085/DuQvA2VkjymVwI9LC+7tGh4DMJAzesdUAshOaMdpu+dLohQ
         qEsw49MH3do/ftE3X2JygdXv7pOG+w+nnVg7PFIiflt6On05zD9mZoc6zUXv+/C2FvD2
         QZlsWlpS6YhPrsL9fhduFBpesES6e7zVOBYkqm/Qx6vdv9ZuGLQxGQivJvvufcRuH9U7
         JLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596879; x=1770201679;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64aHssFZr7VaxSK0D6/XN0631oo5malDp14UZIFT07M=;
        b=uvfPgIXORrs93F3YyzDfuWndwNWfP9Xk42knyVe4/hd4blOvgfbT+4XQKJJSqDbftH
         0va5rWQbZT8rYR70n7YvYG3UUACWHMI2JejkPyp8fsF+RKBkDlkZwJCZPNMRZyUiYhHc
         MqMLtRGKNaHQvecP2gLolGm4qJUtRGTWyFZpc4lxGk+GYtZgIZ2eCgKV9/HAg0fSQoVI
         5bOCM4Nig/62LuWoPNiomJlJL9Rtzmp5rHW+O8Mx6rZCuxgONGLUS0e0S5GGJunZ+RjK
         gh9Fa6UjLNK4l30JwB7Sl16HTkw/i3Eq33QyEHPXdlJjdz6DjW7LAeQDMh9px8uUaYsa
         dQlA==
X-Forwarded-Encrypted: i=1; AJvYcCUkA4yIrrX5AWvXFaBfH4p0PhZ7aZE4Gp4RkqBXfzaVMN4snFBMARM4JBfrbjPCKUN7++umGugHaa4KCjev@vger.kernel.org
X-Gm-Message-State: AOJu0YyTLeeAIOrgf1pkmhV9mC/BhXHKe4yk5/Tbhq7PL8QSq8oBJ6gk
	vu3Bs/nnDR9uTbdKK7ES71Vc+vwpQTbqPcxQyXUXPJ99QqgdRptx2/dJcnhahBKGKdc=
X-Gm-Gg: AZuq6aLJjmOXQp3s5FeGG50pRYcVd6EtsGHShYmkFW82zHiZsyOZydED5+QoIQ+kiUK
	xjyVrRjZP2Ik3QW4y3HtS1DqzNaLqZaqzl6VGRiL18PEdDtQuki67PDEd+ktkTiYd7H444D/6TZ
	ZwMqiYTAEFQY3DcyQEwF5UgcZ8TeLT/GJyrO1hoSmhmt9mbz5VjU1sdZV1+Y1ckpO8v41pp2hds
	B+IRmsQyGSSwZnCqHjWyAHhFxuW48RajSyHBxQ6mD5cs2UxfIrRaZvG+Z+sJV8zkY2kZa7eIZ3h
	eFV046Pf+6mC68IM2gJKdvfsNsQ0duzaXzi3TZBRLM024HEwb0bxBQEr9Z/JAmpPcFzDgCP9jgu
	iYx7KdO9SrcZrKghicUJMpEIKNvB+mQgTp7TzZBR7vYnVQk0naQDEmt1cap5C9hwY0vqlzMhLnA
	Wk/nHXTOKbGy6Ckb9X87q85rlTe0LlIJoCSs9r1HjO2tG4tdO1qyxt
X-Received: by 2002:a17:907:8689:b0:b83:95ca:23e7 with SMTP id a640c23a62f3a-b8dab2c00fdmr351448566b.4.1769596879528;
        Wed, 28 Jan 2026 02:41:19 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0102sm108582866b.51.2026.01.28.02.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:41:19 -0800 (PST)
Message-ID: <6692ca5f-216f-428c-96b2-511fdd769f04@linaro.org>
Date: Wed, 28 Jan 2026 10:41:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: ov02c10: Correct power-on sequence and
 timing
To: Saikiran B <bjsaikiran@gmail.com>, Bryan O'Donoghue <bod@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 vladimir.zapolskiy@linaro.org, Hans de Goede <hansg@kernel.org>,
 mchehab@kernel.org, stable@vger.kernel.org
References: <20260127165024.46156-1-bjsaikiran@gmail.com>
 <20260127165024.46156-3-bjsaikiran@gmail.com>
 <aXjwtBey0MRP0c7f@kekkonen.localdomain>
 <hAXW76sxpszN3JpApVO_ntI28dSyCTiDXIE-S1AJDCa7Mbp8-pHbGqhFhTh2FGPdj3TxO9AowyRRan2u8TTO6Q==@protonmail.internalid>
 <CAAFDt1vJtJc+C_J9Gv3SYjs_2zWFXsWqwq29=ig1o2_kSkjwLg@mail.gmail.com>
 <dbf73780-a33a-4fbf-8569-321b4f4e0a88@kernel.org>
 <MZajBkG4hU2kIZFDZbpq0WZOF_tJmASpmGr-7IH_qheO0We0Z45KNZPrQY4UmoqsWKOX3lSx1W_hnLtfKocXPw==@protonmail.internalid>
 <CAAFDt1vmXg9L6axsDN6kpCQKZifOCRxtQeDpmRpHyejS1ORR+Q@mail.gmail.com>
 <92131a67-471e-41e8-83d6-4f802103db7b@kernel.org>
 <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAAFDt1sqh=O-CpxbdcWueyqbiq4qyCrJHVH-_SS+KjEC9CyRhg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90949-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 1FCD09F9DA
X-Rspamd-Action: no action

On 28/01/2026 10:19, Saikiran B wrote:
>  > Just to be difficult - I'm specifically asking to test never switching
>  > the regulator off - not having a long delay.
> 
> To be absolutely clear:
> 
> ***I have tested exactly this.***
> 
> In my local v2 testing, I modified the driver to keep the regulators
> permanently ENABLED and only toggled the software standby/reset lines.
> 
> Result: The camera was 100% stable over hundreds of cycles.
> 
> This isolates the issue:
> 1. CCI Leaking? No. If CCI were leaking, the "Always On" test would 
> eventually
>     fail or show instability. It did not.

I have to say, I'm not an electrical engineer by profession but, I don't 
believe you can make this blanket statement.

What is the problem with testing the hypothesis ?

> 2. XSHUTDOWN Floating? No. The "Always On" test relies on XSHUTDOWN working
>     correctly to wake the sensor. It worked perfectly.

Yes I agree there, if always-on shows no failure then XSHUTDOWN isnt' 
floating.

In which case this patch can be dropped, its not helping.

> The instability ***only*** appears when we physically toggle the PMIC rail.
> 
>  > Do not believe we have root caused a regulator brown out
>  > Believe we should interrogate the LDO settings
> 
> I cannot easily dump raw SPMI registers on my personal machine, but
> we can derive the LDO state physically from the discharge curve (RC Time 
> Constant).

?

I gave you code to do just that. If you can iterate sensor and DTS 
changes - you can use that code to dump out the requested LDO states.

> We know the physics of the PM8550 PMIC:
> - Active Discharge Resistor (R_active): ~1 kΩ (Typical)
> - Bulk Capacitance (C_bulk): ~10 µF (Estimated for this rail)
> 
> Scenario A: If Active Discharge IS set:
>     Time Constant (T) = R * C = 1000 * 10e-6 = 0.01s (10ms)
>     Complete discharge (5T) would happen in ~50ms.
> 
> Scenario B: If Active Discharge is NOT set (Passive Leakage):
>     The rail discharges through the high-impedance sensor (~200kΩ+).
>     Time Constant (T) = 200,000 * 10e-6 = 2.0s.
> 
> My measurements show the rail takes ~2.0s to reach the Brownout Threshold
> (failure point) and ~2.3s to reach a clean 0V (success point).
> 
> This 2.3s duration is physically impossible if the Active Discharge bit 
> was set.
> It mathematically proves the LDO is in High-Z mode (Passive Discharge).
> 
> Here are the specific logs capturing the failure at exactly the 2.0s mark.
That's great. We should be able to interrogate the PMIC regs and see the 
state of the LDO configuration - code I've shared with you.

If they show active-state isn't set on one or more of our LDOs then we 
can write some platform quirk code to set them.

A 2.3 second delay on every start/stop stream is not an acceptable 
upstream fix.

And please stop top posting !

---
bod

