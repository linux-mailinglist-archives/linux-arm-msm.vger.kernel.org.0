Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B47483DD751
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 15:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233907AbhHBNj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 09:39:56 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:39818 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbhHBNjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 09:39:55 -0400
Received: by mail-il1-f182.google.com with SMTP id r1so16429414iln.6;
        Mon, 02 Aug 2021 06:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rIgerFBPFG2F9JHKS0RXhQgm9UjUmaIoJdpDfrB/Eqg=;
        b=otTBeVwKBaZlVRQKerRBen12EenCc/JWe+nEEfKaxFiiJ3BZOkY2fXH0wAjp9kMXxB
         i9Y6Jy34EB74jYmczvH+DRtt+qeP2P+7J0SgT4GUh160bkHIxgQdTXmtNBigK2aAYLnA
         3g+ILu2oBV1Lk7r1b4o8t//hpVf8TwyH/ljt1yLdRe/0Udzg48LUs74/8sGfKZBdZLf4
         oBViYQPrpyrc/iSZVyGbcmnyhzLh+S4EU48X4SijT4EOuPiLHBITNMMfV+9bzHg6IvWO
         BpCiwY0u4kEXNqB62OARhJkUUcdpu9NSQ97qHcSvHiC0sNZBkveP7joQc00mie4VFlLr
         oX4w==
X-Gm-Message-State: AOAM533XiaaX+WSvPOszUkPB493eGyWv283+GcVv9wLtLDccHef68jBk
        afToQI58vWexAMeJ2wqc6g==
X-Google-Smtp-Source: ABdhPJz/WMoUM2rQxLxKe8Oz1HHj/sv39dQtPlrv+f+AFL8gZ4W8A2ixxXUb1j/rukgizJUiX5ZsrA==
X-Received: by 2002:a92:d790:: with SMTP id d16mr1160275iln.185.1627911586130;
        Mon, 02 Aug 2021 06:39:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 125sm7415955iow.9.2021.08.02.06.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 06:39:45 -0700 (PDT)
Received: (nullmailer pid 918759 invoked by uid 1000);
        Mon, 02 Aug 2021 13:39:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Linus W <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20210730142537.v2.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
References: <20210730212625.3071831-1-dianders@chromium.org> <20210730142537.v2.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid>
Subject: Re: [PATCH v2 1/6] dt-bindings: drm/panel-simple: Introduce generic eDP panels
Date:   Mon, 02 Aug 2021 07:39:43 -0600
Message-Id: <1627911583.050984.918758.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jul 2021 14:26:20 -0700, Douglas Anderson wrote:
> eDP panels generally contain almost everything needed to control them
> in their EDID. This comes from their DP heritage were a computer needs
> to be able to properly control pretty much any DP display that's
> plugged into it.
> 
> The one big issue with eDP panels and the reason that we need a panel
> driver for them is that the power sequencing can be different per
> panel.
> 
> While it is true that eDP panel sequencing can be arbitrarily complex,
> in practice it turns out that many eDP panels are compatible with just
> some slightly different delays. See the contents of the bindings file
> introduced in this patch for some details.
> 
> The fact that eDP panels are 99% probable and that the power
> sequencing (especially power up) can be compatible between many panels
> means that there's a constant desire to plug multiple different panels
> into the same board. This could be for second sourcing purposes or to
> support multiple SKUs (maybe a 11" and a 13", for instance).
> 
> As discussed [1], it should be OK to support this by adding two
> properties to the device tree to specify the delays needed for
> powering up the panel the first time. We'll create a new "edp-panel"
> bindings file and define the two delays that might need to be
> specified. NOTE: in the vast majority of the cases (HPD is hooked up
> and isn't glitchy or is debounced) even these delays aren't needed.
> 
> [1] https://lore.kernel.org/r/CAD=FV=VZYOMPwQZzWdhJGh5cjJWw_EcM-wQVEivZ-bdGXjPrEQ@mail.gmail.com
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - No longer allow fallback to panel-simple.
> - Add "-ms" suffix to delays.
> 
>  .../bindings/display/panel/panel-edp.yaml     | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/panel/panel-edp.example.dt.yaml: bridge@2d: 'aux-bus' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1511822

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

