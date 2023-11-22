Return-Path: <linux-arm-msm+bounces-1510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099457F466D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 13:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AD341C2084E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DF821A13;
	Wed, 22 Nov 2023 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3C/Nawl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5197A4D11B;
	Wed, 22 Nov 2023 12:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C4FC433C7;
	Wed, 22 Nov 2023 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700656829;
	bh=tqEY6FGT5GYctEXe7gynUJuIohw71n++dptwt+BslSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3C/NawlMCzIOcW/f3jz9KXaVJ0msjYd0OAfdl07Vp6wvx6hRWeIKT0SyvWUP4HNY
	 XrSUvS46oni2kvurfTrjQal7GlOwQOEFaoeN0HuoMBjWIx6Bs0KvClfBFOKtfmnP+x
	 B02ngziHfxHNKgX4xHya/4P+Zfl6WnLhSMcZ0OKVtpayRT94nF3cC2/MSNoIgySw0R
	 2J6am9ButjfcBTx0DIMd0S4iv1DqLZWFN78B7m9Z3+V7F/VoYdkVCYZgLv+/rzc2dU
	 nBBl6C34lwQ3jvEkN3jJZx7Ni8A53BMtv6V6tnzD9TET4qJTiyaXhe2dNaD3bDvMf6
	 YhbFFkRQiQWqw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r5mX5-0000GT-38;
	Wed, 22 Nov 2023 13:40:44 +0100
Date: Wed, 22 Nov 2023 13:40:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Felipe Balbi <balbi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH 10/12] dt-bindings: usb: qcom,dwc3: Introduce flattened
 qcom,dwc3 binding
Message-ID: <ZV32ywdBsLXs2mn6@hovoldconsulting.com>
References: <20231016-dwc3-refactor-v1-0-ab4a84165470@quicinc.com>
 <20231016-dwc3-refactor-v1-10-ab4a84165470@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dwc3-refactor-v1-10-ab4a84165470@quicinc.com>

On Mon, Oct 16, 2023 at 08:11:18PM -0700, Bjorn Andersson wrote:
> The Qualcomm USB block consists of three intertwined parts, the XHCI,
> the DWC3 core and the Qualcomm DWC3 glue. The three parts can not be
> operated independently, but the binding was for historical reasons split
> to mimic the Linux driver implementation.
> 
> The split binding also makes it hard to alter the implementation, as
> properties and resources are split between the two nodes, in some cases
> with some duplication.
> 
> Introduce a new binding, with a single representation of the whole USB
> block in one node.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-dwc3
> +              - qcom,sc8280xp-dwc3-mp

The multiport implementation is not ready yet and this part of the
binding has been reverted (similar for the multiport interrupts below).

> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 9
> +        clock-names:
> +          items:
> +            - const: cfg_noc
> +            - const: core
> +            - const: iface
> +            - const: sleep
> +            - const: mock_utmi
> +            - const: noc_aggr
> +            - const: noc_aggr_north
> +            - const: noc_aggr_south
> +            - const: noc_sys

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-dwc3-mp
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 14
> +        interrupt-names:
> +          items:
> +            - const: pwr_event_1
> +            - const: pwr_event_2
> +            - const: pwr_event_3
> +            - const: pwr_event_4
> +            - const: dp_hs_phy_1
> +            - const: dm_hs_phy_1
> +            - const: dp_hs_phy_2
> +            - const: dm_hs_phy_2
> +            - const: dp_hs_phy_3
> +            - const: dm_hs_phy_3
> +            - const: dp_hs_phy_4
> +            - const: dm_hs_phy_4
> +            - const: ss_phy_1
> +            - const: ss_phy_2

So same here.

> +    else:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          items:
> +            - description: Common DWC3 interrupt
> +            - description: The interrupt that is asserted
> +                when a wakeup event is received on USB2 bus.
> +            - description: The interrupt that is asserted
> +                when a wakeup event is received on USB3 bus.
> +            - description: Wakeup event on DM line.
> +            - description: Wakeup event on DP line.

I guess you may have copied this from the current binding but the
descriptions here are not correct. The HS/SS interrupt comes from the
PHYs in case the corresponding events have been enabled. I assume it can
be used for connect/disconnect events as well as remote wakeup and
whether to actually wake the system up on those is an implementation
detail.

Similar for DM/DP which represents the state of the data lines and that
can be used to detect all sorts of events, not just remote wakeup.

> +
> +        interrupt-names:
> +          minItems: 1
> +          items:
> +            - const: dwc_usb3
> +            - const: hs_phy_irq
> +            - const: ss_phy_irq
> +            - const: dm_hs_phy_irq
> +            - const: dp_hs_phy_irq

And here you are now defining all of these interrupts for all the
current SoCs it seems, despite not all of them actually having all of
these at once. (The order also does not match the current devicetrees.)

Some only have HS/SS, and it's not clear whether the HS interrupts are
actually functional when a SoC is also using DP/DM.

We're currently discussing this here:

	https://lore.kernel.org/lkml/ZVYTFi3Jnnljl48L@hovoldconsulting.com/

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    usb@a600000 {
> +        compatible = "qcom,sdm845-dwc3", "qcom,dwc3", "snps,dwc3";
> +        reg = <0x0a600000 0x200000>;

> +        snps,dis_u2_susphy_quirk;
> +        snps,dis_enblslpm_quirk;
> +        phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
> +        phy-names = "usb2-phy", "usb3-phy";
> +

Stray newline.

> +    };
> +...

Johan

