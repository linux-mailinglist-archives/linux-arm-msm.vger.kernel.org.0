Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A4F3EF245
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 20:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhHQSyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 14:54:08 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:43543 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbhHQSyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 14:54:07 -0400
Received: by mail-ot1-f42.google.com with SMTP id x10-20020a056830408a00b004f26cead745so115019ott.10;
        Tue, 17 Aug 2021 11:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uh3yX8H6TLsN9OKTlfGslSl2eUYu3PuQFUrAtR+MjgY=;
        b=iNHKfGeSNEXjA9x8KkNJ993nRWZkOtXfVzD3pHTPbiLugX7Mx0SiKHQOGxoK3vpoX+
         piFNoXUsZW/341kQoGwVnwTnzzjZdVVMsNj5CPOEQT3gleoopr7w79q1soDBd2bWTM3n
         dteETQd03O7L2rkjCQ8fhW7AcfecEj/8tHy+4LP++WjJfQya3gbpldF7HoCNNTaR5Z5Y
         eTcXMBgMnVOUfEPRp7whiyp0iwuqwis55Nh29dAjgcD8Yl2r6/UP3f73TCIcG2QSiAvf
         uda2Zj58ZScFCs8+yBwewkbNt+2/GlTCUUQopVN2dWPLHkH4veyzNjSGc16iDQls3fuX
         onUg==
X-Gm-Message-State: AOAM531BUEr2R8PMq78rzTTe6N6YqN03i1nCsTNmoUQiY7ANcfAnBNsW
        OOkOK9Wp+drEz4fYaUrAag==
X-Google-Smtp-Source: ABdhPJwdlsfHlEhRtBcV8FhwgbozTQwrR52YEoNnA5fHDt6QOPwB6NMzcRRM9gfouCAMNfnpZvYYlQ==
X-Received: by 2002:a9d:a12:: with SMTP id 18mr3820062otg.252.1629226413997;
        Tue, 17 Aug 2021 11:53:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b5sm674032oif.44.2021.08.17.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 11:53:32 -0700 (PDT)
Received: (nullmailer pid 652790 invoked by uid 1000);
        Tue, 17 Aug 2021 18:53:31 -0000
Date:   Tue, 17 Aug 2021 13:53:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: add bindings for the Sharp
 LS060T1SX01 panel
Message-ID: <YRwFqzIqwmkjgFAv@robh.at.kernel.org>
References: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
 <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 09, 2021 at 09:47:11PM +0300, Dmitry Baryshkov wrote:
> Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> using NT35695 driver. This panel can be found i.e. in the Dragonboard
> Display Adapter bundle.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> new file mode 100644
> index 000000000000..c4af5e7f6f39
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
> +
> +maintainers:
> +  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sharp,ls060t1sx01
> +
> +  reg: true
> +  backlight: true
> +  reset-gpios: true
> +  port: true
> +
> +  avdd-supply:
> +    description: handle of the regulator that provides the supply voltage

Single supply? Use simple-panel binding. Or are your supplies 
incomplete?

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
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
> +            compatible = "sharp,ls060t1sx01";
> +            reg = <0>;
> +            avdd-supply = <&pm8941_l22>;
> +            backlight = <&backlight>;
> +            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> +
> +...
> -- 
> 2.30.2
> 
> 
