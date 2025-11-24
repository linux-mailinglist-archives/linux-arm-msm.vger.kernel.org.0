Return-Path: <linux-arm-msm+bounces-83093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E83AC81616
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 16:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5193A47AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101B9313E11;
	Mon, 24 Nov 2025 15:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="u57Rn8nh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95C31355D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 15:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998588; cv=none; b=N5Kw0hWJP4NwZ19hZKtI5zbsVZw65qNKDtAPq8GNe6FAvSpLdrlYtDUD8O8x6Is7JSthQGTWS6WgJsaFRN3p8Q3d6hCXYgRaUk5PrOme7zlIkgQ1Rw8s2LY1ziYhJrthfSEP3h1FNTRY4NTdU/fvpEJHH5C8fuvKIQjb/lp5bW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998588; c=relaxed/simple;
	bh=e0nZgjg3ufB+9SrJFiY1G1uB/T9ZjhZVGoELd6NUN0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fP2SVhe2g0Pi8IBXxcSIFpbIWhMtZsTECZq2jwVb76ffs3wQyVGRk4wNocJszf+9lLOz6YIocLvYdY6if75SwTkGs+2ThTZ2bRf+ThyCTHNSMXxeyc3ucg/415zTR2kR/air8F4ghDoVyRVzjrW0lTX1d3UjRniWeKS09bbZyDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=u57Rn8nh; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59583505988so6018459e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 07:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763998584; x=1764603384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxP0xIDAWymZv7fPSeGgKb5PKARmnBvRUWthSMdS5iY=;
        b=u57Rn8nh8eXWSMTipRgJtUrznX1quQS/p6xHLv/AMHOwmnnbI1fSYJf16EawvoaOmw
         M0B7w4hhYyP29aU2vBLf+2lJWEHhRY6xMdCSKn5uctay4tfEn9DbZi1716nfLxf0Ur9I
         OcPObz8do76W8rNOtKeBfGoJkqZ3Zd7PMsuc36h2AjVRQMxtfgiQeV4RoqMjyKNHacoZ
         DN0e69Wq9dc9qux2S5sivB34XZMUmvym2ZImvbCybHtljJTaNVOgxV+GvxUi1u6JXwf6
         pN2zwOZLKgrYFP5Y4DwglXvmGG786yhGCIEhQ3ELTbPT7GLjOTuBpE0U2r/5xz4eKmZ+
         bwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998584; x=1764603384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxP0xIDAWymZv7fPSeGgKb5PKARmnBvRUWthSMdS5iY=;
        b=YWx6/DYI7/Ic0CT7qdEMnE5LGMGjvvnqGTQRH35OZUQ8cU1DjR/WLcQRO1FZZz8UL3
         1fi6MfNzfC184rCpXq4ojLDndshG7ztl4qTJZWJGI3pA2Da+eDKjnp0guxYjwpdwZnZH
         oGSj8n6c/DhO98d5vlr0Hqw14NvxUARbClPY7C7W6OISPXpC5RWfBE8duX6TIU3WqnJW
         GeMavFTwvw4CfL43voR+HnDZN0aL1iyWUn1mmy/AETOOaIphe9gF/MJVpjTMXXb5/XHx
         +ADdoqGN4/XiLTNpnNfljyMsyLQRnUw5UgA297BZI8f1dRAfFN7CYDKwuvHj/t9f0dYR
         D4jA==
X-Forwarded-Encrypted: i=1; AJvYcCXt5cccU0xPykCvTq6IkodfZx5KEcaDvUqsULvmPqBgH20P4pigqbQhdQYmT8x6T6aqt8paz2jU9X7sg+Cf@vger.kernel.org
X-Gm-Message-State: AOJu0YzJG3VTY5R1XOww4WFWqXNLWjaVrjV1yFLYlaaNSU5hem3wc3Pl
	6VcQvBAG5d3o9rYdFJxlLpwIivldN75Wc+TU9DAr3RvVZB/WU33RoYfUgVYLrqgF3SGXy4cFbLC
	03d63hcwm4XGbggfkWj6HYqM/0l42evlfU+iy4e6E4A==
X-Gm-Gg: ASbGncurBfaLI7W/PUT8gEGaKzYZdADx2RWOXdC4SDyvRkICs/6/K+HcASEaz/PRb11
	PBMoy6hLFJYj29HbraqXweS9IqPA3+Wr1RCDfZTOq/6aui+57M+42jlqH3WN+8eyIioXfONjCNg
	EVrMPm+e+j4eVvUpvSKpDjV2CThs/u3kjnB4rHB1tnQj5w9v6XOxXcjn9PBllbAeguc9J56PD9z
	ELW407tLtPHcjahPdyH7uVlA95fyG6yYsepTnYMMIvRAgdSdwHRN/ukAM+NlBimJ588Vnm37yM+
	ZMYYy53GPPyjlH/TLdRx9x7J1+D/vA3J5P+b3g==
X-Google-Smtp-Source: AGHT+IHrwGF/qNDn7B783Eqm0HhC2COHtQ4fwnWblm9MArG9nwh0lAwTRLNsvQfu6OXhFZId288Bq+XaRf9PVQoIxMk=
X-Received: by 2002:a05:6512:ea4:b0:595:7d7c:59a9 with SMTP id
 2adb3069b0e04-596a37a14bbmr3805367e87.22.1763998584153; Mon, 24 Nov 2025
 07:36:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251121-gpiolib-shared-reset-gpio-fix-v1-1-cf0128fe4b47@linaro.org>
 <be7fd390-e81d-4e93-880a-1b6404398408@packett.cool> <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
In-Reply-To: <CAMRc=MdW3AkkivE=sA4STZAmmee7bCBkD5oEsXiRcKA80Ggd4A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 24 Nov 2025 16:36:12 +0100
X-Gm-Features: AWmQ_bnO4MoBK0HrDlfLiYqUSEooF6PVnvY79-WR_C_UGuPRN286MprEXsts4t4
Message-ID: <CAMRc=MfQhu9GY2+3G+Ba71JnXUnU4akAfNbsMDnwkCRNzAXQCw@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: handle the reset-gpios corner case
To: Val Packett <val@packett.cool>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 9:38=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Sun, Nov 23, 2025 at 2:03=E2=80=AFAM Val Packett <val@packett.cool> wr=
ote:
> >
> > > ---
> > > This is targetting linux-next where the reset-gpio driver is now usin=
g
> > > the auxiliary bus and software nodes rather than the platform bus and
> > > GPIO machine lookup. The bug is the same in both cases but the fix wo=
uld
> > > be completely different.
> > > ---
> > > [..]
> >
> > Tried applying only this, as well as this +
> > https://lore.kernel.org/all/20251120-reset-gpios-swnodes-v7-0-a100493a0=
f4b@linaro.org/
> > + https://lore.kernel.org/all/20251121135739.66528-1-brgl@bgdev.pl/ (on
> > top of next-20251120) and the issue is still present.. am I missing
> > something?
> >
>
> Can you try this branch?
>
>   https://github.com/brgl/linux test/gpiolib-shared-reset-gpio-fix
>
> I confirmed it works on my setup and fixes the problem with multiple
> users of reset-gpio AND shared GPIOs enabled.
>

Actually linux-next got updated with all the prerequisites so you can
try this patch on top of next-20251124. I tested it and it works for
me. If it still doesn't for you, can you enable GPIO debug messages
and send me the entire kernel log?

Bartosz

