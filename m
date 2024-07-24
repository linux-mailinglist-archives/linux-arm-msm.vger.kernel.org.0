Return-Path: <linux-arm-msm+bounces-26976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61593B5DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 19:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E76991C2152B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2024 17:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D0C15EFC6;
	Wed, 24 Jul 2024 17:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cg8bajM6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379121C693
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721841936; cv=none; b=SmCoNg8TlmRFY7nQd7ckUBP5TG3FuHbGUum8RPTC84J7L/lZAxi3104zMjVjOLWITxgYIJxJvk4mupsYvWP8TFxFwA0xQMbn1pDfN4Fnbx95qtYVEPs1HFNYVA5BJK0wYVuaP5vkmtRE8ipOuLyDnvR9488p+bk9ociCB5HoA5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721841936; c=relaxed/simple;
	bh=nFZf7S7ro//PLP9HS5yxjfdzCniQy0lbYHb658tkBTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqLPh5S7G9lXhHnapbklgW+NGePy4zjZ4KnZ2aHuicB8HVeR+dPXLUTK7gMKWRj7R9+4JJWqXI1SVc5c4G1/pkwYWEVie3JH5qdBiac3P2OE3GyNR0U7uU/f/3WtWxiJDwcS9bGboepdROY9PzuQgZvEX4VfRmPVlAQAbJ4cmZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cg8bajM6; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso3935595e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jul 2024 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721841932; x=1722446732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdsIcUIuG4F7BUsodEphNLEIZizsuXunws9wTKYJcI0=;
        b=cg8bajM68JliseIO9b+Z5Wjb6LiDA/ZPA21hNQxgMGqoSaRy0cDdzFE6fKZWxm9rK+
         xL6ef/t6egYdKP2F+ujv7hQ4L74dZY6pRc7S2xYSm7EUOphnaK9s6FZDEl7Z191KcbLS
         TN9WmIs1TuTPXbvFlCrDbMBm4y8c5/8P/EbxSn+df9p/f+fLPjZygzZ2cSonVP8VOSXh
         0Xt3d24oqgxMG6iMwMrEtAelIMiD+jAy4r/qBi2Y/ykinisilCp2SFwTarLEkXUo0u6F
         8DLdIwzRC4upwr+2uvX/GF1Azwc2rfErDQo7Mj3tLVIio7zpblXf5g/L0/OOEu8p86Xx
         UNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721841932; x=1722446732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdsIcUIuG4F7BUsodEphNLEIZizsuXunws9wTKYJcI0=;
        b=XGrSLLxYpjLEOXJ7b3ttWiANjh7WZETN6IIskPIk71xrQebFSIg7FL4mXkih8ud1xW
         xWKGvg2uOlIaTdVNkQgT5zKDqNdXZ46P1zJeq84JnytaiCnvUQWnx4vXb0+3UbbyMfnY
         aC+d7j3jXQkVFAMyM4u5IPTczdCRjbbHnS/JAIUcmdEm/31YmwdjHjsQwjuUpovhvb31
         bPICFTel+ZRF4TNlQNrLBeMQwJKlkZY+sULTOhiQLW69QVL7xjISoLcx0eznF8h45AbF
         YzBjshXj30PGe8B7ei2wXV4pVfNFAjdJ38AeXl+SJN8UZypmw7QJNeQf9vq1FCJ+whMN
         JOFw==
X-Forwarded-Encrypted: i=1; AJvYcCVYCKYH0pCNKRfPNjwJq4TVgoOf7OQfNuswMTnmhFWMbwTZ9qnadxZbt8d8T1crF2mzFkA0bqRakPSmJ8aY1rrzJo7hxK5lMOBK7F1Enw==
X-Gm-Message-State: AOJu0YzjD/pksWnO//P4Pp0R7YcI+/muBkGKRQNQbuFyD8MvMmpM20Bv
	oqvrL1r+By72cz7L2xQlAG8fYneC330s91pNT4wGs/EfK4iysO3bfnv+GKId5dU=
X-Google-Smtp-Source: AGHT+IEECUoCxDKGUPEy3aPp7AF8fHdHiOenlXOdyEZ33VXwFx39ZbX/NJ2O7llyKmDJp954FLHYBQ==
X-Received: by 2002:a05:6512:3da9:b0:52e:f2a9:b21a with SMTP id 2adb3069b0e04-52fd3f069c7mr304608e87.19.1721841932407;
        Wed, 24 Jul 2024 10:25:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef553c8b0sm1970944e87.81.2024.07.24.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 10:25:31 -0700 (PDT)
Date: Wed, 24 Jul 2024 20:25:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Arnaud Vrac <avrac@freebox.fr>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
Message-ID: <j2ouvtywaasnkxq344rm4b6mrlqtu6bxlq4wrvz4fawzww3xad@yjp7k4zmfygu>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <f40de173-0c61-4400-87b2-51c171a52baa@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f40de173-0c61-4400-87b2-51c171a52baa@freebox.fr>

On Wed, Jul 24, 2024 at 07:18:39PM GMT, Marc Gonzalez wrote:
> On 15/07/2024 16:42, Maxime Ripard wrote:
> > On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> >> On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> >>> On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> >>>> On 01/07/2024 15:50, Maxime Ripard wrote:
> >>>>
> >>>>> On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> >>>>>
> >>>>>> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> >>>>>> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> >>>>>> It supports 4 TMDS channels, HPD, and a DDC interface.
> >>>>>> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> >>>>>> for power reduction. Several methods of power management are
> >>>>>> implemented to reduce overall power consumption.
> >>>>>> It supports fixed receiver EQ gain using I2C or pin strap to
> >>>>>> compensate for different lengths input cable or board traces.
> >>>>>>
> >>>>>> Features
> >>>>>>
> >>>>>> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> >>>>>> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> >>>>>> data rate, compatible with HDMI 2.0b electrical parameters
> >>>>>> - DisplayPort dual-mode standard version 1.1
> >>>>>> - Programmable fixed receiver equalizer up to 15.5dB
> >>>>>> - Global or independent high speed lane control, pre-emphasis
> >>>>>> and transmit swing, and slew rate control
> >>>>>> - I2C or pin strap programmable
> >>>>>> - Configurable as a DisplayPort redriver through I2C
> >>>>>> - Full lane swap on main lanes
> >>>>>> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> >>>>>>
> >>>>>> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> >>>>>>
> >>>>>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> >>>>>> ---
> >>>>>>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> >>>>>>  1 file changed, 51 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >>>>>> new file mode 100644
> >>>>>> index 0000000000000..21c8585c3bb2d
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> >>>>>> @@ -0,0 +1,51 @@
> >>>>>> +# SPDX-License-Identifier: GPL-2.0-only
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> >>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>> +
> >>>>>> +title: TI TDP158 HDMI to TMDS Redriver
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - Arnaud Vrac <avrac@freebox.fr>
> >>>>>> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> >>>>>> +
> >>>>>> +properties:
> >>>>>> +  compatible:
> >>>>>> +    const: ti,tdp158
> >>>>>> +
> >>>>>> +  reg:
> >>>>>> +    description: I2C address of the device
> >>>>>> +
> >>>>>> +  enable-gpios:
> >>>>>> +    description: GPIO controlling bridge enable
> >>>>>> +
> >>>>>> +  vcc-supply:
> >>>>>> +    description: Power supply 3.3V
> >>>>>> +
> >>>>>> +  vdd-supply:
> >>>>>> +    description: Power supply 1.1V
> >>>>>> +
> >>>>>> +  ports:
> >>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
> >>>>>> +
> >>>>>> +    properties:
> >>>>>> +      port@0:
> >>>>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>>>> +        description: Bridge input
> >>>>>> +
> >>>>>> +      port@1:
> >>>>>> +        $ref: /schemas/graph.yaml#/properties/port
> >>>>>> +        description: Bridge output
> >>>>>> +
> >>>>>> +    required:
> >>>>>> +      - port@0
> >>>>>> +      - port@1
> >>>>>
> >>>>> The device supports DVI, HDMI or DP input, with various requirements and
> >>>>> capabilities depending on the input. Your binding doesn't address that.
> >>>>>
> >>>>> Similarly, it can do lane-swapping, so we should probably have a
> >>>>> property to describe what mapping we want to use.
> >>>>>
> >>>>> The i2c register access (and the whole behaviour of the device) is
> >>>>> constrained on the I2C_EN pin status, and you can't read it from the
> >>>>> device, so it's also something we need to have in the DT.
> >>>>
> >>>> We are using the device in its default configuration.
> >>>> (Power on via OE, then it works as expected)
> >>>
> >>> I know, but that doesn't really matter for a binding.
> >>>
> >>>> Can we leave any additional properties to be defined by whomever needs
> >>>> them in the future?
> >>>
> >>> If you can guarantee that doing so would be backward compatible, sure.
> >>> But that means being able to answer those questions with a reasonable
> >>> plan.
> >>
> >> I think proposed bindings are generic enough to cover other possible
> >> usecases in future.
> > 
> > I don't think it is. The current binding is for a I2C device that
> > shouldn't be accessed through I2C.
> > 
> > It's working for now because the driver doesn't do any access, so it's
> > all great, but as soon as we add support for the other case, then we'll
> > have to add a property that states that while it's an i2c device, it
> > shouldn't be accessed.
> > 
> > And adding such a property is a compatibility-breaking change.
> 
> Why do you say:
> "current binding is for a I2C device that
> shouldn't be accessed through I2C" ?
> 
> As a matter of fact, my debug code queries the device ID using
> regmap_read() to make sure I set the correct I2C address.

Please note: bingdings do not cover the driver at all. The driver might
do whatever it wants. The bindings describe the hardware.

> 
> It's not that the device "SHOULD NOT" be accessed.
> 
> It's just that the driver DOES NOT NEED TO access the device,
> simply because the default settings work fine.

-- 
With best wishes
Dmitry

