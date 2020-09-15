Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7337A26AB24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 19:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgIORwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 13:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727920AbgIORsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 13:48:33 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4ED7C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 10:48:23 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id o16so5121087qkj.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PMuG0obES1mSU4p2Bpr9xG7rtnzSIk+zV1FaePqSpAg=;
        b=Hp9J3dEGpH2Tmiz9hu0LHBSu9dMuxfgzHEHC6EExeypCNaNj4GXYK7uTRowjOfqWTJ
         6paAY39WTSiWMWBKsQ/MzVdwZDyQbM6Jwx9zVZhY8QTnqMonYJ5u4kg5B3UTHxAJnWbW
         2t3bHz7zY2M7AOdSWlhKIVVIxkBGNpGtDaZIuv86g+tOyMut4zFas1uLfddUe0ux4Lpc
         GCdobFHAeTK029mmYVLioLA8QV7OL0zwrjP91ov5EcQvbVif/99cR8VooqMbZRpxxBd2
         2Zl0dY+YD4haUWXc4hP73sHe0X8cXKlZz+kBGw5lvL03nr073GrKUdq0Y/ZyxD/nnOgR
         4evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PMuG0obES1mSU4p2Bpr9xG7rtnzSIk+zV1FaePqSpAg=;
        b=H69dTD6cLNLGFRMAbbuv2PJPSNTGBUSp/IdrPAMy+fnT0Z0NDiKTK9BuHSPaaZPSjI
         mn8qfEb2ZBXs/HKaiDyEazNcktmP3q0blHYLpuYQDPK1U9iuCKAqPbXarzuZZAXnp3A0
         TTzHJMKrNftaHOAdMZ0Tcwr+4Mr1lxX2BrMAahiQjnKmyVY4Glm4IHkGDKSWWKLCcWfA
         Jo6lZimR00ESXSZ7N+Uw9P6+Ix0DAsybYVFLk84VBLBC96t19w9gLIIsHvLm9vGIoVGS
         oFXIHbZ1t00RLMaQRisNYSbwCW6keyn4uXm0gJjzzOJGRKIcuLQ4ltnTdISEIR24AaI9
         VVIQ==
X-Gm-Message-State: AOAM531s9+YufVXUiYkUuZIaFtB0f0U8s70b481COLHVPvlevc2yzj4q
        lYLXmDIYz+RDdfZabdCzOFR1kw==
X-Google-Smtp-Source: ABdhPJxTTAbFFmxhibWA9gq1WRKxKHcXRLCjzzCKT74WJ3jv9tDtGRFixbfDx/V4RZZsonZeQCirCA==
X-Received: by 2002:a37:8404:: with SMTP id g4mr7503354qkd.63.1600192103023;
        Tue, 15 Sep 2020 10:48:23 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id z19sm17735949qtb.37.2020.09.15.10.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 10:48:22 -0700 (PDT)
Date:   Tue, 15 Sep 2020 17:48:20 +0000
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for LT9611UXC
Message-ID: <20200915174820.GI478@uller>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
 <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 09 Sep 09:28 UTC 2020, Dmitry Baryshkov wrote:

> Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output. The LT9611UXC chip is
> handled by a separate driver, but the bindings used are fully compatible
> with the LT9611 chip, so let's reuse the lt9611.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index d60208359234..7a1c89b995e2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,18 +4,19 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9611 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  description: |
> -  The LT9611 is a bridge device which converts DSI to HDMI
> +  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
> +      - lontium,lt9611uxc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.28.0
> 
