Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8273E97F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 20:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhHKSwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 14:52:24 -0400
Received: from mail-pj1-f46.google.com ([209.85.216.46]:41870 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHKSwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 14:52:23 -0400
Received: by mail-pj1-f46.google.com with SMTP id fa24-20020a17090af0d8b0290178bfa69d97so6683878pjb.0;
        Wed, 11 Aug 2021 11:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u+NqNQJXFf5VMDea9SqmxIiAq1Aqxjz2mlCFVqeoTl0=;
        b=Ly+m9zQKJQv/mNepC49QbK6sQaa2Jk2PIiQYWONJw9qRKg8Kc/Ej53ZGN+i/vZlx77
         EtIj5rEtOQ4QLb5cTt2Uy5VqR7EOhJ8uVSBw9u+SndGM3rhremv+dPKcch3N6mDK2Jlo
         tfuaFcJwo0o2/0czQydBW/0q+HOC20wl3Klex5HmTqMVA0Wlkq1uXM9bmNoXf1E80wm8
         Nu8Bm4HgnbkaaoAT3AKmsX86BDU1vRPSysI85bLnyQDA/vyeUzhnTv/1xQd8mSIU7PBk
         7URCqjAQIzI7kb4iNiEI8vN7/k4MFpU+1PwfQ/pUqN83o1P0xHKHtA0mNtOznTQ8VFV/
         1KDg==
X-Gm-Message-State: AOAM5317Wwga9ukdj6SPnUNlKq5bpHHROyb8G44EWP3mcy37yG9CDBwk
        Pzbax87KnmnueRxs0l8x+w==
X-Google-Smtp-Source: ABdhPJw2EUF+rrg+K5zpy3SmJDclmp5BOOvJMKX5mwcfU9Q7hj+SPfmwbPaHXNTErwiV+X8SsIfbsw==
X-Received: by 2002:a17:90a:6c45:: with SMTP id x63mr11869591pjj.0.1628707919654;
        Wed, 11 Aug 2021 11:51:59 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id g4sm197697pgs.42.2021.08.11.11.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:51:59 -0700 (PDT)
Received: (nullmailer pid 86823 invoked by uid 1000);
        Wed, 11 Aug 2021 18:51:56 -0000
Date:   Wed, 11 Aug 2021 12:51:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <YRQcTLK1ffM1TEbX@robh.at.kernel.org>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804081352.30595-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> managed through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../bindings/display/panel/truly,nt35521.yaml | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> new file mode 100644
> index 000000000000..4727c3df6eb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/truly,nt35521.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
> +
> +maintainers:
> +  - Shawn Guo <shawn.guo@linaro.org>
> +
> +description: |
> +  The Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel.  The panel backlight
> +  is managed through DSI link.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: truly,nt35521
> +
> +  reg: true
> +
> +  reset-gpios: true
> +
> +  enable-gpios: true
> +
> +  pwr-positive5-gpios:
> +    maxItems: 1
> +
> +  pwr-negative5-gpios:
> +    maxItems: 1

Are these +/-5V supplies? If so, they should be modeled with 
gpio-regulator perhaps unless the panel connection could only ever be 
GPIOs.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - enable-gpios
> +  - pwr-positive5-gpios
> +  - pwr-negative5-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "truly,nt35521";
> +            reg = <0>;
> +            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
> +            pwr-positive5-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
> +            pwr-negative5-gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
> +            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +...
> -- 
> 2.17.1
> 
> 
