Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD87389741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 22:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbhESUDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 16:03:21 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41581 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232548AbhESUDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 16:03:19 -0400
Received: by mail-oi1-f181.google.com with SMTP id c3so14219134oic.8;
        Wed, 19 May 2021 13:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Kjcp8Kbu/gHUzT4EN3gAJeFDCsJxXxZEegj91MDV0s=;
        b=uCG53rbHsiOuh3CmnPPKhkhfBfW1aYrWUpNSHwJH1nCAN+lPHIJl0qT2OGzr5POEaD
         hQmSuOxoqb9dfZ5AaMwXmv58/zbJuOUHGe/6S68tH74yxS1scRq4i7NnTI0kKwEGW4rl
         Ykf8jH2ZLla4KHZtU4bLj1E8/3bSbLtFwpe//Hod6yq+XkrpQbtEV+WQD1lR7uUMwtl+
         bdWn7EB0CH0MwuKHz7imHwte/FBQeUZUyqQ/Ux/N18QSA9Iumfaci6w9gimiGxgYeFTC
         oVzoumDSG227hG05PyiUvsDXwOO8x/fB0gRabC2FrpE8zRvOzI79Qe1v8t+odnIv/4mW
         FujA==
X-Gm-Message-State: AOAM533TCcD4kNhxjFblL6gkKmnm1rUaOUs32/vBX4PtHjR+7FxZTREp
        zMyoMXjwqPktUhIyun8+Nw==
X-Google-Smtp-Source: ABdhPJydgRnEx3u0Yk7JGxUcjCToYZAuHSoyNE8WhQh23y3bTA4GIZ9QjzcusOLgg0cgOuCwZQ3YAg==
X-Received: by 2002:a05:6808:309:: with SMTP id i9mr731417oie.14.1621454518528;
        Wed, 19 May 2021 13:01:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm164017ots.10.2021.05.19.13.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 13:01:57 -0700 (PDT)
Received: (nullmailer pid 3552474 invoked by uid 1000);
        Wed, 19 May 2021 20:01:56 -0000
Date:   Wed, 19 May 2021 15:01:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Lyude Paul <lyude@redhat.com>,
        Thierry Reding <treding@nvidia.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Linus W <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org, robdclark@chromium.org,
        Steev Klimaszewski <steev@kali.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Sandeep Panda <spanda@codeaurora.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add
 aux-bus child
Message-ID: <20210519200156.GA3535665@robh.at.kernel.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 17, 2021 at 01:09:00PM -0700, Douglas Anderson wrote:
> We want to be able to list an eDP panel as a child of a ti-sn65dsi86
> node to represent the fact that the panel is connected to the bridge's
> DP AUX bus. Though the panel and the bridge chip are connected in
> several ways, the DP AUX bus is the primary control interface between
> the two and thus makes the most sense to model in device tree
> hierarchy.
> 
> Listing a panel in this way makes it possible for the panel driver to
> easily get access to the DP AUX bus that it resides on, which can be
> useful to help in auto-detecting the panel and for turning on various
> bits.
> 
> NOTE: it's still possible to continue using the bridge chip and point
> to a panel that _isn't_ listed as a child of the bridge chip (since
> it's worked that way previously), but that should be deprecated since
> there is no downside to listing the panel under the bridge chip.
> 
> The idea for this bus's design was hashed out over IRC [1].
> 
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Possibly we might want something fancier that could be included by
> other eDP controller bindings. If we want to do this, I'd love to be
> pointed at a good example to follow.
> 
> Changes in v7:
> - ti-sn65dsi86: Add aux-bus child patch new for v7.
> 
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 26932d2e86ab..51f5a29e216c 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -70,6 +70,11 @@ properties:
>      const: 1
>      description: See ../../pwm/pwm.yaml for description of the cell formats.
>  
> +  aux-bus:

As this is a node:

type: object

> +    description:
> +      It is recommended that you place your panel under the aux-bus node
> +      here to represent the control hierarchy.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> @@ -201,11 +206,26 @@ examples:
>  
>            port@1 {
>              reg = <1>;
> -            endpoint {
> +            sn65dsi86_out: endpoint {
>                remote-endpoint = <&panel_in_edp>;
>              };
>            };
>          };
> +
> +        aux-bus {
> +          panel {

We should perhaps have a separate aux-bus schema. Something should 
define the child node is 'panel' and nothing else. Though perhaps 
connectors are valid too?

> +            compatible = "boe,nv133fhm-n62";
> +            power-supply = <&pp3300_dx_edp>;
> +            backlight = <&backlight>;
> +            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +              panel_in_edp: endpoint {
> +                remote-endpoint = <&sn65dsi86_out>;
> +              };
> +            };
> +          };
> +        };
>        };
>      };
>    - |
> -- 
> 2.31.1.751.gd2f1c929bd-goog
> 
