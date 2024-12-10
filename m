Return-Path: <linux-arm-msm+bounces-41205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAC69EA790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 06:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9720F16675D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 05:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8870B1D9A40;
	Tue, 10 Dec 2024 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5DIW0r/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484A1168BE;
	Tue, 10 Dec 2024 05:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733807422; cv=none; b=Xafm2nRJHV1uj+Or9iMqKieREUCMEEu92X+04d/d/114qk2izD28P15vz8hcYBgrLoreBQDaYoOuv4MnB73ZqIdWwsB8DCpqMuxFH5itn/wVRqtbib8z3LJ0hT59gt/OUFDS8MTBjTZ7gSabNj1I8ADt2UgHJdpVNzy8kjFBTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733807422; c=relaxed/simple;
	bh=3PFxSSpWAf1uej3O7h8d+RzULqKyQZ0CsWOcHahIS8Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HQTyrxVuz9t/j7XyzronW3pVQBFLEMPhWQbfFE3063TxE/q9Zn4nCOKd4YB6KCSc6fr3ZnizGREE0tvUiCNAPvR5DdbflrcMgK7wZStI/xlHFhX+O8WPU91NKAETgODU3yb9SQrJuSzGE+J6KbZ+qj3vFuteNbDY7j9AnFlxzJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r5DIW0r/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE6FC4CED6;
	Tue, 10 Dec 2024 05:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733807421;
	bh=3PFxSSpWAf1uej3O7h8d+RzULqKyQZ0CsWOcHahIS8Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r5DIW0r/VhAd2ECaJf98oP2OK0PH5pluM0LmVmvuXQftBAz3Kvc0GBB1gYNAWofoU
	 OvWYB4nuOAJP48oZC8JU3OMa89t5wynMF/6vWpKf6mgKoLBg15ElQJcYnPRRIZZQ3g
	 7BPWUKVGpiTSTo1uzVTiyeFOTVmFlEn/wjsc5dX60ETAFfBFEj4dnZ0w9MnPa5tXy4
	 YO4s3JkG5/CuHuN3to7O8HnS3i3evzVxJWa7ivs39csiVplv63toxbTbTnwJfRexh0
	 QCrB7X697iWUdw0gmKR4deBPF9E0U5bVl8MpuuTTkwq7NjjMEoXt057QK6aOP1oc3L
	 /foaMsTnmJ8Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 716FC380A95E;
	Tue, 10 Dec 2024 05:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 00/15] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <173380743727.355055.17303486442146316315.git-patchwork-notify@kernel.org>
Date: Tue, 10 Dec 2024 05:10:37 +0000
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Cc: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, vkoul@kernel.org,
 richardcochran@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, kernel@esmil.dk,
 minda.chen@starfivetech.com, nicolas.ferre@microchip.com,
 claudiu.beznea@tuxon.dev, iyappan@os.amperecomputing.com,
 keyur@os.amperecomputing.com, quan@os.amperecomputing.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, peppe.cavallaro@st.com,
 andrew+netdev@lunn.ch, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, s32@nxp.com, 0x1207@gmail.com,
 fancer.lancer@gmail.com, jan.petrous@oss.nxp.com, jacob.e.keller@intel.com,
 rmk+kernel@armlinux.org.uk, emil.renner.berthing@canonical.com

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 05 Dec 2024 17:42:57 +0100 you wrote:
> The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> interface over Pinctrl device or the output can be routed
> to the embedded SerDes for SGMII connectivity.
> 
> The provided stmmac glue code implements only basic functionality,
> interface support is restricted to RGMII only. More, including
> SGMII/SerDes support will come later.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,01/15] net: stmmac: Fix CSR divider comment
    https://git.kernel.org/netdev/net-next/c/31cdd8418234
  - [net-next,v8,02/15] net: stmmac: Extend CSR calc support
    https://git.kernel.org/netdev/net-next/c/c8fab05d021d
  - [net-next,v8,03/15] net: stmmac: Fix clock rate variables size
    https://git.kernel.org/netdev/net-next/c/cb09f61a9ab8
  - [net-next,v8,04/15] net: phy: Add helper for mapping RGMII link speed to clock rate
    https://git.kernel.org/netdev/net-next/c/386aa60abdb6
  - [net-next,v8,05/15] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/37b66c483e4c
  - [net-next,v8,06/15] net: dwmac-imx: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/839b75ea4d94
  - [net-next,v8,07/15] net: dwmac-intel-plat: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/8470bfc83515
  - [net-next,v8,08/15] net: dwmac-rk: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/30b4a9b5c335
  - [net-next,v8,09/15] net: dwmac-starfive: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/b561d717a799
  - [net-next,v8,10/15] net: macb: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/04207d28f468
  - [net-next,v8,11/15] net: xgene_enet: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/fd59bca4d5ea
  - [net-next,v8,12/15] net: dwmac-sti: Use helper rgmii_clock
    https://git.kernel.org/netdev/net-next/c/1ead57775507
  - [net-next,v8,13/15] dt-bindings: net: Add DT bindings for DWMAC on NXP S32G/R SoCs
    https://git.kernel.org/netdev/net-next/c/91f10e589520
  - [net-next,v8,14/15] net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver
    https://git.kernel.org/netdev/net-next/c/cd197ac5d661
  - [net-next,v8,15/15] MAINTAINERS: Add Jan Petrous as the NXP S32G/R DWMAC driver maintainer
    https://git.kernel.org/netdev/net-next/c/6bc6234cbd5e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



