Return-Path: <linux-arm-msm+bounces-61504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D929ADBCA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 00:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 209E11892318
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 22:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3B222D781;
	Mon, 16 Jun 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otR/Scfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770A222D780;
	Mon, 16 Jun 2025 22:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750111812; cv=none; b=aVmhwcns5ou4cDs4yf59ub+6yZTJ+Kxmf3FrtiSPORTQYP9XBeMrou8zNugBIN/qS9wZRaCxOpv5awmUpsIyxivSU7IYtzZyqaYBZESTOWdfAPTo9QbUWvZtEhmXDeEre6wIQUvggFiNLyVrJWNJEzOKedzMsYjepNkKTDySbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750111812; c=relaxed/simple;
	bh=/UFQy/gwF7auX1dmeeWX0y5HeA22qawDpoPuhTXqVnw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=axaNd9ezKgEUDdvmDTYagUv/mPCrZJmx5aewQJKNZrchEqgUWkacXqHpMYqh/lPicmqTsKxgduzHCPNSHs3KhdzsuKSNeJNjchwqcvah1xkVEvh6bTlb/LRreixutT2+EGkCfeN8bHrDbSUlEwtJnCTSCnUDugGsnFidIMa9NyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otR/Scfk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0086C4CEEA;
	Mon, 16 Jun 2025 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750111811;
	bh=/UFQy/gwF7auX1dmeeWX0y5HeA22qawDpoPuhTXqVnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=otR/ScfkmiBWXEbpcWOJlqYb1rAnFUVEnRn8+FYqoIAWGOYwV0AxHstBzFzUVzZCy
	 jhAZgP1NU1I9cQnHfUZuUV1aYoRcmNgnsoHQqJx/vFibgYUjkK9PRncbe9uvr8Dd2j
	 XHWDotczCBbx4cvoPJEHUbctkYP3wmpiUtCtWGg5jkYWXHRyiNX49/k5p3q0ElPqFl
	 fPXYs8VWO/fnPF69/a+JY0NpRd8nK4WvWurTb8a3aCGOMdE9pQfARWcdb/jQHtFAOf
	 qKAQvFPOfF45GNa+t9a1mcn4geHSpMh3Rrfm3vzM7CQDk7uYrJZyJy9dtQ+K6lWDG2
	 32jR9EAMHroDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACFF38111D8;
	Mon, 16 Jun 2025 22:10:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/3] net: phy: make phy_package a separate module
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175011184073.2530350.6087096152984005228.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jun 2025 22:10:40 +0000
References: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
In-Reply-To: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew+netdev@lunn.ch, pabeni@redhat.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, andrew@lunn.ch,
 linux@armlinux.org.uk, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jun 2025 23:25:00 +0200 you wrote:
> Only a handful of PHY drivers needs the PHY package functionality,
> therefore make it a separate module which is built only if needed.
> 
> Heiner Kallweit (3):
>   net: phy: move __phy_package_[read|write]_mmd to phy_package.c
>   net: phy: make phy_package a separate module
>   net: phy: add Kconfig symbol PHY_PACKAGE
> 
> [...]

Here is the summary with links:
  - [net-next,1/3] net: phy: move __phy_package_[read|write]_mmd to phy_package.c
    https://git.kernel.org/netdev/net-next/c/cbd1ab0ce8f6
  - [net-next,2/3] net: phy: make phy_package a separate module
    https://git.kernel.org/netdev/net-next/c/a1acde1e1bcf
  - [net-next,3/3] net: phy: add Kconfig symbol PHY_PACKAGE
    https://git.kernel.org/netdev/net-next/c/7d57386905d4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



