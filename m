Return-Path: <linux-arm-msm+bounces-64386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FCB003D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 15:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8996D7B11BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73F9259C92;
	Thu, 10 Jul 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vm0E40b3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57622253AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154752; cv=none; b=oCCvNsPvA/907oEScSpyzFr9ANHU3QSztZOLuGU9Jyh6XnTup4+R6Of3bp7Z/+aDleyMi7laEo4MLZuG7W1ENHcLpy1hYXCbh4nc4kiRHWGzoarSwe5FFBTFiYwyrf4x5/xZCcSW1G27NKbFJbg/sXkMrBT6JAP8aqYlH3NbKwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154752; c=relaxed/simple;
	bh=AKXQs7l/JnXnGET0gMtJ1sU9EPmcS39N6hUdQpcxAYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzn89deGr+7VWwsqpqeEYoIQqbMXsaRzjNuxME+tgP0bP8jtKpp/6TmWDB0q5yQBqCGAICuiVHadTCOctG5YOwXKjHFdeXejoDqZbZtR/yQpV7JNrbtB0mV4UvWKaZjk6pTcJV8MqfE5nKgb0mD/HUHjCgCSNSbfjvnoWhZ4sx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vm0E40b3; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so2407794e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752154749; x=1752759549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=vm0E40b3KJdBYURwDB2SGyiajheBsl+ABER84/3zfU8FaDh4lF6D+Y/bDXTVWCd9Ls
         wQfPH4WyJavgbd8gLpfhWeorCRWjjAyQcxsQtlmdoTuhFAaXygoHlpbIkAatNIyqGeYf
         hMUuBVb+N5evrFuB/8yu1RKA8mSwBKBtq0yHfBL45cazgVdQZ8RQfLEguPTL+dFVFh1E
         64e8JIl8v4CJLQ1lapFPopee8/ozT93rpi/nuBbxFyskVLYXtfpmtq53J99V+8182n/d
         V42bW7RcFbcLGnUAPuYz/umho+C3YZ4eCMWc4dndAKcTvXekjhXd+80++2qIoBdAAnbh
         Wq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154749; x=1752759549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrVJz6seKnsGWdk+TcTY9r2vqG/4YZecUgijiRF40No=;
        b=kaTR/hVJYOfME6aTx+C9uCpyyyjceyTKGpAJlTJIlsv5vjZH8ox18g8Z9kfnms8y6Q
         HhSMeFKug0iwRR0QhYTnw2ed9Io9FV7+TO3A3f1f7Gx31EIReGuNUtq3smm0lqHyaOy7
         a27lDl8T2NFJ5JrwsVYQXNrVMZAmXMN3RJl0Os3Bx584W8bTsSBMyNGuFkmb5q1JObbT
         YcoetRoh+re43exD3nWRydit9E6kAuH3is7VM5JhNs+IYlcGclVAVdslZLdltMjWuSNp
         9oSJfgqa47b7UIgQ0QwYYrvQCnvgjq5It3XJbQV3kvaEzv7azn3SXQcJXBFbBcb+DaQV
         N9pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg/xhsJeh3mR/Z0Sts9/73oDBzi1lfce+QhYoAFwS21XEgcTH6fwmeEByq2hYp1ARo3JRiAezADuHMxRmv@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi2U+Qrb1P1KwKtp1Wafc59R0QcsbNfzOn1HKoIAcSVbCwEYVm
	8SOR+Miu7rHpLDnPyG3AV3fBF35gHHmpxl2/gq+AGzBeSguWvkrRqB3pzDukwlYNl77q0wk21sI
	OSJy4FMYsZrG+8ODIXe1NPDJxV/UGiYCW0aQnj0eAtw==
X-Gm-Gg: ASbGnctuK3LXbYZVN/t30AvBtGATx9gZIBuOagIYcmSZAIaG3Fy6QYLsWzj61yH30jO
	gM12T8T5yzQyaIh3C+nQNxBhf1ta+oKwQxfmKQY4XQkwP98acXZTsI7HW5dS9wFGSN7W72lm2yj
	wlE4RfQqX/awtCXPdDoybGAHq8VMYGSNpCsEj/3mMCRGNmHRBiiXAC8ky2hmBX1ooNCf+czZKNt
	hs=
X-Google-Smtp-Source: AGHT+IGB6UUmFZhzqKjRvGV4lr9BeyGDE6WH9O1sGiazwi8CZoRnZBbYDI50VNLpbqgC1sRg+VYVXXWLsDZF+CuXQF4=
X-Received: by 2002:a05:6512:1587:b0:54a:c4af:15 with SMTP id
 2adb3069b0e04-5590071b7c3mr1264610e87.19.1752154748737; Thu, 10 Jul 2025
 06:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
In-Reply-To: <46a506ee-0472-4c7a-8fd8-b3a1f39105b5@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Jul 2025 15:38:57 +0200
X-Gm-Features: Ac12FXwUS6h2JE4LNA_vmGF3f9mhet3j6NKR8eSjHb_k-YJ2CoyhrM-67s3nQ-g
Message-ID: <CAMRc=Mc7KSSTF=Jsu-_1C6eWrTXNKB=_Q9fnZor8K_4nnQ5m4g@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 2:25=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> [...]
>
> >  int msm_pinctrl_probe(struct platform_device *pdev,
> >                     const struct msm_pinctrl_soc_data *soc_data)
> >  {
> > +     const struct pinfunction *func;
> >       struct msm_pinctrl *pctrl;
> >       struct resource *res;
> >       int ret;
> > @@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pd=
ev,
> >               return PTR_ERR(pctrl->pctrl);
> >       }
> >
> > +     for (i =3D 0; i < soc_data->nfunctions; i++) {
> > +             func =3D &soc_data->functions[i];
> > +
> > +             ret =3D pinmux_generic_add_pinfunction(pctrl->pctrl, func=
, NULL);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
>
> It's good in principle, but we're now going to house two copies of
> the function data in memory... Can we trust __initconst nowadays?
>

Well, if I annotate the functions struct with __initconst, then it
does indeed end up in the .init.rodata section if that's your
question. Then the kernel seems to be freeing this in
./kernel/module/main.c so I sure hope we can trust it.

Do I understand correctly that you're implicitly asking to also
annotate all affected _functions structures across all tlmm drivers?

Alternatively: we can provide another interface:
pinmux_generic_add_const_pinfunction() which - instead of a deep-copy
- would simply store addresses of existing pinfunction structures in
the underlying radix tree.

Bartosz

