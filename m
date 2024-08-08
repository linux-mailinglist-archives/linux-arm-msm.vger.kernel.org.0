Return-Path: <linux-arm-msm+bounces-28186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E272694C4D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 20:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49072B260A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 18:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE2B146D6F;
	Thu,  8 Aug 2024 18:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JpbONcjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30812F5B3
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723142729; cv=none; b=WMoi+O492Rj6dG69MgLlPSypd1j5vWXqD0E39GJQJOioPWE2D+/DQNP428g25J9L1TPn+Z6yagZXjEJwm4ZH6JnkWpmWWxr0FJQmT3XQD3aGRtpFRHxufsQLy+OCaxNMLcwNNNsBdZcpFpmVQaouzaGhv43u/iLFlnKs4vrAHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723142729; c=relaxed/simple;
	bh=VNwfPNIDrZEQhR6zUkI5fMJgN7wQ0VNlQDZOxtdoxPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM4xr+lFre72RJTzePAPlLntwO56/3fMufaXYNGvGcxuDGp1y4OrORVJILgzU/ymzPLDekjMCfOULbRX7mVMgyL0dKPEIa3mWzpwnInhT1jpDHKlMJbtdvLtwZoT0gT05xxb5rXzLRu6AuzYHMCBEFlIgYwNHIrFo/nhOukrFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JpbONcjt; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a35eff1d06so80663685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2024 11:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723142726; x=1723747526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNkhoqvKuiIgMp2Dxoqrfnd9iwX4pwdtbywMo2F68wE=;
        b=JpbONcjt3mJDfkGiYxZCFOEbhDUSujV4m/SGdrBHxQWLSjcQImqUzYx9r+mrVhxmMq
         4pC2icUwkC1JTJxefA972iYtAc3u5RAOiMUCsfKfsynSO2/pmTza6GGxV21JfOC1bpCX
         XM7LLGAeHgFfdIQ6VMtneu46VB7ELMbgjNb5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723142726; x=1723747526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNkhoqvKuiIgMp2Dxoqrfnd9iwX4pwdtbywMo2F68wE=;
        b=BzN0L+XMOkuR78g5vqnlWqihyC3P1BhXqq/OVor7b63r427nf0qdeF710dD7TSRvsd
         tOZZW9VhmIojILv8r9CuFMKZc8YgKmrYeopbejI0cQZptV+pCGuVAqO5XLNXln1Anwuz
         ar0MOJFxM5YF89CuyouY6tB5l5MlBZP/aeY1XlXsn5sYd8UUh+GYAhhcFzmgExsF34po
         7I+0TW0+4c5ZIpc9HZvyWpJG4nQ3FJy1c94abGqcF0TYnE62fresoJuk83yJr1oJ9oBg
         obKmiMKO/S6KE61rWFZndHR3jbk8yHCIv0vXm7LPCAJiq4rY6t7lBrgatxC1XYgY0G8l
         M3PA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHkaR4Q+rFix5s+z3UuG/uNktUmOfXghUxZ8nVQ83WLSsi6C3Tu+n+oDgVMPjEIalYms0r09c/0pxBtCthKFuO+HlfGh97t2lzf41BQ==
X-Gm-Message-State: AOJu0YyMmXGupPL3ODyHeJ8EwX0FpQ7Y6cf5OONx3TBkRjQbo/IlCRda
	jSOo+q+7gBq1mZ4PFTgyAeBtbZ6Grj4nJT19uq+77VTMOzUnDOTSwClpaQJlZ8mz12hKj2dmsAI
	YChyA
X-Google-Smtp-Source: AGHT+IErE2HFpP/lAwUmyLC/mTFuXZuqa188DX6FZtWSyoYOXowWmnbxypJqgmaweF9+SZ1eBBJRyg==
X-Received: by 2002:a05:6214:5c49:b0:6b7:a248:3961 with SMTP id 6a1803df08f44-6bd6bd8058cmr33135166d6.41.1723142725833;
        Thu, 08 Aug 2024 11:45:25 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c7602afsm69171496d6.2.2024.08.08.11.45.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 11:45:25 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45029af1408so23321cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2024 11:45:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUncrkRWyKRX97siZWckRtvsuEuP8O7B1wyxpdWZfQNn/WGLYyeDiaLBe/a5i8oiX6kByELAtRyY/Hlees0EE9X41ynPe6CL6teSVjGXg==
X-Received: by 2002:a05:622a:241:b0:444:dc22:fb1d with SMTP id
 d75a77b69052e-4530dcd66e9mr383971cf.12.1723142724490; Thu, 08 Aug 2024
 11:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729205726.7923-1-robdclark@gmail.com> <CAD=FV=Wo2nVzn6qvwSAFAnrFX4wtv6_ZCVZaL1K_DBBFg9DJ=w@mail.gmail.com>
 <CAD=FV=XMJ7b=2tt6_2oTGFXuL8XcmBxuDtQBoWdf_65YyS49XA@mail.gmail.com> <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
In-Reply-To: <CAL_JsqLRTgQRPcfXy4G9hLoHMd-Uax4_C90BV_OZn4mK+-82kw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 8 Aug 2024 11:45:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWAoQ3Njq14uwSrA2zA=Wx_Jm7F1c7gFyk4Jysut1Thg@mail.gmail.com>
Message-ID: <CAD=FV=XWAoQ3Njq14uwSrA2zA=Wx_Jm7F1c7gFyk4Jysut1Thg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: samsung,atna45dc02:
 Document ATNA45DC02
To: Rob Herring <robh@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 8, 2024 at 11:14=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
> > > > existing ATNA45AF01 and ATNA33XC20 panel but with a higher resoluti=
on.
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >  .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 +++++=
+---
> > > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll plan to land this in drm-misc-fixes next week unless someone
> > > objects. "fixes" instead of "next" for the same reasons discussed
> > > previously [1] that the dts patch should probably be considered a fix
> > > and there's a chance that the dts patch could land in an earlier
> > > version of mainline than the bindings unless we consider the bindings
> > > a fix.
> > >
> > > [1] https://patchwork.freedesktop.org/patch/msgid/20240715-x1e80100-c=
rd-backlight-v2-1-31b7f2f658a3@linaro.org
> >
> > Landed in drm-misc-fixes.
> >
> > [1/2] dt-bindings: display: panel: samsung,atna45dc02: Document ATNA45D=
C02
> >       commit: 1c4a057d01f4432704c4dc8842b6e888a91d95df
>
> And now warning in linux-next:
>
> ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml=
:21:9:
> [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml=
:23:11:
> [warning] wrong indentation: expected 12 but found 10 (indentation)
>
> Please send a fix.

Doh! I'm just about to hop out on vacation, but here's a fix. If
someone reviews in the next 30 minutes or so I'll land it. Otherwise
hopefully someone else can land...

https://lore.kernel.org/r/20240808114407.1.I099e8e9e36407a0785d846b953031d4=
0ea71e559@changeid

