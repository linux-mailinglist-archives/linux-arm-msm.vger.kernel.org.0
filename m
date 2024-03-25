Return-Path: <linux-arm-msm+bounces-15067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32488AB93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:26:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6D212E6B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322FD12FB26;
	Mon, 25 Mar 2024 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Grt+7jrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850A12F396
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383600; cv=none; b=gZDN8u8U10Efw3E91aJUk7IfvwWhoJ3PD61bz/RYUVl2BqNaNautqkKlQkK1cKDWCqPZpeyszpAuntpTnB4iHD/pKCFfnyQidfph0IbKQPyLHlPvw79LRKFulmCkqeO7U+rkLw+ZDpO7ezM/Gr9dhzuwaZ1sW6q1mFPhxsrzcuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383600; c=relaxed/simple;
	bh=uOV5MCWT9pDoDGzplATxiEhOJo8GdM18dNDgTj0skJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/qYXeIK/f3HrkhBvEE5m6dzrMheurnm1N+vnMQWYVYjLqN0kIYMwDciIrLL/dYrRkS6MvE55oOG7Q1bo2JeI8jYIVZLlVk1YVdELgyBtYW4OtK9E6k/TbUpFxoP6wPfn7ME6amPDIbJXjvNHWdUEWTPhQv6qqADhHCX6MB6qSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Grt+7jrK; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-430c63d4da9so34287081cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383595; x=1711988395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M+RNRaHQeXuCFayOM1dYEtW20x69QDnHCFDaOPJPF0=;
        b=Grt+7jrK3HlzN2+0um0h4Ab0fbyCWhM6vYXhyThG9kOM4CB4r44ibZfeaVayrYjGp5
         Cz+ZVpmoPG9TBD/UbE57VPZ2KNOHkmWYKn1IHErD8e1TpWUsfteCRPzj79erzcZZJqx3
         YrgrJdvWe/5ZaxLneClFNqXPTmB+tqqfgillo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383595; x=1711988395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/M+RNRaHQeXuCFayOM1dYEtW20x69QDnHCFDaOPJPF0=;
        b=M2G4t/Zojk1chePu4HRwFoVXCOpb8hBeL6HLSYzdTTHpBuTBie3n1o7sGfVRRO19Cb
         /UE0nErWgVEEyuC79oWzFwvb09W5UbNhJdcXCBg208tybeJ6G59Xr92p121AuZwqnP04
         54FdOmoBHynr2/ocaMeC4pp9Mb7kNQt9GV+mEQaCyqWz7yAkcBl2c+5dqxQttNgMm7q2
         0QNKI7SFNAcVGaQUkgoqNl6j+RdeTYVAgMSXNG1oBbtrzyh+UJiSrzz5f0f3Xutr3VKk
         clVtsQL8n27Hfiqcqumcd+k9IMU0/yH1yYj2XJNXyUfpMwjPWBMS5bPB9ajMCWzBHxiO
         d5QA==
X-Forwarded-Encrypted: i=1; AJvYcCX+S+SSBGx8tU62gN4iwvRuGBTdmArfpwLYKQFyN3wpchGCAxuFA7FxFYXn5d/Eg8Zt7RMd4ZIIZPZqbZIRTwRoiUTpbrk1O0IEJ/KVhg==
X-Gm-Message-State: AOJu0YxTJogqwzaBRXNwmp4GZPZr1n2D24F2b3D7AoohIlsO/Iha04VL
	8+ad/uQxClVfTX9GwNvuINtxxuM6CFyg7ItJWXpER74jGKawVY5NUDbNbRDs08vAlZMU1m3nv2o
	=
X-Google-Smtp-Source: AGHT+IEEvozJJMlvM5txZu7HgvbCuNc1lx6a7xO6mwJgtpLwPrwmKUzT8nYU2jLyNuZdfhAc9YXWhA==
X-Received: by 2002:ac8:570a:0:b0:430:f76c:3c4a with SMTP id 10-20020ac8570a000000b00430f76c3c4amr8796056qtw.4.1711383595369;
        Mon, 25 Mar 2024 09:19:55 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id f9-20020a05622a114900b0043140cd9996sm2499851qty.38.2024.03.25.09.19.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:54 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-431347c6c99so487661cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/FcP++/GiNwow70MnJrRv3sbVbcahHR2jf64XgYOEgxcV5WQnVzZZNVxByDPLqoeudHV876Tp6/Nhb1QMccE8MKJ75VwHzfH2pq3Hjw==
X-Received: by 2002:a05:622a:1909:b0:431:c35:150f with SMTP id
 w9-20020a05622a190900b004310c35150fmr1202359qtc.14.1711383594159; Mon, 25 Mar
 2024 09:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-5-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-5-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:19:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com>
Message-ID: <CAD=FV=Ws-LYcpiitibPBPRhqrbS8rTo_7xtPPw2kA+qBzybOxQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: Get runtime PM before walking tree during disable_unused
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Introduce a list of clk_core structures that have been registered, or
> are in the process of being registered, that require runtime PM to
> operate. Iterate this list and call clk_pm_runtime_get() on each of them
> without holding the prepare_lock during clk_disable_unused(). This way
> we can be certain that the runtime PM state of the devices will be
> active and resumed so we can't schedule away while walking the clk tree
> with the prepare_lock held. Similarly, call clk_pm_runtime_put() without
> the prepare_lock held to properly drop the runtime PM reference.

There's a part of me that worries about the fact that we'll now be
doing a pm_runtime get() on _all clocks_ (even those that are used) at
bootup now. I worry that some device out there will be unhappy about
it. ...but I guess the device passed in here is already documented to
be one that the clock framework can get/put whenever it needs to
prepare the clock, so that makes me feel like it should be fine.

Anyway, no action item, just documenting my thoughts...

Oh, funny. After reading the next patch, I guess I'm even less
concerned. I guess we were already grabbing the pm_runtime state for
all clocks while printing the clock summary. While that's a debugfs
function, it's still something that many people have likely exercised
and it's likely not going to introduce random/long tail problems.


> +/*
> + * Call clk_pm_runtime_get() on all runtime PM enabled clks in the clk t=
ree so
> + * that disabling unused clks avoids a deadlock where a device is runtim=
e PM
> + * resuming/suspending and the runtime PM callback is trying to grab the
> + * prepare_lock for something like clk_prepare_enable() while
> + * clk_disable_unused_subtree() holds the prepare_lock and is trying to =
runtime
> + * PM resume/suspend the device as well.
> + */
> +static int clk_pm_runtime_get_all(void)

nit: It'd be nice if this documented that it acquired / held the lock.
Could be in comments, or, might as well use the syntax like this (I
think):

__acquires(&clk_rpm_list_lock);

...similar with the put function.


> +       /*
> +        * Runtime PM "get" all the devices that are needed for the clks
> +        * currently registered. Do this without holding the prepare_lock=
, to
> +        * avoid the deadlock.
> +        */
> +       hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
> +               ret =3D clk_pm_runtime_get(core);
> +               if (ret) {
> +                       failed =3D core;
> +                       pr_err("clk: Failed to runtime PM get '%s' for cl=
k '%s'\n",
> +                              failed->name, dev_name(failed->dev));

If I'm reading this correctly, the strings are backward in your error
print. Right now you're printing:

clk: Failed to runtime PM get '<clk_name>' for clk '<dev_name>'


With the printout fixed and some type of documentation that
clk_pm_runtime_get_all() and clk_pm_runtime_put_all() grab/release the
mutex:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

