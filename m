Return-Path: <linux-arm-msm+bounces-59580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D0AC5979
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 19:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA431891428
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 17:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E972820D8;
	Tue, 27 May 2025 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tp1BX57i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE142820B1;
	Tue, 27 May 2025 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748368586; cv=none; b=iQDTVMMfDVMClg8ifiL6VoBTAd/glVb7uyZC0qSjrHInf1QeC0tp0/mIfXymiN1qYPqt9BaBPKKdKr1dHHPW6ykOscaWkBAQiHM7beBIaIYHdiE08sYWgxt1qY53vJ5qZURiq/puiPxuZ5gijVidhhW2XcDI6edjXk+OijHlzEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748368586; c=relaxed/simple;
	bh=qj/NFUs6Q4cvExcqis4HSxY/ptX9HKobaFds0gNh0KI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mnfTuY2kHtLCixU0ej8zuEYS7TpVxUE1M4I2ccH8n/BS7g0yn62Du9yB5i3to0cKDpwNhj++4IuWknHtQlSt4W8oqnTV01vuxALP63FRGlWfShVOE/QtAKt2jTnRs5/wzT84vUfUGfxpbL1b2uhV0oR/WjDPcvxvkqbpU9soWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tp1BX57i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F34C4CEE9;
	Tue, 27 May 2025 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748368586;
	bh=qj/NFUs6Q4cvExcqis4HSxY/ptX9HKobaFds0gNh0KI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tp1BX57iWRjfC47HV0pta+DAwEpBKFNV+PiY892vqqjRlJ7lqok4gRsc6j6MkQaSS
	 eM4mX4ropUMSkPMsBXYX4EpEeSlucrZ+n0p0/P2nytQzGT2tElKrpa0WTPN7+qRbyR
	 S3uQgeQKnvLlOlbrnI5dSQwYO2wx1EmZigk/pfIkCKHDBUerrnbM8Wm02sca5LDnOx
	 61GA6HDpMQ6ImPdZ9FS89Oe2+Uda0tQmXxd9qVs4QvDC5rc5B9tkIeWEcOtH9InYgN
	 UvpWM4pSYAXzB+naEfrkIdkXD/I2hdheXj520ZHqcvIEqdH0rBXHObALo/NdiKQ7DV
	 v1g4CAOVTLcHA==
Date: Tue, 27 May 2025 12:56:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Heiner Kallweit <hkallweit1@gmail.com>, devicetree@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 "David S. Miller" <davem@davemloft.net>, linux-clk@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paolo Abeni <pabeni@redhat.com>, linux-arm-msm@vger.kernel.org, 
 Eric Dumazet <edumazet@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
Message-Id: <174836830808.840816.13708187494007888255.robh@kernel.org>
Subject: Re: [PATCH 0/5] Add support for the IPQ5018 Internal GE PHY


On Sun, 25 May 2025 21:56:03 +0400, George Moussalem wrote:
> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
> output pins that provide an MDI interface to either an external switch
> in a PHY to PHY link architecture or directly to an attached RJ45
> connector.
> 
> The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
> 802.3az EEE.
> 
> The LDO controller found in the IPQ5018 SoC needs to be enabled to drive
> power to the CMN Ethernet Block (CMN BLK) which the GE PHY depends on.
> The LDO must be enabled in TCSR by writing to a specific register.
> 
> In a phy to phy architecture, DAC values need to be set to accommodate
> for the short cable length.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
> George Moussalem (5):
>       dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
>       clk: qcom: gcc-ipq5018: fix GE PHY reset
>       net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
>       arm64: dts: qcom: ipq5018: add MDIO buses
>       arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus
> 
>  .../devicetree/bindings/net/qca,ar803x.yaml        |  23 +++
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  51 ++++-
>  drivers/clk/qcom/gcc-ipq5018.c                     |   2 +-
>  drivers/net/phy/qcom/Kconfig                       |   2 +-
>  drivers/net/phy/qcom/at803x.c                      | 221 ++++++++++++++++++++-
>  5 files changed, 287 insertions(+), 12 deletions(-)
> ---
> base-commit: ebfff09f63e3efb6b75b0328b3536d3ce0e26565
> change-id: 20250430-ipq5018-ge-phy-db654afa4ced
> 
> Best regards,
> --
> George Moussalem <george.moussalem@outlook.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: base-commit ebfff09f63e3efb6b75b0328b3536d3ce0e26565 not known, ignoring
 Base: attempting to guess base-commit...
 Base: remotes/arm-soc/qcom/dt64-11-g43fefd6c7129 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com:

arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
arch/arm64/boot/dts/qcom/ipq5018-tplink-archer-ax55-v1.dtb: ethernet-phy@7: clocks: [[7, 36], [7, 37]] is too long
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#






