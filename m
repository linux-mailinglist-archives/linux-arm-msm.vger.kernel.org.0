Return-Path: <linux-arm-msm+bounces-26319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C40932485
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF542834FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3309A1990C2;
	Tue, 16 Jul 2024 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gVxtAbYx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B51198E99
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721127598; cv=none; b=p9d2U4wekO1MPIMH7mqQ3fc+ZnRLczG50vJypOAedvQjxJOxlI8Zj1kRYEGNkaNehkHhX6PiymS4VN5vD7urplhMS1W+TgFQyd6I7m+yi1ivBRqwFrMvAmaN5JVg+rlSyGbsI5pTTC6RmiwatoVQI1M1Fns6f8FFz2dlKKtAYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721127598; c=relaxed/simple;
	bh=2Xbui5IUyg5tb8VxTM+MedBqiuXg6kjyATX7ytaJ32w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGa4JrtrBqhjMmcF/QjDYuOYvSetWv6UFlIEzTwEduXpZ9wTXXraYFHCUX25yh1CE1lEZWFkUhL4OPp9vjYsgd3QKNhStBWnIAfAln5Gob9gTa3QF6Juo7TRVRYK85uIqj8EnCsete0N2P9TLhtmwfKtYFtIg6kOXZ9teUsyU5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gVxtAbYx; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-65f9a79fc82so25859437b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721127595; x=1721732395; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SCpp5TdLu9kk6eRwCAo7oBPRTqvgECiNvL6BaGoRicI=;
        b=gVxtAbYx/YIC3h1CkWqVGvnQII/9SfRNXUtP7Lc9SwpU4+Skr+lesOyRDzNPcgz4i+
         0CRLtmI6R5fvFL8C/kErnUWmwjzNGN0Armg1/T70fCs+PBos89mw7ZhxdpHn2I4jvCqr
         v8vSSe6dyNWNWItys8GalmJeWDHQbtfpatE54/q6yy+vToCqc8usGflYw9NfspuQKu2t
         un2BriQI4G6M6Nlkvq+t4WhsHeT6V4Oxa71tovCRbczF/zuePePaYWJhCyD44RDYJZqD
         OqFAJwmEpnsgVhvOQ40+PLzardHzMtEetEBPY8XmkeityAIHXenKS3BbeuALT25SPJCS
         aTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721127595; x=1721732395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SCpp5TdLu9kk6eRwCAo7oBPRTqvgECiNvL6BaGoRicI=;
        b=jR5Nvxm9XU2bRmR0/Xg3s/XT2hHUh4RS36fg2zt2fhQh98ogsOAGxb9jSOHVp5uFUQ
         iUlrevrDw0EgwCboPnYuVSfx+pWgIDNgGzdRT8LCrafQdNi3xoB2m8dPdzbhXcea1nkj
         0TbxepAFtMH0WVW2BfCdKZIk/U5Tt01UWYvbBuG/h83SJd6hVYFYPpIAjDEXcuLMok77
         mKo089yG8sio57WIiibne8O2RNRZVGTFk3Y+ireRuYtL/myOjISILemB6M+1PnoTwMCQ
         KIf/qiOpERkK5fBoS6YrVDhK0yp4qmPKk3Tkqv5ZnXXTAsH5VbBDYCd1WzlAv6kDTFlm
         YYWg==
X-Forwarded-Encrypted: i=1; AJvYcCUejAUI2b0pyMfwNrusJUi6poiw+0x/xMWk7iDNMpLmhlTIu7+euU30P0QmpJVrzsOnlOLElJFx7pK+4+zaYnahJNqc2p1VAuXZ4sOgZw==
X-Gm-Message-State: AOJu0YxvVTrjP7zrG5P4UxYHgqLeqneyBgQ3l1D7I1usDSqlN0JtXEl4
	cYk7MlDt9h0N/RuksFwdiT2eED2snn5R25rj+ztxEDNES2zddGXgK7k+V4oP+E6ltz+BfVhZmQY
	lCwdSBniZXAAoriUOKOHJKBUj3sWLQaxQZrWJRQ==
X-Google-Smtp-Source: AGHT+IEAYszVmONd9WFRIl8XLspjDCopUYw6S6qPqmgIeZkQQTGphg+e0dz0ezSFN7crgqieY6cxct7ubknDXA63tu0=
X-Received: by 2002:a81:77c5:0:b0:643:aef1:fb9d with SMTP id
 00721157ae682-6637f0c9bd5mr20216307b3.4.1721127595205; Tue, 16 Jul 2024
 03:59:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr> <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat> <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat> <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat> <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
 <20240716-exuberant-diligent-beagle-c43ffc@houat>
In-Reply-To: <20240716-exuberant-diligent-beagle-c43ffc@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 13:59:43 +0300
Message-ID: <CAA8EJppwWN8vBPv0cE0Fmt5rtP60RS4qgB5n6_CfuaQdLLpGDw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 12:24, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Jul 15, 2024 at 07:38:34PM GMT, Dmitry Baryshkov wrote:
> > On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> > > > On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> > > > > On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > > > > > On 01/07/2024 15:50, Maxime Ripard wrote:
> > > > > >
> > > > > > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > > > > > >
> > > > > > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > > > > > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > > > > > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > > > > > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > > > > > >> for power reduction. Several methods of power management are
> > > > > > >> implemented to reduce overall power consumption.
> > > > > > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > > > > > >> compensate for different lengths input cable or board traces.
> > > > > > >>
> > > > > > >> Features
> > > > > > >>
> > > > > > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > > > > > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > > > > > >> data rate, compatible with HDMI 2.0b electrical parameters
> > > > > > >> - DisplayPort dual-mode standard version 1.1
> > > > > > >> - Programmable fixed receiver equalizer up to 15.5dB
> > > > > > >> - Global or independent high speed lane control, pre-emphasis
> > > > > > >> and transmit swing, and slew rate control
> > > > > > >> - I2C or pin strap programmable
> > > > > > >> - Configurable as a DisplayPort redriver through I2C
> > > > > > >> - Full lane swap on main lanes
> > > > > > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > > > > > >>
> > > > > > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > > > > > >>
> > > > > > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > > > > >> ---
> > > > > > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > > > > > >>  1 file changed, 51 insertions(+)
> > > > > > >>
> > > > > > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > > > >> new file mode 100644
> > > > > > >> index 0000000000000..21c8585c3bb2d
> > > > > > >> --- /dev/null
> > > > > > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > > > >> @@ -0,0 +1,51 @@
> > > > > > >> +# SPDX-License-Identifier: GPL-2.0-only
> > > > > > >> +%YAML 1.2
> > > > > > >> +---
> > > > > > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > > > > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > >> +
> > > > > > >> +title: TI TDP158 HDMI to TMDS Redriver
> > > > > > >> +
> > > > > > >> +maintainers:
> > > > > > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > > > > > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > > > > > >> +
> > > > > > >> +properties:
> > > > > > >> +  compatible:
> > > > > > >> +    const: ti,tdp158
> > > > > > >> +
> > > > > > >> +  reg:
> > > > > > >> +    description: I2C address of the device
> > > > > > >> +
> > > > > > >> +  enable-gpios:
> > > > > > >> +    description: GPIO controlling bridge enable
> > > > > > >> +
> > > > > > >> +  vcc-supply:
> > > > > > >> +    description: Power supply 3.3V
> > > > > > >> +
> > > > > > >> +  vdd-supply:
> > > > > > >> +    description: Power supply 1.1V
> > > > > > >> +
> > > > > > >> +  ports:
> > > > > > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > > > > > >> +
> > > > > > >> +    properties:
> > > > > > >> +      port@0:
> > > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > >> +        description: Bridge input
> > > > > > >> +
> > > > > > >> +      port@1:
> > > > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > > > >> +        description: Bridge output
> > > > > > >> +
> > > > > > >> +    required:
> > > > > > >> +      - port@0
> > > > > > >> +      - port@1
> > > > > > >
> > > > > > > The device supports DVI, HDMI or DP input, with various requirements and
> > > > > > > capabilities depending on the input. Your binding doesn't address that.
> > > > > > >
> > > > > > > Similarly, it can do lane-swapping, so we should probably have a
> > > > > > > property to describe what mapping we want to use.
> > > > > > >
> > > > > > > The i2c register access (and the whole behaviour of the device) is
> > > > > > > constrained on the I2C_EN pin status, and you can't read it from the
> > > > > > > device, so it's also something we need to have in the DT.
> > > > > >
> > > > > > We are using the device in its default configuration.
> > > > > > (Power on via OE, then it works as expected)
> > > > >
> > > > > I know, but that doesn't really matter for a binding.
> > > > >
> > > > > > Can we leave any additional properties to be defined by whomever needs
> > > > > > them in the future?
> > > > >
> > > > > If you can guarantee that doing so would be backward compatible, sure.
> > > > > But that means being able to answer those questions with a reasonable
> > > > > plan.
> > > >
> > > > I think proposed bindings are generic enough to cover other possible
> > > > usecases in future.
> > >
> > > I don't think it is. The current binding is for a I2C device that
> > > shouldn't be accessed through I2C.
> > >
> > > It's working for now because the driver doesn't do any access, so it's
> > > all great, but as soon as we add support for the other case, then we'll
> > > have to add a property that states that while it's an i2c device, it
> > > shouldn't be accessed.
> > >
> > > And adding such a property is a compatibility-breaking change.
> >
> > Please correct me if I'm wrong. We have following usecases.
> >
> > 1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
> > connected to the I2C bus. A0, A1, SDA and SCL pins are used for
> > strapping the settings.
> >     board DT file should describe the bridge as a platform device
> > sitting directly under the root node.
>
> DT maintainers have required that reg is always present in the other
> sub-thread.

If I2C_EN is pulled low, there is no reg, as there is no i2c bus
whatsoever. I2C pins are repurposed as pin straps, An pins are
repurposed as pin straps.

I think DT maintainers wanted reg for the 2.a. case - in other words
the bridge is present on the I2C bus, but it is not being programmed.

>
> > 2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
> > the I2C bus, A0/A1 pins set the I2C bus address. The device is
> > controlled over the I2C bus
> >
> > 2.a. The same as 2, but the device is not controlled at all, default
> > settings are fine.
> >
> > The driver covers usecase 2.a. The bindings allow extending the driver
> > to the usecase 2 (e.g. via optional properties which specify
> > bord-specific settings)
> >
> > The usecase 1 is a completely separate topic, it requires a different
> > schema file, specifying no i2c address, only voltages supplies and
> > enable-gpios.
>
> I could have mis-unnderstood, but my understanding was that they were
> running it with I2C_EN tied low.

That was my initial assumption, but I think Arnoud pointed out that
the bridge is connected to I2C, just not controlled as defaults are
sane.

> Of course, that's one of the thing that is completely missing from the
> commit log, so who knows.

Or from the cover letter :-(

-- 
With best wishes
Dmitry

