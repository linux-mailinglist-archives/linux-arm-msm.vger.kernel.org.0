Return-Path: <linux-arm-msm+bounces-2164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707A7FAD38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 23:16:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EC6BB21468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 22:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A848CDA;
	Mon, 27 Nov 2023 22:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF181BCE;
	Mon, 27 Nov 2023 14:16:14 -0800 (PST)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6d30d9f4549so2993687a34.0;
        Mon, 27 Nov 2023 14:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701123374; x=1701728174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ni+QM1NQCcgkAj/8RAaEXHLHTHpEmfsdhBRgD9S0obg=;
        b=aAUdhvHMzesr6eK1rypc9HjL2RinBf+ZsMRoGI3MKGEvFjbmbVqSNGQIw6khZIFe0F
         6IoxYf6U58WGTwRAchrZYAv1LRwYQWZvRUZCrfE9tbeY/VHNqEnvPyGKi8JGozCLnbD/
         /HfBCiDVO3oLu4TPenZQdG55WKymnX8fKYOxQwSv+PUwZpnxY/4PQEhqhD3k4Ja1ds7g
         GqYsAsrpXiz7f4ldNfnQbpuFbNsY10VJTyjiNLh+clamSGeuJGKpFgciBbp1PtKjpxT2
         ySrtVjMMxT3kv7zDiRICFe9rMNS4gWI+xakgm0BNcf/4rBVB+N9Kja9W4UnPdTHGVf0w
         fi7A==
X-Gm-Message-State: AOJu0YwSOQbn1CBvjJGrnIO3xf8gxWtEzbVi/d7n41fmgAcLZ7wuQa6B
	ix+qlie+mwEUOB1mgsZRMg==
X-Google-Smtp-Source: AGHT+IGUTejt/8I/FkmEAVJmTD9AFB5fYEWb//1MrwvjzlCkYslMTEoW/bdzPOLIYsPc065LFT0e5A==
X-Received: by 2002:a05:6830:1e39:b0:6d3:a8b:b34 with SMTP id t25-20020a0568301e3900b006d30a8b0b34mr15059347otr.5.1701123373505;
        Mon, 27 Nov 2023 14:16:13 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s12-20020a056830438c00b006ce2f0818d3sm1497262otv.22.2023.11.27.14.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 14:16:12 -0800 (PST)
Received: (nullmailer pid 4135204 invoked by uid 1000);
	Mon, 27 Nov 2023 22:16:11 -0000
Date: Mon, 27 Nov 2023 16:16:11 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231127221611.GA4023452-robh@kernel.org>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-2-ansuelsmth@gmail.com>

On Sun, Nov 26, 2023 at 02:53:39AM +0100, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. The special node describe a container of PHY that
> share common properties. This is a generic schema and PHY package
> should create specialized version with the required additional shared
> properties.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.
> 
> The PHY package node MUST declare the base address used by the PHY driver
> for global configuration by calculating the offsets of the global PHY
> based on the base address of the PHY package and declare the
> "ethrnet-phy-package" compatible.
> 
> Each reg of the PHY defined in the PHY package node is absolute and will
> reference the real address of the PHY on the bus.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-phy-package.yaml    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> new file mode 100644
> index 000000000000..244d4bc29164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Package Common Properties
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description:
> +  This schema describe PHY package as simple container for
> +  a bundle of PHYs that share the same properties and
> +  contains the PHYs of the package themself.
> +
> +  Each reg of the PHYs defined in the PHY package node is
> +  absolute and describe the real address of the PHY on the bus.
> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy-package(@[a-f0-9]+)?$"
> +
> +  compatible:
> +    const: ethernet-phy-package

In case I wasn't clear, but that compatible is a NAK.

> +
> +  reg:
> +    minimum: 0
> +    maximum: 31

Pretty sure the bus binding already provides these constraints.

> +    description:
> +      The base ID number for the PHY package.
> +      Commonly the ID of the first PHY in the PHY package.
> +
> +      Some PHY in the PHY package might be not defined but
> +      still exist on the device (just not attached to anything).
> +      The reg defined in the PHY package node might differ and
> +      the related PHY might be not defined.
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0

You are implementing a secondary MDIO bus within this node. It needs a 
$ref to mdio.yaml instead of defining the bus again implicitly.

> +
> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: ethernet-phy.yaml#
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package@16 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "ethernet-phy-package";
> +            reg = <0x16>;
> +
> +            ethernet-phy@16 {
> +              reg = <0x16>;
> +            };
> +
> +            phy4: ethernet-phy@1a {
> +              reg = <0x1a>;
> +            };

This example on its own doesn't make sense. It can't be fully validated 
because you allow any additional properties. Drop it.

> +        };
> +    };
> -- 
> 2.40.1
> 

