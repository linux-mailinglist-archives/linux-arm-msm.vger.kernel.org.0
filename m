Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E7E3A0540
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 22:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhFHUtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 16:49:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53024 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhFHUtN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 16:49:13 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FD3C3E6;
        Tue,  8 Jun 2021 22:47:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623185238;
        bh=nL94lwxiZDx7hO51vSX7RllgqbEzWiXMfFLGeKO44RU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LqehrYH7+bNvxnCFiQRU5fOnAU8KAbzQFhAmjEpkGwrRsydbIiNAxFHhFDXenTXD3
         n6J0D/aEgZ2SJklelIKb8IWd1J7FBRkKGzPRnTIf89afSIo+VcOQTIa3IXSSJfbWQK
         J1f7W0/ODl1SjdZjDcwJnS1XftTAUlSoAnj1gfM0=
Date:   Tue, 8 Jun 2021 23:47:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
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
Message-ID: <YL/XRsiShrCJOadW@pendragon.ideasonboard.com>
References: <20210608195342.18269-1-jonathan@marek.ca>
 <20210608195342.18269-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210608195342.18269-3-jonathan@marek.ca>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jonathan,

Thank you for the patch.

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

The MIPI D-PHY and C-PHY apply to both DSI and CSI. I'd name this
PHY_TYPE_DPHY and PHY_TYPE_CPHY, or possibly, PHY_TYPE_MIPI_DPHY and
PHY_TYPE_MIPI_CPHY, without a DSI prefix. With this addressed and the DT
bindings updated accordingly,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(You may be asked to split this in two patches though, not sure)

>  #endif /* _DT_BINDINGS_PHY */

-- 
Regards,

Laurent Pinchart
