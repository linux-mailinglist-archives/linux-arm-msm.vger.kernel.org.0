Return-Path: <linux-arm-msm+bounces-36261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343009B42DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 08:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A62CDB21CF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 07:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C1B2022CF;
	Tue, 29 Oct 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oICyg007"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A3D8821;
	Tue, 29 Oct 2024 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185962; cv=none; b=U2UJ/p9Y07Tg3AEH+CDIyNqR6PRyYXx042nrfE50kzcaH/9qlR/SFRrxMP410+t7asB242HRjvWalYpqTLMXjAUtSuCpHPTeqQNm9Cm5gLFeTlTx6Fm+CzGLbGVs+7QFcuBeTkXmMAQKLArxSg8WhzgeyJD2CPPxkpEhuQl2hVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185962; c=relaxed/simple;
	bh=igfKIenU4dJBGawwsJvxkzCU1VOD+q+NRQ0rb5inxyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zj/x8Wr1BovcaS7BEO+zh3U7NoFjoaJrIhrs5Pdxu/8g081Wr+bwMhRyfZ6TjKt0GKQnA4kNoHPTFMD5FMXS+FQmQnzoWcprroC3vWRpdhOtta8XmS2JPUi+GW4OTSNNtzvcytFElGqCZb/RxVPtG2msXes7KZuUUeCYyl8TwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oICyg007; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AF6C4CECD;
	Tue, 29 Oct 2024 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730185962;
	bh=igfKIenU4dJBGawwsJvxkzCU1VOD+q+NRQ0rb5inxyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oICyg007b5Gm5w8lag5yVt14qEuHdGfETw0y6VEKHn4w/2+3Xut+s17l7d0VbKdG5
	 P+mUdW0xVf2EL4S3vtkjlyAp5avy27nY2x+JdhgoQTKP6cvMzN5zjbHQLJ0cUw74ln
	 QnWDoP2fquZxcQ073e4poPypqnnYjw2HUHIXe5W+qDXrB6MShGJw+dDrfiPNKORvqJ
	 1eTAeePVW9dQspVOjJ0Iq0SmDekLCynKm4wVOIvdaNCPUqDLpdpgoiTIZyaTmDE8vI
	 BnUPa7sckEg5rItKMix1BIJGB+HS9sEzrOTCwD9pVIaV7YuJuvPjzej8EK1CPwGdIz
	 WlSbXvlboWIiA==
Date: Tue, 29 Oct 2024 08:12:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <erg5zzxgy45ucqv2nq3fkcv4sr7cxqzxz6ejdikafwfpgkkmse@7eigsyq245lu>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-13-03618f10e3e2@oss.nxp.com>

On Mon, Oct 28, 2024 at 09:24:55PM +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 98 ++++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  3 +
>  2 files changed, 101 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> new file mode 100644
> index 000000000000..b11ba3bc4c52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2021-2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> +
> +maintainers:
> +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> +
> +description:
> +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,s32g2-dwmac
> +      - nxp,s32g3-dwmac
> +      - nxp,s32r-dwmac

Your driver says these are fully compatible, why this is not expressed
here?

> +
> +  reg:
> +    items:
> +      - description: Main GMAC registers
> +      - description: GMAC PHY mode control register
>

...

> +        mdio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          compatible = "snps,dwmac-mdio";
> +
> +          phy0: ethernet-phy@0 {
> +              reg = <0>;

Messed indentation. Keep it consistent.

Best regards,
Krzysztof


