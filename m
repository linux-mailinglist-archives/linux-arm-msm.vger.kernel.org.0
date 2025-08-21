Return-Path: <linux-arm-msm+bounces-70138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D558B2F59F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466EC587DB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FB5308F11;
	Thu, 21 Aug 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnkrqOXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB3308F02;
	Thu, 21 Aug 2025 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755773414; cv=none; b=g+2W7wWTLH8GicqRyQEOeulhllSTxl2djV55e2b2y8piKkbjBj8SFBis4dkCKZ5WyMjx8zUaJ4qbTO09u2qZhoH3FUdZAt2lIXWsIILNYCmYDuevfWwS4nH3Vc/Sh3xgmgqjHI2Yku9lZa2wHqKOHCJaVRICYC3b9fXgZrFcbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755773414; c=relaxed/simple;
	bh=3pWLHc7LmGxgUyl74J5LFWhSFK0KCYRgf/oJ2btTLDI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JNA90HiKf8ce6WalzuRukEfdlyVPe2oONvNREXJ5JzqE1MKXPS6VUxb2QXoyLT9aZCYUKa6iAXARrBpnHH0zHn5PshkvvSg/AMEd5t/hE7vIgM/lp+eoUOMe83Oq64Lnve0sMd/6gf1eVEoDKEiRx3f/9jGb3ybdO2hnB6DdDGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnkrqOXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF9EC4CEEB;
	Thu, 21 Aug 2025 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755773414;
	bh=3pWLHc7LmGxgUyl74J5LFWhSFK0KCYRgf/oJ2btTLDI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mnkrqOXHzIRqsY8fvy/vAHAEDK9+sT2XcxY9xn12xK8HxrmGkTImR/ebMLe6Xg81K
	 9NQTFTqJSFPSMl1S6PaYn/sges8X/7fUeBexkwwPwHhijE5L4pVmhP32LC2miHSKKv
	 o+nLUJVkitI9LhycxaVByhD0TBaA+/bYlJ5rmOgbjzMVrrRuj7hzj900DDSYfFA7eT
	 F9UxuUaKuim+ajVoK30suue2H+MhKvSxNCJNYqnW9EAKC+lFh2QLnm4RDGRI1Y470n
	 k2u/PlhV7243xai0eq/2QifGsf0oVFHbar0dCoNJwDLXufGu6cV0nNGGqblMvlI0MU
	 VMsNbFt4ZU3Fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F05383BF5B;
	Thu, 21 Aug 2025 10:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 00/14] Add PPE driver for Qualcomm IPQ9574 SoC
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175577342325.986145.13841394351982921726.git-patchwork-notify@kernel.org>
Date: Thu, 21 Aug 2025 10:50:23 +0000
References: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
In-Reply-To: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
 quic_pavir@quicinc.com, horms@kernel.org, corbet@lwn.net, kees@kernel.org,
 gustavoars@kernel.org, p.zabel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org, quic_kkumarcs@quicinc.com,
 quic_linchen@quicinc.com

Hello:

This series was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 18 Aug 2025 21:14:24 +0800 you wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574 and IPQ5332.
> The PPE in the IPQ9574 SoC includes six Ethernet ports (6 GMAC and 6
> XGMAC), which are used to connect with external PHY devices by PCS. The
> PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN. It also includes an L2 switch function for
> bridging packets among the 6 Ethernet ports and the CPU port. The CPU
> port enables packet transfer between the Ethernet ports and the ARM
> cores in the SoC, using the Ethernet DMA.
> 
> [...]

Here is the summary with links:
  - [net-next,v8,01/14] dt-bindings: net: Add PPE for Qualcomm IPQ9574 SoC
    https://git.kernel.org/netdev/net-next/c/1898fc572118
  - [net-next,v8,02/14] docs: networking: Add PPE driver documentation for Qualcomm IPQ9574 SoC
    https://git.kernel.org/netdev/net-next/c/6b9f301985a3
  - [net-next,v8,03/14] net: ethernet: qualcomm: Add PPE driver for IPQ9574 SoC
    https://git.kernel.org/netdev/net-next/c/353a0f1d5b27
  - [net-next,v8,04/14] net: ethernet: qualcomm: Initialize PPE buffer management for IPQ9574
    https://git.kernel.org/netdev/net-next/c/8a971df98c4e
  - [net-next,v8,05/14] net: ethernet: qualcomm: Initialize PPE queue management for IPQ9574
    https://git.kernel.org/netdev/net-next/c/806268dc7efd
  - [net-next,v8,06/14] net: ethernet: qualcomm: Initialize the PPE scheduler settings
    https://git.kernel.org/netdev/net-next/c/331227983814
  - [net-next,v8,07/14] net: ethernet: qualcomm: Initialize PPE queue settings
    https://git.kernel.org/netdev/net-next/c/7a23a8af179d
  - [net-next,v8,08/14] net: ethernet: qualcomm: Initialize PPE service code settings
    https://git.kernel.org/netdev/net-next/c/73d05bdaf01e
  - [net-next,v8,09/14] net: ethernet: qualcomm: Initialize PPE port control settings
    https://git.kernel.org/netdev/net-next/c/8821bb0f6262
  - [net-next,v8,10/14] net: ethernet: qualcomm: Initialize PPE RSS hash settings
    https://git.kernel.org/netdev/net-next/c/1c46c3c0075c
  - [net-next,v8,11/14] net: ethernet: qualcomm: Initialize PPE queue to Ethernet DMA ring mapping
    https://git.kernel.org/netdev/net-next/c/fa99608a9a9e
  - [net-next,v8,12/14] net: ethernet: qualcomm: Initialize PPE L2 bridge settings
    https://git.kernel.org/netdev/net-next/c/8cc72c6c9236
  - [net-next,v8,13/14] net: ethernet: qualcomm: Add PPE debugfs support for PPE counters
    https://git.kernel.org/netdev/net-next/c/a2a7221dbd2b
  - [net-next,v8,14/14] MAINTAINERS: Add maintainer for Qualcomm PPE driver
    https://git.kernel.org/netdev/net-next/c/ad5cef7ef01c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



