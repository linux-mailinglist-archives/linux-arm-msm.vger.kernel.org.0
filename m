Return-Path: <linux-arm-msm+bounces-69071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B690B256A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF31C2450B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA051F582A;
	Wed, 13 Aug 2025 22:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIYExKi2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF624302765
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124131; cv=none; b=Y/Dp8r3/BuTCvm25FPkPP8A/0SoJcFYlyKH83Mo7C2omyhgCsweawGALmyGOLPEC+Io8Ut9JyBzO40LaXZgM8/RfIepGFX76Ykel6QdnRVLpUNoK4uNyXxDJIRV8rEP0Db4p09clj9J+o04k0q30BNxbSoIoEtFT/c0j36ZEgeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124131; c=relaxed/simple;
	bh=GTN+5WirIPVzvLSwAv3/9YAKlkgOlUeRjCYAsj/rpzw=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Z7AnD31h3MA1dKTfEJBayZuGYKH35wiISWzolh5uqTuDXvpFd7tvfX+9X7nvN+VuM98nvL8uGMAe/6FaXsDDc2uW3RRfaXqTGQT/FgYKEwcWPZ8cM5+FPCAW5ay92GeHD9bIuQz96uffB0HZyrEVl36zvSZk9hUlJktCCUFWOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIYExKi2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so283206f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755124127; x=1755728927; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sloit53e7whTsQFAQynr7aVEZzM4yMZh+xfD4/W9sqg=;
        b=OIYExKi2Kt17S9SHvoPHNIXnCbSXM+5Ql6yGxlpWrkVEYJ7ptqeMjR1/EBjQvmyqps
         Wsaf/uswP2XByKaRfrx+iPEJDXBy1eh0qE0a1RwtPbCx5fBg4wo+hggEmgPEAVO9C6pi
         q3ckgc8l9yhIXzf7x2z2jyH8+N/GqGSXF9sX6GaXnbIRTOApxe9cn9Y9hhnmd18M60bl
         hYWIDQ/TMVj/ERzAkj0fDCQZY4cRYZqwP2j70IYe48DHwEP804QYT2JFDir3UVjbvg1F
         /YAxI5fgszeYOOp4cV8K+PM4ZgKQmmwWPLjFSOyOVVTANwZXyEbF5KNgh8ZzARK2Z35H
         LYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755124127; x=1755728927;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sloit53e7whTsQFAQynr7aVEZzM4yMZh+xfD4/W9sqg=;
        b=nUSAg81X9RcxH5kXRE4J89W2l1r9HjwkLgIsR1Si+jgBX54liHxVyJbC0+lZsjVNBm
         W2Tx5Bh3N8rxvegPkp6iGXjv3vsjSlUrlwtr1dJhkVrEDvLHz4Qk+d9ELw6/iQ06dAyd
         HuuL7jfCr6kMVTTnRar7zhEltEBrvIqIU8JYzZRZfVfp/dSfB0twiB84Ntz9Tq0M80bp
         /dq0SUIWXeC6OXybOvE0ERltk+6YsxerIjDBuFqb5X2+NVU1gYNVmQIUl7henJ1Vuh0M
         qwYhbReorDnRjuVGbs95JClLaAiFqbTXSL8kfBJL3BIsiPVWR4s0xr67T+3Jo7ZWF1Lr
         rEtw==
X-Forwarded-Encrypted: i=1; AJvYcCW2XXkjpz6ZJR9vi/g6zANObYf1G9suRhSCssAhuTfieZmuaQ5D4atTVNjcKz6rjoqJhQgk9DTV9Pe9oQAs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Y3LivYbzeJG4mHOZbMeUa3RBTwgq3VPM5tgaWsQPjy5AZlxJ
	6xARjHKZ72Fd7eDmnSMnznE2qWpaoPybDsCT056dK8+eqYpzBEwI5hbJCuegdrJCQSE=
X-Gm-Gg: ASbGnctANXZHGJYjnXOlmOcSzqSTauKoFkMhHhIoyZO+Sne8h+ZCh7Rsn64MpiCXH77
	nvpXXWLePFkLn3rd8bTCclr9EBLRzhSxb5aBG/TQyKMUD+iEVJurJVytsJHpv28pUIv45X13lve
	slReDQzM5VShDNiQMEPgJwCERfB+UbUJNDd/4qLl9eLugAqFJY0m1/ZplQkG+2M5/rT9JMx0vGU
	tV1LkKhyn3ZZPDP+rrdV+yaVz9ODQN6RhPBx8YJAY+V7NTUZEfFwUPokBM0rBkI6B1tDBxc3IND
	GTyP1FCRWWnW8GWqGoq8x5uWznIC94ytadr2R5OAljZSc/Wx84aEsa1rswWUfpCwJowzAeA3Ytd
	1Q/gIIAAr8Mlr/Yg5xIvNF+GCpnU=
X-Google-Smtp-Source: AGHT+IFaVC8EcfmFnezsgQds3hcWeHYfy6YLXuZiaXqv+d9hK1doPUatpRJ57+lgFQ8CFRK3tCcYgw==
X-Received: by 2002:a05:6000:2dc1:b0:3b6:d0d:79c1 with SMTP id ffacd0b85a97d-3ba5067fcd2mr272072f8f.10.1755124127183;
        Wed, 13 Aug 2025 15:28:47 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b1db885sm4014715e9.0.2025.08.13.15.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 15:28:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Aug 2025 23:28:46 +0100
Message-Id: <DC1NKSHIXLHX.21F0AXCTRNINS@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: sound: add bindings for pm4125
 audio codec
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-1-13e6f835677a@linaro.org>
 <20250718134334.GF11056@google.com> <DBKDVB96ZC98.NOF39E05HZ8H@linaro.org>
 <7b012ae4-32b8-4de8-97a5-9b73cced2e4c@kernel.org>
In-Reply-To: <7b012ae4-32b8-4de8-97a5-9b73cced2e4c@kernel.org>

On Thu Jul 24, 2025 at 4:48 PM BST, Krzysztof Kozlowski wrote:
> On 24/07/2025 17:17, Alexey Klimov wrote:
>> On Fri Jul 18, 2025 at 2:43 PM BST, Lee Jones wrote:
>>> On Fri, 11 Jul 2025, Alexey Klimov wrote:
>>>
>>>> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
>>>> It has TX and RX soundwire slave devices hence two files are added.
>>>>
>>>> While at this, also add pattern for respecive node in mfd
>>>> qcom,spmi-pmic schema so the devicetree for this audio block of
>>>> PMIC can be validated properly.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |   4 +-
>>>>  .../bindings/sound/qcom,pm4125-codec.yaml          | 134 ++++++++++++=
+++++++++
>>>>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  79 ++++++++++++
>>>
>>> Do you have to submit these all in a single patch?
>>=20
>> qcom,pm4125-codec.yaml and qcom,pm4125-sdw.yaml describe one device (sub=
-device)
>> and change for qcom,spmi-pmic.yaml is needed to avoid failing dtbs check=
.
>
> Preferred way to solve this is to just list compatibles, instead of
> other schema, just like all qcom display bindings are doing.

Ok, thanks. I reimplemented it for next version. Couldn't say that I've got=
 it correctly though.

Best regards,
Alexey


