Return-Path: <linux-arm-msm+bounces-3739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E78808BB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 16:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2740A1F21468
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 15:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330DB44C82;
	Thu,  7 Dec 2023 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R65VkIkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6DD40BF4;
	Thu,  7 Dec 2023 15:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1624C433CA;
	Thu,  7 Dec 2023 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701962538;
	bh=sSg4qggAKfOIMoU7cAGFb55QGJXmj09uIc6zejvgP+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R65VkIkdHOTIji/Q+amWpQbIa5ZhKCaC/nGH0Et2FdBLZDdJ1xZ+fG9tVzK2fLogq
	 2VFmAPJb3xZjIQxzjxTq2UYn3eMIgub1shc6Dwv/4Adve6lq2RB8wFb+VqvjltE7Bo
	 sdKPzSgBR+og1WmtaOnwAx7tl42wsFaGi7lcnk13Calp1SljdGRneZSXbKPWA3AlAe
	 834IoZuFcZX2BdvF6gFxiQYcfwqnnP02PI7kf7SMR+vBEYO02440yj60jgoPuWwdOW
	 WIenk9BD6LlcXeEUqlmW12ImvuydHf2HiBTeFIfF9bUQmbSv/vXqma1YdYejY4FdKG
	 hPEKHIaWE/zRw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rBGDU-0000p1-0H;
	Thu, 07 Dec 2023 16:23:08 +0100
Date: Thu, 7 Dec 2023 16:23:08 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZXHjXGEbdtbCiOck@hovoldconsulting.com>
References: <20231204100950.28712-1-quic_kriskura@quicinc.com>
 <20231204100950.28712-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204100950.28712-2-quic_kriskura@quicinc.com>

On Mon, Dec 04, 2023 at 03:39:45PM +0530, Krishna Kurapati wrote:
> The high speed related interrupts present on QC targets are as follows:
> 
> dp/dm irq's
> These IRQ's directly reflect changes on the DP/DM pads of the SoC. These
> are used as wakeup interrupts only on SoCs with non-QUSB2 targets with
> exception of SDM670/SDM845/SM6350.
> 
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
> Classify interrupts based on whether qusb2_phy interrupt is used or
> {dp/dm}_hs_phy_irq is used and whether hs_phy_irq is present or not.

s/interrupts/SoCs in four groups/

And say something about the SS PHY interrupt being treated as optional
as there are SoCs with multiple controllers where only some supports SS.

As Krzysztof mentioned you should also add something to motivate why
this de-facto ABI breakage by reordering interrupts is justified and
safe in this case.
 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml    | 147 +++++++-----------
>  1 file changed, 58 insertions(+), 89 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index 3ec62027f663..94deef765ec3 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -98,12 +98,30 @@ properties:
>        - const: apps-usb
>  
>    interrupts:
> -    minItems: 1
> -    maxItems: 4
> +    description: |
> +      Different types of interrupts are used based on HS phy used on target::

Try to use uppercase 'PHY' consistently in text throughout the series.

> +        - qusb2_phy:: SoCs with QUSB2 PHY do not have separate DP/DM IRQs and
> +                      expose only a single IRQ whose behavior can be modified
> +                      by the QUSB2PHY_INTR_CTRL register. The required DPSE/
> +                      DMSE configuration is done in QUSB2PHY_INTR_CTRL register
> +                      of phy address space.
> +        - {dp/dm}_hs_phy_irq:: These IRQ's directly reflect changes on the DP/
> +                               DM pads of the SoC. These are used for wakeup
> +                               only on SoCs with non-QUSBb2 targets with

QUSB2 typo

> +                               exception of SDM670/SDM845/SM6350.
> +        - ss_phy_irq:: When in super speed mode of operation, interrupts are

Capitalise 'Super Speed'

> +                       received when a wakeup event is received on ss_phy_irq.

The description as it stands sounds circular. And this one is only used
for remote wakeup right?

> +        - hs_phY_irq:: Apart from DP/DM/QUSB2 Phy interrupts, there is

s/phY/phy/

Perhaps rephrase to sound less like a commit message and to make it a
bit more concise.

But this is already an improvement over the current descriptions which
are too terse and not even correct.

> +                       hs_phy_irq which is not triggered by default and its
> +                       functionality is mutually exclusive to that of
> +                       {dp/dm}_hs_phy_irq and qusb2_phy_irq.
> +        - pwr_event:: Used for wakeup based on other power events.

I'm not sure about the free text description of these (format etc), but
at least this avoid repeating the descriptions for each permutation.

Perhaps the DT maintainers can chime in here.

I think you should reorder them to match the permutations below though.

> +    minItems: 2
> +    maxItems: 5
>  
>    interrupt-names:
> -    minItems: 1
> -    maxItems: 4
> +    minItems: 2
> +    maxItems: 5
>  
>    qcom,select-utmi-as-pipe-clk:
>      description:
> @@ -359,116 +377,54 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,ipq4019-dwc3
> +              - qcom,ipq5018-dwc3
>                - qcom,ipq6018-dwc3
> -              - qcom,ipq8064-dwc3
>                - qcom,ipq8074-dwc3
> -              - qcom,msm8994-dwc3
> -              - qcom,qcs404-dwc3
> -              - qcom,sc7180-dwc3
> -              - qcom,sdm670-dwc3
> -              - qcom,sdm845-dwc3
> -              - qcom,sdx55-dwc3
> -              - qcom,sdx65-dwc3
> -              - qcom,sdx75-dwc3
> -              - qcom,sm4250-dwc3
> -              - qcom,sm6350-dwc3
> -              - qcom,sm8150-dwc3
> -              - qcom,sm8250-dwc3
> -              - qcom,sm8350-dwc3
> -              - qcom,sm8450-dwc3
> -              - qcom,sm8550-dwc3
> -              - qcom,sm8650-dwc3
> +              - qcom,msm8953-dwc3
> +              - qcom,msm8998-dwc3
> +              - qcom,qcm2290-dwc3
>      then:
>        properties:
> -        interrupts:
> -          items:
> -            - description: The interrupt that is asserted
> -                when a wakeup event is received on USB2 bus.
> -            - description: The interrupt that is asserted
> -                when a wakeup event is received on USB3 bus.
> -            - description: Wakeup event on DM line.
> -            - description: Wakeup event on DP line.
>          interrupt-names:
>            items:
> -            - const: hs_phy_irq
> -            - const: ss_phy_irq
> -            - const: dm_hs_phy_irq
> -            - const: dp_hs_phy_irq
> +            - const: pwr_event
> +            - const: qusb2_phy
> +            - const: ss_phy_irq (optional)

You should not include the string "(optional)" here. It was only a
notation I used when we discussed this earlier.

The fact that these are optional should be expressed using min/maxItems
as I mentioned earlier. For the above SoCs that would be

	minItems: 2
	maxItems: 3

> @@ -522,12 +490,13 @@ examples:
>                            <&gcc GCC_USB30_PRIM_MASTER_CLK>;
>              assigned-clock-rates = <19200000>, <150000000>;
>  
> -            interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
> +            interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
>                           <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
> -                         <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
> -            interrupt-names = "hs_phy_irq", "ss_phy_irq",
> -                          "dm_hs_phy_irq", "dp_hs_phy_irq";
> +                         <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "pwr_event", "hs_phy_irq",
> +                          "dp_hs_phy_irq", "dm_hs_phy_irq", "ss_phy_irq";

Perhaps you should align the continuation line here too.

>  
>              power-domains = <&gcc USB30_PRIM_GDSC>;

Also have you set up the tools so that you can verify your bindings
before posing them? I assume the above wouldn't pass (e.g. due to the
"(optional)" strings).

There's some more details here:

	https://docs.kernel.org/devicetree/bindings/writing-schema.html

under "Running checks".

Johan

