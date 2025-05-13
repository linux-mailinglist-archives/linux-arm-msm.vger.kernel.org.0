Return-Path: <linux-arm-msm+bounces-57719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7EAB5818
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 17:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 867953A44B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BD528E56C;
	Tue, 13 May 2025 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RaXJ8MdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A64E244669
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148892; cv=none; b=FyeSbkcvxYaEspyrd/Qgmb7dchB97uzj4NWBnsQAqExRRbzBKxVM7CacaVr1oK2e7TH2WDzGyBFkRzPnLfxDe/aYeBvuXNPmU8xNi0y5GdWG9KY/FQ9eommaH9CrgsmY7MPaTgd4+e6NewK54Tjej9kenEHJcFt6hHAe3g0pIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148892; c=relaxed/simple;
	bh=cyC24FKRZ7v1DWNmkTR+FPbI5tSVDOpMoBY0cH2e8cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FjFQLpzjZ5SHLuRvc9lduNiK0kT3UzKd6bL+efQ4rdc3p7vY//cgTAH7PRbGEOviHaE70XgjWJUzetNuwAH0ArKw7COwpOt7QfeXGmEuQ2sJsZgCP+i9c7CzgluOxRaWBaAz/X4xsm1+2b7X0diAQX7M+L4HNcASwWL+k+3guAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RaXJ8MdG; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-879d2e419b9so5214050a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 08:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747148887; x=1747753687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=RaXJ8MdGfS8YejZwFEu7L/kXgCD6v5p70W0NECUlKt6cZ3Xvfxdj/h1rZH1pbN3vvR
         x+ApH2mf9GnnP0VRi0ENuYWqycvvxM5w1hYBwdrS3TO8ybGB64J/2lMzlL2yNrO20N1d
         9z02+PtIAoMxKD7B9TKBjveo8G5xRlZspbYQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148887; x=1747753687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XC0wSA5fBRbT0vh1GnpF7biy8ZuXb9lHcS4DgbOrdhY=;
        b=RoGyhwoan+x/p0x7q+9dcVYtMuMASEQG5HkvUnIyJ2oYny9VTfrU2LeL56rSdnVwSp
         xX6SY3U2tWJjPd1YBHa4EBkPhUOBiQSt8078s7Sc72o5MlDkw+Ty/7cSNzK/jOIlWUEq
         3BzfgOk0zr/IBihqQTqfahKjNu4+kLpZkv8754d6oKYnum/vDYvjeXUzxygQkvjo7d/Q
         flsDk7fo39uB8EIYLsA1d8FybActRrpGeK6c0eZS5bt0BvBaOKWeLli5ZPGvMrtPklVz
         BqevT4mZdL9pIBilu36XKrd81Ew0US5HfLCdWZriIezKdYtdHC838Oc5sjMpccjDxiej
         a1+A==
X-Forwarded-Encrypted: i=1; AJvYcCVO7gqbowff4zGB71yEwLOiuTneOvb4YbKcQVsrlgqlhHGHrfusPvqd9gXphCoYbVB4h20WhhYr9zZaJup5@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxT00ozN0wet1+R1QXJRAoYBMamkL9+p9TXy4VVFQgPpSyri1
	4v20uoZBYapkx1TaCCgHPmNbOxj4HkyBN1OED5WvPRBsoUK3bkc/THFMEKj2VPnbLmo1r4vn0yI
	=
X-Gm-Gg: ASbGncvX879zj9HXgK0+dvcnQGE4KH8hjd55S5P6D7/R1Itim8CzRdOLf+tEL+0DLgc
	P4yS3Si9sTVu8CmkPg+FATj1Yq//6cUi007Xw5FMpadIxnw+2FZzNX/nZikae0PEgNDpR3zuvye
	AtALOKUMduH7BdfAIfk8G3ERP2k/5VdSX1bIsfV/i/jagijjRZ2A3LZwxjJtqHFEEkedMoTYd7h
	eqUg4MokB1glUcTlJ6BCkgWsfrlkpAzRGm/5cJnidEnfzHypy7C7gDBzt/2NAiCZT7zry4uDFjG
	24RZbzKEsyXkL1Gr3TALkmR/utW+bxydUm4TLjgynTAT7FeucCfTXkyuoWSh9xYudRnWUmWN05K
	Gr06UYOVd+0Q4q7PwImE=
X-Google-Smtp-Source: AGHT+IEGiJtzbf7r99tAApqb55cAjgxOBkUKRI5oE3XD4wYVIiqQVIlIJLImBKDQbh0UaWfRVMxcWA==
X-Received: by 2002:a17:902:d581:b0:22c:33b2:e40e with SMTP id d9443c01a7336-22fc8b1b1cbmr243202035ad.2.1747148886538;
        Tue, 13 May 2025 08:08:06 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c17sm82867855ad.121.2025.05.13.08.08.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:08:05 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1a1930a922so4209765a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 08:08:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvrwruH9oQCeXwYN3jD+DJ4quA0yUItS0rq+YnTMnmDPna6RZGno86wk1Hww8c7ItVIICu2pmEBryQCigI@vger.kernel.org
X-Received: by 2002:a17:903:2344:b0:22f:b327:a720 with SMTP id
 d9443c01a7336-22fc918fe81mr229546365ad.39.1747148884248; Tue, 13 May 2025
 08:08:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
 <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
 <CACMJSesqtkorg1akuXjMa9U1fe60aDhfGOSB_T6mX5CtCYDwtg@mail.gmail.com> <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
In-Reply-To: <CACRpkdbDNbEpNOLT31+8Jb_fdvnROOtONxFc0hxCFa5AotSwTw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 May 2025 08:07:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
X-Gm-Features: AX0GCFs4uZMLXjCSAO0m1e3AtYaXg0I7KL7nfpg18FrQ59BKSujflfXbgJMJkH8
Message-ID: <CAD=FV=XiGJ1uV_s35dwCYwdzoAj4ycXOYRyDZMGLOM9+JY668A@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 2:27=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Hi Dmitry,
>
> thanks for your patch!
>
> On Tue, May 6, 2025 at 7:28=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> > On Sat, 3 May 2025 at 07:32, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> > > +       /*
> > > +        * hog pins are requested before registering GPIO chip, don't=
 crash in
> > > +        * gpiochip_line_is_valid().
> > > +        */
> > > +       if (!chip->gpiodev)
> > > +               return 0;
> > > +
> >
> > I really dislike you dereferencing gpiodev here which is (implicitly,
> > I know...) very much a private structure for GPIOLIB. Can we move this
> > into gpiochip_line_is_valid() itself?
>
> I agree with Bartosz. Patch gpiochip_line_is_valid() so everyone
> can benefit from the extended check.

Any chance we can get a solution landed sooner rather than later?
Every time I test mainline I have to account for this bug or my device
crashes at bootup. ;-)

-Doug

