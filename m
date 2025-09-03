Return-Path: <linux-arm-msm+bounces-71847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6569B41E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2FA189912A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7052FC029;
	Wed,  3 Sep 2025 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Cr8iimpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67428467D
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901229; cv=none; b=XY9cTgzVBiv8oT2QBAAPUPotPXH7lJHyfjOcPRJthjLJ0O1Qhuh3ZxxXAARNqRt173hVvdYBhaiiB3JtB94oj1A/aBhWDKQN/9hIG160J2ViI6OuLT5Wxy//vZ8GbgVitH0CZyLiS1Uw8fQl8N1VXXDKuKqfB9/6CPwLK2yIRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901229; c=relaxed/simple;
	bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxVGYR5P1q9Sudkd0HxyLT106EEgCKDeFD3y6F3jrKZz96tAfcHgufwMnelRqrMQd07Y+w1i685Awqbj8ri5Hv8JTIywg6LU382Wnebu6DMGa+REkkJ+WAtLezebtsqq8XtnZugO2Subw4DdDd0IoNqh1N0+VTrH3PUcOfWRH5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Cr8iimpL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-337e5daf5f5so7641091fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756901226; x=1757506026; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=Cr8iimpLTHs6s53iq8k0SG84ZHh1xz4oDFb+ChINbIM9H4SVg8+DtMalnizQ3z3Xug
         5/rApOGhXUT8M2XKGKjs9Kn96w8+p8BMJz8kTdt05eRgw4ExQJbU9v8fYXckBw3VX6JC
         r1ggvthJXmy+zzv4Sv0a2TGRDB2A00n6FJrweI+Q6guDodtJNA8Aq+5gylYjm8sf9Wvk
         lRKDa44HoY7bRaOGPD6ed01x3JscIGqwrP054N/u/KzaAu/ARVmoEh0bEtpMPrvwCb07
         JwyPjq4bUJYlAwEkwQDjDyAyz1ABc/omrYXOn86f9x1gBdD3gaFENljq+iD4XTPvvKGM
         zDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901226; x=1757506026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo9UJfvaYgRET1kqEn1jPWXs6VN26Af35fGJeuqNMfk=;
        b=H8FMo1oSG3lJU38ZGgeFJsT6sYUQOlwAPNuBsJQtySyaXUISi2sVaoZGpZMD3Bw1mL
         krCBjFL09ukNk7HSl0AO8N/poZW413YFmFFCf5BLUoR6ek1xgSc9v5TAbGOwtkYWAFXD
         T5U343973OV4zCPh55ydeTFDR6yl2jRq2N/BbJEd17+Igij1Qb20rCbx35FX1NBlthlo
         zzz3P9v7upKV8cYjZhw3B7TVmff+rxkaUOc30vIDsTkgQSKJkGbOyNKju5wGbGWgFfQN
         4pmegMa+TzrsPuBqgc0pxxjKz30FwGPuFyOPqsaaoyOygJgm0DtjDRQV+wnx0p/CZT/q
         2Aiw==
X-Forwarded-Encrypted: i=1; AJvYcCVG5MZaTx2Xybd3ONB9lQIT12fDWN0coXY+hi+oEqFoLUIWLCdg3RFTx4Ou10rivXt2+P6W/sZKFNO73N5p@vger.kernel.org
X-Gm-Message-State: AOJu0YywtsFRH1H81B0AMcgRi4kvOItbV00M/Dys7rlUsfD8yHwXgcwM
	FvXV1flwL3jr8GCYK4XzlXpVqbuxL+y2Hlm4W6vxhOfVPguWwb6Iv+/otnKUSyOJpMP0AY9Ss9Q
	ucgCcBv1QWwCkuXCccIrboDlNfKXxCsRA/32w+hYUiA==
X-Gm-Gg: ASbGnctih+RPP+1Fb/b4XrmmW8sgysC25ARfEfeBTAv9WD5QKTxKmQQhst211tkO09Z
	IdaJAvUaOQwj1pWhda6PheNTVHSXwxPVpnT84H/+uhfoTKifj2roUMWh8m1737xgsmRYvXp42fk
	hb4S3dAQPhtwMRIOQaOSzQt+hn39daE38ldJYCUtgGE8WKYzk3jsDBtZrG8GjPHlrfmSqqUwN28
	HB1rMFaQyaU7hw/ZL2sDxRT3RHD/AFnHnMaiTI=
X-Google-Smtp-Source: AGHT+IFCWFQpsNSj5HbtwgM9MCfjT0JGzQpT+8Q0JOxroU2mp8U3cFtE7ajM8EOI5676CpGuXoSnHTYyKyq5zkghPtU=
X-Received: by 2002:a05:6512:3ca9:b0:55f:6b08:e60 with SMTP id
 2adb3069b0e04-55f6f6aab17mr4829149e87.5.1756901225907; Wed, 03 Sep 2025
 05:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com> <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
 <aLgeDNLABpmkShIU@smile.fi.intel.com> <CAMRc=MdD9g4WiBCP0qYGuy5e3pnQf5MUHTqkUOnrUvcWUYK27A@mail.gmail.com>
 <aLgrqZETNLmuMHhv@smile.fi.intel.com>
In-Reply-To: <aLgrqZETNLmuMHhv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 14:06:54 +0200
X-Gm-Features: Ac12FXx1vWTkfbwcKCR1G15N9111AA5z_ZoC4xZjaCT4bFZgzZIJamSIU5gFH4o
Message-ID: <CAMRc=MeX58XKmxaY1jYCMdy6fQJf7HWMR8f=DQpeovE8APw=og@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 1:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> >
> > I don't see why this would stop these patches though, as they don't
> > break anything unless you decide to make your pin controller strict in
> > which situation you'd need to verify which functions can GPIOs anyway.
>
> It can't anyway, Linus already applied :-)
>

This would be the third time he did it so it's not like it's carved in ston=
e.

I see your point but I think we should cross that bridge when we get
there. Shouldn't be too hard, we already have an entry point:
gpiod_request_user() where we could set an additional flag marking the
descriptor as requested by user-space in which case, when we get to
the relevant pinctrl code, it could check this and refuse based on
whether the descriptor was requested from within the kernel or from
outside.

Bart

