Return-Path: <linux-arm-msm+bounces-62113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B43AE4CD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 20:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442653AB6C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FDA2D3237;
	Mon, 23 Jun 2025 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOmo0Uyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1A853BE;
	Mon, 23 Jun 2025 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703382; cv=none; b=SiPdiwmgKWDmiVwHsRjyBWqqwI800YtpqXyzwijxNjxfBy6IAU6MbD8ElyZWFFSlX2rDKHmHKt0rshrBX6zPh4xoeB2ttzTqWStjMb1dFQz3ml0UlwxjrFWBweDl4seBdBiAc22IGZktAeSBENb7BVGqyhcMrCSkTrCCYzA1cFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703382; c=relaxed/simple;
	bh=DuV8Yun1lWZ3oSW7rIJg5T8e5u0ZEQ+SP0liO9MVO3Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=arAF9kcHpAt9gdIPyDBPnNup/uVZ7HU3QgyExhB5Wtq2l4c3NhzDKuMnhwcOKf3SjaBnUgPTaSpRMNFAT45v4HA/T8JQTroQj3WADiSspHZcuJn2yJPxhRTTlwsadXc1oFE6bzPujhH7XgghPhxX64tNeRkbsQTuoQlqaEUWrPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOmo0Uyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2C6C4CEEA;
	Mon, 23 Jun 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750703381;
	bh=DuV8Yun1lWZ3oSW7rIJg5T8e5u0ZEQ+SP0liO9MVO3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AOmo0UyvrRlt1Fx96qYaSu48tm/BSdpAy6PBODxz2orDihTk5dsvfyP1eVtn7a/2+
	 F1zAorzCbMIIsgNIwQMK0j0O5mBYkjYwDAhZLtLkqfec9pn300Ygqt2b7PXy2OHcjM
	 dvkbEbe1ei00nZ2rVsi2otQqL7Qqcw0j9aP8tjdAIoHufGqsWW555LiB8AtRg39BRu
	 8LkgThbs6yAvafsw3mgHiP6E3gMJmORJHj5IJHs972tJjHkIWUixBfMjwJJoD2Q3Nr
	 YQ3CniVmkVgazbbvEUR05g4eUGmx+uJ8eSUe9FCqivLWickB+1sSrb8nSmHmbucly3
	 bHLy4lwZb+Oog==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEEC38111DD;
	Mon, 23 Jun 2025 18:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net-next v5 0/2] Add support for the IPQ5018
 Internal GE PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175070340876.3258656.5575686241109513013.git-patchwork-notify@kernel.org>
Date: Mon, 23 Jun 2025 18:30:08 +0000
References: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
In-Reply-To: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 f.fainelli@gmail.com, p.zabel@pengutronix.de, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Jun 2025 05:55:06 +0400 you wrote:
> The IPQ5018 SoC contains an internal Gigabit Ethernet PHY with its
> output pins that provide an MDI interface to either an external switch
> in a PHY to PHY link architecture or directly to an attached RJ45
> connector.
> 
> The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
> interface mode, CDT, auto-negotiation and 802.3az EEE.
> 
> [...]

Here is the summary with links:
  - [RESEND,net-next,v5,1/2] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE PHY support
    https://git.kernel.org/netdev/net-next/c/82eaf94d69fc
  - [RESEND,net-next,v5,2/2] net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support
    https://git.kernel.org/netdev/net-next/c/d46502279a11

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



