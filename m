Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0E836F185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 23:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhD2VEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 17:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbhD2VEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 17:04:21 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DCCBC06138B
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:03:32 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id t17so40219821qkg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
        b=MxcB5px72C8+5vJCXXHc+ftOlbOvLaOIZCcSYXwDudiJ5T6uRWCF3IbA/q7i0v05H4
         b5+Xhyg/FMAavwP1EiO0TTX+zk0MdwRoYHVLZbsieoDElYIszlwp9kC2cL2arlNwdmht
         5eSBc+Cb7eohKUohNBZmGo0StBZWqhQKL+4x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
        b=bVTplbC98mEZZAidNA7bQEPPC69qoi2Hb6gtsWQlwjCWnbevFRhH2zCUlImKxSo6nP
         MvvrnGt0mJLU3hiHcxwFRX63uL3bna5qVSLcy4jCudDTySZDMDRmM0WsKiHMH3ZuuAI+
         jvJwAQyt8+wUbjQpL+TZKKU2RSIBa53v2UvTES/ST8iBjDrZMEeJjuOU/Y+04kq4YBkW
         PEWMGbA8675kGOfWnHoqAXuLQu767n1dd8VA4qCu/ofLaY+wXCi2tYrpHeTZblSS9GF4
         ZN2IbNmExo2wjDaD6FIqN0+Ad4LJH0eAdlL14iNsjHguPJEYX6nc0dQeM05nG+jdUYSC
         IEYw==
X-Gm-Message-State: AOAM532HYola3/r+1kYCDfahUlOVicrsyheW5HsA8vur7daZnkOfoN38
        OwBuqGkxfmrjGXBctkG1K0igLZ8nqI3zVA==
X-Google-Smtp-Source: ABdhPJwMwVJsIP6I3D+UshTTaRV8doqkxIgk6Vg7PO3uWcKq25WyNtdA3EB75lhDLIzF/asWz10IQw==
X-Received: by 2002:a37:6257:: with SMTP id w84mr313989qkb.158.1619730211547;
        Thu, 29 Apr 2021 14:03:31 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id g185sm3059376qkf.62.2021.04.29.14.03.30
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id i4so42759431ybe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
X-Received: by 2002:a05:6902:4e2:: with SMTP id w2mr2101815ybs.79.1619730210214;
 Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org> <20210429180435.GA1385465@robh.at.kernel.org>
In-Reply-To: <20210429180435.GA1385465@robh.at.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Apr 2021 14:03:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
To:     Rob Herring <robh@kernel.org>
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, mkrishn@codeaurora.org,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> > Add bindings for DisplayPort aux backlight driver.
> >
> > Changes in v2:
> > - New
> >
> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > ---
> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > new file mode 100644
> > index 00000000..0fa8bf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DisplayPort aux backlight driver bindings
> > +
> > +maintainers:
> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
> > +
> > +description:
> > +  Backlight driver to control the brightness over DisplayPort aux channel.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: dp-aux-backlight
> > +
> > +  ddc-i2c-bus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the system I2C controller connected to the DDC bus used
> > +      for the DisplayPort AUX channel.
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: GPIO specifier for backlight enable pin.
> > +
> > +  max-brightness: true
> > +
> > +required:
> > +  - compatible
> > +  - ddc-i2c-bus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    backlight {
> > +        compatible = "dp-aux-backlight";
> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>
> So the DDC bus is connected to a backlight and also a panel? This
> binding is not reflecting the h/w, but rather what you want for some
> driver.
>
> There's only one thing here and that's an eDP panel which supports
> backlight control via DP aux channel. You can figure all that out from
> the panel's compatible and/or reading the EDID.
>
> You might also be interested in this thread:
>
> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/

I think Rajeev needs to rework everything anyway as per:

https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com

...but you're right that it makes sense not to model the backlight as
a separate node in the device tree. The panel driver can handle
setting up the backlight.

-Doug
