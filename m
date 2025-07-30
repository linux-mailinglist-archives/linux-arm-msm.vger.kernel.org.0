Return-Path: <linux-arm-msm+bounces-67106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07897B15DA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3509318988B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 09:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D3A293462;
	Wed, 30 Jul 2025 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="y6v1Y+rP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805A27467B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753869294; cv=none; b=QZ7Naz50l66L/7z2NlMLqWS9KpiZ0Sxl49kJlD3ostU2limcbNlm1JvcIyEGdblc8/GMHEQhd2uRnkNngK0z7r8+CowuPN0vjdGKGWVkdzg9LRC9EEQ5quiUO4uA39ZtD8YHoxtgHk0LeCyX6gz9G0izqSrSiDDFDBd8gbm5pwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753869294; c=relaxed/simple;
	bh=hp7bAnlyWbMe0UagxjClRdoFhPBImgjJBDcHhbMOPBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGCWQn3bdYq4Rda/svzYftdh2yEPcgXmwM3fPSelXjBqFIY1oG8fn8GnEiZI4CTbQu422dtB7WTRhAF8KGh5ChlR7M1aRqja780JlcqTA+S+ctr1w6CkO5/9N7BVDmMddNWCMzL6IhsxzRzEJFMQkvuGz1TJFFjJC3xFam1UBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=y6v1Y+rP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55b827aba01so321013e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753869290; x=1754474090; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=y6v1Y+rPEVDHOkrqc2KWOfhiugmQ47csz1p9+cPsKrBxMu6N++Lx7mDSVzJx9n6oqS
         UB5hMz5e/MChLsSvAmzP82OKI7y6HHDsJkHIQqJ10ekWc9qTbZH4JevVzniY4W09B0A/
         VbMUa0prk04D/p8/3TRqlWvGNSKC2kXTwf/bhns+HC7/CXVhXgBURVJR/9r87Bn9GlN0
         gv/+LXG6hJV0a64I7ABkBgPr6iaKk6lKUYzENYZv0W+E8GgTmxZDjeJpjUQvzGsRYgUw
         UIsm9yMb4dS4lePbwKM+ubqez2QY+tIytNFSDWF2gXWKi7MulASGNSolQFMpNoSrFq9C
         RciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869290; x=1754474090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6vdhp2EWkPtq+IAr0ObGae8XoJd1fUV2G+NSQOgeB0=;
        b=j0S+TDqM7z+tTCRpuGl7SXZ8rbExhYdL6B3UQLSxD9hOPdnpxiVxb/y0HzKg8WxQjz
         UGDCa65wlMaS5apaptpol/xmjCXbkaCp8ZaB3qIR2Iy7XIYD90vDQpkoXGkjpgGQJu5u
         9+Wa8QxQs+sUsoTlkvfeguY0SaUzccvCeIQ6ctj1HaZKpUZdbVNCguuKCHkkf16ixUli
         jl86on4lJAU0ywrLF6fXTWWtAcO1FRgwBIRWSfHV9OW+cpFqZaW05CrnrWk7n9E+uGi/
         VS/V2XmbTxyQZzE20fuj4rF0vHU54HbBNEvdEMz3HkdOMn7z0VNyjV4y1CrAcL24cFGm
         Qrgw==
X-Forwarded-Encrypted: i=1; AJvYcCW/S96ZBhWG4WXqQYFMbgbcBcf5Era1IDA7+/2RQ+tOslYqLZMzpYbga+If0Aq0BEkadjLre/YSGSKa0R5y@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+IUqSN1QC70Yidg2rcGQfTTjoka1l0v+a1XC1mn29we8mNcz9
	vWSYWUH/+hjg2CcFc3ERXTfMS+oWmSRblSsaqzgVMnhqkooRvW1cD9lugiP6ifD9s1A4vCCzJtG
	CtnfrhLbZz7jqmHqvkvbYkXfcmm6MHOGbOcb0L5BpMg==
X-Gm-Gg: ASbGncs4WY2d4ijeFoWyVtQKH2FbjgWn2rNXKCoaWJvSWYkQ0DctX5aSm9Spmw4Iorm
	QjY+lG6ze+dpeWem52Z6Hs4jH4RXvR3LEWkpEEe3smPXcsLoOHlhZ/Xwk1SbpL6FnyKx1Sdcosj
	+YZMzf3flEX9rD/YK825qBHDzOG/YSljwbZcQ56ZuN83lZLFvjU0oge520IeNXPwgZE7cRi488f
	wK1eFMm24d2KFXIM5UJ5gj2sfYnFc7RC5sLztU=
X-Google-Smtp-Source: AGHT+IFD0mC+adTu2tQIUqoYqi4YbEm6lb9KfHl4WlQUhUVwQ9owZPBnvnUOvhF+89ksRVwAv/r0YIR9B2aVVdKhoAo=
X-Received: by 2002:a05:6512:33c7:b0:554:e7f2:d76b with SMTP id
 2adb3069b0e04-55b7c0b0f66mr939851e87.56.1753869289592; Wed, 30 Jul 2025
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org> <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
In-Reply-To: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 30 Jul 2025 11:54:38 +0200
X-Gm-Features: Ac12FXyouWksKyGI1Z-cYawOTPPQ3IbuMxJxWat2oIDr-ST0nxIlLBCifNIDusI
Message-ID: <CAMRc=Mc1ophkofB6MmtD4adBAi69C3JyovM-S9YD_y7UA3V1qA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 2:22=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> >  struct pinfunction {
> >         const char *name;
> >         const char * const *groups;
> >         size_t ngroups;
> > +       unsigned long flags;
>
> Not sure we need this. If the function is GPIO, pin control already
> knows about this. The pin muxing has gpio request / release callbacks
> that change the state. Why do we need an additional flag(s)?
>

I'm not following, how does the pin controller know that the function
is GPIO exactly, other than by the bit set in this field?

Bartosz

