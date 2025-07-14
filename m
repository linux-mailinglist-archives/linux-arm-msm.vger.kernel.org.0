Return-Path: <linux-arm-msm+bounces-64883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BD0B04924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 23:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F851A67462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 21:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003CE2673A9;
	Mon, 14 Jul 2025 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joELX53R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A902C263F4A;
	Mon, 14 Jul 2025 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752527385; cv=none; b=KpvCVosf1T8TCjKOK8w2OCNk+WT04+8QsQNSoc1UqURqYfVkBlGAzF5N4zBMAI3C4FIfhMIv/Xzld+wXPNgutllwSkfh2e/fnbSgb2Yf7gpFPpmKUVENJ9WtE6qo/4O5Cg1N6X7NTjjhsf/xbkE1rG27CwbEh7VeZ2Wkp0T/u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752527385; c=relaxed/simple;
	bh=nVBCslxlPncX/VDKuIE89eGSx6wKViW/DDBK2FBzxVI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J5z9VI2NI0lctt8buwEPkXScedkldxhlE7CqrRQ+OZTuxA7T52V/6bjjwbPXsnmeVjKJ8L86/1Z4GYJ2+m9raBxcpjVbTbPQ1+pCZDuACy8AU/38AyFKPF+LDQ5jL37GmMBR5+kKScGZyfEfm/Rx2/Yt/DNbqalLbooL5lgFlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joELX53R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD7CC4CEED;
	Mon, 14 Jul 2025 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752527385;
	bh=nVBCslxlPncX/VDKuIE89eGSx6wKViW/DDBK2FBzxVI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=joELX53Rga5hFZYciwlJWqtUWUutrfWonkxX1p1xjg9cXUVhc/k4/9eSZgvTOCK8U
	 vtwpq3EoWstMaF4gr+o6wNtd39T+vcEBO+DjTuMoiBiZIf7ewMziZI3biGpf1I/0TE
	 c7vGFoEvy5tZvxOcxHX9VhZRaD8a8zxXe7tn8n9e5fvb6gv4eDt+SRUBbtfHsDUymC
	 7wDw8D3xa8/5r/KJSwxKiaEVPCeOsyDHf9ejzQvWi6ro4vkE4ILolT8HP8Wv9odLpZ
	 QLnwLZJmJDk05rf8VIt7LGIqT/PYZPHUEUfeVgtzDoxmNKjZehIWSrWB5cNkat8wQK
	 Io/xh3ckaxuWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345DF383B276;
	Mon, 14 Jul 2025 21:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] Bluetooth: hci_core: fix typos in macros
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <175252740601.3988382.10149417016230822674.git-patchwork-notify@kernel.org>
Date: Mon, 14 Jul 2025 21:10:06 +0000
References: <20250714202744.11578-2-ceggers@arri.de>
In-Reply-To: <20250714202744.11578-2-ceggers@arri.de>
To: Christian Eggers <ceggers@arri.de>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, pav@iki.fi,
 johan.hedberg@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, yang.li@amlogic.com,
 sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, asahi@lists.linux.dev, netdev@vger.kernel.org

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 14 Jul 2025 22:27:43 +0200 you wrote:
> The provided macro parameter is named 'dev' (rather than 'hdev', which
> may be a variable on the stack where the macro is used).
> 
> Fixes: a9a830a676a9 ("Bluetooth: hci_event: Fix sending HCI_OP_READ_ENC_KEY_SIZE")
> Fixes: 6126ffabba6b ("Bluetooth: Introduce HCI_CONN_FLAG_DEVICE_PRIVACY device flag")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: hci_core: fix typos in macros
    https://git.kernel.org/bluetooth/bluetooth-next/c/359bc1aaa840
  - [2/3] Bluetooth: hci_core: add missing braces when using macro parameters
    https://git.kernel.org/bluetooth/bluetooth-next/c/de92c6716970
  - [3/3] Bluetooth: hci_dev: replace 'quirks' integer by 'quirk_flags' bitmap
    https://git.kernel.org/bluetooth/bluetooth-next/c/be736f5f89d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



