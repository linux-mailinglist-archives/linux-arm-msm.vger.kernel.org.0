Return-Path: <linux-arm-msm+bounces-61759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18161ADF614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 20:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F5D9189FEF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 18:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF7B2F4A1E;
	Wed, 18 Jun 2025 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mws7jMY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F83085B3;
	Wed, 18 Jun 2025 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750272140; cv=none; b=YR05NvcvjsBbfFpPkSP8Y5HOXz/216bzMD6rndap1m116uLgtWA+lUldVXK8/EMjtIKt3C2eJNGWdm0Aj9SzxXw84ikPsg2kiyi5O5yusBuKx8YsTJB5ZwkG6kQW5wmjN3w7vNGBgBUpr1RKql3n9/p5ovyLnOiQ5naOPmCmFsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750272140; c=relaxed/simple;
	bh=wE4/WPYWtqDJfV1HOrNScBw/vhgUfaSiNNDqKJCoR/s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/BogYzep7vXukUYRA1eyJJHBbryU6g1b7bb8T/ck71IB0u6Rti1eGcm9siCXgusG/kpzboGXxogosSQBf65GdTMtlTwIYYb8gnq9QfviM/x47LxvCQ1GkwxpAwhmwEuL41zLXEab62+E5Q3oC24fEDaJslObsBmCZcZn0Wdivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mws7jMY6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05344C4CEE7;
	Wed, 18 Jun 2025 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750272139;
	bh=wE4/WPYWtqDJfV1HOrNScBw/vhgUfaSiNNDqKJCoR/s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mws7jMY6McrOeNlVES1yw/4TjUstaMsYnOWWhQI3AF8uY80dHcujBFzqjI100tnDW
	 SN+64mEcUssHZ2xJsgFh3UAH37idYQjkuZA0wL8aB1rhOYs1rlWD2unHA0ZXbbFaca
	 MFE+Ug9Ghyso7OAI9lwyrURkKrjpO9N2Nox/eQs/tLibl67g+h/5D7jXE2CCyFwq3A
	 nJ/KUmyzfBVrXS3E+CbNVIaZbwXOLGg1AyziluV7NdhHBuSP1hCj7Z4IdDnBtKapgQ
	 7mBEjMT5f38m95JSDzzWnGEcc/yYK2tW1BuuhEVixfuD4foQ2okGbJOcrTTrXJFSXt
	 Kody0JO+P3QQg==
Date: Wed, 18 Jun 2025 11:42:18 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: George Moussalem via B4 Relay
 <devnull+george.moussalem.outlook.com@kernel.org>,
 george.moussalem@outlook.com, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND net-next v5 1/2] dt-bindings: net: qca,ar803x:
 Add IPQ5018 Internal GE PHY support
Message-ID: <20250618114218.6add7fa3@kernel.org>
In-Reply-To: <20250613-ipq5018-ge-phy-v5-1-9af06e34ea6b@outlook.com>
References: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
	<20250613-ipq5018-ge-phy-v5-1-9af06e34ea6b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 05:55:07 +0400 George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
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

Hi DT Maintainers!  Is this in anyone's review queue?
I see some comments from Rob on v2 but no reviews since.

