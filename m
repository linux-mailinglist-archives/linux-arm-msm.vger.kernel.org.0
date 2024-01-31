Return-Path: <linux-arm-msm+bounces-9252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60017844178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 15:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9A991F26EB7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AD582863;
	Wed, 31 Jan 2024 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MVZOtlij"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EE80C0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710329; cv=none; b=Au6n30baNcipF324oljdww/bQTBZFXNW8eUtVeKv6PtxH2ymr64wCuYvPIdakncqVDa5lgqTk7mHzbMahaU9+AGsANKAU2Z1uPWkqmiDf6RoMjTiN2H0ziEq/eBDf7xv2+WUkJflphADxsCt2D0SjDHOmsIQjpGjUlrB8tjLztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710329; c=relaxed/simple;
	bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kRXIRXSQr78qin2WXfIYfmfX80UNG5oRlkrwEL73gmDqEym/MeL364/EVi+icMGGrwhH0ZZCVYwCPVm4M95EWkJak8c4dVeTsd5BjSI4LuVViq6drF1RAmgxf7qovoN8SFN6FtjsVLrp+lbNgotYJJmqwQNsd7y+kwrJcNNpvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MVZOtlij; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4bdb7f016b3so1355462e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 06:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706710326; x=1707315126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
        b=MVZOtlij2AZ22kc1XCTZWLZ/d/0js7zssLKOlA24s8zen5q3lGG7G5q7IdSPnwtZSB
         XUZj40mPwU6jNopWsW6w6H49sdsHuUMDhmgR74IkMUgNSv7HYBV9ZVEQ3OF35T9RerlZ
         CdOy9l5esYmHNqAZWPqoK15kiImPVwzRHteH44iKwyUdF7S2mQkJCxnqEh/OFOBAiu9t
         yiwqfwhZevpBRKmfbvqa7OX3jVZlBR3DsS18BrHg/xAxVxkHhDskboDF8iOnjECQP/hQ
         xq/Pfaer6gknZplfImXP1Oxn31CWrSAfEy+iOFa6nQzzkCyqbZC40KN8BqmU7Un3lN9Q
         uHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706710326; x=1707315126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy67XFG440oNqKNoOyKdiRXwM4wMoj/X9XerGknRkFM=;
        b=XLDd9SEiMHNcbbX5XpiF5Xwfxm41oVcyhHQandsM91tqGECQCKS87GpuzA6HbVkM0E
         TjsWwVIxU7B/x+t6jnT+PFDwWUHCTaFafrCbD4LmjvJM7/7YTm/gS3zbiifNRB7xBEZ4
         Ol2HZnpCN6f7gVo8NBHlpkHI7r2zuvkmcVhIQcK/t3xfNTIdJU2StcUueBariSd75TgI
         Yf2SggJyt2eMPJJ+PfOcq1ytdb4HIqZuFGasyHFH9ItezKej8b4cYpxLycV1Oiir99ig
         cTGiXef5MGOZRTN552pYnfgxcEYFZ4TjGFhPRlH1MdOqWrxMJ7rtMiPpQU4RXhJLI/hr
         Zgcg==
X-Gm-Message-State: AOJu0Yxy380qRa8XPfHzAPruL2/sYP7dvD9RgZn1GtQ89ML9TBEPLTfv
	SSQU7DFZ/xu5Pm38kbTpMaQemZZrfH4Efa6QjJPOY2eblYghCVq7NKVPxnSNbatII3mVCV6b+aA
	ndXcTxFRt5A7q/Rse78h6f3SgRnDxKNaY63f1MQ==
X-Google-Smtp-Source: AGHT+IHw+5LJCo4zP77ngTsk1zmxdOx6fkUQPNqVAurEYXrfnmeT5FR7RaZ6Ra6HK3KzPd2ohkdgXC4v/gfXwwIUBNk=
X-Received: by 2002:a05:6122:179c:b0:4bd:5328:b20f with SMTP id
 o28-20020a056122179c00b004bd5328b20fmr1596779vkf.14.1706710326488; Wed, 31
 Jan 2024 06:12:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org> <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
 <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com> <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
In-Reply-To: <5ef64082-0b44-4bb2-bd4c-654c96f4a9bb@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 31 Jan 2024 15:11:55 +0100
Message-ID: <CAMRc=MfNNdJzbxsihNd94LhqzhZiL2H2-z=grEFoNmOxpua5JA@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 31/01/2024 14:17, Linus Walleij wrote:
> > On Wed, Jan 31, 2024 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >
> >> [Me]
> >>> reset -> virtual "gpio" -> many physical gpios[0..n]
> >>
> >> This is a different problem: it supports many users enabling the same
> >> GPIO (in Krzysztof's patch it's one but could be more if needed) but -
> >> unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
> >> of users and doesn't disable the GPIO for as long as there's at least
> >> one.
> >
> > I don't know if the NONEXCLUSIVE stuff is broken, if you mean reference
> > counting isn't working on them, then that is by design because they wer=
e
> > invented for regulators and such use cases that do their own reference
> > counting. It's also used for hacks where people need to look up a desc =
in
> > a second spot, (perhaps we can fix those better).
> >
> > As I say in commit b0ce7b29bfcd090ddba476f45a75ec0a797b048a
> > "This solution with a special flag is not entirely elegant and should i=
deally
> > be replaced by something more careful as this makes it possible for
> > several consumers to enable/disable the same GPIO line to the left
> > and right without any consistency."
> >
> > I think for regulators (which is the vast majority using it) it isn't b=
roken
> > because the regulator reference counting is working.
> >
> > So if we solve that problem for reset, we probably should put it in
> > drivers/gpio/* somewhere so we can reuse the same solution for
> > regulators and get rid of NONEXCLUSIVE altogether I think?
> >
> > The NONEXCLUSIVE stuff was prompted by converting regulators to
> > gpio descriptors, so it was for the greater good one can say. Or the
> > lesser evil :( my judgement can be questioned here.
>
> I discussed the non-exclusive GPIOs with Bartosz quite a lot, who was
> Cced since beginning of this patchset, because that was my first
> approach, which was rejected:
>
> https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.o=
rg.uk/
>
> The non-exclusive GPIO was made explicitly for regulators, so it is
> working fine there, but it is broken everywhere else, where the drivers
> do not handle it in sane way as regulator core does.
>
> To make it working, either GPIO should be enable-count-aware, to which
> Bartosz was opposing with talks with me, or the subsystem should mimic

For the record: I'm not 100% opposed to the enable-count-awarness of
GPIOs but don't want it to be the standard. I'm open for introducing a
wrapper built around the core, low-level GPIO API but I've just
dropped a big patchset addressing the access control and serialization
issues for the GPIO consumer API and I would rather work towards
making it at least more-or-less correct in the first place before we
start overcomplicating it again.

Bartosz

> regulators approach. In some way, my patchset is the second way here -
> reset framework subsystem being aware of shared GPIO and handles the
> enable-count, even though it is not using non-exclusive flag.
>
> Best regards,
> Krzysztof
>

