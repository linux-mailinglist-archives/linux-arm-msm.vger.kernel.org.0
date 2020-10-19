Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7EFB292EF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 21:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgJSTy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 15:54:58 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46484 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgJSTy6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 15:54:58 -0400
Received: by mail-oi1-f195.google.com with SMTP id l4so1250961oii.13;
        Mon, 19 Oct 2020 12:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e4J94wWgSsj19Lztka7Bia6MyVnqYmOwHNkLHwqtIG8=;
        b=T++KzZxTD/PdhcyHf16lTD+cW+DsDwwuq5VvOnBVp3I0PANylOlTNvCiHvcHREqV72
         seWqZayLszRrcdr/HMGCQF9Mbko0TmRW5xSDCiEr0GnI/DQChffugzZQb3feTIeqXPKF
         eA4P2Gr01NYQrZJ46wSUXMv6wky9haARTSTxDm3JhLURG8kyBtDh8+A0m3ADy48Ursaw
         eByxkoHxue1smhKPna3Z4H/z3tmp4ui2RJb+6ifVMYdDp8FK/yEpU3jYOZ7E4wAGi6fm
         z7xaPzkLyj0w1ZR+lUk+5JK8ZqsjB7bn9mN+HJaQfRLIZi5o6eeUjYclhRFmxeuWqQRt
         Rduw==
X-Gm-Message-State: AOAM533tNjPzCA3P+GFCicmpTLT6dGTgszZ2LYjWzf5a5GQ7c2KSjRAd
        fgLFCLPRT/FcFWDeyFVU2g==
X-Google-Smtp-Source: ABdhPJyqf4zni8HaE2/CuaZPgjWxMZQQ9i9WueUEa7ps6qjeJ9ymfTc4au9dhynaocUyBeRq2Z2e7g==
X-Received: by 2002:aca:2111:: with SMTP id 17mr678135oiz.139.1603137296324;
        Mon, 19 Oct 2020 12:54:56 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t84sm203608oih.35.2020.10.19.12.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 12:54:55 -0700 (PDT)
Received: (nullmailer pid 3503981 invoked by uid 1000);
        Mon, 19 Oct 2020 19:54:54 -0000
Date:   Mon, 19 Oct 2020 14:54:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v4 1/2] dt-bindings: spmi: document binding for the
 Mediatek SPMI controller
Message-ID: <20201019195454.GB3499610@bogus>
References: <1602864634-23489-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602864634-23489-2-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 17, 2020 at 12:10:33AM +0800, Hsin-Hsiung Wang wrote:
> This adds documentation for the SPMI controller found on Mediatek SoCs.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---

If you have a dependency such as the include, please note it here.

>  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> new file mode 100644
> index 000000000000..9945200a35b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek SPMI Controller Device Tree Bindings
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |+
> +  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
> +  for multiple SoCs to control a single SPMI master.

Need a $ref to spmi.yaml.

> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6873-spmi
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: "pmif"
> +      - const: "spmimst"

Don't need quotes

> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: "pmif_sys_ck"
> +      - const: "pmif_tmr_ck"
> +      - const: "spmimst_clk_mux"
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names

unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8192-clk.h>
> +
> +    spmi: spmi@10027000 {
> +        compatible = "mediatek,mt6873-spmi";
> +        reg = <0 0x10027000 0 0x000e00>,
> +              <0 0x10029000 0 0x000100>;
> +        reg-names = "pmif", "spmimst";
> +        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
> +                 <&infracfg CLK_INFRA_PMIC_TMR>,
> +                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
> +        clock-names = "pmif_sys_ck",
> +                      "pmif_tmr_ck",
> +                      "spmimst_clk_mux";
> +        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
> +        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
> +    };
> +...
> -- 
> 2.18.0
