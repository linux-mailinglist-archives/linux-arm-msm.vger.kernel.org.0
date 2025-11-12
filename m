Return-Path: <linux-arm-msm+bounces-81481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BFC53C0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0F3A541F2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4C9343204;
	Wed, 12 Nov 2025 17:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9TrqFbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA63446C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968069; cv=none; b=lvgANouxCmmAHZ+6wXT/TqnbCAsESc1dscgOXryO7EoLenY98ylBPTvTW53GiNtbwJ/2IbDUBeBnup7LynFB4w1k4Yb34uzq0IMtrfTyKiV6B2yRzBhfVMTdjqtoFvflLfXbcyqfYXPOY9zPSUJDIYZv3NoR4Nrr1ssfBwh6r2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968069; c=relaxed/simple;
	bh=zGm3bjPIXNlAXsn923/poaK7/h5DdSgopChHq1KIJug=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=MLtp2URSXTOtOh51XY/AMPCX443ckk4RL65/amx2GhU70yidz4QREdnLH684HEUeUdvfK/q9wpb9hkah6vNbA0OAWKY5HkF6M/3O3VpJVI58nNC6Wr0MbabYmIIumhI8/fE4KVfTubq7ir+f5Hcx2tz/Za6yqZ1rV4N+IvX2qlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S9TrqFbN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso707223f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 09:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762968064; x=1763572864; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=S9TrqFbNcrP3YS5Uc7rdz6PzAL3g54MeF9cHf4b6VqPeDafcgVsOwmw3sVcAxW+SYf
         +kYZ8G5A1zVPRayt8sMogwJOaPtvzFRjp83uHjY4bmuhyPP/ULvORLZSyu5rRukDMrAv
         oe4Mtob5tFI/QAhL8K4A08M6tRgspAZr9rFNkqKY1CuEyuwiRzlmha0ipW1jef88mufh
         HtUdnYZGD29e3ULyHYB1AJmA5sxwYg3TX4ME9YuPK0B3SXLXHMIOCCKL0iDeU7NUoyZc
         6RXESpaWDJd3iV94l7X2grwZG3XtoyE+63VFil56xuS/4XFFO9EM+x/SF0Bk/4MevcWB
         Rh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762968064; x=1763572864;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+D8BoUvcqK/7rHl2L0r4XdY6giRmTPN9ngtKeR3ez90=;
        b=AhB8LS/lSlGLZogVHOvvu7jxXj+SFRRw8HgfeJYslPuRDSd9k78+HAFVoKYawMSdVB
         8fsGvFXVxz+1vPF5PQHZkLZw03Vvc0IhCqbb/Vuz5Q/xIJtuKfa7UkanPF//PxuMwnMC
         FjaHzkQO/2eF/7AEz1+nuLUZy83tf1mEUjBufT3GuXwmyLR6+ObxOz1bcHk49TECQmRq
         k+jEeJ/LJ3qEh0iuZkA3BIz36uPGJXpQEILazdbJxS4EWwuaKg6r9+IhjS4fsILpMRga
         xanAvmn/SUppamuJMGNaPvDEqLHFwrVMxnO11qir4A5WYCFHCRtr3RwdPpUIVcT5kgKP
         +X+A==
X-Forwarded-Encrypted: i=1; AJvYcCUAi0KmS1CKud1PJS4SMZcjtN/tsgLsA6H+oL5dRkuOwyHREVURYLV2QYW0iNVRQN28o78pm7ttsbkVSskz@vger.kernel.org
X-Gm-Message-State: AOJu0YwHvE9B6Iwc3HCEOXHKXkVTl0plAhEHt8CNMHClhl/HVP+oONMH
	ojlDsHeq5FLg7L0BGIy60nRS7rgzaf3aePq78Kzg6FL9AWApS0k7PAZd1c5HVB88XRk=
X-Gm-Gg: ASbGncvNIDCNkbcTcyxTBkUOxCtEIyGyAxlueBPPchkjUQ5YHyetZTzMBNUvgKaF2pA
	kVRUbmOOS9ruhTtneFUuwdkZ4EZ6ndFIvMzbZPrHqN76/wGNiDZjscN5lfHWTCkTsyguv6jlaCQ
	65/qoA7MEG5MjvPNAgQCISmWQR4qAiS2bRChqQjauThxW5Y9oiPFlDtWLwoS20yYA4F1UhnkZyD
	wKnwOhDGuvLC0gUtRTopf/qFKfo+dCIs1ApOwUf/nqhminRGmb5Azgj0T3IOtRfzgGUMR6N7S38
	UYubdMhIT10ZkenehtfeSNLI46GIDLAipT9M9RciqKb5YZIY8Spoiw+a0LgKcJ/WBhA/qJd+Si+
	P5jXLuhPhWZ1ChESwodN4vlAaTDT925r9YM1KczOoZ1mBxBPOzK7BATHeOOIwYcciSFb5avWy1b
	orEz2Iclj/8EzCwm0=
X-Google-Smtp-Source: AGHT+IFOnruwkehrKtiSlIIluNpW1jCcNK6zjknkUp1TXGQBb3IO3OG62+bnEz116c3kPlLyvXv7bg==
X-Received: by 2002:a5d:5f53:0:b0:3ec:ea73:a91e with SMTP id ffacd0b85a97d-42b4bb90b60mr3558763f8f.12.1762968064363;
        Wed, 12 Nov 2025 09:21:04 -0800 (PST)
Received: from localhost ([2a02:c7c:7259:a00:4fbd:5c9b:d8a2:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b4789896esm9558995f8f.38.2025.11.12.09.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 09:21:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Nov 2025 17:21:03 +0000
Message-Id: <DE6W0RIF2Y26.1MENYDV2RIAIP@linaro.org>
Subject: Re: [PATCH v3 05/12] ASoC: codecs: wsa881x: split into common and
 soundwire drivers
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
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
 <20250522-rb2_audio_v3-v3-5-9eeb08cab9dc@linaro.org>
 <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>
In-Reply-To: <f1337654-ff69-4489-840a-a1b38efb7f74@oss.qualcomm.com>

On Thu May 29, 2025 at 11:05 AM BST, Srinivas Kandagatla wrote:
>
>
> On 5/22/25 6:40 PM, Alexey Klimov wrote:
>> This is required in order to introduce wsa881x driver that works
>> in analog mode and is configurable via i2c only.
>> Functional changes, if any, are kept to be minimal and common
>> parts or parts that can be shared are moved into wsa881x-common
>> helper driver.
>> The regmap config structure now contains 0x3000 offset as required
>> by soundwire spec.
>>=20
>> While at this, also fix the typo in WSA881X_ADC_EN_SEL_IBIAS
>> register name and rename wsa881x_set_sdw_stream() to
>> wsa881x_set_stream() and update registers description in the
>> header and use the new defines in wsa881x_init_common() and
>> in wsa881x_digital_mute().
>>=20
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/codecs/Kconfig          |   4 +
>>  sound/soc/codecs/Makefile         |   2 +
>>  sound/soc/codecs/wsa881x-common.c | 193 +++++++++++++++
>>  sound/soc/codecs/wsa881x-common.h | 458 +++++++++++++++++++++++++++++++=
++++
>>  sound/soc/codecs/wsa881x.c        | 493 +------------------------------=
-------
>
> How about we have something like wsa881x.c wsa881x-sdw.c wsa881x-i2c.c ?

I am totaly open to suggestions. Splitting to wsa881x-{sdw,i2c}.c sounds
good to me.
I kept the original name to keep the changes minimal.



[...] (the rest of the patch was quoted and sent but I didn't find any
comments there, please let me know if I missed something there)

Best regards,
Alexey


