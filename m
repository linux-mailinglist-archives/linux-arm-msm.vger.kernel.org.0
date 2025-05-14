Return-Path: <linux-arm-msm+bounces-57848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7FEAB6E2C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F321A1BA1705
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D477E1A8F82;
	Wed, 14 May 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Cg00KlEV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5E31946C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747233039; cv=none; b=qLjYyL9V1SHWq1ito7JEXGj839qRlTZx+CotEh6+TMhBGbqbygl7O9nxQJrv/lRDfQ1Vg011Z/KS4swzJ9RfsbHcSyBb6pubH1E9QIRhEc/PKjARz75NzqnZtbMTaFzQ2LvEHZpJmZmWoGK/RHlwSTRdMPeXM/jpK/ke7C9mYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747233039; c=relaxed/simple;
	bh=TpqI7/UstRjD1t3hPg2je7OSJ+mR5sn9M/MPI9l8Hcw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBWKakvXaWDDhsGOCjwrCBzlSO+HK69Tivj45xxAFHg/ISwIAov5MuiXCSpu32IcH7wJXgbXqyNoV9kQirep6MHWWURARpS1HFFgY4laYCIP6F/SDG4X1Jm3O/S0Gz1N0joTltVB28zopT+U+QRZSKPeU+DC6qFyiMMs2AQrWVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Cg00KlEV; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-609e7f3caf3so218678eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747233034; x=1747837834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=Cg00KlEVi3hrMqfohvf+82BgG3JyNSOzl42De/qZuc7+7Wj6H8PM48cyMmPvZTTeYW
         jbSY6/+vuuY1jOTOk6YsmYraCF9KBbN2kCTs+VUgEgivfzS5PVQK5OAIYwBBhXRZDBEP
         hMTYk36Dtl4hIJ6zbTKsrOVjIHwcQiZEiCSMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747233034; x=1747837834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hmvwNbNh3Td4tVXcEuUfGTCu9MlTY+8OhrY/bE97vRA=;
        b=AFLYQvG1ivVcWZ4H2lR2bDQfoTNtLtM+JhVnLS4PXQs0viKLPUHsuv4x6lPPoMPfqH
         ebG1aOJYbxsxrHV8U3jFivFvgjyC7iWiJrnwFEcW6kTg9xBUuWKROig99zC38BhF3GmT
         XWcuYoV9GfYXLT9HI9qmsE+RhXVWYaevKXnNxYkcKXw7h8nMi1RAHHh0x2f9wVrvNfDX
         S3F9GMmEwnyEyR8nAuyNdk6amjHLQuM08VzaTUyBchK0ICmVIZcVGup9e5VUItEfICB1
         pLnV6lZMUqYD4R6lgPkdqSHq3iQyi8QOp8zedPGxYPKc/6xsjkHLv+AAwOdcruIDSzpS
         eGIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoTYWW9etXHjByJmomTyMz/KsOp9K3x93LAnFTy9y1LbaX9muWfZyIVpRQtzKbEXP4z1B111lSHGOz5aoa@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJSaI8tFebjrxNHT8fi0XJVnEeek/PRRzriA7aPK7W/AbpX2z
	Pkhx86sn1GXXL/XK9X2C5rveINEJWFaINszQaAcpL/HgMuvkj3oR/+q+1Y9RFcd+Q8Ok6vMf/aE
	=
X-Gm-Gg: ASbGnctFjZUgFGQWjjNIONT6pZQOSkOgn1BF6D1bxZpw4FiYSc1uTO74kVvJv7Ifnq/
	4pRMVM2m+o2TM4XLt7DeqbCLQRuqrM0FoBu2vbk5AP+keVf9MT8bL2ybZUpMge7ft5Zp8I06928
	YgLrxyHdWHVqOmLVTigwVVM0LvIIRcvMeigWcWdLNu2K6DlgkP9M0Z1Qg0gTdlqnku3NzTAgVf9
	mQoEs010njdcLTjNz6X5AG9Xwt/nMGdxtdoImsEUA6A1OkFRbEctAfRtdHYJCfsDtNrrrUIGhfz
	FPpIv5NaKdXsHp5ihXfZwPoNFTuCZ5slXdu6kdNh1EngrjnjY7zQB2FWrMTGj/tuNMoTuLqdCxj
	VtXPXLhYLdLqLxG4vCbz/IBA/MYkb7A==
X-Google-Smtp-Source: AGHT+IEMu5CV0aRFHSqH8MNxQmx/OzFSBnWRVSHnSvvFh3cBiljBJUmoZBLKYxOQiI1ekPH5KUUtKQ==
X-Received: by 2002:a05:6870:a79c:b0:29e:3c90:148b with SMTP id 586e51a60fabf-2e3487f688dmr1983339fac.26.1747233033816;
        Wed, 14 May 2025 07:30:33 -0700 (PDT)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com. [209.85.167.174])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba080f0ccsm2821856fac.30.2025.05.14.07.30.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 07:30:32 -0700 (PDT)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3fbc00143d6so5535884b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 07:30:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/ZcNhVoPoEQRUDQ0+CKx0+ub+IDsoFK7flidAaIO6EVw16tXcWfTAcJmfy7sjpmiVRrEXh/UjQ3P5MUf1@vger.kernel.org
X-Received: by 2002:a17:902:f54d:b0:223:6254:b4ba with SMTP id
 d9443c01a7336-2319811f06bmr51131025ad.13.1747233019581; Wed, 14 May 2025
 07:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com> <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 14 May 2025 07:30:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
X-Gm-Features: AX0GCFvLrY-v4BVXb_MRFpcALF8nRN6RsNjsWBFIx-m74SsDyBv5AvTCKf3v9G4
Message-ID: <CAD=FV=WaiqwZsWJ0JdLrmfm1tVbG9dmi_jN_7one02OdV+ecow@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, May 13, 2025 at 11:39=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gc->gpiodev is not NULL.
>
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
>
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>  gpiochip_line_is_valid+0x4/0x28 (P)
>  pin_request+0x208/0x2c0
>  pinmux_enable_setting+0xa0/0x2e0
>  pinctrl_commit_state+0x150/0x26c
>  pinctrl_enable+0x6c/0x2a4
>  pinctrl_register+0x3c/0xb0
>  devm_pinctrl_register+0x58/0xa0
>  msm_pinctrl_probe+0x2a8/0x584
>  sdm845_pinctrl_probe+0x20/0x88
>  platform_probe+0x68/0xc0
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x208/0x5e8
>  worker_thread+0x1b4/0x35c
>  kthread+0x144/0x220
>  ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=3DFV=3DVg8_ZOLgLoC4WhFPzhVsxXFC19Nr=
F38W6cW_W_3nFjbw@mail.gmail.com
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib.c | 6 ++++++
>  1 file changed, 6 insertions(+)

FWIW since it's changed slightly from the last version, I re-tested
just to be sure. Still works for me. Thanks!

-Doug

