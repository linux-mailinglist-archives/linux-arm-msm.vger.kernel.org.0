Return-Path: <linux-arm-msm+bounces-2172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869897FAF0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 01:30:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCEBE1C20DC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAB0A2A;
	Tue, 28 Nov 2023 00:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bbRTvQC+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE251A2;
	Mon, 27 Nov 2023 16:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=RXJUdpNEWT2fSRqZk39lN7kLn1cO7XXum10Kr+b8hjY=; b=bbRTvQC+J9K35PMLvA3Fco0upj
	MXvAojVmeMrAECfyRQc8vr4zJyenwbw1Aq9RVLf+xuTx1nDokvAvv+jB4Q+m1xMBedxW2YYu/gD+O
	bg8gkORBNviUZkOVH9FgDPBXzSSfTkta8T90HtZC9wcOFK4jLQb1Da3edMOC6eLS64kc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7lzM-001Ou7-Jn; Tue, 28 Nov 2023 01:30:08 +0100
Date: Tue, 28 Nov 2023 01:30:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 6/8] dt-bindings: net: Document Qcom
 QCA807x PHY package
Message-ID: <19605736-0f67-4593-a9ae-0e5c4578648f@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-7-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-7-ansuelsmth@gmail.com>

> +$ref: ethernet-phy-package.yaml#
> +
> +properties:
> +  qcom,package-mode:
> +    enum:
> +      - qsgmii
> +      - psgmii
> +
> +  qcom,tx-driver-strength:
> +    description: set the TX Amplifier value in mv.
> +      If not defined, 600mw is set by default.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [140, 160, 180, 200, 220,
> +           240, 260, 280, 300, 320,
> +           400, 500, 600]

This is O.K, you are describing package properties, even if i don't
agree about qcom,package-mode.

> +patternProperties:
> +  ^ethernet-phy(@[a-f0-9]+)?$:
> +    $ref: ethernet-phy.yaml#
> +
> +    properties:
> +      gpio-controller:
> +        description: set the output lines as GPIO instead of LEDs
> +        type: boolean
> +
> +      '#gpio-cells':
> +        description: number of GPIO cells for the PHY
> +        const: 2

But now you are describing PHY properties. These belong on a .yaml of
its own, just like qca,ar803x.yaml defines properties for the AR803x
PHY.

	Andrew

