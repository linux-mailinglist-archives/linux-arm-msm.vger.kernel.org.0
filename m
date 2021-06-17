Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D65883AB96F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 18:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbhFQQWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 12:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbhFQQWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 12:22:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1999AC061574;
        Thu, 17 Jun 2021 09:20:03 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id f2so7415114wri.11;
        Thu, 17 Jun 2021 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mxhQgXhjJCcr434tkXcCOzOBhk7EomSUJf4aVJZ0wu0=;
        b=ZDSVR8M7c9hwiPzVzkhJiROl5H1QooUS4TuFwB42YX8EnKKWr4aqdasm4V7p/kq2Ul
         p37uiAe/5uuSuqzQume1QfTiTKToSFYMLErGn4deZLc5Jtd5xMJgcQiCNPT1BeQ5T0rL
         olrEIonYkKBZvFVm3zMhsYfFv58SjXuMaJQedm7LPaa/BhFcIXiq2iwCvDeSu+HOaRT8
         d9sbrZOrT/i7nPLjV3ErhIcI7hXY8BO2Wg5qqIdkoX3vGXFzmycDc53lODBmI5x7CUja
         fQoDcO+YVyETYerBoMwnNWbp2BVhCoQZcWtVlqmM3pVT0Q7/ZNEbJmmR7lJ//5lrlR7D
         j0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mxhQgXhjJCcr434tkXcCOzOBhk7EomSUJf4aVJZ0wu0=;
        b=pIShb3OGqA6cK7UHhKKyRpUQMsN8Jhx28crk8cebk1CJvDqcJoH5C+3wG8TlfTH2Au
         G0WDZ4j8/f1Mp3JvJ8rqC32rkSkO4m1f+4/JudopCNGzEwqT44l+MXM85OFA7gn4BIIC
         Qb6nKTs6o4YbXHPTXVeobOQ03P38DSaMZ8TpNzRbkVPrTtCujWPyoFwu+A/zmJSneFtX
         BpfZjXjexRbEl7cfo689QEcE+CgaFra1fNRCDtUj5cwvEtiboY3NtZP+zgRC9OgoaRRR
         usDwp04Dd0KXk/KJmxZnT3yR3ggsxZp7Xcqtx3sOCT1AsWA90cZkV+1NgyCLOqmlu1Il
         ygRQ==
X-Gm-Message-State: AOAM532753g47xp1HVfpcWuIX5FsADFzGacPBFN54z4tQxcK1WtxfGpk
        mQIsx6GBe2uIKtp6IVvRM3XSWkPV0XpL3l9vcHE=
X-Google-Smtp-Source: ABdhPJwH6yGOAV8Zq/2asUXPC7c2rWQDMRFg9nKCg8VonF7EWFPVJkcadbn/fE/Noz0DAZm8/FK7wOed0dxi/3qvrJU=
X-Received: by 2002:a5d:4203:: with SMTP id n3mr6812885wrq.132.1623946801650;
 Thu, 17 Jun 2021 09:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210617144349.28448-1-jonathan@marek.ca> <20210617144349.28448-2-jonathan@marek.ca>
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 17 Jun 2021 09:23:56 -0700
Message-ID: <CAF6AEGsaPK4mev5o4DoE5R=tbczQB6z+Qem3gpxNW52uwf=71A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 8:09 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> These got lost when going from .txt to .yaml bindings, add them back.
>

Fixes: 8fc939e72ff8 ("dt-bindings: msm: dsi: add yaml schemas for DSI
PHY bindings")

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> new file mode 100644
> index 000000000000..c0077ca7e9e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 7nm PHY
> +
> +maintainers:
> +  - Jonathan Marek <jonathan@marek.ca>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-7nm
> +      - const: qcom,dsi-phy-7nm-8150
> +
> +  reg:
> +    items:
> +      - description: dsi phy register set
> +      - description: dsi phy lane register set
> +      - description: dsi pll register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vdds-supply:
> +    description: |
> +      Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vdds-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible = "qcom,dsi-phy-7nm";
> +         reg = <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94900 0x260>;
> +         reg-names = "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells = <1>;
> +         #phy-cells = <0>;
> +
> +         vdds-supply = <&vreg_l5a_0p88>;
> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names = "iface", "ref";
> +     };
> --
> 2.26.1
>
