Return-Path: <linux-arm-msm+bounces-1218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F187F1B1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 18:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B2BE1F256EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 17:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20EB208BE;
	Mon, 20 Nov 2023 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BBDD4C;
	Mon, 20 Nov 2023 09:41:37 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35af64a180eso5876095ab.1;
        Mon, 20 Nov 2023 09:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700502096; x=1701106896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLZXIZ9nL5/cSx66YwTtOh2+aHxea+g3SVnUlPh+FEo=;
        b=qG4FjCbCx+ir0ywKzjr2vERc1PizrnQClBq48UIhcYXgW0Vsxh9MzaJC54fWW7CXYU
         cZShKn8jKg2viIhUha6LnKfTN6FxWoN9ZUp7u0lyiZuRtXhS9ZJgoMo/Y0wFTKPYwPFV
         9E/KZ/dEAdaP24V3g3+Y1PRUDypUSVHmRZhB/gxhCLXqzDAYzQ9qnE1KcY8Vgr3Z3KOs
         Bvn7rbLWGeFClewxrzdy7Hc88j9J6Pltg+A8GIUJW+NbVMULsVsEe77wUZmsxTfwdmL+
         /ZATmvAV/XoaM/Cj75Mb7tgZdOiUjMQdA6qkDuNW3LMjsXTwPhkontd+xQpSPgsp5LfO
         RvRQ==
X-Gm-Message-State: AOJu0YzN9FX/P5NqhcwLhvJUrWwJuNra2L8kgNUvR85n03EaSMcnEQvN
	WuOoUxeo0c8Z2kfmZAABbw==
X-Google-Smtp-Source: AGHT+IE7LLdCgHclxhBtKeaxESMvFFwRvbO4prdXF+F7uXEM4kZFAFBlPgYkjWcTW5fnFTdDF4lhlQ==
X-Received: by 2002:a05:6e02:1c49:b0:359:4fde:6297 with SMTP id d9-20020a056e021c4900b003594fde6297mr10797167ilg.30.1700502096357;
        Mon, 20 Nov 2023 09:41:36 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id m23-20020a0566380ad700b00451b5feb80fsm2075627jab.8.2023.11.20.09.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:41:35 -0800 (PST)
Received: (nullmailer pid 2455759 invoked by uid 1000);
	Mon, 20 Nov 2023 17:41:33 -0000
Date: Mon, 20 Nov 2023 10:41:33 -0700
From: Rob Herring <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, 
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231120174133.GB2378814-robh@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-4-ansuelsmth@gmail.com>

On Mon, Nov 20, 2023 at 02:50:30PM +0100, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. These particular PHY require specific PHY in the
> package for global onfiguration of the PHY package.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.
> 
> The PHY package node should use the global-phys property and the
> global-phy-names to define PHY in the package required by the PHY driver
> for global configuration.
> 
> It's also possible to specify the property phy-mode to specify that the
> PHY package sets a global PHY interface mode and every PHY of the
> package requires to have the same PHY interface mode.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/ethernet-phy-package.yaml    | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> new file mode 100644
> index 000000000000..2aa109e155d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy-package.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/ethernet-phy-package.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ethernet PHY Package Common Properties
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com

Missing a '>'

> +
> +properties:
> +  $nodename:
> +    pattern: "^ethernet-phy-package(-[0-9]+)?$"
> +
> +  compatible:
> +    const: ethernet-phy-package
> +
> +  '#address-cells':
> +    description: number of address cells for the MDIO bus
> +    const: 1
> +
> +  '#size-cells':
> +    description: number of size cells on the MDIO bus
> +    const: 0
> +
> +  global-phys:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 31
> +    description:
> +      List of phandle to the PHY in the package required and
> +      used to configure the PHY package.
> +
> +  global-phy-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    minItems: 1
> +    maxItems: 31
> +    description:
> +      List of names of the PHY defined in global-phys.
> +
> +  phy-connection-type:
> +    $ref: /schemas/net/ethernet-phy-mode-types.yaml#definitions/phy-connection-type
> +    description:
> +      Specifies global interface type for the PHY package.
> +
> +  phy-mode:
> +    $ref: "#/properties/phy-connection-type"
> +
> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: /schemas/net/ethernet-phy.yaml#
> +
> +required:
> +  - compatible
> +
> +dependencies:
> +  global-phy-names: [global-phys]
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ethernet {

You mean 'mdio' here, right?

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package {

This doesn't work. Child nodes of MDIO bus must be an MDIO device with 
an address. What you need is a node with all the addresses of the 
device:

mdio {
  ...

  ethernet-phy@1 {
    compatible = "vendor,specifc-compatible-for-device";
    reg = <1>, <4>;
    ...
  };
};

There's also some MDIO devices which define a secondary address as a 
child device. Maybe those are similar to your situation. I don't recall 
which ones offhand.

> +            compatible = "ethernet-phy-package";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            global-phys = <&phy4>;
> +            global-phy-names = "base";
> +
> +            ethernet-phy@1 {
> +              compatible = "ethernet-phy-ieee802.3-c22";
> +              reg = <1>;
> +            };
> +
> +            phy4: ethernet-phy@4 {
> +              compatible = "ethernet-phy-ieee802.3-c22";
> +              reg = <4>;
> +            };
> +        };
> +    };
> -- 
> 2.40.1
> 

