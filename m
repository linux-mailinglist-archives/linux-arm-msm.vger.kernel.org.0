Return-Path: <linux-arm-msm+bounces-30382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A73279682B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 11:08:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80C81C21ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117B9186E5A;
	Mon,  2 Sep 2024 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuD8bzvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA381865FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268125; cv=none; b=lgzep6vaMEE1oXGUhNsuLiMm5fAZWBgaUWFqpC9VvlmAOtEvU38kyWv+rywPdFSFzOGs5zZ//Lzn9bPuZZPt4THwBJpLzivySId0QP6mJxg3nL1ztgb5SzJSyk3LA7R/MsVVkB7qQSkxm/Yejn+Wm/mETU3KCY1oo38vkQivTXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268125; c=relaxed/simple;
	bh=ItlPypp6WrCWIb6a+iZ6UnRF5dm/ZOiMxnKIf5htWU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTI/StfqeTJXJ0LhEkNM/kVebjCe5AR6NwgQBFtVhHsfHvFPVYLwKrD2gpi0oXHLEa3eerOJxln5ZgUHWzWmbExPSn0LL58ooUaz5WySfNP/edizBVJGGqHXelue6HIPVtN90ZCJ4Lg0ShyEn9mSWF+eU3CDaxyP+w3VTpkPsJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuD8bzvM; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f43de7ad5eso51386291fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 02:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725268121; x=1725872921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItlPypp6WrCWIb6a+iZ6UnRF5dm/ZOiMxnKIf5htWU8=;
        b=uuD8bzvM5C/y53wR6FUbASg+81EL8koD7lGuCaa/PrYnbVC4tphzuiUMNWzrPBrvkn
         QmrRjFFLVscLw54V0oWPo058hxyxoe619I0jMbd26JFST4M/LG/XA/pNL+Eg7EIgj1yI
         3CfAkGCJKLMxY1F2Uhhzbfv5eoI+EtVzU5uZlScYbhjkdBlZB+/DyNjChHXI+DIkO+4O
         QHXHZGzPT1a/4dQkldFj+dc/B4YhywFYcOwi8t+pONPkbLX9TGTGIPA8wWkVgTFCYKTm
         zCoYqIjA1eLMg+jP+u7ycYXFzBGK/9PCtOeubwSE/axuDrrFy41t4mmDvbOT0HTPNiG+
         hbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725268121; x=1725872921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItlPypp6WrCWIb6a+iZ6UnRF5dm/ZOiMxnKIf5htWU8=;
        b=amNYRUH+9gBnp+9voOa/Gv1nKp6N75wHHEqonwpDllDbTZQfVHJoocbH1kq0fvTVMP
         vFvXciVxDa7O/TOemoF7Esbt99eCIEXj4rS7R80icQBGiutiMCc8pd591iE9+mc7yFwi
         qtjkb7jWQkYWWNMklusDQgkebDT1ojtenpICcP+SvyVOqGILW1ek1ruRZcjgoRPZtDyJ
         XVnv6nNper7SYYFP3cQDIDBydlvJS14kl70jjgTEP41y2e1ryGL5Zxe2Y2Xg70l6sCzL
         ShsRoy0bknT7HkHMnivUyZteNze0MRqlY5eJFxlfP+Y1w/Hz77oNgPG85l35T1/rFpVy
         dX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFiHE8PePYypjT88ZDTCnLomtqLX/ZwAYSj6JTWaX+JJ8X+deqY/K6ojpJkjRLPcag7o7fxxph4obTgM2o@vger.kernel.org
X-Gm-Message-State: AOJu0YyUuFq1ANJyKTfHbs9SH4FX5N63jcOijzA3EbcR0zQl5WwG1a7J
	bkjA+qtH8CFU/PBOsDlHUG8jTtq5cJgXF0q0Z4AAulUW/Tl82JXaIi/tvx/SjxtjeSlvJuMgjX3
	L171KMK6WQyy1SR5/ZlopX9/Rht/JGxy8DXRu3Q==
X-Google-Smtp-Source: AGHT+IE7Gmr8DRXU57qN/PlvHfcPdekTg2Ympj1QWPZ+v6eYceQhpU7ghw98R1G+yXBVxygGtcP2A1ooOEzFQ96QHpg=
X-Received: by 2002:a05:6512:3d24:b0:52e:a68a:6076 with SMTP id
 2adb3069b0e04-53546bb4d0fmr7358027e87.49.1725268120534; Mon, 02 Sep 2024
 02:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
In-Reply-To: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 11:08:29 +0200
Message-ID: <CACRpkdY97ZOOu66FkLcCSF9vd5uw9N6i239t8aeuaAR4B_ccxA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Maulik Shah <quic_mkshah@quicinc.com>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2024 at 11:09=E2=80=AFAM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:

> On X1E80100, GPIO interrupts for wakeup-capable pins have been broken sin=
ce
> the introduction of the pinctrl driver. This prevents keyboard and touchp=
ad
> from working on most of the X1E laptops. So far we have worked around thi=
s
> by manually building a kernel with the "wakeup-parent" removed from the
> pinctrl node in the device tree, but we cannot expect all users to do tha=
t.
>
> Implement a similar workaround in the driver by clearing the wakeirq_map
> for X1E80100. This avoids using the PDC wakeup parent for all GPIOs
> and handles the interrupts directly in the pinctrl driver instead.
>
> The PDC driver needs additional changes to support X1E80100 properly.
> Adding a workaround separately first allows to land the necessary PDC
> changes through the normal release cycle, while still solving the more
> critical problem with keyboard and touchpad on the current stable kernel
> versions. Bypassing the PDC is enough for now, because we have not yet
> enabled the deep idle states where using the PDC becomes necessary.
>
> Cc: stable@vger.kernel.org
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Patch applied for fixes, excellent work as always. Thanks!

Yours,
Linus Walleij

