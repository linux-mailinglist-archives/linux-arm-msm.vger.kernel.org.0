Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81AC3EB667
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 15:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240325AbhHMOAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 10:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233514AbhHMOAS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 10:00:18 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A78BC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 06:59:51 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id bo18so15471671pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Aug 2021 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MQn6cqjN8smmcTyxcoK9bZJTSPGWxwSW1fWm9idf4p8=;
        b=bbHUzcOfc28iYmzuG1dJQA5Qa3wglzCEl3896nSfZmZ8WFP2QtXO5vfAMUDVjq3oJ0
         KV1z2/rvmQtomipyPGLecQk2BHJrW5ZZYHuGh0PF/NyN5AnZWF8U6nHxdvnb5RHkk7bV
         tQr7yYencus19zZQx3ztNv2JgInt1QHi2/Wu//2MOET5FtlbIu1YmYhzsRgebMogur/5
         /LsoPJgbZJI11aLJKGmhiWVM78ymSDQlWFA2z2ScyQs7EvXR38FfdHvJ8I6QIdwfTEKy
         fLjD9eQHoajeBTxC/ZDO+haKCPSfkA50cIlRCf7j3YjrCnL7UU7CM6rBGvfmdtv7sfpc
         wzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MQn6cqjN8smmcTyxcoK9bZJTSPGWxwSW1fWm9idf4p8=;
        b=H06IvED1+1Q/GuZqXAYnXtbtRDlCqH4Hv1DthC2/HeB7M7pRal4Gqscc4zBJQDG22q
         YplzLZK/Aol89yWqfNnyC1bOEuf+7Gm8G5nU7X7ib4AxQ/WcLAVVA79NXVJq/xrgnQ+x
         GsLAVZrwyVo1rFRt1kx4zlUoA2OLjndWGJV+zTrac1q/WstRGotew0RCW1FrG3cvMR2a
         405BRp0DXJmzOZF7jBuUqdctw0rfrigm3qE8hEBB+4PtpnaDZ8qJETXMGYh/jShIOgkO
         JyD6Z8qlB8ar5B8HzprGJhN9FGocTwAlkN8RkZf7LWb/qyJ2HS4J/ADGts7nQLMHwrlZ
         JbMQ==
X-Gm-Message-State: AOAM532FQMi1tNGE3DPtSKO3RaFXkrd22WyjJddzvlzBPnSHIdgtsKtR
        EJZsckiBrB3cMguW9zoOqGs/wg==
X-Google-Smtp-Source: ABdhPJwZR5on4UTDwsr7OAESZTVh5CnOYdmBdsdNm1FuFkNx+acV4zlCo1Q9eKj2prvco3VqfZsMsQ==
X-Received: by 2002:a17:90a:930e:: with SMTP id p14mr2731460pjo.132.1628863191115;
        Fri, 13 Aug 2021 06:59:51 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id a185sm2511961pfa.205.2021.08.13.06.59.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 06:59:50 -0700 (PDT)
Date:   Fri, 13 Aug 2021 21:59:44 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <20210813135943.GE6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
 <YRQcTLK1ffM1TEbX@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRQcTLK1ffM1TEbX@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 11, 2021 at 12:51:56PM -0600, Rob Herring wrote:
> On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> > The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> > managed through DSI link.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../bindings/display/panel/truly,nt35521.yaml | 62 +++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> > new file mode 100644
> > index 000000000000..4727c3df6eb8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/truly,nt35521.yaml
> > @@ -0,0 +1,62 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/truly,nt35521.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
> > +
> > +maintainers:
> > +  - Shawn Guo <shawn.guo@linaro.org>
> > +
> > +description: |
> > +  The Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel.  The panel backlight
> > +  is managed through DSI link.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: truly,nt35521
> > +
> > +  reg: true
> > +
> > +  reset-gpios: true
> > +
> > +  enable-gpios: true
> > +
> > +  pwr-positive5-gpios:
> > +    maxItems: 1
> > +
> > +  pwr-negative5-gpios:
> > +    maxItems: 1
> 
> Are these +/-5V supplies? If so, they should be modeled with 
> gpio-regulator perhaps unless the panel connection could only ever be 
> GPIOs.

Hi Rob,

The binding has been updated in v2 [1].  Please help review that.
Thanks!

Shawn

[1] https://lore.kernel.org/linux-arm-msm/20210809051008.6172-2-shawn.guo@linaro.org/T/#m587035a602b1be6c5326dcf24af01b3e8a5d2cc9

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - enable-gpios
> > +  - pwr-positive5-gpios
> > +  - pwr-negative5-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel@0 {
> > +            compatible = "truly,nt35521";
> > +            reg = <0>;
> > +            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
> > +            pwr-positive5-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
> > +            pwr-negative5-gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
> > +            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
> > +        };
> > +    };
> > +...
> > -- 
> > 2.17.1
> > 
> > 
