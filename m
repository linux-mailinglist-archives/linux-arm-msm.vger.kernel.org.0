Return-Path: <linux-arm-msm+bounces-77963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B11DBF049F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC1124F1425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34172F744F;
	Mon, 20 Oct 2025 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IcO943AZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131682F5306
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760953329; cv=none; b=DXjfwfQkx5PqhhgaoRq4pkPgw7Nl1l3xa14IUyHO2wX7nn6M5ibtnZYpEMzRZnt9Bsg/norZ7e4cqs9dCqMtMtnyAWP8AfU0KgW8OTVZ1Bd912FnaGbVbqiAA+YhXX8ruQ6MDeaAc/uo3T7zstWJvReF9quvWAEh6Nia8gmAG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760953329; c=relaxed/simple;
	bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSv8jzKLYksjAT0KlnJT1PuQNeK3BVqQJFIkgmLp3jGdpLLm58bzdXcPW1GkPrWcAYK9EC8PnKi4W8kEC6AN/uQKsPtrkmaimGvLOEzV1mMfIHN3n6bCX3D1ZmCutw68efUR6CUj3RNCU5B3cWU6DgDrBfTx3ECEXNeeIZ2IFOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IcO943AZ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57e36125e8aso4074248e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 02:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760953326; x=1761558126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=IcO943AZ4slbeY23j1wnDAiVcwPBPLOz6p7nwR3LnKZ0EWyuxZ1NV7vh4gmJ/DIdyO
         6NBnVnJLgA6olIiUyrFMdxASrH1QtEFiA7r/E1llGQVLoET/fsgSRnAyAnwR8NcWStjO
         FuT2KFRZGMEzwuOaEhqAI6OZQRNQgcs9YKKrdrTKxlFK2oJm2XQIc6nDLunQhkol1mbb
         d70GOBwY51A3Hb51gRUwQxAzlPvGos30Z0gp/Sy15aqIdUTTrOReoH1dy+wfcjOsfgCW
         7aj159DIeTlPLFh0St4Zk1tpfonVqFPLXNmWZp8b1j/WnRZHVRVzd4hwU/lmZADNgoht
         oLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760953326; x=1761558126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjEUaWPd/Jj2ElIhymJE8eOmk6i+S46mwSJsA8AQ+EQ=;
        b=e6D1iBP42skqHz55tHa9O1OnoEADv+b/fv0L3xLfVTzCMSLaKj5oUp1NpRJ23/bGn5
         msYRxBgb7YywgIr8HZcvcyRvrISyIUk+U3Rj87EJ20UIVVAFa8LGmpVhC8aTKFiBmeU/
         pLrorvyeY1SsfiI0p7e5Pbvr1Joul3oAVJ6Z5Cf3nm/xY0hbO7qk4549MJYXg0iQsHOg
         4prRkB89EH4j3B4OxWO3Ms3vP2s4bdHbQlYkNk7cmD68SNzBltvZKQp8pENtes/Yymjl
         5Wd1FwuYDMX+OREjYLdGiYiIKPAB4+MczJFjN/RvLsNWgUvOfoG7pI7VMAAMSth5W9Il
         Wq6g==
X-Forwarded-Encrypted: i=1; AJvYcCXPX3Q99lEH7MM8+BpokrqRGDJhUNbcKkoI987rZ5O8hiuFbCELH/zT8V70A3hgxjQ2jOTY1/50i9y95trM@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgVCjNeTE2xrnuNcojj5R/GbGt5GrBFDCU0g5PeoVDwEglWDd
	ym9LXOI6VYJQTkQONtET6njipyUx6cy634yxlwuI3LWxxM/iRsNBoXl+V4q0y43nwHi0rk0bjmE
	hhQSirHlzfaB3O8blsGz0u/O0UE5jvGcVfw+4qOof+A==
X-Gm-Gg: ASbGncsH3VhrWiRPLfaZRT3r+3LqwjXnHBq3+Y90JdGWkMkWdfwzy6BmC9cdS9Hv+QT
	eyAbYtxenUEWuP12lrG4M36wY7OS1Z86wdWj/3a1lU7LAeIkNOCGEHcmw7jaauxyUNH6IVqPbx0
	82igZaIEsvvNR4rhfEzwmNbGZ7nYK97RJnK63+JWlBj9qt4pKbhk5m1dDuIg2zHw/vtEnmguRiO
	w0KJS1BSu9pW2sVG5tznmDimeDNmhDPpSDsyLVBWOR5GtZYO+qHlp1zrQuqtMeW5woWwgzQ8IOd
	/Pht0x+xOhvHwiL0
X-Google-Smtp-Source: AGHT+IHY1EdCIXYngUyFFwGvzEW0znpDl77em9pEnOCmJRoroDyoIZB7DiA520ogK1u8lsISe3niq2HVycioLER4ci8=
X-Received: by 2002:a05:6512:1052:b0:578:ed03:7b70 with SMTP id
 2adb3069b0e04-591d8589aedmr3757333e87.28.1760953326040; Mon, 20 Oct 2025
 02:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com> <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
In-Reply-To: <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Oct 2025 11:41:52 +0200
X-Gm-Features: AS18NWCTv8z2cF08OaIclAyR6BuSf6xIu18qyroHsfySyW-sq8vo6xUHsWKQB4s
Message-ID: <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Mark Brown <broonie@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Catalin Marinas <catalin.marinas@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Oct 17, 2025 at 07:26:51PM +0200, Bartosz Golaszewski wrote:
>
> > Upon a closer inspection it turns out that this is not the case - the
> > ENABLE/DISABLE events are emitted when the *logical* regulator is
> > enabled/disabled even if this does not involve a change in the state
> > of the shared pin.
>
> It really should be the actual physical state change that triggers the
> event.

I guess so, but this would require some non-trivial rework of the
regulator core. We'd need some list of deferred notifications stored
in memory for when the physical state actually changes.

Bartosz

