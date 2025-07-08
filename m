Return-Path: <linux-arm-msm+bounces-63956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D196AFBF4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 02:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A9DD1AA85F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 00:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45C71DD0EF;
	Tue,  8 Jul 2025 00:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aV1t61Sr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C51DB375;
	Tue,  8 Jul 2025 00:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751935386; cv=none; b=Xk1RBDhzQyI4TmTrc0Jpu/yeZbGdaZBiByZAl13f2GYA8llc/GX8HeB7NMa39uuy404BY0MvXeJxJK4ArJCjAY0ZFH0oydaDLgopp3iTvSiECw6mkdRu5GmhHYKVfrFfgGxCY2vXYyV/vudDcMtV4b6VkN2bTX4WZ+MDLNrUecI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751935386; c=relaxed/simple;
	bh=OM6DSiPA2OlOE23y/X/4gQLKmsBitK2wNjT6uRVNGtE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VdJZ3Axb8IKoAqy2RLrOCuCYZW8vzkYCskeA+L0kZrKCxQboi/eR7GeI958qcyXvP28nrue7FjnVdeE8JP7S+uiWvG4aFNmnnp/wKrbiXIgOosySV7AQrrOBiQ6GPDwbwjhDoN2keneykAJCOZ/Z5mqmzmLiFrOPREuTxUo7Tiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aV1t61Sr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EC0C4CEF1;
	Tue,  8 Jul 2025 00:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751935386;
	bh=OM6DSiPA2OlOE23y/X/4gQLKmsBitK2wNjT6uRVNGtE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=aV1t61SrWEvlq3+eeF4TbRzjQHr9n19UDQEBo5WuUjyrmxEyxTv16Qu4QEsuArIDn
	 +qiPRz8FcQHb206V7CEDuISmazDDShsgcyHNprKxR+1xhGjgwlgwAYruzYqirM9dxs
	 xVk1oHpw16awkz6qits3g9VZccRNWyqtE+MZd/glTEKaLoUBiZcYGLOfjrX8RR4KVF
	 wCaF/a3rgnEKbBhKXV3B3VUo1SVTUbxbcnj8aYnj4eLviEPIa7B95sH+DSPZT1cHS8
	 a2l3QNSS3ibRuYHXeu5VwbfEzi3GhMayuJ5y3LyOjsPQv3Rv7UCrZadfQsuLivegJI
	 Vn8Jvcz6NV42w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DCA38111DD;
	Tue,  8 Jul 2025 00:43:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND net 0/3] Fix QCA808X WoL Issue and Enable WoL
 Support for QCA807X
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175193540924.3455828.4763600284207918560.git-patchwork-notify@kernel.org>
Date: Tue, 08 Jul 2025 00:43:29 +0000
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
In-Reply-To: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 viorel.suman@nxp.com, leoyang.li@nxp.com, rmk+kernel@armlinux.org.uk,
 wei.fang@nxp.com, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.chevallier@bootlin.com

Hello:

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 4 Jul 2025 13:31:12 +0800 you wrote:
> Restore WoL (Wake-on-LAN) enablement via MMD3 register 0x8012 BIT5 for
> the QCA808X PHY. This change resolves the issue where WoL functionality
> was not working due to its unintended removal in a previous commit.
> 
> Refactor at8031_set_wol() into a shared library to enable reuse of the
> Wake-on-LAN (WoL) functionality by the AT8031, QCA807X and QCA808X PHY
> drivers.
> 
> [...]

Here is the summary with links:
  - [RESEND,net,1/3] net: phy: qcom: move the WoL function to shared library
    https://git.kernel.org/netdev/net/c/e31cf3cce210
  - [RESEND,net,2/3] net: phy: qcom: qca808x: Fix WoL issue by utilizing at8031_set_wol()
    https://git.kernel.org/netdev/net/c/4ab9ada765b7
  - [RESEND,net,3/3] net: phy: qcom: qca807x: Enable WoL support using shared library
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



