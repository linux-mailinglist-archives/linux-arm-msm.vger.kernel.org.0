Return-Path: <linux-arm-msm+bounces-9247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 264A9844079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 14:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E2C3B2F82A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 13:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43079DB6;
	Wed, 31 Jan 2024 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnI8TbWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAA87AE47
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706707088; cv=none; b=nqg6WwlM0i+bLo0wjrXSKRMQZJIvTSiBAk99pK2Nx3I3Tn0xAc65FOfOoioBmR4uphkELOsNLO3OrmhF8J4VaP6UH5wDvQKJpU4Xg+d/mXemP/LkkZjdOM/FJnkdE2QMVVnUliVnva2rALSO3Apa5cEcT9QOBbGuecOt7Vwld5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706707088; c=relaxed/simple;
	bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X617LQlgBbi4FDnhj+xWXtCWA3cgNQMtq8BgAro0olvih+t7jKOOjaY07Ee1Q335i5a87Om3bVRF45xr+oMrG6995bhXBnOwOdcL4avnfLowty43ZvSgvoJWpkSTPd3/Nd/r3Xm2Hpaej+jN3Mp39hcQA/xyJIvjKUKbPa4jPTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnI8TbWG; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-603e086c05bso30869727b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 05:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706707086; x=1707311886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
        b=QnI8TbWG2XKPFB9aozCWTavISGyEjEIeKvQBhFVZ5daEc2Gvbg1a+uRaA9AEr1386U
         0xudJNvDJ30LyjyFJmsPwFu/u7Hxt8SIIBM4vL+b/JJRqFYk5NMC3lOENIkHYFOrbVxh
         GF57jP3AFv8Xg2eMG0Hb1EPlibZ0ZyS3kqTNZHy8iuxaX7s2XpL6+15F89GUjAoDWNXD
         MMfPk55M/V13sFxB+NHHhB3FiOQLnkaGO5GgUogGV91PZepnmTwbXwl7JBq2lwTO80KD
         0OQe5pFIf2uRB9A6KAJL0XvN1CspSRq3q2brtC/BDwHx7OAeIrhTEdKgC5qtkeOxjk2V
         hvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706707086; x=1707311886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr6D8tcSVVpexu92k5w3N7i9nF+7FRKOS7uUR00A6YM=;
        b=mI84ga5/pUiGZuULjSRAPmTerD5THw4o6t/LYDI7pfKSVxA2TqovJ854I8d0lyo/P6
         5pWl4rvrjIIfSMH5JFnt4HiPJfGp/lZNtKHaUl42c+t5sJISj/qkn9I3SykPYkGAuvZJ
         YmI/WwOIo8tNfFuzVregbLUXMNUzV0BxGHOtY0d8+nuMG0WttJVElyCYHTG2UW8hxAgC
         FA0r14Kkn40epOH9KzE+j3f0z5bfHGQLoe5OPRAdr1oqj8cAQzN6x77SvCH1UPrjs7lv
         8AUCqgtYWlMUrJKM4l//R7NfJFqMcYApHYFwKGkfQ7BIeT6XW587SLkkbqcscjOvPDbH
         X+sw==
X-Gm-Message-State: AOJu0YxlenysYc4k8JN71RX9TJSx/3VlcviltQC+Q9uompGSGZ0srx8a
	9Qj2flHrSiV7rh+4uiCcWXVj4V9YdELnorquruuUNt7teUV0ZM8GGnTJ+cmwIIvOeSmXBZ8V1gN
	P4m3U0r+afUH5pTTMO6oKnDw/1gWXQYmfg6++Gg==
X-Google-Smtp-Source: AGHT+IFVACpGX4CJfjjGDw2bakc2klq/FcD8fSXKF03+Z3ok8uxur5h6A7nnyOGYfn7248iMkpgzntKDjCWeB+kOfoE=
X-Received: by 2002:a81:79d5:0:b0:5ff:f756:8804 with SMTP id
 u204-20020a8179d5000000b005fff7568804mr1275150ywc.45.1706707085871; Wed, 31
 Jan 2024 05:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org> <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
In-Reply-To: <CAMRc=Mc1SGLeUOWmKg=fvCdM+RR6FSu2QkFuR17s7L99eRMGug@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 14:17:54 +0100
Message-ID: <CACRpkdbaxqTzwL9L02vCpMMdBYsubNP1VkNuJ8mXB_=4E3Kjaw@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
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

On Wed, Jan 31, 2024 at 10:37=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> [Me]
> > reset -> virtual "gpio" -> many physical gpios[0..n]
>
> This is a different problem: it supports many users enabling the same
> GPIO (in Krzysztof's patch it's one but could be more if needed) but -
> unlike the broken NONEXCLUSIVE GPIOs in GPIOLIB - it counts the number
> of users and doesn't disable the GPIO for as long as there's at least
> one.

I don't know if the NONEXCLUSIVE stuff is broken, if you mean reference
counting isn't working on them, then that is by design because they were
invented for regulators and such use cases that do their own reference
counting. It's also used for hacks where people need to look up a desc in
a second spot, (perhaps we can fix those better).

As I say in commit b0ce7b29bfcd090ddba476f45a75ec0a797b048a
"This solution with a special flag is not entirely elegant and should ideal=
ly
be replaced by something more careful as this makes it possible for
several consumers to enable/disable the same GPIO line to the left
and right without any consistency."

I think for regulators (which is the vast majority using it) it isn't broke=
n
because the regulator reference counting is working.

So if we solve that problem for reset, we probably should put it in
drivers/gpio/* somewhere so we can reuse the same solution for
regulators and get rid of NONEXCLUSIVE altogether I think?

The NONEXCLUSIVE stuff was prompted by converting regulators to
gpio descriptors, so it was for the greater good one can say. Or the
lesser evil :( my judgement can be questioned here.

Yours,
Linus Walleij

