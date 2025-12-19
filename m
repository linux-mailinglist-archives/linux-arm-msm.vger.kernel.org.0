Return-Path: <linux-arm-msm+bounces-85886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810BCD002A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 631B83063872
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4081D2EF646;
	Fri, 19 Dec 2025 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAVy62vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1454921ABDC;
	Fri, 19 Dec 2025 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766150008; cv=none; b=u1sMPXhE9YB8oAs0VyhKwLWGE0ZSjZJcnbmiQvhbPGCcGnYH4KCpx/K+wNjE626x2iambliA4z5fjU9xeK8aAQ7RRB4UDbBWRp+2tekLY9imfABV9RWY54aHj3u+WchH+32jwZDHlFJnxUabKpo4R5cXra4JZEq0ELE8mROO+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766150008; c=relaxed/simple;
	bh=7f2cRWCl6fVTfMV+x0OQbodHX26GnG4XI2rLbspz8CI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gphl8WuVvJUEYOla6SEEj5Wunxbf3drVsGtowdYEWO7YuYvMdnJJHceMyHrmZbmUBOrMz71ROTLFeXtAAJ+gBjpMDPR+2/iL1VMbX9iV0FQzf9mGa3SyK1bClrUevYDSUsIv8WAfvjlbQG0jj8FIiN96VOJU5BbIZ47nYl1waOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAVy62vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03ABC4CEF1;
	Fri, 19 Dec 2025 13:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766150007;
	bh=7f2cRWCl6fVTfMV+x0OQbodHX26GnG4XI2rLbspz8CI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IAVy62vcr74TdrR8lDXOTCVzPrsuxCkyDPRVO9X7Ny98RMDLmCTEzW5VsTe778tb5
	 H+Bvq5Z4Vj5RtsPjf8EmZh1KMCWUIYjbbTa/vGcUfpS1UjOP3QLOVH4Kt+ulnLuV8o
	 2ZtrRnMlG9hOV1arS5KW972V4w9Bji6wvSpZZ+soh4Z5zdS4HkM42NodmOq4O3m31+
	 6H2K6ckcjhGf082sJRGgPMBRWaOl14bGSsNdvCmbvtqNGHRuk48FrM7dyie8i6xNbv
	 NKr67wMPsd0w9pVvRInhkf5M8Phpmu77qyoLAOCBMIET+gWdBbzFxWaD4JQwv60Gy7
	 9hMj8t/125tQQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20251201092259.11761-1-johan@kernel.org>
References: <20251201092259.11761-1-johan@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd939x-sdw: use devres for regmap
 allocation
Message-Id: <176615000564.376665.11468588142722382964.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 13:13:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 01 Dec 2025 10:22:59 +0100, Johan Hovold wrote:
> Components are bound inside a new devres group so that any resources
> allocated can be released on bind failure and on unbind without
> affecting anything else.
> 
> Switch to using device managed regmap allocation for consistency while
> dropping the misleading comment claiming that devres cannot be used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd939x-sdw: use devres for regmap allocation
      commit: 7a8447fc71a09000cee5a2372b6efde45735d2c8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


