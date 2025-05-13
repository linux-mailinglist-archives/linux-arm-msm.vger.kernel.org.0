Return-Path: <linux-arm-msm+bounces-57775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 091F1AB5F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 00:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D1D1B423CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 717E9204F9C;
	Tue, 13 May 2025 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="chXfOkEM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6608E202C48
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 22:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174475; cv=none; b=GK8NQ1oO4grPBtyKlISh6mKXjcCylzMlcVT027diV+NBTYwLekCDqCR+SuJQLxTX0+kelok4j4uKCP3mxpSGdqqN5T3BGt3A0KIAiMwOt/DaFhbY3QYcYUk5n6TZn6uSgfX3OJ7p9jVT3AQw+V0uyNsq9ZhjYPPxNPuECSh6mZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174475; c=relaxed/simple;
	bh=vhrkQkIyemUKp8fVxGYyNtHLYIR+hrU6/oUo8F80CPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv17VplGbALRwZC38M+A8C6G7ACSvDST12KbORv6Ynrdcw5cHT0hyAyhihmtRs0ldcDK0byipxlfXjbm/T54NGfZN32/K897aAseKwxX0iYMZUpbcDRpCz19yxAr90F7BctZmhZeCsZSl9bynk3L1Du9vnMdlC/hlhHhrRj2mP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=chXfOkEM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8257628e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747174471; x=1747779271; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqRbrvay4EnmVnivzBlX8Lw52BNBODi2l2MrzYeUfbs=;
        b=chXfOkEMELL+idf2V028b8JwFQWEj4Zhk6bzKybKjK7k+ph89tCH22nDQSiN2j5hr4
         L3qykDd+x19bV5bv8+ArvVV/aWGwMK8AFNMwoC28/0Oh6BEBsrpJhaBsCzSFvLyYTsUD
         WjSO5PsLPXImJZ9ZvfybV0qpB3jUgR16Ex1mPlNZ00aq+NZUsJOhQQrCZLXqixNqGSrk
         R46o8o/TNEqqbBnhvjSFL4uVKY9YGzKEZFnhBGvaOsdV11G6RiWzc90QP14hFfgG2Ze5
         AUmav4F1R7KE/8IBCdEz+cDhxmvk4BBuIMnST6czVtKaKz+1JZHhSCO41WtmR11n05mM
         qyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174471; x=1747779271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqRbrvay4EnmVnivzBlX8Lw52BNBODi2l2MrzYeUfbs=;
        b=aE9ekQjx2lPPzhNArR3TXbaeMzcTQk6jRgBmds+TthQwDafZB8jOluwWV5hYnKsr3i
         jpVdc/MszNHYuKBJzdFFpe8T2slVxEy3rNiKOo4VDnfE9CvmUzHuKeol2jEUF7Ywt8FB
         3/3COcnVkzwY98iZ34sGfny8EmR02Q9xCqoCSFbS2oHh8f+vJo+DGaSUnKaBSGNvg0vY
         jNp7X8aS9oAqeEBYe/SqEQ08ZMqGEql3vwtoi9mkMW5MvsjZt/YmZxPjE69J6JUdexwh
         IxO+tGPjXILsUSTgqPAGLjxflvaY19d2Zn/wwhiGq81lzrjFXbXkLQr57Is6kRXeSG0p
         yyEg==
X-Forwarded-Encrypted: i=1; AJvYcCXSAXpbfocff9Fj/kk4GJcAWNU1MR8jD48c5NoQBq1sRgCjxitN6TDlWWoaG5YTplVwKgTyZi6wKeTmImNW@vger.kernel.org
X-Gm-Message-State: AOJu0YyMED0NM8jRkeWFqvSmD/UW2fsJFJP8RKYKlCEtyYVmxtIIHL3O
	8xCcO37mdBd1AAVJ+z850xDbUj0+lETwueYyJqRMA+wUq6NISL1XE8z7mvd3e+NVTIqTX86QFXt
	9j1Tsj67tP3HShKsaJKWayCTWstG8ua7N+muqrg==
X-Gm-Gg: ASbGncteIN/bm8cHikMoiJWyevD7TfeSqLou/q1feXIrF14U6g/F0rY9Ac9dDDT+2DP
	UGneDQi58UHo0z8MssUkcL+BD03lqvZcrCyYX0rTZaJRvsGcoIN4jPhRj3UiMgbDGNso3tibEX1
	V0yID78lIDMSd8baOO++Q/zAcm6JbPY1Ng
X-Google-Smtp-Source: AGHT+IEI/A53XKPhHlqbguLvNcAKp8W6Ajoh+iCoRNvpdC948ccI/NdQGUU5EzWJOfpFednMMrqlFQs4TL82VUi3Fgo=
X-Received: by 2002:a05:6512:660b:b0:549:4a2d:30af with SMTP id
 2adb3069b0e04-550d5fadfd0mr272022e87.25.1747174471470; Tue, 13 May 2025
 15:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com>
 <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com> <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
In-Reply-To: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:14:20 +0200
X-Gm-Features: AX0GCFuWZfUikEIaDZtRnObf0sfQM_9zpw_U81pI7XLMffgTeVp1Ek5AnjAJnSs
Message-ID: <CACRpkdZ_GP3hz1yM+cJk_6U5-tshgnRau1WKdx8PNgoMOZmcHQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Doug Anderson <dianders@chromium.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 5:08=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
> On Tue, May 13, 2025 at 2:27=E2=80=AFAM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> >
> > Hi Dmitry,
> >
> > thanks for your patch!
> >
> > On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org> wrote:
> > > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > > > +       /*
> > > > +        * hog pins are requested before registering GPIO chip, don=
't crash in
> > > > +        * gpiochip_line_is_valid().
> > > > +        */
> > > > +       if (!chip->gpiodev)
> > > > +               return 0;
> > > > +
> > >
> > > I really dislike you dereferencing gpiodev here which is (implicitly,
> > > I know...) very much a private structure for GPIOLIB. Can we move thi=
s
> > > into gpiochip_line_is_valid() itself?
> >
> > I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
> > can benefit from the extended check.
>
> Any chance we can get a solution landed sooner rather than later?
> Every time I test mainline I have to account for this bug or my device
> crashes at bootup. ;-)

Normally at this point in the development cycle only super-crititcal
patches go to the -rc (v6.15) but I trust you more than most so I take
it this is one of those, so we will need to funnel this to Torvalds as
soon as there is an acceptable patch.

Yours,
Linus Walleij

