Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B77C4397B78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 22:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234707AbhFAVAd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 17:00:33 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:33654 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234638AbhFAVAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 17:00:33 -0400
Received: by mail-ot1-f52.google.com with SMTP id l19-20020a0568301553b02903beaa8d961aso634802otp.0;
        Tue, 01 Jun 2021 13:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mFVgXK4P9/P196d6q38oyDpnHkvZz1jGfjrbZohVPy8=;
        b=oZebr1t4L3KpYIwM87E8veHoFItWVz59cRvZhh+/ZTdOjhQjbY9ZT63wYl9aisNzUr
         PIdSoH2ojK5fYp5sCvjJdXeKVdiFteBvpVw/362vhQv0HmB2iaHXkOuYImcBsyMa/BgE
         Zti81N5/dFTSPw0NFFRiIASGzoCaej/veNVvacc31h4Eer/lJskn2juir46uVUCRvKGe
         UfhsbSslAiD3qw9R2KYbhUnPPoX/1a6VlNixrgiDF6g4n8Y2ldiwGNTupQPFhT3QlD5h
         vdEeGCv5OlA8EmstKkdcX96u41b6BlG53oKRYJZLQYPFa2yafnkJwiv/EyaVdM/AvecK
         7L2g==
X-Gm-Message-State: AOAM532VFjDzkWYPveRA45nqra5FVD5ci4XAmNLjtHvzsyPZ9SIac0gA
        gHaP9KX6zDpWHCKn8LKhRw==
X-Google-Smtp-Source: ABdhPJwSDOHE2U3w/uzQOBXamMUbXVw3E+ghXWqjym71F23AjO+4al6m1BHPI6Gog/151NLhLbohIg==
X-Received: by 2002:a05:6830:611:: with SMTP id w17mr22894682oti.225.1622581130059;
        Tue, 01 Jun 2021 13:58:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a14sm3956610otl.52.2021.06.01.13.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 13:58:49 -0700 (PDT)
Received: (nullmailer pid 1030577 invoked by uid 1000);
        Tue, 01 Jun 2021 20:58:48 -0000
Date:   Tue, 1 Jun 2021 15:58:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        abhinavk@codeaurora.org, kalyan_t@codeaurora.org,
        mkrishn@codeaurora.org, jonathan@marek.ca
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
Message-ID: <20210601205848.GA1025498@robh.at.kernel.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:
> Add YAML schema for the device tree bindings for MSM 7nm DSI PHY driver.
> 
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> new file mode 100644
> index 00000000..f17cfde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 7nm PHY
> +
> +maintainers:
> +  - Rajeev Nandan <rajeevny@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-7nm

When would one use this?

> +      - const: qcom,dsi-phy-7nm-7280
> +      - const: qcom,dsi-phy-7nm-8150

These don't look like full SoC names (sm8150?) and it's 
<vendor>,<soc>-<block>.

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
> +    description: Phandle to 0.9V power supply regulator device node.
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
> +     #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible = "qcom,dsi-phy-7nm-7280";
> +         reg = <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94900 0x280>;
> +         reg-names = "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells = <1>;
> +         #phy-cells = <0>;
> +
> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names = "iface", "ref";
> +
> +         vdds-supply = <&vreg_l10c_0p8>;
> +     };
> +...
> -- 
> 2.7.4
