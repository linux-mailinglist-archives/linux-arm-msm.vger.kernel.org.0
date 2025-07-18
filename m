Return-Path: <linux-arm-msm+bounces-65565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B6B09984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 04:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 461381715D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 02:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F401BC2A;
	Fri, 18 Jul 2025 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHLrVRNH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806E1CEAB2;
	Fri, 18 Jul 2025 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752804005; cv=none; b=Sd2inPOPfmtEM36qPjJbtPFH7zrn0k576dDgnW1S/uFc9qroXrCHY1heGCSKW3qg0Mj/tR7+QfE55cWqBQqkG0CItnwcsnfuOrlkooqn1xaqWi7QWP7PuNGg/+ybzjkBHmJ9a9byi9p9Q3VsmGTxRgq4LENQgUZQbO+mZByrPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752804005; c=relaxed/simple;
	bh=7qvsqx1de8j/7gYl2naIdK0LtF2ufyf4Xtjxazufslw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=onIusKoy8mgsXOEFxDdZ1+gkPJBz0sBQDr/sHZFgB3esb/qd6E3oI0NBNQ9aJUcemX7QnH3Fy9UAtN4WdeQNYxgAjkHDXZKC0K/7YzvEjEHYku1XkJldRIuBI6N10YWKyHIfgUrDnbnXc6NkZ+AoAIEQp4vYUM96e7KC1Pa6ExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHLrVRNH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA013C4CEF0;
	Fri, 18 Jul 2025 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752804004;
	bh=7qvsqx1de8j/7gYl2naIdK0LtF2ufyf4Xtjxazufslw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tHLrVRNH3g+96sUkLxI8ICty+80cREVqrb3f8KiBKuejU1r/d86yTpnqfTUwZ3MdP
	 b28fpEogcg9U+WLEv8/NQIPjiDFMQ6I5WRqANHAmX8yPIC5dNSJ+EEMOpa7PEECHXN
	 LuTjNqTORZa8+y0IbxRyDDjLiwEP2KJ53ZcZPl0FK8A6fppl+4u4QBCspxUz3kI1sw
	 udCHJQmbvoYVc3qtAWQxIKGm5VPCDV1FUg4/O59m0iTtqCe7rjtv7V10sd1lxy/6+r
	 I5lNrFRcgw0IZ5asaJX/Z8i7NIVV0PA3jiinb34mvf94+iwI7W8NtsPPNiE/Q04x1x
	 7tVpPxDSivl2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD34383BA3C;
	Fri, 18 Jul 2025 02:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/3] Add shared PHY counter support for
 QCA807x
 and QCA808x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175280402449.2141855.11339300453684668234.git-patchwork-notify@kernel.org>
Date: Fri, 18 Jul 2025 02:00:24 +0000
References: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
In-Reply-To: <20250715-qcom_phy_counter-v3-0-8b0e460a527b@quicinc.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 15 Jul 2025 19:02:25 +0800 you wrote:
> The implementation of the PHY counter is identical for both QCA808x and
> QCA807x series devices. This includes counters for both good and bad CRC
> frames in the RX and TX directions, which are active when CRC checking
> is enabled.
> 
> This patch series introduces PHY counter functions into a shared library,
> enabling counter support for the QCA808x and QCA807x families through this
> common infrastructure. Additionally, enable CRC checking and configure
> automatic clearing of counters after reading within config_init() to ensure
> accurate counter recording.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/3] net: phy: qcom: Add PHY counter support
    https://git.kernel.org/netdev/net-next/c/22bf4bd8ec4f
  - [net-next,v3,2/3] net: phy: qcom: qca808x: Support PHY counter
    https://git.kernel.org/netdev/net-next/c/3370e33a1c23
  - [net-next,v3,3/3] net: phy: qcom: qca807x: Support PHY counter
    https://git.kernel.org/netdev/net-next/c/d98f43b84a1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



