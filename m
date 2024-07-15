Return-Path: <linux-arm-msm+bounces-26208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A92931893
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 18:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6773B2243A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 16:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12411CAA1;
	Mon, 15 Jul 2024 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QZVt4CHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F661C6A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061527; cv=none; b=BE50wkmtXCLuJ165h38V+9hRHZKElM6jrhhP1keqxfDq/TZfg9XnIL65xFDHJnnYonTlrBYzCdSfRO+9yxo5kCi24/bZznUOZIgvn2wDBRtVuzfOCi9WBxH+x9XlZFAI6l6LXphDqV5DfcRuqoTHbKZw4LzYqE7zq8UT/PtE9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061527; c=relaxed/simple;
	bh=2FgquQ2EDQMPY/z3aNa+80jBsRB/Cu1yXAZzujxHdvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e05a2aRbIy81ipnptqK2464kXI3MqVQxX924u9IHINzy92iH5rGewc1ldwm+HonPaCOlUc4kdYUtfaJj082/Kl2NVXDgrhLgVbdwZZidTdW5kyt2wRjYvl9v81TtmSWFO8K04jhIv9a53jfTVNUDh9EaZnPEwuR+GGnoetxjeGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QZVt4CHA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-65fdfd7b3deso18929827b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721061525; x=1721666325; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MMh3CmRk7eNTy43aYCP1b5/BKtC9brxonzF2hzhXLNQ=;
        b=QZVt4CHAkDFO4JBy5eVf6Cd30kAGT2uRLAMXW6Zxz0+GBxjcG7AtJe2AN39lgmHTL8
         1NEf7cfL1VK6MpEH6MH7UsG42MDH4bRYsPTcwIAyPPI5aPPuskCGGRp1PIuI2KqB9X+Z
         Dmy5B+zkYIVcXAO0kR4aqW3G3uzxweuIGvd0jXSK4OwmABleUXGbknjLjo63Vk+Q658P
         5yabfPqUKhSm5pRZjdxC3w8OXGMtBXpqtjmBN6N2qrNEK6K157hcyoF/EIm3SSfEXbQN
         mYLXHex/xORBLCvkt16Pzq+K8QW7w9dZaofIaNaibVsJKE3LXh0U5vzlXbg+MhgpcRRp
         +pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061525; x=1721666325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMh3CmRk7eNTy43aYCP1b5/BKtC9brxonzF2hzhXLNQ=;
        b=FcRNVJwZ4B6wkBY5ZfF2ojU+zV0GGdh8/5o80QDpCyzoUva3iQyOqJGptooislka6F
         xOZciEGQiPE1gHdtE8ziFoI4Jac4sXSWuG0s9owuXmcDC8dv/cJFWTnimcUBTEWv0FRI
         njABAyxoM5vTqVcauTGrUVK01QTDe8aSULqY921p3Quf0hk+py2UdusKjX5yzRW3J4xS
         52TZkiayP9OP93jMRtfIrliAyK6yguAmv34/5DkFWNFhLWif/6c9rhKS6/j0Otv8SIbV
         Qro/744oidlpR9sXAZzKaLziUfuW48gO6/B3ROUIwOlxNbYIw0FQ5L0x09aRND5tpc8e
         57tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJdvd7f4YWvpq8Uoqe0oz6vuKEbxH+IkEn03ZdEWE2XGC1c64H99rdjCYobrE9YGoG/Opf6t8++XKHn1sYqjMiHqE8hjAeBiiK0RYW5w==
X-Gm-Message-State: AOJu0Yx1bQzs5PPwlvA4X+ms5bGcDYjmnkrGhe3AvWiisg8FypRZukVI
	lSq4Gsoaq4SMt/NGqOD7XJiBDhWXbGXF6PPmDmCyWtnSb06YOdbCWbgMtlRXHNRpu8DvomqQUe6
	aEqlZKUbF6A8WiTYWyGmaEq/WOKh4Nkm/8ygZBg==
X-Google-Smtp-Source: AGHT+IExykdLXYD9KCVCHw+nB8pZix6KO0eWJ2+RNg1Z2PRZxAdF/RdKNfFefS9K6D2jDSOTCSoQkkP0691aK8Kjnm0=
X-Received: by 2002:a0d:fc86:0:b0:65f:86a2:b4c5 with SMTP id
 00721157ae682-66355c4366emr123487b3.31.1721061525047; Mon, 15 Jul 2024
 09:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr> <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat> <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat> <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
In-Reply-To: <20240715-shiny-enigmatic-firefly-2a6dec@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 19:38:34 +0300
Message-ID: <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
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

On Mon, 15 Jul 2024 at 17:42, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Mon, Jul 08, 2024 at 11:29:46PM GMT, Dmitry Baryshkov wrote:
> > On Mon, Jul 08, 2024 at 04:59:23PM GMT, Maxime Ripard wrote:
> > > On Mon, Jul 01, 2024 at 05:36:18PM GMT, Marc Gonzalez wrote:
> > > > On 01/07/2024 15:50, Maxime Ripard wrote:
> > > >
> > > > > On Thu, Jun 27, 2024 at 01:13:03PM GMT, Marc Gonzalez wrote:
> > > > >
> > > > >> TDP158 is an AC-coupled DVI / HDMI to TMDS level shifting Redriver.
> > > > >> It supports DVI 1.0, HDMI 1.4b and 2.0b.
> > > > >> It supports 4 TMDS channels, HPD, and a DDC interface.
> > > > >> It supports dual power supply rails (1.1V on VDD, 3.3V on VCC)
> > > > >> for power reduction. Several methods of power management are
> > > > >> implemented to reduce overall power consumption.
> > > > >> It supports fixed receiver EQ gain using I2C or pin strap to
> > > > >> compensate for different lengths input cable or board traces.
> > > > >>
> > > > >> Features
> > > > >>
> > > > >> - AC-coupled TMDS or DisplayPort dual-mode physical layer input
> > > > >> to HDMI 2.0b TMDS physical layer output supporting up to 6Gbps
> > > > >> data rate, compatible with HDMI 2.0b electrical parameters
> > > > >> - DisplayPort dual-mode standard version 1.1
> > > > >> - Programmable fixed receiver equalizer up to 15.5dB
> > > > >> - Global or independent high speed lane control, pre-emphasis
> > > > >> and transmit swing, and slew rate control
> > > > >> - I2C or pin strap programmable
> > > > >> - Configurable as a DisplayPort redriver through I2C
> > > > >> - Full lane swap on main lanes
> > > > >> - Low power consumption (200 mW at 6Gbps, 8 mW in shutdown)
> > > > >>
> > > > >> https://www.ti.com/lit/ds/symlink/tdp158.pdf
> > > > >>
> > > > >> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> > > > >> ---
> > > > >>  .../bindings/display/bridge/ti,tdp158.yaml         | 51 ++++++++++++++++++++++
> > > > >>  1 file changed, 51 insertions(+)
> > > > >>
> > > > >> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > >> new file mode 100644
> > > > >> index 0000000000000..21c8585c3bb2d
> > > > >> --- /dev/null
> > > > >> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
> > > > >> @@ -0,0 +1,51 @@
> > > > >> +# SPDX-License-Identifier: GPL-2.0-only
> > > > >> +%YAML 1.2
> > > > >> +---
> > > > >> +$id: http://devicetree.org/schemas/display/bridge/ti,tdp158.yaml#
> > > > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > >> +
> > > > >> +title: TI TDP158 HDMI to TMDS Redriver
> > > > >> +
> > > > >> +maintainers:
> > > > >> +  - Arnaud Vrac <avrac@freebox.fr>
> > > > >> +  - Pierre-Hugues Husson <phhusson@freebox.fr>
> > > > >> +
> > > > >> +properties:
> > > > >> +  compatible:
> > > > >> +    const: ti,tdp158
> > > > >> +
> > > > >> +  reg:
> > > > >> +    description: I2C address of the device
> > > > >> +
> > > > >> +  enable-gpios:
> > > > >> +    description: GPIO controlling bridge enable
> > > > >> +
> > > > >> +  vcc-supply:
> > > > >> +    description: Power supply 3.3V
> > > > >> +
> > > > >> +  vdd-supply:
> > > > >> +    description: Power supply 1.1V
> > > > >> +
> > > > >> +  ports:
> > > > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > > > >> +
> > > > >> +    properties:
> > > > >> +      port@0:
> > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > >> +        description: Bridge input
> > > > >> +
> > > > >> +      port@1:
> > > > >> +        $ref: /schemas/graph.yaml#/properties/port
> > > > >> +        description: Bridge output
> > > > >> +
> > > > >> +    required:
> > > > >> +      - port@0
> > > > >> +      - port@1
> > > > >
> > > > > The device supports DVI, HDMI or DP input, with various requirements and
> > > > > capabilities depending on the input. Your binding doesn't address that.
> > > > >
> > > > > Similarly, it can do lane-swapping, so we should probably have a
> > > > > property to describe what mapping we want to use.
> > > > >
> > > > > The i2c register access (and the whole behaviour of the device) is
> > > > > constrained on the I2C_EN pin status, and you can't read it from the
> > > > > device, so it's also something we need to have in the DT.
> > > >
> > > > We are using the device in its default configuration.
> > > > (Power on via OE, then it works as expected)
> > >
> > > I know, but that doesn't really matter for a binding.
> > >
> > > > Can we leave any additional properties to be defined by whomever needs
> > > > them in the future?
> > >
> > > If you can guarantee that doing so would be backward compatible, sure.
> > > But that means being able to answer those questions with a reasonable
> > > plan.
> >
> > I think proposed bindings are generic enough to cover other possible
> > usecases in future.
>
> I don't think it is. The current binding is for a I2C device that
> shouldn't be accessed through I2C.
>
> It's working for now because the driver doesn't do any access, so it's
> all great, but as soon as we add support for the other case, then we'll
> have to add a property that states that while it's an i2c device, it
> shouldn't be accessed.
>
> And adding such a property is a compatibility-breaking change.

Please correct me if I'm wrong. We have following usecases.

1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
connected to the I2C bus. A0, A1, SDA and SCL pins are used for
strapping the settings.
    board DT file should describe the bridge as a platform device
sitting directly under the root node.

2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
the I2C bus, A0/A1 pins set the I2C bus address. The device is
controlled over the I2C bus

2.a. The same as 2, but the device is not controlled at all, default
settings are fine.

The driver covers usecase 2.a. The bindings allow extending the driver
to the usecase 2 (e.g. via optional properties which specify
bord-specific settings)

The usecase 1 is a completely separate topic, it requires a different
schema file, specifying no i2c address, only voltages supplies and
enable-gpios.



--
With best wishes
Dmitry

