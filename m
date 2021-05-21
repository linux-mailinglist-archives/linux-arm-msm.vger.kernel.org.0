Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C28F038CBE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 19:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238162AbhEURTr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 13:19:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238147AbhEURTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 13:19:43 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC75C06138A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 10:18:19 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id y76so11040073oia.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
        b=jualahogEVesPIS1gieZtC1DETW5VCcI+hWyJqH0Kdjum2lD+UwbPEbKgqxu7GcmRI
         pHz3Gd6XgJQGv0HVfnMeiKuAAmPge4eHFybgu34Ra+YEqSSGRQ7w5SNmzzTlkAEn8uJT
         wSXoTlG2XmtPpOywIe803JpKMa8vjwuDJ7zTX6z1K431z68kCNBsqNKz76tKz43AxutL
         uDNyXegyJ2L9vg2x5VWLFNkw1+SJF/GTMXvWehvvKArrotqAf2ofM+M4Q1Ib+jAx0B+u
         +vo7SWqkp9zwx/QWUyhMHfr5OZfjGlHaEoUL/25wAGR0kRG9Q6vLurVTiTzPMlA/r4DF
         80zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
        b=gD27A8bv5Ad8LwzXs3CpKtq49Rj1sl55avIjAIUemqsFXA+klz9O1iK7Ce3PGVeMyq
         hK63PIroXRsc80xJy0a1iTASUsWgI5VdZwJa9S4aa/d+SkAK/FPoqoOOtbVhbPcp7SA+
         IJlM41i1oj1UWwX+lGU5/fTgPAPVl1lIXGK3eetnHZCnUlU5YBuJFKApL9y2wOAuqzXx
         GWD98sqQ2EiPsSQKhTFudzujqxqeTDbWFGPAqSNFALEIGb5pGtcD/0ZVH7UkZ2VJMoqA
         1iRe2LdRZhQWv1UPUKzCM0Uso8OqWWU+ioWiEcXJDhaXtPxqeWAnC3NLR9s2JAl/6xXY
         7XDg==
X-Gm-Message-State: AOAM532AbfPgtTpbv+BzcJyp7t0BRhUQballU61x+WoiI75lsDDRpVzo
        N+IkIrqhhC7+QgXDUXH22y+G4A==
X-Google-Smtp-Source: ABdhPJwgfHYqvQ5wMl38vkWZL9zz0zUQ+NMWGofTkepeO9trJy2uIAEJzA/Kkl4P5rhSVJIkkVUw9w==
X-Received: by 2002:a05:6808:4c2:: with SMTP id a2mr2930417oie.150.1621617499278;
        Fri, 21 May 2021 10:18:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w198sm1215089oie.26.2021.05.21.10.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 10:18:18 -0700 (PDT)
Date:   Fri, 21 May 2021 12:18:16 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, swboyd@chromium.org, vinod.koul@linaro.org,
        dianders@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
        sean@poorly.run, robh@kernel.org
Subject: Re: [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210521171816.GD2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:

> Add YAML schema for the device tree bindings for DSI PHY.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
> 
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> 
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
> 
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
> 
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
> 
> Changes in v6:
>    - Add proper compatible string in example
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
>  5 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..4a26bef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 10nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
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
> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target

"Reference to the 0.9V supply for the PLL." would have been sufficient.

But overall I think the patch looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
