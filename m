Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE9A3B38B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 23:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhFXVdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 17:33:46 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:35450 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhFXVdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 17:33:46 -0400
Received: by mail-il1-f174.google.com with SMTP id a11so7814763ilf.2;
        Thu, 24 Jun 2021 14:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O8EmC5jmhd3H2tbmN3mNHrPfEcvwMJRpkzyEy8i3V+E=;
        b=D3JV1aQlP/TmevTgrzZ1uT6v8pKsdotIlLWznBOSKpVhtDEFlshD9NKbJ7/7aBV3aY
         zDGZXQmIByKHxON6qPopbEmjYyLxZPPA4oAw7clC9hdR1BAhSVGP4WQz5f8Jp2U2zDiF
         XR7HFtas4XqlhAEmALbyFgezLshHdLZ6fuKlciL4Q3mXHQ+Mr1c8F04ADoVNoV30OAcz
         gIZVUDn5e3yvEhqzdfc3L62d+xWlu56uWGosYZNQq1ohETHzradrr1ixNO/I7wNifuXY
         vPiSBzRp4foHr8jZPRR3D4xKycvr7wacxpJbnznzi2Qkulf5Etce8zeAbmCw7dcZJYeF
         HxGw==
X-Gm-Message-State: AOAM532jhHdPR7dbQcJMX+2bCPO46Gfjc5TPPpyrcnXW9DlnfHnWMcPf
        wsLSHp5GF4bVnKYmtQj8AQ==
X-Google-Smtp-Source: ABdhPJyfC0XhMTfy1YhoujL5JpehdqKXMrHWs83jfIsPpv/8SunAVt0KZjArx8NQ2Mj1T8BTQVTMZw==
X-Received: by 2002:a92:2e08:: with SMTP id v8mr2143640ile.50.1624570285223;
        Thu, 24 Jun 2021 14:31:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d5sm2495355ilf.55.2021.06.24.14.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:31:24 -0700 (PDT)
Received: (nullmailer pid 2020523 invoked by uid 1000);
        Thu, 24 Jun 2021 21:31:19 -0000
Date:   Thu, 24 Jun 2021 15:31:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: msm: dsi: document phy-type property
 for 7nm dsi phy
Message-ID: <20210624213119.GA2017600@robh.at.kernel.org>
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617144349.28448-3-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 10:43:34AM -0400, Jonathan Marek wrote:
> Document a new phy-type property which will be used to determine whether
> the phy should operate in D-PHY or C-PHY mode.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-7nm.yaml         | 5 +++++
>  include/dt-bindings/phy/phy.h                                | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index c0077ca7e9e7..70809d1cac54 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -34,6 +34,11 @@ properties:
>      description: |
>        Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
>  
> +  phy-type:
> +    description: D-PHY (default) or C-PHY mode
> +    enum: [ 10, 11 ]
> +    default: 10
> +
>  required:
>    - compatible
>    - reg
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 887a31b250a8..f48c9acf251e 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -20,5 +20,7 @@
>  #define PHY_TYPE_XPCS		7
>  #define PHY_TYPE_SGMII		8
>  #define PHY_TYPE_QSGMII		9
> +#define PHY_TYPE_DPHY		10
> +#define PHY_TYPE_CPHY		11

I thought I recalled a suggestion to add 'MIPI_' in this. Or was there 
another similar patch? If not, I'm fine either way:

Acked-by: Rob Herring <robh@kernel.org>
