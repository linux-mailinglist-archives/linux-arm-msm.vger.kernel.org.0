Return-Path: <linux-arm-msm+bounces-59358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779AAC3691
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 21:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27C5A7A7166
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08EA25C70D;
	Sun, 25 May 2025 19:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WtzVY/Yx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B9718EAB;
	Sun, 25 May 2025 19:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201733; cv=none; b=UJuYFH4Ka1VKtP2Co8lX1st+6BMLXkpvm67fN/4ez6tBqxLv9EFStbq431vbHyFAH4cPdUEyya77aXJMZLy7GdEBKDNJ9oNg4GtTMJbDNXeT96cJWI2vImNTv3LYKZnXBV6Lair0g0ZqJ0pDkcTT6+9wdUJ/luFYy7+U9lsa5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201733; c=relaxed/simple;
	bh=JuT6KUnHq81bQuNvZamp268XAyuvKNLy5usnRZv+PA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9jBSJQb2ITILpG8VINtvYInOio64zUWiDKPDjhjXQEAff2CJzNZLLnNNz5VDHtn4I0yrWttKITG+RjB/Zv1XyLrsMrCOoeGN1Xp7ZcY4Ch9g8RoJOKrM94OnwmZs54tDRMMnilgnTCjPdc3OKmPWu+6U7WesFv/luKXEnBJVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=WtzVY/Yx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hjIoME60xChBfTDIKPKBOiyzN7tmPkpzibcygMvdyuU=; b=WtzVY/YxIqqYb0w69WwEwR1BUL
	Vlc7WR6jysHBTXv+17l1UGLs91NsIk7KsHxt+H3o8FZThA0gmGSI26lJsyTLEvIBLwojkJYS6nw46
	p4hwncCWIp2zX0GftQxC3SmxwCuyp0zNRNJGqZFkJ5jjfNJZPN8GhfOnv1eBfqbRC1Cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJH7l-00Dx2m-PI; Sun, 25 May 2025 21:35:09 +0200
Date: Sun, 25 May 2025 21:35:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: george.moussalem@outlook.com
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal
 GE PHY support
Message-ID: <579b0db7-523c-46fd-897b-58fa0af2a613@lunn.ch>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>

On Sun, May 25, 2025 at 09:56:04PM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Document the IPQ5018 Internal Gigabit Ethernet PHY found in the IPQ5018
> SoC. Its output pins provide an MDI interface to either an external
> switch in a PHY to PHY link scenario or is directly attached to an RJ45
> connector.
> 
> In a phy to phy architecture, DAC values need to be set to accommodate
> for the short cable length. As such, add an optional property to do so.
> 
> In addition, the LDO controller found in the IPQ5018 SoC needs to be
> enabled to driver low voltages to the CMN Ethernet Block (CMN BLK) which
> the GE PHY depends on. The LDO must be enabled in TCSR by writing to a
> specific register. So, adding a property that takes a phandle to the
> TCSR node and the register offset.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/net/qca,ar803x.yaml        | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qca,ar803x.yaml b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> index 3acd09f0da863137f8a05e435a1fd28a536c2acd..a9e94666ff0af107db4f358b144bf8644c6597e8 100644
> --- a/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> +++ b/Documentation/devicetree/bindings/net/qca,ar803x.yaml
> @@ -60,6 +60,29 @@ properties:
>      minimum: 1
>      maximum: 255
>  
> +  qca,dac:
> +    description:
> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
> +      and error detection and correction algorithm. Only set in a PHY to PHY
> +      link architecture to accommodate for short cable length.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    items:
> +      - items:
> +          - description: value for MDAC. Expected 0x10, if set
> +          - description: value for EDAC. Expected 0x10, if set

DT is not a collection of magic values to be poked into registers.

A bias current should be mA, amplitude probably in mV, and error
detection as an algorithm. 

	Andrew

