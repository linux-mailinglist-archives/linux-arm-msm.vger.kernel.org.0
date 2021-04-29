Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AC136EF4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 20:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241084AbhD2SFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 14:05:25 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:35513 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbhD2SFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 14:05:24 -0400
Received: by mail-oi1-f177.google.com with SMTP id e25so37390916oii.2;
        Thu, 29 Apr 2021 11:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BGXc8n8dJgWIvZ1rgn/mp/0YVMWp8ZgJFpSUhA1n/t0=;
        b=VUmbolxsdBR7g59BJIa4Uxubh8AAezLYzNq8glcT3Szq0vGl3jmNQ7lGsOV7MeRWBl
         Nr7FTDSvq90swnqtEQYQhU9hoh+OYIpOhlQUyvitwYoa6P2Pv0VxuhUxQWI/GLdo/6sQ
         ulgRTMiCYMvCAtaLq0xp/JYTzB+AaLz1PyKw5uAHgXajwlJKskxoV19RZQdD2POaM595
         qKiYwhk7xH4Rjs+2uyyywRF0ZWJp+/mQBwnR6t1imTybpMKAqk2dDHqGwmY7UgSFmNeo
         TbP25PaYggqNksYU1aaXi9flUKqYG6w6RoRaIwhl9+v1HvYJSrQeyT2OtALS7sUxAtQt
         lhlg==
X-Gm-Message-State: AOAM531wWt+5M60u/at6fBBvtpUk1j9JQ3pQl8T9rZlTAHCyRp8hgP6Q
        iWBhB3dUjTS+IIpPjhUPQw==
X-Google-Smtp-Source: ABdhPJxsvgDl4cmyGSZAjcy3TO96h2Gk37C2SsrChdAtgKojOCkhhcJuqRmLaS8oiHIGCS+V5p6asA==
X-Received: by 2002:aca:ed12:: with SMTP id l18mr7861083oih.24.1619719477238;
        Thu, 29 Apr 2021 11:04:37 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm114127otm.26.2021.04.29.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 11:04:36 -0700 (PDT)
Received: (nullmailer pid 1505463 invoked by uid 1000);
        Thu, 29 Apr 2021 18:04:35 -0000
Date:   Thu, 29 Apr 2021 13:04:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Message-ID: <20210429180435.GA1385465@robh.at.kernel.org>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> Add bindings for DisplayPort aux backlight driver.
> 
> Changes in v2:
> - New
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> new file mode 100644
> index 00000000..0fa8bf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DisplayPort aux backlight driver bindings
> +
> +maintainers:
> +  - Rajeev Nandan <rajeevny@codeaurora.org>
> +
> +description:
> +  Backlight driver to control the brightness over DisplayPort aux channel.
> +
> +allOf:
> +  - $ref: common.yaml#
> +
> +properties:
> +  compatible:
> +    const: dp-aux-backlight
> +
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the system I2C controller connected to the DDC bus used
> +      for the DisplayPort AUX channel.
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for backlight enable pin.
> +
> +  max-brightness: true
> +
> +required:
> +  - compatible
> +  - ddc-i2c-bus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    backlight {
> +        compatible = "dp-aux-backlight";
> +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;

So the DDC bus is connected to a backlight and also a panel? This 
binding is not reflecting the h/w, but rather what you want for some 
driver.

There's only one thing here and that's an eDP panel which supports 
backlight control via DP aux channel. You can figure all that out from 
the panel's compatible and/or reading the EDID. 

You might also be interested in this thread:

https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/

Rob
