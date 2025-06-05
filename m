Return-Path: <linux-arm-msm+bounces-60369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183AACF653
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 20:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23BE189D367
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 18:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A7279918;
	Thu,  5 Jun 2025 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irglAXUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7D275869;
	Thu,  5 Jun 2025 18:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749147296; cv=none; b=ulBQQ14iFdrhXbO00MA3Upol6evW7bEN0B0HtbNn7C2B2BlJvA1tL1qwsi5+aYMgj5A4cX52RxO0a9R7gk0P2PN+Nj/OIsRm7QwMDhdlTtY5+2PaUhE24Cm2Aowp9zQ5z5oOb+R3QVlfI2P3hFL5NlpHBUYOsdutg1DUZ/iVrhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749147296; c=relaxed/simple;
	bh=kM+tZQLZzYNHuIw8DxjQDCB49bssz5ArH/w0ixdklPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYUZ2tvzNbunXXwMPDGqw3yrO+brcobqYiryd4PYpgTsGLJ0pINHr8HEdzfyDDBvBIpz9HX6QT49HN0pnMjvnv1K7kIyeAIMa5Df7wTkIOErRNagBbVEwBwUzhlxNp2oNVJ+SfMzGcNjflQr7pwEjvz39EEBcMVqG4N/gsn4K0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irglAXUu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949B2C4CEE7;
	Thu,  5 Jun 2025 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749147295;
	bh=kM+tZQLZzYNHuIw8DxjQDCB49bssz5ArH/w0ixdklPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irglAXUu2OpsKW9nnQWyxV8tVob52YV/dgR9F0uBahjTSfnZlgO5EVlJhjYbltYXu
	 9lTnWSlOsDUgBwDvE9NnQENGN4k8AxmNWWB21jbtpF/pFzg60sSqmyI9dd3g5UaIz5
	 F/yka1xtCh7bwVqLQQeTpiQPGJ1kwkYVV0zSpPRYNwVdUkDHn8GPH0MElwJ/1I8bIT
	 Xd8kh5eKQp/yUzk+TnmPYge/1i12/RZSZK/yV4iJ1ZCrUSYecHTTRFAczRReeZXc0/
	 MNpV1jjiF6eTu/jqu6EA4GcnV0PXjdq2agD/BztXZ55wQNNMXKc8epepoAHiLxuDss
	 FLRKwbWv7PVFg==
Date: Thu, 5 Jun 2025 13:14:53 -0500
From: Rob Herring <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <20250605181453.GA2946252-robh@kernel.org>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
 <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-ipq5018-ge-phy-v3-2-421337a031b2@outlook.com>

On Mon, Jun 02, 2025 at 01:53:14PM +0400, George Moussalem wrote:
> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
> SoC. Its output pins provide an MDI interface to either an external
> switch in a PHY to PHY link scenario or is directly attached to an RJ45
> connector.
> 
> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
> 802.3az EEE.
> 
> For operation, the LDO controller found in the IPQ5018 SoC for which
> there is provision in the mdio-4019 driver.
> 
> Two common archictures across IPQ5018 boards are:
> 1. IPQ5018 PHY --> MDI --> RJ45 connector
> 2. IPQ5018 PHY --> MDI --> External PHY
> In a phy to phy architecture, the DAC needs to be configured to
> accommodate for the short cable length. As such, add an optional boolean
> property so the driver sets preset DAC register values accordingly.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/net/qca,ar803x.yaml        | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> index 3acd09f0da863137f8a05e435a1fd28a536c2acd..fce167412896edbf49371129e3e7e87312eee051 100644
> --- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> +++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> @@ -16,8 +16,32 @@ description: |
>  
>  allOf:
>    - $ref: ethernet-phy.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ethernet-phy-id004d.d0c0
> +
> +    then:
> +      properties:
> +        reg:
> +          const: 7  # This PHY is always at MDIO address 7 in the IPQ5018 SoC

blank line

> +        resets:
> +          items:
> +            - description:
> +                GE PHY MISC reset which triggers a reset across MDC, DSP, RX, and TX lines.

blank line

> +        qcom,dac-preset-short-cable:
> +          description:
> +            Set if this phy is connected to another phy to adjust the values for
> +            MDAC and EDAC to adjust amplitude, bias current settings, and error
> +            detection and correction algorithm to accommodate for short cable length.
> +            If not set, it is assumed the MDI output pins of this PHY are directly
> +            connected to an RJ45 connector and default DAC values will be used.
> +          type: boolean
>  
>  properties:
> +

Drop

But this schema is broken. There's no way for it to be applied to a node 
because there is no compatible defined in this schema nor a 'select'. 
You can introduce an error and see (e.g. 'qcom,dac-preset-short-cable = 
"foo";'). Really, any phy using these properties should have a specific 
compatible defined here.

>    qca,clk-out-frequency:
>      description: Clock output frequency in Hertz.
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -132,3 +156,18 @@ examples:
>              };
>          };
>      };
> +  - |
> +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> +
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
> +        ge_phy: ethernet-phy@7 {
> +            compatible = "ethernet-phy-id004d.d0c0";
> +            reg = <7>;
> +
> +            resets = <&gcc GCC_GEPHY_MISC_ARES>;
> +        };
> +    };
> 
> -- 
> 2.49.0
> 

