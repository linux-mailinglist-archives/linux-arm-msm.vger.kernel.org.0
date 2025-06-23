Return-Path: <linux-arm-msm+bounces-61994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4BAE35C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 08:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F13303AEDBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 06:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454ED1A5BA4;
	Mon, 23 Jun 2025 06:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjXMs0HS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCBDBA33;
	Mon, 23 Jun 2025 06:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660469; cv=none; b=iBp1aY+43JTRLlixNF0nj/deTXxcuyNUsRxDybEs9GrB0nYlrH+rv7w1VJTxOQhj7x0VkuZyCLj9ELNvZTKD1pBElm/r9zeIhVkFr6RdN3uWFYTSuWvAPt9mIF4HIRBTKuov1/bYQ0VrcFLrO6LjBU+Y2b00S/LN5yz3MOvDH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660469; c=relaxed/simple;
	bh=4C6wXd+Eo26Qy37WMRqveXHtHM5MhD9wkvtfxwvTAxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkAWG2Yz9ksIJqemwo+omtftFGT/lnWNMUF7jdOcMHpDFAIvgPFSOgL5cp/x1M7t9SRDjoWe26z4ctoqrNDPj9hFTb43NIYWLjZVoCTdH4Spe8Ne3I9iFx9aXz8FJdwJeW6D5+nfzuBnVt2m8VBc6l2tWsw8Xc3Xw+r2qaOSNrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjXMs0HS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184EBC4CEED;
	Mon, 23 Jun 2025 06:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750660468;
	bh=4C6wXd+Eo26Qy37WMRqveXHtHM5MhD9wkvtfxwvTAxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjXMs0HSZ/fkqEHhPxPmQ/2qIq6mwXllao9DJWgUNtpchNh0SpnExy8d0k3vyFOBK
	 lrLwczroAQ9joHePT21xiaY1LTFudGpxMEGroh459DjOylLItCQfduWgN14HRKfEPD
	 XPwuLzINUTqu4pRZUxAagMdhixGXI18eusmnklpx0qutapC6EB/de2AxdTerUHXQE1
	 IaIruIdaHjYxZMk3oyzDaWhKdxHdya3BsF4XySjX16zvKJNw/11OWy8jDOgfpFiHbX
	 RsRIGo4/wGnexy8N8lr6VvIzVLKfmIwXsvh45g2/wvTc7sNN8pzp2okrw6Vo5D4QLB
	 PS3AEqkAcna9A==
Date: Mon, 23 Jun 2025 08:34:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND net-next v5 1/2] dt-bindings: net: qca,ar803x: Add
 IPQ5018 Internal GE PHY support
Message-ID: <26v6yklme3bbw3h4eze4z27cgr67ovymee5mc6nay23zt4xfcv@37sus6dp3g7x>
References: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
 <20250613-ipq5018-ge-phy-v5-1-9af06e34ea6b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613-ipq5018-ge-phy-v5-1-9af06e34ea6b@outlook.com>

On Fri, Jun 13, 2025 at 05:55:07AM +0400, George Moussalem wrote:
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
>  .../devicetree/bindings/net/qca,ar803x.yaml        | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


