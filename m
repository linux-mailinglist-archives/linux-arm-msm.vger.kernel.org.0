Return-Path: <linux-arm-msm+bounces-52272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3EDA6D519
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 118CA18923E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C408250C1C;
	Mon, 24 Mar 2025 07:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PMS8LhNq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4876D13B797
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742801464; cv=none; b=I+QT7k0T8neBGkes21uT6hfBS4TqFYCUA4uelJjcwwiVoWOhyeMykRRzgK5jJQkjLgTI1UxzT7I43P3XAwnodf8varB8WZ3/GWTyS83qT/Xnr3rocumEhEBtKWtQ+69nDJ9ZQuN44UHyPrsbqiGzKsQUBQySQXK9x0j8gZYm2pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742801464; c=relaxed/simple;
	bh=wFVPP9vrm/IpUuXPozdTr3WZBrU9bbE4t2LjemtCNYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQbSt3YPvjKhQQX8BZeCRpd3/3G63R78gW4z61biAtQd7ULiUSVzQIN4nq8VfX6ezW8D7COjQ2w2SQpAhwBK3jjNbkyxJ2aOMVN4YRJvHT7lX9Vw/4tDGsXajuQ+RehO6AqY0X9yS8zgrwKRzkfZMuNWPSbZVrhrs6J0IwI0XLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PMS8LhNq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549644ae382so5122796e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742801460; x=1743406260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=PMS8LhNq7rRUO385P4lXW0rU9qKg8qHy7iNAP14PbUvuYpHdJwsPafAvU7mBZkAt74
         oZ63my8crKLFLangHhp2bbcP1ZbXRVFz/gcX8kqTttN1DJMS47ItXCAvv5dJBgvyJB+W
         xp36pG1IoP1D/qW0HQOt7rq/Ept4rYSUHshiI069ahdLD7t0GQcg6XuzfzIj5zE1rtJH
         CX6lLcnrUJAGd0RSkFU0nPcO5VF9EVsYnUjx9of1q4Hy5fT2Ex4WcUWyC1zMvARoJzpm
         c1GCCMbcLYyQn5RO+ki9PI7byFYbfPZFCIkmmB9yIsVIkKkmbbETnfzLTr1c8wa10tLv
         aqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801460; x=1743406260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=YToqiAX67IqPnSAq4fXM+HYnHgMggOrQlq2YZuWlo5RJs/Fl6FXRF+noyKkk2LrmhD
         3SEXQ0XKKu2yXKUZs9w0Wd/PjeFGOnDeEB3Rcklr/h1G9hNjg4rsHF5Lo2PhpWQ6YeTt
         BLMgtxrNS0AHwxQKLrJI8Bn02NO40kcn+6k6Nusr8of8wKiz6rz/tQBSny6tnuUskRLI
         vQdk1GMoXoHiBf4yHXEw7xfnaK/zIHob1WRmwurM534fNMWva0XopEsFDLZRzz5klrFW
         hbvkK6OKwnbMiVRlS33uFY8Q4iVE/uYjPabbSYjA+nqF93DwlSioDc+nkccJPrJBiIiZ
         Hr0g==
X-Forwarded-Encrypted: i=1; AJvYcCV4TE9KZpqxmUw6SEV/uLa2fLmenBIK8NNXRhikzh34IBq5iIbZRrvuB5U4XiPa6xIw5ZVw/tObGcmIUgxF@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9xxNChfXprXDH58p2zGr2+WJm0/QthYlpk+MLYRBJPqN3xzh
	LX0DUVZOriesXkzGvze/ElXvc1Lo9oP7I9rxoFm1UDdCHMthoA407c1C7GZI2oxrGgFqUWYMhLV
	v4krfy2L19+Teirh/x9vSm0lhhWJGGKrDGXBlog==
X-Gm-Gg: ASbGncvzkWkWE24PhC37RGg/qarmeapkxyXJgj57GfFa77mpssudAko7BGZF7Q2yTIb
	POYMHRS8hkbZykUrd0rui/50JJEr70WlCd8bw9v8uk/193xlkptVaMMaRnPqy/tzpVyGyAHl9sC
	vO1vgC4s6exsIZDUsACnsBzuc=
X-Google-Smtp-Source: AGHT+IFfY75E83XPsnnpR4d1GJLdT3BEM1cMFJPNDF5onGmESgudM5Wglz+nZtIx6LfxsWNWpFn+XfQWwGmynVuCBtU=
X-Received: by 2002:a05:6512:b99:b0:549:6460:6b6a with SMTP id
 2adb3069b0e04-54ad64fbfbamr3771531e87.46.1742801460181; Mon, 24 Mar 2025
 00:31:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-2-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:30:49 +0100
X-Gm-Features: AQ5f1JotataG0hZSkN3AGVCpQIszAGWu_3pPzj94x551CNQv3UQ4vd0DTWvGPVg
Message-ID: <CACRpkdZmaAg-CMp1PhR69-VPnP43DigtaEy8aAd0MhUJ0gcWOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 3:28=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_ASIS when get GPIO descriptors, and set value 1 means
> output low, set value 0 means output high with gpiod API.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

