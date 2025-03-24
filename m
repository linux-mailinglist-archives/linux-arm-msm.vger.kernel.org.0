Return-Path: <linux-arm-msm+bounces-52279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D704FA6D561
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16FDC3AA2B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20E7250BEB;
	Mon, 24 Mar 2025 07:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFubLlqx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12E1662E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742802460; cv=none; b=m87n1vAe/1mkgVPCf/ntA95e4IIUjPlYeGYltLkDjcldGeg1cypW9emTsYJQo/Q344AXIjnYFkfNxEXYDXX6nRn9eOAQWWC7GEXaXNPFoKsDBAPKGU7lpvsYoTfLBKXJ7mYxeV/VhEyBsI2zVb8W+LybImtcQh67ZUPlv2XppkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742802460; c=relaxed/simple;
	bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4V78GMfJrf8arcBSan8mlU4q8pbP+9x/njBgSDdHq0nWjP6b4tLT649x89iDPBSjplYwaqPNiyWsWiG1t6KN5Vz5go4kPIyLZoqR9NWjGFgjb35rit9aodgA5drnr+Skzeu4sqFmLN59shfIrNUCGZj587o4Aj97vPNxptUxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFubLlqx; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30761be8fcfso44583181fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802457; x=1743407257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=kFubLlqxdANp2SaBSJ2+aCPynJ9e/fXGr5+x5KsTu0KEQ5Z1rx+KrlGUENa/0QMuaH
         /5/t5mcT6gkVfaR4n3y/X4KhLEw2JF5yP0zVYJ5yn6ld+Be3LJKfWXuQ4TI1URgLrNyu
         9pt0pjs7qtqpLpGcU23v782REk8MgkyBhtq3q261lfdA+Ru0hNFCI/VLzVSmB3pPHhOZ
         GXl1S/WBnLQe7fRWeCtipLe48yeN+K+4eJtMm6SHFHLG5+EXn8A6BOwxzv8T1oQujO9E
         u6crXoeupzIXprAianNGWSNTAU5ckrOsndm5I9CHxAlJWJ+6IFWixJtyZvchiCj8ozXq
         58JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802457; x=1743407257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LADn1kANv9yfbuyperCIqqOS/gvroECf2fXmlFm+UsU=;
        b=rmS8ZHXfKahhtxmN1ohQd2Npi/rzD2a+dwsyq5sinEYdU/HPUZURajlC1Vn9vwqLNs
         1eF7fOcv10mVvElj5nGM666SbAv69j7eFcSkevkGbbtQFmdvupPlxuqQiI2pyRZCNIUc
         TWJ2VuQpdtak/ojR2DfQqZNhMwIhBb3sKLpuvkh21BGW87dOPPPwEZIVsule5q971qGJ
         eKh2xX+kr5H5GvK5Q7GKwU0wBprj1XHldX7CH/XpCwjCkyOGWiS+feOGZsw5hBeogNJd
         d6AAP1IN1vrcCZVAU1PcPoZisMxNUJKgqxk3DfoWkyi4eLKjHec2m7zOjvXr3L4DAgfJ
         yQMw==
X-Forwarded-Encrypted: i=1; AJvYcCU/agub/VkA9YJhoAIxz65VLZtjR0oOyUmVWygR32+kwlK6VFQLh+pPUARopBEcxVmjZXlEEFVjN/SRpNXg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8rgUH3gObXiqlBsCYRHPLUAX5yQJkSNxZ/XXS3CbreydWoJco
	YcZA85jiZMAko0GqukOswccpuk2VXM0qt4jBkOmeEfqeODx16By6DKidqhh1h27L2rHfY9wxz/X
	PwrnK3MRpNpbOYdeqRIWgHBVimmhxu8Y+iodGug==
X-Gm-Gg: ASbGncsxLzY0WP3blSiRJBo5Pjlv70k2W/ImAc79HD7gOAUJjtVmmX8hKEq5GF9oNRQ
	aOlzcDtoozHerrZhhRkO10jcT5B4SfSCWggolbzQ7iSR25lPXn6jjrb0vMH3E8GonPBZr2e79CZ
	vtFOGIoeOChLQIbk6QgoJJbnQ=
X-Google-Smtp-Source: AGHT+IFoKZEu+cWJ6kUjBS4RpIBDAR0l8rGtHeVCikA1xU6nS5VUl5q1Ld16dkGWapP7A6sIfZYBs2kqSSLj1B5qKIw=
X-Received: by 2002:a05:6512:3f05:b0:549:4e79:dd5f with SMTP id
 2adb3069b0e04-54ad64f7da2mr4777907e87.37.1742802457021; Mon, 24 Mar 2025
 00:47:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v1-0-27afa472e331@nxp.com> <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v1-3-27afa472e331@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Mar 2025 08:47:25 +0100
X-Gm-Features: AQ5f1JoLqXpK62k6ENcNGiw40yjAMqH6KjKoeHo5l6jpodi-SVCf3FhtdJEoj-w
Message-ID: <CACRpkdYLMJaC7XREXL4m62B6x8fc6XvmR3FfXYUfh=QKM3whmA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: codec: wcd9335: Convert to GPIO descriptors
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
> - Use dev_gpiod_get to get GPIO descriptor.
> - Use gpiod_set_value to configure output value.
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

