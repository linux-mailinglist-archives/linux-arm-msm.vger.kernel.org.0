Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF0E3A1F88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhFIV7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:59:33 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44669 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFIV7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:59:31 -0400
Received: by mail-ot1-f51.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso9258483otm.11;
        Wed, 09 Jun 2021 14:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c7WxSL952AsDBW+4Q+slVrXXE4mBT22/Jigijej7zVs=;
        b=QvwudXpefizh5l8ptOup9n7sjq6enz5kIftWOR/AAF2RV8PR7lzyMAl/cEdqMC+aO5
         5HplrVFCWTaYpMaohtDfEU6Z/f9dOyBY8QVWgH1fj0ZL8/y0F+rEpX8sJTonk8qjWiR+
         K+UEAOP18hou7oCNqfnE0gB9qklfnfdYPd3r1UbcebwmeJ02LYQXroK/EjvbwU15XutP
         a8sNIaQbXcqKAQin60AHoYWO6ffNZWW2WeOGC9cIjK6fuT4DgmPeJoP7F2l2hfgrv3UR
         DvQRg9BAGZofMYz0GhvGvDqmScTs+SsAJnIjZBLfCAj0RdmefOo3gS0fWC2yUWORUyDa
         nelg==
X-Gm-Message-State: AOAM531pKC4EffGWMtzYBD6Mgip9q0Yi7OGA5haILB4znJjGXvKVs3wv
        j/4U5+MNHS2BMRwMJtIrPw==
X-Google-Smtp-Source: ABdhPJy6bcqCt9Nr7mez/COGdYXUV+b7ETIQSyxBwcojEj07xvqX689RWOJae7Mqf1SPDoohBZOb8Q==
X-Received: by 2002:a9d:355:: with SMTP id 79mr1336380otv.101.1623275846809;
        Wed, 09 Jun 2021 14:57:26 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k8sm198439ool.5.2021.06.09.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:57:25 -0700 (PDT)
Received: (nullmailer pid 168056 invoked by uid 1000);
        Wed, 09 Jun 2021 21:57:24 -0000
Date:   Wed, 9 Jun 2021 16:57:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: msm: dsi: document phy-type property
 for 7nm dsi phy
Message-ID: <20210609215724.GA163102@robh.at.kernel.org>
References: <20210608195342.18269-1-jonathan@marek.ca>
 <20210608195342.18269-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608195342.18269-3-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 08, 2021 at 03:53:28PM -0400, Jonathan Marek wrote:
> Document a new phy-type property which will be used to determine whether
> the phy should operate in D-PHY or C-PHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml          | 4 ++++
>  include/dt-bindings/phy/phy.h                                 | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index bf16b1c65e10..d447b517ea19 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -34,6 +34,10 @@ properties:
>      description: |
>        Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
>  
> +  phy-type:
> +    description: |
> +      D-PHY (default) or C-PHY mode: PHY_TYPE_DSI_DPHY or PHY_TYPE_DSI_CPHY

Don't write prose for what can be schema. Unfortunately, can't do 
defines here, but you need:

enum: [ 10, 11 ]
default: 10

> +
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 887a31b250a8..b978dac16bb8 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -20,5 +20,7 @@
>  #define PHY_TYPE_XPCS		7
>  #define PHY_TYPE_SGMII		8
>  #define PHY_TYPE_QSGMII		9
> +#define PHY_TYPE_DSI_DPHY	10
> +#define PHY_TYPE_DSI_CPHY	11
>  
>  #endif /* _DT_BINDINGS_PHY */
> -- 
> 2.26.1
