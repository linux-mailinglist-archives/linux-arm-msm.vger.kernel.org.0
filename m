Return-Path: <linux-arm-msm+bounces-27382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BB9940C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 795F5B25010
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 08:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 814B81940AB;
	Tue, 30 Jul 2024 08:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSZiYF2m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E86194094
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722329198; cv=none; b=sTfOkyayKr3JuJNiQZ2PQ04Nj6BThk5nUCyrorWbs+Ea4tVQqtFC2bXaVKQk9cqsQhAcLSdzdq6EeSDMWm1TGCPHxihh4Q+B41ebpmWsdNuymIL6V8erszClb/ArAS8Jt9+ykeAXSISYqc6GaHo/IBD6voy185W+qRlfHGiI8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722329198; c=relaxed/simple;
	bh=WkiyHbdJ5NrdJz1oK2Jrc7fN+l1CyWz/UI4TUfj/WQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kou5I7yNkJLcZekBft4XXXD/AqOpqWSrwRo1P61lVLsqH6G0DlhHnrsKxfrzY3229mlEcmc5TbBn/zNDyffSvn0zC9dovNgdirFPdatEyRfgOHWmRAGUCb17w9H5myRtsvMyeqgFgcfIafKcOh/9E+RcWkQwdhrI+xNebX2VVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSZiYF2m; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-65f7bd30546so22328557b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722329196; x=1722933996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N1SVRoOfwAGT1ArgnhX1cCtDllghjDDbgYirxLnYNzQ=;
        b=WSZiYF2mxZGLVMRNeruKwa87RJ4ntJR1aAHa3UYQmC8QyAmkQ6ZDcDQHwSUYgLSBeq
         zEg2dsvBtDbgk9oirzruZJp0LYjFRM1vKgS641yF7SMMMOTMQA0ufFOVetmg5F5ojADu
         h6XhyjYA8Ae7EyYon1xOfXolejBSYH/IpsySGvF8cVeagit6gMvb66FdM077PJr2r+xi
         lKEAxGzC8FfKPx1tTDs0cn6W4EBi8sbb+w62WJJZvzSrQoqWuDeIH6x7RIjTc/Wm7W3h
         rllLMgwZAbhXmtVAQLJNMF3hKAfYT2a2mZn2/TJp7rmxSGA5K9+6KjGHXwoHGC9KDW78
         uMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329196; x=1722933996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1SVRoOfwAGT1ArgnhX1cCtDllghjDDbgYirxLnYNzQ=;
        b=lHpTo7jGYyUlHKMBp7VGhg8ESAP4goH4+cJXNg4vwBMdT4CL4/pXtSp4HKcDISc7/C
         xb9dLWatWk3OlfAeT8AVLJ8Utu3oDFFOzb3o+bJ0pKTyozvMmYJLSt6KTbHLxx7g+Vj3
         oPwINFI3a3f86iZMR6iuOLS9iRvp0VwHGIrZAslI6TmEUy1xz+lQpTCL/X9iBKS+xwad
         Qb+3fetuy3d2DvDy3cBjVmiU1BciN1QWU9QkeARkJJE1eYceVG45CPKoBxhj/IJhs81Y
         If8Ql/4FcvaCW0qsLgy2gl3OL0qP3Tz1YIkkPt7jnfVVHkFvE5NiPjPCVHB21U624M7y
         cVtg==
X-Forwarded-Encrypted: i=1; AJvYcCXiH+ixfEWi8zAdAxKGlLeXav0zCHRVau4yVKBscM2ZOZPnwgC6luAuwNDk4rXxTEb4D4bGkRJrqEON1q/boR8CMwAurLhuSXrKUXCtLg==
X-Gm-Message-State: AOJu0YyOIEaZN/6jvwd14zE3nF0plA0Ouyn0zjqyW52Wub4t692YSkPp
	3qH0tOPHweNUsEeEu+elyyu5nf3LYPEVOFbonS3bfhRe9qPW6BKj02/iduO4/ysV00fIin1ljTd
	9UiKSZVF7l0vUdK4TO9ZqZi0xt5IhmJy39ApcFw==
X-Google-Smtp-Source: AGHT+IHjFfHgqjmlzduFLfBafbIgZJ6xlEV6ruFB9cW2gDIL63vUlMWZer/56XD5APUD0hpf/X8faq6H0va63gFoa5w=
X-Received: by 2002:a0d:fec4:0:b0:65f:cdb7:46a7 with SMTP id
 00721157ae682-6826d4349a5mr12295097b3.22.1722329195668; Tue, 30 Jul 2024
 01:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr> <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat> <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat> <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
 <20240730-eminent-venomous-condor-8ef421@houat>
In-Reply-To: <20240730-eminent-venomous-condor-8ef421@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 30 Jul 2024 11:46:24 +0300
Message-ID: <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jul 2024 at 11:27, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Wed, Jul 24, 2024 at 07:59:21PM GMT, Marc Gonzalez wrote:
> > On 15/07/2024 16:40, Maxime Ripard wrote:
> > > On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
> > >> On 01/07/2024 15:50, Maxime Ripard wrote:
> > >>
> > >>> The i2c register access (and the whole behaviour of the device) is
> > >>> constrained on the I2C_EN pin status, and you can't read it from the
> > >>> device, so it's also something we need to have in the DT.
> > >>
> > >> I think the purpose of the I2C_EN pin might have been misunderstood.
> > >>
> > >> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
> > >
> > > Toggled, probably not. Connected to a GPIO and the kernel has to assert
> > > a level at boot, I've seen worse hardware design already.
> > >
> > >> I2C_EN is a layout-time setting, decided by a board manufacturer:
> > >>
> > >> - If the TDP158 is fully configured once-and-for-all at layout-time,
> > >> then no I2C bus is required, and I2C_EN is pulled down forever.
> > >>
> > >> - If the board manufacturer wants to keep open the possibility
> > >> to adjust some parameters at run-time, then they must connect
> > >> the device to an I2C bus, and I2C_EN is pulled up forever.
> > >
> > > How do you express both cases in your current binding?
> >
> > It's not that I'm ignoring your question.
> >
> > It's that I don't understand what you're asking.
>
> And that's fine, you just need to say so.
>
> Generally speaking, you're focusing on the driver. The driver is not the
> issue here. You can do whatever you want in the driver for all I care,
> we can change that later on as we wish.
>
> The binding however cannot change, so it *has* to ideally cover all
> possible situations the hardware can be used in, or at a minimum leave
> the door open to support those without a compatibility breakage.
>
> That's why I've been asking those questions, because so far the only
> thing you've claimed is that "I can't test the driver for anything
> else", but, again, whether there's a driver or not, or if it's
> functional, is completely missing the point.
>
> > SITUATION 1
> > tdp158 is pin strapped.
> > Device node is child of root node.
> > Properties in proposed binding are valid (regulators and power-on pin)
> > Can be supported via module_platform_driver.
> >
> > SITUATION 2
> > tdp158 is sitting on I2C bus.
> > Device node is child of i2c bus node.
> > (robh said missing reg prop would be flagged by the compiler)
> > Properties in proposed binding are valid (regulators and power-on pin)
> > Supported via module_i2c_driver.
> >
> > If some settings-specific properties are added later, like skew,
> > they would only be valid for the I2C programmable mode, obviously.
>
> I think there's a couple more combinations:
>
>   - The device is connected on an I2C bus, but I2C_EN is tied low

No, this is not possible. I2C pins are repurposed if I2C_EN is low.
You can not call that an i2c bus anymore.

>   - The device is connected on an I2C bus, but I2C_EN is connected to a
>     GPIO and the kernel needs to assert its state at boot.

This is a pretty strange configuration.  The I2C_EN pin isn't supposed
to be toggled dynamically. Anyway, if that happens, I'd use pinctrl /
hog to control the pin.

>
> The GPIO case can be easily dealt with later on using an optional GPIO
> in the binding, but the current binding infers the I2C_EN level from the
> bus it's connected to, and I think we don't have a good way to deal with
> cases that would break that assumption.
>
> So I think we need an extra property to report the state of the i2c_en
> pin (and would be mutually exclusive with the GPIO if we ever have to
> support it).

-- 
With best wishes
Dmitry

