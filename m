Return-Path: <linux-arm-msm+bounces-69080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C06B2574A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 01:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79E0E1C84F5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188A02F6575;
	Wed, 13 Aug 2025 23:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlxveLth"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C502C08BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755126540; cv=none; b=CwzXGZtzSckNsjSn3GRQWOOMD7xtFJA5G/ao6YfA7nmB55NwHBYvlS9tf0vM4PqyqNLK80mS/5N8E3tBqYdmejsNRxBcUy/idgriVxnHEuuIqxQ0vrjDRnGCcipLmD+qHfRxSCvW5eSufWKRgP6QHQAQPPms9hkD/UGNRw6vmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755126540; c=relaxed/simple;
	bh=D3VCs/yBFzDfZDnvikVOvGWSHbXeqmmlCqMVXJKIChc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GICEYzA9wqN64FUYUpvJ/WobwzYGmJURri4/qIEcNWEsOvx2Zf+WJO8ijW+O9CAfuxQ51WLsYNhUAFreGfu5XWoFB3QGSTPmme1B6Wzngw/+VJw7yP9N9yUlVrmmp9RXTmlFYcVf7BaIazBlDIDg9I53Gk/RtvZrVSQpe3+ZVkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OlxveLth; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9dc56ff66so135042f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 16:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755126537; x=1755731337; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYzpkw32rfojTro/yo7c1tGpbEd5gb4/gc+Z99oDHgE=;
        b=OlxveLth0PbFbSinl2x3O13ijMXjQfKu+/hI8/4tziXCGrFSRzKBOkkOxaDjFOhgev
         pu/c8d/HpLRsUuoLe+m7ExvEWe31G32wkO6gZH6QfsOrhl76em65Q29WSrYg2YaHFZ78
         zejUsVj6ZBezt5WMfPNc5PffkZ+tvIk1k5Y4SQhGr+AGjYWjK5F80kNhF/SGmFWImX69
         nwr41r/tnhdmJ/wf/Y9D2xS4GTzxUUmUoo0pbSbJRunQGJ/PmHgpnjzzCGjdlx+8vq76
         XUqqobisBGphIoKFwbS0CUG13EngYsGii1yH2qc1D1OG7NnF6FT8fnHE/hk2yeCZ6rgE
         vdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755126537; x=1755731337;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYzpkw32rfojTro/yo7c1tGpbEd5gb4/gc+Z99oDHgE=;
        b=JSveuFpae+SSF/4zb7BJ+JElUaajhm28MtGcLZKYAOgLN5lgKJWsmA0KhUPKecTbTq
         6zkQTG2t1+e3SjcZcmFWPy6YSHKZtjCBp3aXXmCPubbA606itWoTbv7HpOcQ0M0CQv9k
         xyogo+OVl3MuPExV4pewlPJ35QT388qn5LKuOVEPTA26whJZQD9tBcT1P/sTrO62BdlK
         5iGSuqSc34j7u+07w846ink1EmxkevvQ3kHyZpEYXbF8wyBmKas9RiSU7s7c9rOEq4Jx
         /KHJWhlaGPkQmVBBCQWY0UetRIZD45PU2sD6Lkni4ZhHXB3D+Yz9OsreJJlKK9Ie6R0i
         r4ww==
X-Forwarded-Encrypted: i=1; AJvYcCUBF+2mgF8L0elz2+0PFNlg15CdvzfW/ckCjA1NgGzPNdLAYh9PJhtbBIvQEc+4MMBd7WnMNWhZUSrWmN5U@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzvwMdjvAY/TrtL84brBEK8BWzCRqIXQeemfdgfnQ0agS9Z8c
	s+8xUOhyJy6kXyLOHT0q0yy0MiPwhpWg2JAIlI/WodvnKEAZ7HfjwVsejWWjNB33jws=
X-Gm-Gg: ASbGnctZi/sfM/rk1Tbb4dQ67+I18nXkdFsHsh32EcAHc96ZDHv1a6pKL/+Cmef+5Ld
	NWrRDjLikOn8WLbAf4zKIQAXNMokaPk6610tpaPwV+HA6cCN2vPortx9rjJAxxg5ghwV7om89Sj
	aVfPQNf9a9g/bHHfL7O9oJ1atTTDOgqKdz5/w0EhifEgEiu+KMVTzXzQHoDTO0OKPeeJ3u8PNJq
	O5hEX/cnItoD2f4pdPBBuZP2PJXBqoKze858wc+zTOD04c4tuak30v7LfOfp8q2CeyhU6wEQeQx
	sKeF3vMgJiwvPuPk1gnbS/EBGF7fEiubRzkQO/2gbOOHJwjaaSOVG48tC7ml3+42slsKGuUA5Xg
	FyqeJuM9CGNkCcPunhu2LyAUPZ08=
X-Google-Smtp-Source: AGHT+IFbhBknykhgRmGNQ8HnZA9S45Dxb2/Sf7agYpr4TtNvocsFTRipZsdaZQpRwhDbfSKf8QHY8w==
X-Received: by 2002:a05:6000:310d:b0:3b6:436:b8ea with SMTP id ffacd0b85a97d-3b9edfd22b1mr647097f8f.6.1755126536667;
        Wed, 13 Aug 2025 16:08:56 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:7f3a:5ab2:26aa:831f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a590187sm16856315e9.25.2025.08.13.16.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 16:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 00:08:55 +0100
Message-Id: <DC1OFJFCKMLD.28U6N6FES0OC8@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ASoC: codecs: add new pm4125 audio codec driver
X-Mailer: aerc 0.20.0
References: <20250711-pm4125_audio_codec_v1-v2-0-13e6f835677a@linaro.org>
 <20250711-pm4125_audio_codec_v1-v2-2-13e6f835677a@linaro.org>
 <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>
In-Reply-To: <20250711-hungry-uppish-taipan-a0a35a@krzk-bin>

On Fri Jul 11, 2025 at 9:29 AM BST, Krzysztof Kozlowski wrote:
> On Fri, Jul 11, 2025 at 04:00:11AM +0100, Alexey Klimov wrote:
>> +static void pm4125_unbind(struct device *dev)
>> +{
>> +	struct pm4125_priv *pm4125 =3D dev_get_drvdata(dev);
>> +
>> +	snd_soc_unregister_component(dev);
>> +	device_link_remove(dev, pm4125->txdev);
>> +	device_link_remove(dev, pm4125->rxdev);
>> +	device_link_remove(pm4125->rxdev, pm4125->txdev);
>> +	component_unbind_all(dev, pm4125);
>> +}
>> +
>> +static const struct component_master_ops pm4125_comp_ops =3D {
>> +	.bind =3D pm4125_bind,
>> +	.unbind =3D pm4125_unbind,
>> +};
>> +
>> +static int pm4125_add_slave_components(struct pm4125_priv *pm4125, stru=
ct device *dev,
>> +				       struct component_match **matchptr)
>> +{
>> +	struct device_node *np =3D dev->of_node;
>> +
>> +	pm4125->rxnode =3D of_parse_phandle(np, "qcom,rx-device", 0);
>> +	if (!pm4125->rxnode)
>> +		return dev_err_probe(dev, -ENODEV, "Couldn't parse phandle to qcom,rx=
-device\n");
>> +	component_match_add_release(dev, matchptr, component_release_of, compo=
nent_compare_of,
>> +				    pm4125->rxnode);
>> +	of_node_put(pm4125->rxnode);
>
> If you drop it here, then you do not need to keep it in pm4125 in the
> first place. But this will point you to the problem - what if
> pm4125_bind() is called after you dropped the reference?

Thanks for pointing this out.
It looks like that component_release_of callback should handle that so I
don't think we need of_node_put() here at all.

Best regards,
Alexey

