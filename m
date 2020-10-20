Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B469293FA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 17:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436503AbgJTPhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 11:37:15 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36899 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436500AbgJTPhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 11:37:15 -0400
Received: by mail-ot1-f67.google.com with SMTP id m22so2114674ots.4;
        Tue, 20 Oct 2020 08:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g4B3H2YyTXqBLgg1wF4uxkPxqRZVivqfWeJYJsXlNNE=;
        b=dKHGQlIAotE7rD3JyLNgNGBA7nHseAtDe075fWDyD68Ze9y0psTI75BtsJPeBnG19c
         DGN66IYA13642bvSknn0yC5ez6C3d6BB3JvFuTEDIC8NNDQwpMDJZqWFmy9Es9O6AV7w
         I6kmSlWplAzMmTAFoGTHqO0fxzh1t0gDzhZHfVXCl7OPqOSo7u8jxT75cizdwk9orPbZ
         ryRYZ+oN9ed3/NpcgNfCsn2gMTu+SrE2RroPL2IkLt7CFdCvThVknAr8X4r+HyIY0Fd4
         MEYsM5e0Pntfswsd7sNiPE5JpkoTlw9NFSpsI4NsATDLHqGC50GWPkvU+tk2X0oVPs9n
         mwmQ==
X-Gm-Message-State: AOAM530YINcK54/iLylWrVGMysxTnaW3GxopP7VGHPl8JU01OV7mAN3S
        l5yi5MGHz/z6NwuoH1RStQ==
X-Google-Smtp-Source: ABdhPJzJLEvPTM2atQsX36mX0hN4YdP/3drHQ23QZjJYMNFXExKWGkmuVNrhKAKbB6OQjr9eitHk0A==
X-Received: by 2002:a9d:1ee5:: with SMTP id n92mr1552389otn.152.1603208233680;
        Tue, 20 Oct 2020 08:37:13 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n1sm497370otr.16.2020.10.20.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 08:37:12 -0700 (PDT)
Received: (nullmailer pid 884187 invoked by uid 1000);
        Tue, 20 Oct 2020 15:37:06 -0000
Date:   Tue, 20 Oct 2020 10:37:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v2 2/3] dt-bindings: regulator: document binding for
 MT6315 regulator
Message-ID: <20201020153706.GB876906@bogus>
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603187810-30481-3-git-send-email-hsin-hsiung.wang@mediatek.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 20, 2020 at 05:56:49PM +0800, Hsin-Hsiung Wang wrote:
> Add device tree binding information for MT6315 regulator driver.
> Example bindings for MT6315 are added.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../regulator/mtk,mt6315-regulator.yaml       | 88 +++++++++++++++++++
>  include/dt-bindings/regulator/mtk,mt6315.h    | 17 ++++
>  2 files changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mtk,mt6315.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
> new file mode 100644
> index 000000000000..457606800d5b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mtk,mt6315-regulator.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mtk,mt6315-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6315 Regulator
> +
> +maintainers:
> +  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> +
> +description: |
> +  The MT6315 is a power management IC (PMIC) configurable with SPMI.
> +  that contains 4 BUCKs output which can combine with each other
> +  by different efuse settings.
> +
> +allOf:
> +  - $ref: "regulator.yaml#"

This doesn't go here, but...

> +
> +properties:
> +  $nodename:
> +    pattern: "mt6315@[0-9]"
> +  compatible:
> +    enum:
> +      - mediatek,mt6315_3-regulator
> +      - mediatek,mt6315_6-regulator
> +      - mediatek,mt6315_7-regulator

What's 3, 6, 7 mean?

> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description: List of regulators and its properties
> +
> +    patternProperties:
> +      "^vbuck[1-4]$":
> +        type: object

regulator.yaml ref goes here.

> +
> +        properties:
> +          regulator-name:
> +            pattern: "^vbuck[1-4]$"
> +            description:
> +              should be "vbuck1", ..., "vbuck4"
> +
> +          mtk,combined-regulator:
> +            $ref: "/schemas/types.yaml#/definitions/uint32-array"

Wouldn't a phandle make more sense. And we have coupled regulator 
binding that this may work for.

> +            description: |
> +              defines other bucks combined with this buck, must contain the following
> +              values MT6315_VBUCK1, MT6315_VBUCK2, MT6315_VBUCK3, MT6315_VBUCK4
> +
> +    unevaluatedProperties: false

'additionalProperties: false' would be better here.

> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* This example shows that buck2 and buck4 are combined into buck1. */
> +    #include <dt-bindings/regulator/mtk,mt6315.h>
> +
> +    mt6315@6 {

pmic@6

> +      compatible = "mediatek,mt6315_6-regulator";
> +      reg = <0x6 0 0xb 1>;
> +
> +      regulators {
> +        vbuck1 {
> +          regulator-compatible = "vbuck1";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +          mtk,combined-regulator = <MT6315_VBUCK2 MT6315_VBUCK4>;
> +        };
> +
> +        vbuck3 {
> +          regulator-compatible = "vbuck3";
> +          regulator-min-microvolt = <300000>;
> +          regulator-max-microvolt = <1193750>;
> +          regulator-enable-ramp-delay = <256>;
> +          regulator-allowed-modes = <0 1 2 4>;
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/regulator/mtk,mt6315.h b/include/dt-bindings/regulator/mtk,mt6315.h
> new file mode 100644
> index 000000000000..6ed9b2b121db
> --- /dev/null
> +++ b/include/dt-bindings/regulator/mtk,mt6315.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_MTK_MT6315_H
> +#define _DT_BINDINGS_REGULATOR_MTK_MT6315_H
> +
> +/* Regulator ID */
> +#define MT6315_VBUCK1	1
> +#define MT6315_VBUCK2	2
> +#define MT6315_VBUCK3	3
> +#define MT6315_VBUCK4	4

I don't find these defines to be that helpful.

> +#define MT6315_VBUCK_MAX	5
> +
> +#endif /* _DT_BINDINGS_REGULATOR_MTK_MT6315_H */
> -- 
> 2.18.0
