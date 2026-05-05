Return-Path: <linux-arm-msm+bounces-106010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFZMHLs9+mmjLAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 20:58:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE854D2F39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 20:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E589D30103B5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 18:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A9635A938;
	Tue,  5 May 2026 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J5HoPn+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329D4A33E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007345; cv=none; b=XS/lwGbQJD+74aW51CCV7FRYwMRH55ciQX3j1ISd9pydwReyge85/HyStvkdBLaUsATYd4umCpb+pyjscDBHG90n+4JDj9c1KXjhnoOXOP+N0IvraX2dZa/0onwEe9bi0jtQJ0h858dQq8CPmPwLUPFtDmiFpJMnhsvQ8yyNn38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007345; c=relaxed/simple;
	bh=Qrih9tbIxMYK3cVffn8rChfomShm6TcW+n2OQ6LGqGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qnp1NFP7B4w77fYws9X4Od4F/Zd+Nq3li+0oS5X1+FQ11UI7XS6uHHPGWCJRAfSopcvxdgXH2oE3okVILLrLllu8QPR+fmctZ+yNfb/Yq6i255Y5GkrlGzyWGG8/YryOsYZoLy+NEoTjSIaSUxCdg8XpWFraywLK0IpNyEAmqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J5HoPn+l; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393933b8c6dso4642151fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778007342; x=1778612142; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=J5HoPn+l6jV5hGSLKn4NHP9KvSnHq7N0LYbPkufjlgcYzDMkKr0IfithL78JM9fbbg
         85ArIY0QlT6L0cjsX/6JBxZUaJ6FAwSxFBoj1S2D5G7dxbHpojgU7BiqL3CUhXP8aGpW
         BcLEkXU7X95iiI9Qymp5qZ3Z28ktdMzSSdGwoIFTOAPlTCkz5BhLS3yW+7oKF6yul/AX
         GcziERwiYn9d1/gBgIFIPrFoF48f87RgXuOO+63m29PbG7DVb+SdyoTf2Bw+BDRxdFMt
         QjBiTuia3vTIj2qPCUnwL4Uo6AYhRHcAhmHbel0tm9zfctTQ/ifBoeXfb2+HuUzBFCrK
         S0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007342; x=1778612142;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWLCp8e9dyR6o6t0FMX093JcFxR+HkBbCVvJsU9sLHM=;
        b=VEYSHDICB262sIx81r7t9VKnD973WWyAorC1+CFUbPOxRg7UJqb1NqHR6aBOCnmXh+
         qyKzgEO+hqAOMdBk5JYkdIMCXoHTkkQ749aVkW2KdkDoPkImjsVCQnc5xFTh7UtvFaq+
         nWYR/0jxqSgA9dZeTGEUato5SVWRrnUchVrYVZccqNG8oezDjBacRSslGrZZ7S5esohp
         /Sd924PfAX2Sb/hmdm82UDfthi1/vqTl4s1WCwVGy7pV0Ff2ejVEyqDpq2BOg5AVtBf5
         lvEwi1AbuNnENvWV9JfKPkMbXscrMgC7E1OLdooBnTsI393IDPfeLs8E8eqUQyUn43Rn
         kkGg==
X-Forwarded-Encrypted: i=1; AFNElJ+A5sJnAQH5n7qajai768PpBqBLm1/8qka7C3BEb53nmBmir5xnvjD88nPevdN6vm1Kr5Kp0BHWvnw0aRXg@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdJhgXrlOutmLbtGybs++9l8y0WlSA+FDGOFZ1+3H8mrzEOwM
	qBX6sAetRLhMBBc6MeLyRbKm1eUP3iI8XUr/tjQlfT513d6S+jodvVZUKXG1lvCbngd+60ZyaKi
	PaLei
X-Gm-Gg: AeBDievyy2Un7W6A48S882wdzIJPQB+97RWmReVXvHGlaUWJwlTIT22HRWv6T7HulSW
	kPAOdQVLc+iUXRHjr2LTaBqoRmyPtCVZNS9Jx8R7z3l7QDKXncCpNejrPJ9SejOEfGpwI96YH90
	OShzH0ulN/lTmegEqRcr5Mg6+lL9XZh4o14lTMBYAV8KQLatgoP2fTS0JzwVD7nu5HFE6CBqgc/
	HsdihKd+yevy2wW/0gSlIpneV1LrY4ftnQ0JHkZGeRjEXG3El3oZhz715CpLbbp+L8/Gd2Zk1p/
	tLAZWy631S2ALYFdcygYJYHUfX6JCq5jgXzUz/0WrWJcykIhDNwjC1nov702rQRZJlF1Yr1Fo5P
	NvIEzT8DD6OudwmwITn0oMQqPBeO+6PjPVdCEULUvC5ODhW423bqIBZVUMRu6eWEcHJ8/FDAg6H
	9N+IUsovByH2bdyUdbjbgdh09NQgxRiXTFagUNGxpJ4vCPekntVAAL9Ia7vp6sBskz5o8DF5UX4
	Do30l+ATz55O/q+
X-Received: by 2002:a05:6512:1056:b0:5a7:4912:1a3e with SMTP id 2adb3069b0e04-5a8631b8d40mr1976270e87.3.1778007342013;
        Tue, 05 May 2026 11:55:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a882e3589dsm654744e87.30.2026.05.05.11.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:55:41 -0700 (PDT)
Message-ID: <9da6d544-97f6-4915-8d53-e3fde7339695@linaro.org>
Date: Tue, 5 May 2026 21:55:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8280xp: gaokun3: describe rear
 camera module information as musch as possible
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Martin Kepplinger-Novakovic <martink@posteo.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
 <20260425105300.745044-5-mitltlatltl@gmail.com>
 <db441eb6-195e-4018-a84d-77b2d1531243@linaro.org>
 <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <CAH2e8h4TYEMhjP9Vx7yYpKHAOR627Ovy2QZMT574oZPVDJX1oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DEE854D2F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106010-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

On 5/2/26 15:55, Pengyu Luo wrote:
> On Thu, Apr 30, 2026 at 7:00 PM Vladimir Zapolskiy
> <vladimir.zapolskiy@linaro.org> wrote:
>>
>> On 4/25/26 13:53, Pengyu Luo wrote:
>>> The rear sensor is S5K3L6, describing it but dropping compatible
>>> string, since there is no upstream driver. A funcitonal downstream
>>> driver is in comment.
>>>
>>> The VCM is dw9714, describe it.
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>> Please take this patch as a RFC, I am not sure, how much I am allowed
>>> to add without a sensor driver.
>>> ---
>>>    .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 129 +++++++++++++++++-
>>>    1 file changed, 123 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> index 39e559e91289..76b1ecb3819d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
>>> @@ -22,12 +22,18 @@
>>>    #include "sc8280xp.dtsi"
>>>    #include "sc8280xp-pmics.dtsi"
>>>
>>> +/* remove due to gpio pins collision, skip 2nd instance won't break things */
>>> +/delete-node/ &cci1_i2c1;
>>> +/delete-node/ &cci1_i2c1_default;
>>> +/delete-node/ &cci1_i2c1_sleep;
>>
>> Instead of removal 'cci1_default' and 'cci1_sleep' nodes shall be rewritten
>> by excluding 'cci1_i2c1_default' and 'cci1_i2c1_sleep' from them.
>>
> 
> Should we register an unused node?
> 

I believe unused nodes are found everywhere marked by status = "disabled"
or if they do not produce a conflict for resources. I understand that a CCI
IP with two ports are special, but likely (not always though) it should be
acceptable to keep its device tree node as is.

-- 
Best wishes,
Vladimir

