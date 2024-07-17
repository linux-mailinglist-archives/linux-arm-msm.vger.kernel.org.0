Return-Path: <linux-arm-msm+bounces-26486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2204F9340A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 18:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B245FB224A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 16:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC533181CEF;
	Wed, 17 Jul 2024 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZLENMP01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF99181BA0;
	Wed, 17 Jul 2024 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721234402; cv=none; b=fHowlME1NGYggzIOT6BCC6bd4p4xaZIFUKuF80hQft9j9qcZkuRe3D8b7cnacbzG+Sa+39zj4W1SZHZssEf5EDFMhXogpGgGcvHDNu0d5VSJS8RPnQ3VXFHLv5mG+7DEZXTCoJ5o03LsCnySZVE0Isi8XcJeiKOFFOkNhzwdDL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721234402; c=relaxed/simple;
	bh=qC8+pVATdmmyhMdVyxpGh1+kxEQNetfbxGBQB2c/ZNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqEpjlzgGk6VHPfqV/39dKU5lMv+Bs7Tc80uV9BwceJDaetnSSaZZQaLLeNnJZviUuJ4Jr4LCFC+yoMpGBAadDX/Z+ACdrtHFj/ESXFl/0AOxh3iv4q5pOakZN5FLuLgFDBFs42us25kkU9QOzrxYAmwoyvG4mx/VGVQbZgR6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLENMP01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14C9C2BD10;
	Wed, 17 Jul 2024 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721234402;
	bh=qC8+pVATdmmyhMdVyxpGh1+kxEQNetfbxGBQB2c/ZNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLENMP013HWtHghbcxzvHT5rHEM0c0yxS2Zdet8UxCJKiVmJpD4aaWm8PZ1Y/Obmd
	 sOR4bBC2xWxIML/BS/pmq07Rik6VFPUZldrUXJ+lK12FRqeXd0jdJVc3HpMvFSLWWZ
	 881PaJlscn9rH0KEFYcTd8PkMTEEUHvY2lmn7ky7Aho1FoYfH9B40pgtpyiJKSdKrc
	 YZomQ0EoPFgC+GZOkssHiTtjZo83Ce6OepjaxfmAubsYDb+LHSfg/3TBzXwoAU5Hsg
	 E7iMYAU4SEwcuB+VlONQ/yL6hEWlzQmgDX7OlYDyVzaJVkspNU3kNVSpAuFh7aa2pU
	 8AK/nqQzFyngA==
Date: Wed, 17 Jul 2024 10:39:59 -0600
From: Rob Herring <robh@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Timur Tabi <timur@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: qcom,emac: convert to dtschema
Message-ID: <20240717163959.GA182655-robh@kernel.org>
References: <20240717090931.13563-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717090931.13563-1-rayyan.ansari@linaro.org>

On Wed, Jul 17, 2024 at 10:09:27AM +0100, Rayyan Ansari wrote:
> Convert the bindings for the Qualcomm EMAC Ethernet Controller from the
> old text format to yaml.
> 
> Also move the phy node of the controller to be within an mdio block so
> we can use mdio.yaml.
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,emac.yaml    |  98 ++++++++++++++++
>  .../devicetree/bindings/net/qcom-emac.txt     | 111 ------------------
>  2 files changed, 98 insertions(+), 111 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/qcom,emac.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/qcom-emac.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,emac.yaml b/Documentation/devicetree/bindings/net/qcom,emac.yaml
> new file mode 100644
> index 000000000000..cef65130578f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,emac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +---
> +$id: http://devicetree.org/schemas/net/qcom,emac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm EMAC Gigabit Ethernet Controller
> +
> +maintainers:
> +  - Timur Tabi <timur@kernel.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,fsm9900-emac
> +      - enum:
> +          - qcom,fsm9900-emac-sgmii
> +          - qcom,qdf2432-emac-sgmii

You just need a single enum for all 3 compatibles.
 
> +  reg:
> +    minItems: 1
> +    maxItems: 2

Need to define what each entry is and perhaps constraints on when it 1 
vs. 2 entries.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +if:
> +  properties:
> +    compatible:
> +      const: qcom,fsm9900-emac
> +then:
> +  allOf:
> +    - $ref: ethernet-controller.yaml#

This goes at the top level and the 'if' schema should be under the 
'allOf'.

> +  properties:
> +    clocks:
> +      minItems: 7
> +      maxItems: 7
> +
> +    clock-names:
> +      items:
> +        - const: axi_clk
> +        - const: cfg_ahb_clk
> +        - const: high_speed_clk
> +        - const: mdio_clk
> +        - const: tx_clk
> +        - const: rx_clk
> +        - const: sys_clk

Define these at the top level and then exclude them in the if schema.

> +
> +    internal-phy:
> +      maxItems: 1

This needs a type ref.

> +
> +    mdio:
> +      $ref: mdio.yaml#
> +      unevaluatedProperties: false
> +
> +  required:
> +    - clocks
> +    - clock-names
> +    - internal-phy
> +    - phy-handle
> +    - mdio
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    emac0: ethernet@feb20000 {

Drop unused labels.

> +        compatible = "qcom,fsm9900-emac";
> +        reg = <0xfeb20000 0x10000>,
> +              <0xfeb36000 0x1000>;
> +        interrupts = <76>;
> +
> +        clocks = <&gcc 0>, <&gcc 1>, <&gcc 3>, <&gcc 4>, <&gcc 5>,
> +                 <&gcc 6>, <&gcc 7>;
> +        clock-names = "axi_clk", "cfg_ahb_clk", "high_speed_clk",
> +                      "mdio_clk", "tx_clk", "rx_clk", "sys_clk";
> +
> +        internal-phy = <&emac_sgmii>;
> +        phy-handle = <&phy0>;
> +
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +    };
> +
> +    emac_sgmii: ethernet@feb38000 {

This should be a separate entry. (You need '- |' above it.)

> +        compatible = "qcom,fsm9900-emac-sgmii";
> +        reg = <0xfeb38000 0x1000>;
> +        interrupts = <80>;
> +    };

