Return-Path: <linux-arm-msm+bounces-52594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB0A72BCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:50:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEE5D3BB3A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F6520B203;
	Thu, 27 Mar 2025 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cJcfeXhf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2E20B1FC
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065445; cv=none; b=QWomDL2O2lhvDudPUkBYltJ6lQ9/fQHsxOs/XTWPpNjK+r0ojN/cqWhAMwfPhECJBCxYkoMWmWhOk5cHI/6ZqNdgB6OEYzR86/7ptSqGENNkULPJYRVK+jGrAOkgRAES5p6Qs5W9zfqCwreLFuSrDKuzZcpO2tPVJN2uq+8QFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065445; c=relaxed/simple;
	bh=SSuwDDlCfqr5CMC3oPcQO21KrxISnnKr5CAAJcA5Nlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVNzpZJihGstKCOoEbGZoa9X9iBJJm0bz2Admd5vKu5xSsYaoDiTPrWosPwim6OB7KFPvEGizCBaIXX+6efZQW1W6wg20cVhFNUi3PbXRrscGPLubKVMiC6y0sJ5MMqmPqTQcTlBYvwvM6aVlpmOEUPPjXuR8oioWKenh9wVebY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cJcfeXhf; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso7192751fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 01:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743065442; x=1743670242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=cJcfeXhfn0oAM5iO1RFH0NqwYN6PKK0dEBx9wf0jHwjBuHk/CpksYvnfirNW3fgMUh
         dMuDPXuE4ZDSMGLOZBv7CO73pKUI34VC6SoZNX+nkZS6Bi8IEGnGdmMURJkEbBF54deI
         VR0fzs9pZ8OfuGlvPTicWKxeRvoI1TslOmGEXpZmxdv1wl/KsaeENQ3lf9hL9Vdbqyp7
         K6F6WavIIxoofDravsJBe2la6npdnqXk/10FOeGR3rwmyXmgkr5nM1BwmFFUocbAtsuJ
         3HJkDqwC4sI+/DDDXEdUlS+QdtI2fcEt4eDZUiCPRXgo2HsnfsKe+nvLRHsOAAbibtTN
         69Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065442; x=1743670242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrCm7V9nLgr1fSaq78mJmNgFm9htZIYRYnkNXr3wiks=;
        b=XjwAphifW5929qVd/vJpekxFx67Yg0eoHhM9TkUHis6vpPd06/dHfvYRLLApZTxtL2
         U8wbtBCh7W/v2wGSusBUGODd4H1zSuiw85oBvG9jBQGeeT/Ox5dsRAEfXIHEPgbkOihm
         DW31iz1EtqBradKHKJBrWQowzfOeb+8iML0ndNChNsZh7E+CJiT/9jfQuscWIMj8ieGL
         UsEn3CNu5RulR4gNKW9AQLfAJcLVgwc4eUXhSXln2JRi7JNuxRqLFR99LfoxibOLP6F3
         69iWspQd9beQtGMxHHW7hp/XPDpO+UlXTcBKXw6azO2HKK7Rr7T6Kj6ofMQCdZKBsQAe
         zpbg==
X-Forwarded-Encrypted: i=1; AJvYcCUnCcVWPF9xmYcsIFzF6RKQ9TQo+ywnIHDMNUkQVQi4i/Z8cWKqc8nQ7kUZBqUKZY6Xoya+rrfYIIKgRS0f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+TAXKMrWjhowWbVumrbXLX8zLiahu5LfO+KoHG/dkBU9dm34D
	Q/k7LGyfqDbXZ6AI4NtAFrBqTclt2IYgeQbvElsE6BfYWCLuEmiKsSvzaEotgzthLpnDat68xem
	dgZPOUDg8Deny6alvM1PqhwiambtFLlCImdEzfA==
X-Gm-Gg: ASbGncvY811GZl5RbyU7DrI99ziTfU70dgAiZRRkhcGNCvirDS+Y9T7sVtgFsWZzbgC
	hH6yQq6VLY9+PnEvQO3NFALNs9bqpV3Lvpw5/ttdHvKDELVIr1LLb69CmUqn7T8eiP1yXc5guzt
	CwsIyi2LF2eiZoSm/7F1JmT7qRVonJkieLL+Xg6XVzj9yqpXoRoHqx4Vzw6g==
X-Google-Smtp-Source: AGHT+IGxgIMt5kbHn2L71WGjDAcLR0NypxnTQNv9HahK/pVgRmQpyy7Nbd63iN4iNHaoEbc5XYTKgBpyYWSQHq3EHrw=
X-Received: by 2002:a05:651c:198a:b0:30b:b9e4:13b0 with SMTP id
 38308e7fff4ca-30dc5e52989mr11888081fa.12.1743065441577; Thu, 27 Mar 2025
 01:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-wcd-gpiod-v2-0-773f67ce3b56@nxp.com> <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
In-Reply-To: <20250324-wcd-gpiod-v2-2-773f67ce3b56@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 27 Mar 2025 09:50:30 +0100
X-Gm-Features: AQ5f1JrsE-JcUTWn7tcgiR5us3IYvBsJJdLl84KolEecUKrVowGr9GOKOQX6-6k
Message-ID: <CAMRc=MdXvwyXTjUj2cNQm8_c_fCoY4+kLA0C2D6k6MmNGkTEdw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] ASoC: codec: wcd938x: Convert to GPIO descriptors
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Steev Klimaszewski <steev@kali.org>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 12:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> of_gpio.h is deprecated, update the driver to use GPIO descriptors.
>  - Use dev_gpiod_get to get GPIO descriptor.
>  - Use gpiod_set_value to configure output value.
>
> With legacy of_gpio API, the driver set gpio value 0 to assert reset,
> and 1 to deassert reset. And the reset-gpios use GPIO_ACTIVE_LOW flag in
> DTS, so set GPIOD_OUT_LOW when get GPIO descriptors, and set value 1 mean=
s
> output low, set value 0 means output high with gpiod API.
>
> The in-tree DTS files have the right polarity set up already so we
> can expect this to "just work".
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

