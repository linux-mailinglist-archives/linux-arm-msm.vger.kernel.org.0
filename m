Return-Path: <linux-arm-msm+bounces-67351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EBEB181C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:29:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1EC07A92E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0201D2441B8;
	Fri,  1 Aug 2025 12:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzTbyrat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238F1C7013;
	Fri,  1 Aug 2025 12:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754051347; cv=none; b=qA4ocxyqf8w7Voz4O+NUotSRIsyEPwKXvesSPfKArFtwG0gROvnYTUyXsZ7m59D44EqVGPbCNuK78/mZA4diVRK5KHh37UqlBx8HBhDFWnvIkOuy5faBxGs4eviD9aHZi8jcXg87Tv9lTM2jfU9IFMNAJQGz7nUdxNItR6E8T/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754051347; c=relaxed/simple;
	bh=wlIBB/eIgR2re6DiPVNzk8QMFfESpsLmaL9VuUr1IVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEOkJ+ibbOgjtc84IKTJRicBDbLrWELMi/gUmCMucxGRFo+zVycDZUhnvxZu80Ul8hZcdSx1p1IyUcCrIUJJGZrGQgpCJKyB7Uv8nP+bThQM+WpY91yoH+JpyTrMj/5pbbEgEEHcFcCfAj/1kQZfxspibwFClv1YIWybQu1/NfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzTbyrat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8679CC4CEF4;
	Fri,  1 Aug 2025 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754051347;
	bh=wlIBB/eIgR2re6DiPVNzk8QMFfESpsLmaL9VuUr1IVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NzTbyrate5K5AWjfX68CgNw+g6OW1a8UtXWcF0NkI0vTiDBYOs7aW0XRqHtV6z1gL
	 bYObdtOqWWgfA/neO+fNHN7eUbigO49gO17lrDApUahVwZ3g8Zj3W1ONZquTWzDYjU
	 SS7c6IayBTdhpkyQ0O7uoLlgFcdwGxIS4KN7R4voVwlYHxhl0HLceVbmh64JkOplQD
	 MxK3ICiGhlVW7KTiqi18vGT/QlOoqyBluEQGAWUQZpCz2YHFVh8eCqgGN1rD/903s4
	 Ji33A7oIoR0sSHFW0yxU056rDRDQdmaSgzUlmTIttWW4XxPz6Q3ibg3u7F3MtE6eYl
	 8JOoLAaAcPmBA==
Date: Fri, 1 Aug 2025 17:58:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: ufs: qcom: Split SM8650 and similar
Message-ID: <l733rhzqpl5guulziufwgewp6ljv4vhekcnvlqh4baycvqnwd4@ywcexv3racyc>
References: <20250731-dt-bindings-ufs-qcom-v2-0-53bb634bf95a@linaro.org>
 <20250731-dt-bindings-ufs-qcom-v2-3-53bb634bf95a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250731-dt-bindings-ufs-qcom-v2-3-53bb634bf95a@linaro.org>

On Thu, Jul 31, 2025 at 09:15:54AM GMT, Krzysztof Kozlowski wrote:
> The binding for Qualcomm SoC UFS controllers grew and it will grow
> further.  Split SM8650 and SM8750 UFS controllers which:
> 1. Do not reference ICE as IO address space, but as phandle,
> 2. Have same order of clocks.
> 3. Have MCQ IO address space. Document that MCQ address space as
>    optional to maintain backwards compatibility and because Linux
>    drivers can operate perfectly fine without it (thus without MCQ
>    feature).  Linux driver already uses "mcq" as possible name for
>    "reg-names" property.

Since Qcom SoC memory maps have holes and shared registers in the whole 'mcq'
region, it is preferred to map only the required parts. So please drop 'mcq' and
add 'mcq_sqd', 'mcq_vs' regions.

With the above change, 

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> 
> The split allows easier review and maintenance of the binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 178 +++++++++++++++++++++
>  .../devicetree/bindings/ufs/qcom,ufs.yaml          |  32 ----
>  2 files changed, 178 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..aaa0bbb5bfe1673e3e0d25812c2829350b137abb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> @@ -0,0 +1,178 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/qcom,sm8650-ufshc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM8650 and Other SoCs UFS Controllers
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +# Select only our matches, not all jedec,ufs-2.0
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,sm8650-ufshc
> +          - qcom,sm8750-ufshc
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,sm8650-ufshc
> +          - qcom,sm8750-ufshc
> +      - const: qcom,ufshc
> +      - const: jedec,ufs-2.0
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: std
> +      - const: mcq
> +
> +  clocks:
> +    minItems: 8
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: core_clk
> +      - const: bus_aggr_clk
> +      - const: iface_clk
> +      - const: core_clk_unipro
> +      - const: ref_clk
> +      - const: tx_lane0_sync_clk
> +      - const: rx_lane0_sync_clk
> +      - const: rx_lane1_sync_clk
> +
> +  qcom,ice:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the Inline Crypto Engine node
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: qcom,ufs-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,sm8650-gcc.h>
> +    #include <dt-bindings/clock/qcom,sm8650-tcsr.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interconnect/qcom,icc.h>
> +    #include <dt-bindings/interconnect/qcom,sm8650-rpmh.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        ufshc@1d84000 {
> +            compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
> +            reg = <0x0 0x01d84000 0x0 0x3000>;
> +
> +            interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +            clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
> +                     <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
> +                     <&gcc GCC_UFS_PHY_AHB_CLK>,
> +                     <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
> +                     <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
> +                     <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
> +                     <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
> +                     <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
> +            clock-names = "core_clk",
> +                          "bus_aggr_clk",
> +                          "iface_clk",
> +                          "core_clk_unipro",
> +                          "ref_clk",
> +                          "tx_lane0_sync_clk",
> +                          "rx_lane0_sync_clk",
> +                          "rx_lane1_sync_clk";
> +
> +            resets = <&gcc GCC_UFS_PHY_BCR>;
> +            reset-names = "rst";
> +            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +            interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
> +                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +                            <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +                             &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
> +            interconnect-names = "ufs-ddr",
> +                         "cpu-ufs";
> +
> +            power-domains = <&gcc UFS_PHY_GDSC>;
> +            required-opps = <&rpmhpd_opp_nom>;
> +
> +            operating-points-v2 = <&ufs_opp_table>;
> +
> +            iommus = <&apps_smmu 0x60 0>;
> +
> +            lanes-per-direction = <2>;
> +            qcom,ice = <&ice>;
> +
> +            phys = <&ufs_mem_phy>;
> +            phy-names = "ufsphy";
> +
> +            #reset-cells = <1>;
> +
> +            vcc-supply = <&vreg_l7b_2p5>;
> +            vcc-max-microamp = <1100000>;
> +            vccq-supply = <&vreg_l9b_1p2>;
> +            vccq-max-microamp = <1200000>;
> +
> +            ufs_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-100000000 {
> +                    opp-hz = /bits/ 64 <100000000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <100000000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-201500000 {
> +                    opp-hz = /bits/ 64 <201500000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <201500000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-403000000 {
> +                    opp-hz = /bits/ 64 <403000000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <403000000>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>,
> +                             /bits/ 64 <0>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 191b88120d139a47632e3dce3d3f3a37d7a55c72..1dd41f6d5258014d59c8c8005bc54f7994351a52 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -24,8 +24,6 @@ select:
>            - qcom,sm6125-ufshc
>            - qcom,sm6350-ufshc
>            - qcom,sm8150-ufshc
> -          - qcom,sm8650-ufshc
> -          - qcom,sm8750-ufshc
>    required:
>      - compatible
>  
> @@ -41,8 +39,6 @@ properties:
>            - qcom,sm6125-ufshc
>            - qcom,sm6350-ufshc
>            - qcom,sm8150-ufshc
> -          - qcom,sm8650-ufshc
> -          - qcom,sm8750-ufshc
>        - const: qcom,ufshc
>        - const: jedec,ufs-2.0
>  
> @@ -66,34 +62,6 @@ required:
>  allOf:
>    - $ref: qcom,ufs-common.yaml
>  
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sm8650-ufshc
> -              - qcom,sm8750-ufshc
> -    then:
> -      properties:
> -        clocks:
> -          minItems: 8
> -          maxItems: 8
> -        clock-names:
> -          items:
> -            - const: core_clk
> -            - const: bus_aggr_clk
> -            - const: iface_clk
> -            - const: core_clk_unipro
> -            - const: ref_clk
> -            - const: tx_lane0_sync_clk
> -            - const: rx_lane0_sync_clk
> -            - const: rx_lane1_sync_clk
> -        reg:
> -          minItems: 1
> -          maxItems: 1
> -        reg-names:
> -          maxItems: 1
> -
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.48.1
> 

-- 
மணிவண்ணன் சதாசிவம்

