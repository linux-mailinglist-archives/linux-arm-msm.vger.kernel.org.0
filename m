Return-Path: <linux-arm-msm+bounces-81479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6C8C53C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3FB575034C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EAE1346FC3;
	Wed, 12 Nov 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GpRL7Cxr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF94346E68
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762967816; cv=none; b=pWBta+l1NWq8oi1wDAn3eBrVEV2gzz9lsm+jG1xDF2lObzgV4etURrdCRkFxeCoNRaDVNNXcLDg26WWH1Is/SAWjv0ZbrijuydRGuAMsKaeQnuLFcdd++rAsmfedIcaNHsSn5v5Z/d3PWgZ6XNK7DPdHZIlfZqC0L0u0Stz8CYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762967816; c=relaxed/simple;
	bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ItqSIdC8xPtQPjOBvgyq4hB3XV++pRsv/9MbVT9xYFfkESmLCUkTK3LCduhxQ1WsuDwJh9aXptdjODcJglhPAbGdoSmist0tWjU0D++9fce02Q6wN5vI8hdUCqvlVXl14Rk3Po/2k/RwKMMvQhbj1A1gWf2mub2MPtN2PbrnfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GpRL7Cxr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47758595eecso5899905e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762967813; x=1763572613; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
        b=GpRL7CxrRFx5sPYkiKaq/kIXW2ATW/s4UELrw2+KcNS1tux0hR5+SULsz1oK5AKVzb
         y+6o89hQwQXNnh3XjlmX7zFFtdrymI6+dXRIMENF/FdKv1EaWpXgjav7afrOR0+Cn4wj
         Kv1y0KEF+JmyUYuIp0a59um1mMV68r5DjwqLQvDFHN7jMIHA1A4cVazTBWD3BAUBswOr
         0njPJ+8m94dSgcDeCgMzK5s+s6oLaaROCytaVWkolVQb5awzdWdalgBNPnNdHjr1lS0G
         ad2ygOSlLwTpums6JBsynHkuwH4A99ZqGhUgJ8UwVgsMrnV5uXWDxls+H4fRKLjOz40o
         +cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967813; x=1763572613;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iiMESZBmokR5+/LPNrjKbowyRucTsoIMCT4ESK7O004=;
        b=SPe9cQzOX4ncTP24+w+XoTAncdEK06GBFzUfhXgTgQIMlvCsRXtxSOtaB+BT+w2Rop
         pAEjwklCNPaDPaKJi0qr5+ju2l9XHW1fgD4Jm4QViZnpVfy/1BhR8baoLGZhRYW/pnp9
         aNpwA9C0f23SKw+BD+L9GYkevXYk2skMGw2VwuxUWwnyUK5P1KP030tLaY/mhvYPY/MT
         VUFojvjJYuiSmBr4O+SATAKCL35kuXfJktViJ+SDYmWX9PMiR/fpLa+vD29yyH/UjlzZ
         DzJKeI699ag+dlQxfi3m92YQv9D6aZK+QoxonjLXOiG8d4O18zbFEFo+KWMPQg4aMnFR
         cLHg==
X-Forwarded-Encrypted: i=1; AJvYcCXa8yL7N8fmCkWhS/GFdiwi7Dnomyca9eOPC2oEowHPGX4SReoO2Cqq71Q+SOwtHRp9sYyIBaBnPikOY5+W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7RvuvDleK9rKL1+bkRHOtIvYshRNPps0bVT4VHqUaxonjeGLf
	E/0zS66A7MU3wJPI2S1uGntVYeDeq9XfVM/UIC8Cd/BAXVznMNZb0T7Kkz0bYYb7DX0=
X-Gm-Gg: ASbGnctx+mgIS6x+o2aq5VprD8t9W1jwav/0d76MZ03nHjB+ljHteOjn86UE9z2m46f
	3HbFS522dB4RHD9KYXeD6zH7KdU4U4Uw6dsFWF479zBEhF5wJO9cZ8PggOHqnfrur78q4opayqh
	yLurLxWGZrYFPL0nukN6RB8JnRkOa2mJIBU5iHVK7JNgPGrwcuM9PYPZOKjCy7J1fN+cEKkJg0Y
	6wYXBFyptZSyVYUI66EQn2hxf6HyNs94xTtm4eqaG5YiusJNWXNV8cvsaK/XKPZbnIbLkJ53RZj
	wlNgjHLrE0swhGWChxOAqX8PKDoRrdiq2cufZUiDvKMJFxNIUc0es7IqzqX7/e4z6XksLaSGmRY
	qJwI4SFHuE80ebi8KsqL57Cg3l3D/yNCM6/Md0roFaT5s0yMb0AuEvfN+H7aPLIbZBwt1kYLgKx
	NwkIWM
X-Google-Smtp-Source: AGHT+IFK1LEgbdoe82XE3jZoJK10kkTDE6sfjAoioDSlpzb+hbqMgzQ5j6+nhIYvnoRpyBG+UEDLMg==
X-Received: by 2002:a05:600c:45c4:b0:477:542a:7ed1 with SMTP id 5b1f17b1804b1-477870b9237mr36446515e9.19.1762967812580;
        Wed, 12 Nov 2025 09:16:52 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:4fbd:5c9b:d8a2:ee64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e51f54sm45322705e9.8.2025.11.12.09.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:16:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 17:16:51 +0000
Message-Id: <DE6VXJQPNX0Z.1LE0XW9T5T1LR@linaro.org>
Subject: Re: [PATCH v3 06/12] ASoC: codecs: add wsa881x-i2c amplifier codec
 driver
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srini.kernel@gmail.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>
Cc: "Mark Brown" <broonie@kernel.org>, <linux-sound@vger.kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Jaroslav Kysela"
 <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-6-9eeb08cab9dc@linaro.org>
 <1c7d62f5-1816-4ecf-9376-2751ec06830b@gmail.com>
In-Reply-To: <1c7d62f5-1816-4ecf-9376-2751ec06830b@gmail.com>

Hello Srini,

On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>
> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>> Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
>> family of amplifiers. Such amplifiers are primarily interfaced with
>> SoundWire but they also support analog mode which is configurable by
>> setting one of the pins to high/low. In such case the WSA881X amplifier
>> is configurable only using i2c.
>>=20
>> To have stereo two WSA881X amplifiers are required but mono
>> configurations are also possible.

[...]

>> --- /dev/null
>> +++ b/sound/soc/codecs/wsa881x-i2c.c

[..]

>> +struct reg_default wsa881x_ana_reg_defaults[] =3D {
>
> This does not make sense.
>
> All the regmaps should be same, it should not change with the change in
> interface from SWD to I2C.
>
> Could you calrify this before we start reviewing rest of the driver.

It was sent initially in nov 2024 I guess and that one was v3. v2 was
sent in December 2024.

I am currently reimplementing this. I obviously agree that registers
are the same but why we should be 100% sure that regs defaults
should be the same if the mode is different?

Or do you suggest/expect that, for instance, analog defaults should be
kinds applied on top of common (swd) default values?


[....]
(The rest of original email was sent and quoted but I did not
see any comments there, so I removed it but if I missed smth there
please let me know)

Thanks,
Alexey


