Return-Path: <linux-arm-msm+bounces-56814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B74AAAA976B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 17:24:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE48188445D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 15:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD0E25D8FB;
	Mon,  5 May 2025 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYO3r7UJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9D625D20E
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746458641; cv=none; b=Xye/XRCgcjDZtQbBnyBjk8Tm4nhtMByEHzl9XVkLHrNzizcIOzMTGY6Orukn75LSZqR9hHODRRqSXxHWfmhxcZNz1yBMUJONAQVxq2lPPUrTghUsOUchqyNwlwn5AboSVckBEmKwsHM4D2/LyHhvKavf024MRWlyMkS+t+eZeKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746458641; c=relaxed/simple;
	bh=0Hc+EQxJfioQ+A+gYtKFPWTxdD4hKYAgnVL1ELeokBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXuuCB0BTwFoT1HwJpZQCYHuSa578mUN/bejMbsP+Dc/4KHYGiLe34iPLRGH0lUj1loYfOVVomC0ucUmX4HZ8d0ugQ8Hp2qY621QqrYUUKaw/7uxrmm/L8kMd1rQ/d8zda6qK1M0f177VmkIcloZXfnYjSI+1ptqWxAcd34qrm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NYO3r7UJ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3081f72c271so4512216a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 08:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746458635; x=1747063435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41acKNPFt0X3b8kDDLPn8SygbWrcPwUb5jtg+E40A3k=;
        b=NYO3r7UJwq830BNe48tsKwAwa6tHZJfoJug9+q5GkaVx2IH5YMfDpZ9Cf9BHr4t65H
         PyeZc3NrPtHfrnIN1gZyNDypUD8fB17BcVxPo6mUIM+oCRMfFmKsGxubBeSWB0Oqy+ZY
         6aRlO8DW4c+WJLN27fBY9F+J2utg/2Fc1itMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746458635; x=1747063435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41acKNPFt0X3b8kDDLPn8SygbWrcPwUb5jtg+E40A3k=;
        b=FbMg+GIE4ra23NtMFUCpDduo3CZltK8XWFPOE4zXeXUKNzj7Im7zu2Z8jHNqA6AYat
         ew/Duibm+214lNjg/kgIGwSRp6KhGB/+jwOZb6moj/ufql4RMjkY05zVKdiCzKqCSxG4
         /icZVIb8SeVariNrmefIbMbk4EbSCq3GoZ2xKbmggA6mXh38aUtMk2bDV/mfJ0g5+gbu
         WDwc4YG4X9cuAXuzOd1N9CUBvuV5GdmGorCKtEvmUt2ScNe1xJZL0gT+0SsBfIfyuFY7
         oo9FQffKFtydumtFbRchY5z7mb/8eUxlcCE7Wg9fpB0fAlpMZqMjX0r68kMVjeQ0E6Cv
         sH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOVorw9Eh8y87jLji0JAW7Ow/R6le1JYRhgOpV3WQIaMPmkQDvGcVmYggGSoQRcyx+xH0msgKxuvjMEc/P@vger.kernel.org
X-Gm-Message-State: AOJu0YwamorihUbiQ8yHDOmj3BWNUIy5Yni3SMEfOHP8L82i6X+8IxUF
	83XNgAZT1R6Bbz8yBmy82hDy2eHWCew0WuNB5ypkl9qxxu/0WiCmjCsbLYgCrcWrhbqyPAAGRQQ
	=
X-Gm-Gg: ASbGncsvojsq+6QTAVwWUohv/AmrTMysCt4Yy/0SCL/El/6zKVFbcPejhR00Whh3yNn
	D5Erh2CHwxNdTZQphKkyrVRtOyqi9VoqSp0sOHuF0oSgVvIUOT3oHQhFLpnpBeCwqEa5iZ1ptN/
	nTbz/09ZzuKPdJvf2mO0vxPc4fMvWGBX283ny+hMi3PEDdW/mME0VwF5SOmKDeuGrMLaYv2mf3Z
	JlFQsqdZ1hsUeYaakurKg9USVvwqJPvnftsVOws0d053xBzgFAVbCb1PdpZhamIGZ/xRmhwYN4O
	raDbcTNJ5e9ShwVK94tMeNhA8PAuszNgqmWoLZhiZsDdb0LeWugyx/LY3knjeckTCz09bDmVtTj
	bY1vw
X-Google-Smtp-Source: AGHT+IGDIYo59FyRbhW1ZCzFfRIYAHPQIvGWWfzduOUFHJUzTIZ/Mc2SOMzRlXoPrhl78QJkt9gyxA==
X-Received: by 2002:a17:90b:3c4a:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-30a6198d5femr12655759a91.10.1746458635531;
        Mon, 05 May 2025 08:23:55 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471f323sm13097003a91.7.2025.05.05.08.23.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 08:23:53 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301c4850194so3616191a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 08:23:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCOU0+n7Eyo6xd2N++R8ssi3p57FfVJGlsn87JU6LTwmpVLcnZ3dAsAxHfSM7mAsVWPVoE+sEJW1IMG6bN@vger.kernel.org
X-Received: by 2002:a17:90b:2692:b0:309:fac6:44f9 with SMTP id
 98e67ed59e1d1-30a61a5de18mr11215640a91.31.1746458632939; Mon, 05 May 2025
 08:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com> <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
In-Reply-To: <20250503-pinctrl-msm-fix-v1-1-da9b7f6408f4@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 5 May 2025 08:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHhND2o_uAaGNe4RzmfbuO5bR6h2hYhs-cfsBzCfR=qg@mail.gmail.com>
X-Gm-Features: ATxdqUEU--2tfIQF8wAYYjbyZfA85xc3-X-O-5P-ZKl511Bl7WUYcv0F-TnAYZ8
Message-ID: <CAD=FV=VHhND2o_uAaGNe4RzmfbuO5bR6h2hYhs-cfsBzCfR=qg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: qcom: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, Josh Cartwright <joshc@codeaurora.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 2, 2025 at 10:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gpiochip->gpiodev is not NULL.
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
>  1 file changed, 7 insertions(+)

So I guess this is fine because nobody would specify a hog in their
device tree that's an invalid GPIO?

In any case, this works for me. Thanks for the fix!

Tested-by: Douglas Anderson <dianders@chromium.org>

