Return-Path: <linux-arm-msm+bounces-74219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1BB8A3DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1D61BC70EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 15:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F6531771E;
	Fri, 19 Sep 2025 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WmVMC6TG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7624DCF7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295236; cv=none; b=Z2GK6Xdwht7uXxUw3AyZrd66CvKOowaB5qg6CwEqJlIst2m7IO1UMERuGt68o3sVUn57NR7OUsHVvYWrUZD1fNrFsITcqJDpr+5IsIkN5HOvGNxjBpOru38lsxn5t4pPQKuf4sSxSUttNRZqkLDOd22TYVn4Y+mr1FMfHaivi5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295236; c=relaxed/simple;
	bh=6MasVt/aSu1l1BXxhKpjh1yxZ8Y8jhzf28ZPi2XqySw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ga53MoF7pqTQqmQQMi9zTcyaL8NCBPe7UD/VdmWbEu7TV5OC7mLM73bSbtIdiX/k8ITmdwl+Mh52vtujx7g2Ri4RbIfIG8U1XoODyQLA3wIM1iMcKzVEmTpYQQuqw0wxfd8PpPcOhSGzOnNJSzyO443HZA5eiO31O1JeirRl6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WmVMC6TG; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-751415c488cso2173411a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758295233; x=1758900033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58QddYy9doQYGj9OGULI81m9rz5X5nvBb+nMrO6L4+k=;
        b=WmVMC6TGwFFdEaxQ4XGfclF8DtSNUeoh/RdDxIC78TGv1HzTMycA6SRNdLuwCCfKzd
         Hr/s3xVn98yGxO2tteoVZ57sO5/a/tdwuB+HtRnvoN3DfQK7gxSiL74n0Vs/ob702DWL
         km5sgrTR2r+YEj51k8kpAd97pRj8xaSeBJCJoOexW9mVOGojzPzJ+5TPmvYClXPnpc6t
         Fx6afwo9hUgMB3zVdtdBNry8pUSSZTh4ptElo2qG09mtzeCZLWhNjuKk65bK0FrsDR7R
         9NTWK36W4N9Tp9CMHzZsCpVRuyYVuv3k6vIbqYeOpTob4CbWXvDNGHoymN8W1OK9rTu/
         ElHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295233; x=1758900033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58QddYy9doQYGj9OGULI81m9rz5X5nvBb+nMrO6L4+k=;
        b=RgWlJKFOcIUw/gD+xRwjx51u8E1KsFBIv4icL9p5xi4iud5gipUJDIhI7H39YqK20R
         3TmiRRTwvO75NS69AaznoJLBpaBnlt9gePmQG60tg0Wyu7MdtuwLB7ZzrcD5Weht/vJl
         +54rztsqbTRp2dvuguJjgJpNJYzvTs39Jmx+LrLpcQVavtK4tkIkjqkd6Bl2mzh5dECN
         TWHOQ1TSA8GxmS1BnEqxtQXt1QgVuEm2uQYcalWg5BsV/HmKMIKqJm/14It5njnvknG8
         60rkl0tjnWkHePZqTjxOSyDLAZrTAZhR3RNJI/QDmZfbr/ZkX2wsS1SWG54spUiT6fY7
         gyZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+u9PhMK8/54BkR7MzGUfS7BjTnfvQX1vZLXdAp2EgsNgpYklIyqQATTtWph72DWBFv+n0rpuaS19PUmvX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94ezmWFizpr26YyeZlfv4GYrHi0NTfDPCgXFaHsygy0yxszhl
	rgpCc+WeFBr/ZVtfwCW/MWyLPPBBrOv96qg+A9leVeLmTHGssUsWw1zjOAGyxAgpIqE=
X-Gm-Gg: ASbGncuI7cYKWzdLfDLnfZpmNxn0LylaIBKwNIN7kY+X3A4hBNq0shf73osHpDb1LPp
	Na329MBG3UQuejirzFmX0YrZ2fSa5KHMBlWHR7KM/ysZvHfIrAb8pbSp9eMlMluV04l55/iPoBG
	PunYHMAxyd2wyzz6kVy88lrtCBwqSybpS/niwXcP6FKHe6wtZ+RqHZpa2QyTYLYKEhVJfe3NVEB
	eMbMapvEvtFlJ7jp06iJGS1QP0m7oExZJwQSPPiaezBr+3IcpCT32ZAqZHOv9FiE4dcyDXXMYhf
	rjTeV6WeiuhJOdRi/6SneMbOWIGie8rx5WEV3X5sS71hLlLj+09uQDePVlfHGLP8T/QNorLCohl
	Xmdin6gg++hG2UeXmzfIQEAptPzK/k1BcscW6/+8pwsr0RE1Y0jlrl6KzPzO7bNGlKXJQBTz2K8
	c=
X-Google-Smtp-Source: AGHT+IEJT0izziTZ06yN6CmHd6vD3fLc3H/jpNESoHp4Nt7QllNscgV8/EofsSLRMMmL3uPtY7Wo0w==
X-Received: by 2002:a05:6808:5094:b0:439:b674:d9a3 with SMTP id 5614622812f47-43d6c26736fmr1642625b6e.35.1758295232364;
        Fri, 19 Sep 2025 08:20:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3838:157c:c9f9:2e3f? ([2600:8803:e7e4:1d00:3838:157c:c9f9:2e3f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c6bf8adsm2068096b6e.9.2025.09.19.08.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:20:30 -0700 (PDT)
Message-ID: <8702fd35-945a-4d20-bc37-410c74c70da6@baylibre.com>
Date: Fri, 19 Sep 2025 10:20:29 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] nvmem: qcom-spmi-sdam: Migrate to
 devm_spmi_subdevice_alloc_and_add()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org, jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org,
 arnd@arndb.de, srini@kernel.org, vkoul@kernel.org, kishon@kernel.org,
 sre@kernel.org, krzysztof.kozlowski@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com, wenst@chromium.org,
 casey.connolly@linaro.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20250916084445.96621-1-angelogioacchino.delregno@collabora.com>
 <20250916084445.96621-3-angelogioacchino.delregno@collabora.com>
 <t3uk3k4h3l53yajoe3xog2njmdn3jhkmdphv3c4wnpvcqniz4n@opgigzazycot>
 <aMlnp4x-1MUoModr@smile.fi.intel.com>
 <mknxgesog6aghc6cjzm63g63zqbqvysxf6ktmnbrbtafervveg@uoiohk3yclso>
 <CAHp75Vf7KrsN7Ec9zOvJoRuKvkbrJ5sMv7pVv6+88tPX-j_9ZA@mail.gmail.com>
 <er7dkmzutsu3ooegeihjzngi6l3hol5iaohecr3n5bolfse3tj@xeedlx2utwym>
 <aMxWzTxvMLsVWbDB@smile.fi.intel.com>
 <2025091925-thirsting-underuse-14ab@gregkh>
 <f16ea5eb-cbda-4788-956b-d41c2af51745@baylibre.com>
 <2025091918-glancing-uptown-7d63@gregkh>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <2025091918-glancing-uptown-7d63@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/19/25 10:13 AM, Greg KH wrote:
> On Fri, Sep 19, 2025 at 10:05:28AM -0500, David Lechner wrote:
>> On 9/19/25 8:59 AM, Greg KH wrote:
>>> On Thu, Sep 18, 2025 at 10:00:29PM +0300, Andy Shevchenko wrote:
>>>> I,o.w. I principally disagree on putting MODULE_IMPORT_NS() into the header
>>>> file.
>>>
>>> Yes, please never do that, it defeats the purpose of module namespaces
>>> completly.  If you don't want to have module namespaces, don't use them
>>> for your subsytem.  Don't use them and then make them moot by putting
>>> MODULE_IMPORT_NS() in the .h file for the symbols as that's pointless.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>>
>> Could someone suggest some additional explanation to add to
>> Documentation/core-api/symbol-namespaces.rst to explain the
>> reasoning behind this?
>>
>> Right now, the only part of that document that say _why_ we have
>> module namespces says:
>>
>> 	That is useful for documentation purposes (think of the
>> 	SUBSYSTEM_DEBUG namespace) as well as for limiting the
>> 	availability of a set of symbols for use in other parts
>> 	of the kernel.
>>
>> So I don't see the connection between this explanation and and:
>>
>> 	[Putting MODULE_IMPORT_NS() into the header] defeats
>> 	the purpose of module namespaces completely.
>>
>> I am guilty of putting it in a header, so if I need to fix that
>> I would like to actually understand why first. Andy has mentioned
>> something about potential abuses, but without any example, I haven't
>> been able to understand what this would actually actually look like.
>> Or maybe there is some other reason that Greg is thinking of that
>> hasn't been mentioned yet?
> 
> Let me turn it around, _why_ would you want your exports in a namespace
> at all if you just are putting a MODULE_IMPORT_NS() in the .h file at
> the same time?  What is this giving you at all compared to just a normal
> MODULE_EXPORT() marking for your exports?
> 
> I know what it gives me when I don't put it in a .h file, but I think
> that might be different from what you are thinking here :)
> 
> thanks,
> 
> greg k-h

Up to now, my (naive) understanding was that the point module namespaces
is to reduce the number of symbols in the global namespace because having
too many symbols there was starting to cause problems. So moving symbols
to another namespace was a "good thing".



