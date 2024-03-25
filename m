Return-Path: <linux-arm-msm+bounces-15070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017C88ADBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 19:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8ED4B47CA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C334713CC56;
	Mon, 25 Mar 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYckELU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABEA130E4F;
	Mon, 25 Mar 2024 16:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711384829; cv=none; b=oqaA6kt8UkIr4qihTJoKtjuifutZmR89/C+PpBYXws6Pl2hmkUInFj7OeolvfbbKPn7BO8+0LaP859qn3OXPsnx79A4HAYD25Bt7TiJn1TA4DQ3rP3Hxd+ncxY5GyAUSAFZCBlfYqHrhewlVqhOJfSLnzQLFzdyuOhxr5YXej4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711384829; c=relaxed/simple;
	bh=Slq/eDTLuhoRN5Z+0B7+H1DisJleCn95vap4bZ0KkEM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mybIKfMuKp6xSMb2IX41XGRKwHBy32WSlq77fU9ftclN7sSHKBywkKYbKgBdC+2SRbChEXDtqt0V9gJHVEs3d4vv/ou79NC7nVIaSfsFCZffHtfKYwc007NqvTfPUr4Dp9AQk26SbYprA8x4EamdqgajQ7vlOEDV5IjSjFhiV7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYckELU5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E127C433F1;
	Mon, 25 Mar 2024 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711384829;
	bh=Slq/eDTLuhoRN5Z+0B7+H1DisJleCn95vap4bZ0KkEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uYckELU5c1ZZjIPjlyBzbPhsQ0j6jRQDO1ubaWmSaRnRnKs4KX455RPu0buKw53zB
	 9SH2Ss0yHhJv52ixvBLiYaZz+d5K7QR72Ge5JovyzmflukJxGklVWnKpM2axGl4oGO
	 07uwRkoupzGHRdy5Rsnu4wiA+2tFccc6LXWtNe3n+tqsdpXypQZYm8ufLkOsjalgPR
	 vmts92D7oC/IyMnr47qW/XkcaJrFnf8Q4xk+H0Tm9iiZb0gtq6ssrTfNPjFjvZ9uQR
	 K+Za0+1jh2N1pj5UJaJ4G0O49zxAV030jK7ib3qRhATqwZHbExzW0fc4G1WMcIFVq+
	 UuQVpNLhOzeDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1B1CAD2D0ED;
	Mon, 25 Mar 2024 16:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Bluetooth: Convert to platform remove callback returning
 void
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <171138482910.29632.1995561805577774426.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 16:40:29 +0000
References: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1710193561.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@codeaurora.org
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, andersson@kernel.org,
 konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, kernel@pengutronix.de

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 11 Mar 2024 22:49:51 +0100 you wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/bluetooth to
> stop using struct platform_driver::remove(). See commit 5c5a7680e67b
> ("platform: Provide a remove callback that returns no value") for an
> extended explanation and the eventual goal.
> 
> [...]

Here is the summary with links:
  - [1/3] Bluetooth: btqcomsmd: Convert to platform remove callback returning void
    https://git.kernel.org/bluetooth/bluetooth-next/c/5bffd666f4ac
  - [2/3] Bluetooth: hci_bcm: Convert to platform remove callback returning void
    https://git.kernel.org/bluetooth/bluetooth-next/c/526f6c35de83
  - [3/3] Bluetooth: hci_intel: Convert to platform remove callback returning void
    https://git.kernel.org/bluetooth/bluetooth-next/c/0dc3ce6b3c1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



