Return-Path: <linux-arm-msm+bounces-74619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CFCB9ACF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 434D9320395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 16:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129913126D3;
	Wed, 24 Sep 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJpw4AKZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927316D4EF;
	Wed, 24 Sep 2025 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729861; cv=none; b=VwTchktZ3PxNoTWGSbx5RnQ/O16gE8WfwbOU1aoY8FrD0qKC5C1Yuaq0xB2GwEQBTE5X7hHWmUQTg0qTtpYxTJR+t+zoBh5M612m0OsZe3P9HDo/WbuX9EyUay8jRQV+2Zn3Ktup13ezVs/YynSL1eVKvaet8m0wz77aq3ipoqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729861; c=relaxed/simple;
	bh=E9Wmp4VzDVFmzMwC3gaWc5Qt/y2pbmHe5FUqOJ1zB00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTmI7jzEkx+BXkpRqdy002WgPlPGdzfcwBunWr22hoUUvQqDb62pV2cXib/bdo1DNRNchi0FPsMd7YJBmvDKIf+vNdLM81AfwzR1a4gNisLYsAdk1a5DdqvCJjNOgfwkZCgKouPr/PGOaYej6yg4Myu/rYus3WyQVr8DASOnDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJpw4AKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F379C4CEE7;
	Wed, 24 Sep 2025 16:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758729860;
	bh=E9Wmp4VzDVFmzMwC3gaWc5Qt/y2pbmHe5FUqOJ1zB00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJpw4AKZ3CoXkYx9DM0Zd4wz3N9iQg8icvrAH8rlczKpltLIua4fpzTkYGvX//fzj
	 cqmHTJnF4+TH7kiGV4dKYh+1nxVvSevglJy0Apry5oPf2R21li+Qz/lhagSV1Jmk9r
	 msb3E9R/jF5985DE2h5XeMmBGdE9JYGLSIp4Ty2Kxk498sJ1+gBpQlqYVX8nL6Qp4q
	 W44Fk8Yq5OLB0GEf5BZg036zxAOmLchSru7+XW38U3bvKfgQsyi/6jXKbEdAri9TyB
	 owTfqi9kFBF/Fk6cvRFoJnUMTqU1ESH2ZI0JTKGkkJSvQjJdcL73AKR3pLAYOsu/oO
	 WcH+znnobiXNg==
Date: Wed, 24 Sep 2025 11:04:14 -0500
From: Rob Herring <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: spmi: add bindings for glymur-spmi-pmic-arb
 (arbiter v8)
Message-ID: <20250924160414.GA1780679-robh@kernel.org>
References: <20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919140952.1057737-1-pankaj.patil@oss.qualcomm.com>

On Fri, Sep 19, 2025 at 07:39:52PM +0530, Pankaj Patil wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> SPMI PMIC Arbiter version 8 builds upon version 7 with support for
> up to four SPMI buses.  To achieve this, the register map was
> slightly rearranged.  Add a new binding file and compatible string
> for version 8 using the name 'glymur' as the Qualcomm Technologies,
> Inc. Glymur SoC is the first one to use PMIC arbiter version 8.  This
> specifies the new register ranges needed only for version 8.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  .../spmi/qcom,glymur-spmi-pmic-arb.yaml       | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> new file mode 100644
> index 000000000000..e80997a5fb4b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spmi/qcom,glymur-spmi-pmic-arb.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spmi/qcom,glymur-spmi-pmic-arb.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Glymur SPMI Controller (PMIC Arbiter v8)
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +
> +description: |
> +  The Glymur SPMI PMIC Arbiter implements HW version 8 and it's an SPMI
> +  controller with wrapping arbitration logic to allow for multiple on-chip
> +  devices to control up to 4 SPMI separate buses.
> +
> +  The PMIC Arbiter can also act as an interrupt controller, providing interrupts
> +  to slave devices.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-spmi-pmic-arb
> +
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: tx-channel per virtual slave registers
> +      - description: rx-channel (called observer) per virtual slave registers
> +      - description: channel to PMIC peripheral mapping registers
> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: chnls
> +      - const: obsrvr
> +      - const: chnl_map
> +
> +  ranges: true
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 2
> +
> +  qcom,ee:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +    description: >
> +      indicates the active Execution Environment identifier
> +
> +  qcom,channel:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 5
> +    description: >
> +      which of the PMIC Arb provided channels to use for accesses

We already have these properties defined elsewhere. You need to pull the 
common properties out into a shared schema and then reference that 
schema in this one. IOW, a given property should only have a type $ref 
in a single place.

> +
> +patternProperties:
> +  "^spmi@[a-f0-9]+$":
> +    type: object
> +    $ref: /schemas/spmi/spmi.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        items:
> +          - description: configuration registers
> +          - description: interrupt controller registers
> +          - description: channel owner EE mapping registers
> +
> +      reg-names:
> +        items:
> +          - const: cnfg
> +          - const: intr
> +          - const: chnl_owner
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      interrupt-names:
> +        const: periph_irq
> +
> +      interrupt-controller: true
> +
> +      '#interrupt-cells':
> +        const: 4
> +        description: |
> +          cell 1: slave ID for the requested interrupt (0-15)
> +          cell 2: peripheral ID for requested interrupt (0-255)
> +          cell 3: the requested peripheral interrupt (0-7)
> +          cell 4: interrupt flags indicating level-sense information,
> +                  as defined in dt-bindings/interrupt-controller/irq.h
> +
> +required:
> +  - compatible
> +  - reg-names
> +  - qcom,ee
> +  - qcom,channel
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        arbiter@c400000 {
> +            compatible = "qcom,glymur-spmi-pmic-arb";
> +            reg = <0x0 0xc400000 0x0 0x3000>,
> +                  <0x0 0xc900000 0x0 0x400000>,
> +                  <0x0 0xc4c0000 0x0 0x400000>,
> +                  <0x0 0xc403000 0x0 0x8000>;
> +            reg-names = "core", "chnls", "obsrvr", "chnl_map";
> +
> +            qcom,ee = <0>;
> +            qcom,channel = <0>;
> +
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;
> +
> +            spmi@c426000 {
> +                reg = <0x0 0xc426000 0x0 0x4000>,
> +                      <0x0 0xc8c0000 0x0 0x10000>,
> +                      <0x0 0xc42a000 0x0 0x8000>;
> +                reg-names = "cnfg", "intr", "chnl_owner";
> +
> +                interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "periph_irq";
> +                interrupt-controller;
> +                #interrupt-cells = <4>;
> +
> +                #address-cells = <2>;
> +                #size-cells = <0>;
> +            };
> +
> +            spmi@c437000 {
> +                reg = <0x0 0xc437000 0x0 0x4000>,
> +                      <0x0 0xc8d0000 0x0 0x10000>,
> +                      <0x0 0xc43b000 0x0 0x8000>;
> +                reg-names = "cnfg", "intr", "chnl_owner";
> +
> +                interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "periph_irq";
> +                interrupt-controller;
> +                #interrupt-cells = <4>;
> +
> +                #address-cells = <2>;
> +                #size-cells = <0>;
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

