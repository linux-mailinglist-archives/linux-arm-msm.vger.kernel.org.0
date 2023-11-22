Return-Path: <linux-arm-msm+bounces-1591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A77F5193
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BAD0B20E72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2EA5C914;
	Wed, 22 Nov 2023 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FA6D40
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 12:25:51 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9B8B42012C;
	Wed, 22 Nov 2023 21:25:47 +0100 (CET)
Date: Wed, 22 Nov 2023 21:25:46 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <e6qtpkzzugddgy6dkpruecdty73qjbja5wpvrvio53mq3dfd2g@axgmdfw6oywg>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122191335.3058-1-quic_kriskura@quicinc.com>

Looks like this patch will conflict with:

https://lore.kernel.org/linux-arm-msm/20231111141953.51841-1-krzysztof.kozlowski@linaro.org/

On 2023-11-23 00:43:35, Krishna Kurapati wrote:
> The high speed related interrupts present on QC targets are as follows:
> 
> dp/dm Irq's

irqs

> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
> are used as wakeup interrupts only on SoCs with non-QUSBb2 targets with

drop -b-: QUSB2?

Perhaps a description like this deserves to live in the yaml?

> exception of SDM670/SDM845/SM6350.

> qusb2_phy irq
> SoCs with QUSB2 PHY do not have separate DP/DM IRQs and expose only a
> single IRQ whose behavior can be modified by the QUSB2PHY_INTR_CTRL
> register. The required DPSE/DMSE configuration is done in
> QUSB2PHY_INTR_CTRL register of phy address space.
> 
> hs_phy_irq
> This is completely different from the above two and is present on all
> targets with exception of a few IPQ ones. The interrupt is not enabled by
> default and its functionality is mutually exclusive of qusb2_phy on QUSB
> targets and DP/DM on femto phy targets.
> 
> The DTs of several QUSB2 PHY based SoCs incorrectly define "hs_phy_irq"
> when they should have been "qusb2_phy_irq". On Femto phy targets, the
> "hs_phy_irq" mentioned is either the actual "hs_phy_irq" or "pwr_event",
> neither of which would never be triggered directly are non-functional
> currently. The implementation tries to clean up this issue by addressing
> the discrepencies involved and fixing the hs_phy_irq's in respective DT's.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 125 ++++++++++--------
>  1 file changed, 69 insertions(+), 56 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index e889158ca205..4a46346e2ead 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,20 +17,25 @@ properties:
>            - qcom,ipq5018-dwc3
>            - qcom,ipq5332-dwc3
>            - qcom,ipq6018-dwc3
> +          - qcom,ipq6018-dwc3-sec
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
>            - qcom,ipq9574-dwc3
>            - qcom,msm8953-dwc3
>            - qcom,msm8994-dwc3
>            - qcom,msm8996-dwc3
> +          - qcom,msm8996-dwc3-sec
>            - qcom,msm8998-dwc3
>            - qcom,qcm2290-dwc3
>            - qcom,qcs404-dwc3
>            - qcom,sa8775p-dwc3
> +          - qcom,sa8775p-dwc3-ter
>            - qcom,sc7180-dwc3
>            - qcom,sc7280-dwc3
> +          - qcom,sc7280-dwc3-sec
>            - qcom,sc8280xp-dwc3
>            - qcom,sdm660-dwc3
> +          - qcom,sdm660-dwc3-sec
>            - qcom,sdm670-dwc3
>            - qcom,sdm845-dwc3
>            - qcom,sdx55-dwc3
> @@ -98,11 +103,11 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 5
>  
>    interrupt-names:
>      minItems: 1
> -    maxItems: 4
> +    maxItems: 5
>  
>    qcom,select-utmi-as-pipe-clk:
>      description:
> @@ -175,10 +180,13 @@ allOf:
>                - qcom,ipq9574-dwc3
>                - qcom,msm8953-dwc3
>                - qcom,msm8996-dwc3
> +              - qcom,msm8996-dwc3-sec
>                - qcom,msm8998-dwc3
>                - qcom,sa8775p-dwc3
> +              - qcom,sa8775p-dwc3-ter
>                - qcom,sc7180-dwc3
>                - qcom,sc7280-dwc3
> +              - qcom,sc7280-dwc3-sec
>                - qcom,sdm670-dwc3
>                - qcom,sdm845-dwc3
>                - qcom,sdx55-dwc3
> @@ -203,6 +211,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,ipq6018-dwc3
> +              - qcom,ipq6018-dwc3-sec
>      then:
>        properties:
>          clocks:
> @@ -285,6 +294,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,sdm660-dwc3
> +              - qcom,sdm660-dwc3-sec
>      then:
>        properties:
>          clocks:
> @@ -357,20 +367,15 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,ipq4019-dwc3
> -              - qcom,ipq6018-dwc3
> -              - qcom,ipq8064-dwc3
> -              - qcom,ipq8074-dwc3
> -              - qcom,msm8994-dwc3
> -              - qcom,qcs404-dwc3
> +              - qcom,sc8280xp-dwc3
> +              - qcom,sa8775p-dwc3
>                - qcom,sc7180-dwc3
> +              - qcom,sc7280-dwc3
>                - qcom,sdm670-dwc3
>                - qcom,sdm845-dwc3
>                - qcom,sdx55-dwc3
>                - qcom,sdx65-dwc3
>                - qcom,sdx75-dwc3
> -              - qcom,sm4250-dwc3
> -              - qcom,sm6125-dwc3
>                - qcom,sm6350-dwc3
>                - qcom,sm8150-dwc3
>                - qcom,sm8250-dwc3
> @@ -381,16 +386,37 @@ allOf:
>        properties:
>          interrupts:
>            items:
> +            - description: Wakeup event on DM line.
> +            - description: Wakeup event on DP line.
>              - description: The interrupt that is asserted
> -                when a wakeup event is received on USB2 bus.
> +                based on linestates. Is enabled if qscratch
> +                registers are configured appropirately. This

Arr.

In all seriousness: I think you meant to write "appropriately".

> +                interrupt functionality is mutually exclusive
> +                to that of {dp/d}_hs_phy_irq)

dm?

- Marijn

> +            - description: Wakeup based on power events.
>              - description: The interrupt that is asserted
>                  when a wakeup event is received on USB3 bus.
> -            - description: Wakeup event on DM line.
> -            - description: Wakeup event on DP line.
>          interrupt-names:
>            items:
> +            - const: dm_hs_phy_irq
> +            - const: dp_hs_phy_irq
>              - const: hs_phy_irq
> +            - const: pwr_event
>              - const: ss_phy_irq
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7280-dwc3-sec
> +              - qcom,sa8775p-ter
> +    then:
> +      properties:
> +        interrupt-names:
> +          items:
> +            - const: pwr_event
> +            - const: hs_phy_irq
>              - const: dm_hs_phy_irq
>              - const: dp_hs_phy_irq
>  
> @@ -399,36 +425,29 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,msm8953-dwc3
> -              - qcom,msm8996-dwc3
> -              - qcom,msm8998-dwc3
> -              - qcom,sm6115-dwc3
> +              - qcom,ipq6018-dwc3-sec
>      then:
>        properties:
> -        interrupts:
> -          maxItems: 2
>          interrupt-names:
>            items:
> -            - const: hs_phy_irq
> -            - const: ss_phy_irq
> +            - const: pwr_event
> +            - const: qusb2_phy
>  
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> -              - qcom,ipq5018-dwc3
> -              - qcom,ipq5332-dwc3
> -              - qcom,sdm660-dwc3
> +              - qcom,ipq6018-dwc3
> +              - qcom,ipq8074-dwc3
> +              - qcom,msm8953-dwc3
> +              - qcom,msm8998-dwc3
>      then:
>        properties:
> -        interrupts:
> -          minItems: 1
> -          maxItems: 2
>          interrupt-names:
> -          minItems: 1
>            items:
> -            - const: hs_phy_irq
> +            - const: pwr_event
> +            - const: qusb2_phy
>              - const: ss_phy_irq
>  
>    - if:
> @@ -436,55 +455,48 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sc7280-dwc3
> +              - qcom,msm8996-dwc3
> +              - qcom,sdm660-dwc3
> +              - qcom,sm4250-dwc3
> +              - qcom,sm6115-dwc3
> +              - qcom,sm6125-dwc3
>      then:
>        properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 4
>          interrupt-names:
> -          minItems: 3
>            items:
>              - const: hs_phy_irq
> -            - const: dp_hs_phy_irq
> -            - const: dm_hs_phy_irq
> +            - const: pwr_event
> +            - const: qusb2_phy
>              - const: ss_phy_irq
> -
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sc8280xp-dwc3
> +              - qcom,sdm660-dwc3-sec
> +              - qcom,msm8996-dwc3-sec
> +              - qcom,qcs404-dwc3
>      then:
>        properties:
> -        interrupts:
> -          maxItems: 4
>          interrupt-names:
>            items:
> +            - const: hs_phy_irq
>              - const: pwr_event
> -            - const: dp_hs_phy_irq
> -            - const: dm_hs_phy_irq
> -            - const: ss_phy_irq
> +            - const: qusb2_phy
>  
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> -              - qcom,sa8775p-dwc3
> +              - qcom,ipq5332-dwc3
>      then:
>        properties:
> -        interrupts:
> -          minItems: 3
> -          maxItems: 4
>          interrupt-names:
> -          minItems: 3
>            items:
> -            - const: pwr_event
>              - const: dp_hs_phy_irq
>              - const: dm_hs_phy_irq
> -            - const: ss_phy_irq
> +            - const: pwr_event
>  
>  additionalProperties: false
>  
> @@ -519,12 +531,13 @@ examples:
>                            <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>              assigned-clock-rates = <19200000>, <150000000>;
>  
> -            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>;
> -            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> -                          "dm_hs_phy_irq", "dp_hs_phy_irq";
> +            interrupts = <GIC_SPI 488 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "dm_hs_phy_irq", "dp_hs_phy_irq",
> +                              "hs_phy_irq", "pwr_event", "ss_phy_irq";
>  
>              power-domains = <&gcc USB30_PRIM_GDSC>;
>  
> -- 
> 2.42.0
> 

