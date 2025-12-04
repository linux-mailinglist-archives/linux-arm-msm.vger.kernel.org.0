Return-Path: <linux-arm-msm+bounces-84364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB8CA3B72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3848B3081839
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499312E8DFA;
	Thu,  4 Dec 2025 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="At6Ecatu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED882AD2B;
	Thu,  4 Dec 2025 13:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853459; cv=none; b=FoTJa78qBBAi6rUj6ENEu2Ryh3BVjxv96MHEX48kOs1mBwHgcVV8a/vWmzSVNC80DIXps3LmNo0tWFDLoCE5EaoyzSUQ4xBegBKxoleOsDem+TV8lD5JBm/7B9z2Vsi41Ks4Sw9UMytDnBYHAXqV4cJvFYwO3EN56ZO0sMwHdJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853459; c=relaxed/simple;
	bh=3fDmVixiURReJZYPnTB2ray1Fg6XTd6Acttcjq2EZqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kYyAUegiQUTCMTItQply1pzbdP0Y8VqH+9f3s82AAJsr9+8q9I2YPVWrMigSP8RNp91MvO9IUssIccUnsj9ZaV3eZeWQ//r///TlspwRnEHrHnQXzz4eLfePaU+VJcR4Vmr6PviLR5DmLZabTdU/0ewb3bm74HDw89f3GrvCf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=At6Ecatu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8C6C4CEFB;
	Thu,  4 Dec 2025 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764853458;
	bh=3fDmVixiURReJZYPnTB2ray1Fg6XTd6Acttcjq2EZqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=At6Ecatua4V1QEIYFUylJ0KOepGmbdMIqIxznbtQTzxQoIugq6rU5SKp5hsKSEWJe
	 ZBq/VQGdbCzAqYuQ/APswRH5bcx7julZoF0egjdF13vaFT1/tN7ei3bkkPRR7y2163
	 iBBKIHwcLWgs5579H1tZYGbGf+dw02FtsgImOLbn2u1AfqWBs8OQc0vU6rCrhPtDc/
	 gshau3lYU3cmNPMYJwzbeyIwXdN5N98m161W8t4qaCc/3ookCc9v2mWUK5c/diLYJ9
	 /69NqLCDYE8MZAaH0QocqhdypDUGi41XGxDwaejiqC7vNJl4DTYd0c/A6LtZE+mf8B
	 6Vrf8d2jeeNWA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251201093419.24474-1-johan@kernel.org>
References: <20251201093419.24474-1-johan@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: wcd93xx: fix OF node leaks on probe
 failure
Message-Id: <176485345691.29556.7069249740822339004.b4-ty@kernel.org>
Date: Thu, 04 Dec 2025 13:04:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Mon, 01 Dec 2025 10:34:16 +0100, Johan Hovold wrote:
> The original wcd938x driver has a couple of OF node reference leaks
> which have been reproduced in the two later added drivers.
> 
> Johan
> 
> 
> Johan Hovold (3):
>   ASoC: codecs: wcd937x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd938x: fix OF node leaks on probe failure
>   ASoC: codecs: wcd939x: fix OF node leaks on probe failure
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: wcd937x: fix OF node leaks on probe failure
      commit: 22a03ca7c20c4ed3a75047709b0ad15160e29d58
[2/3] ASoC: codecs: wcd938x: fix OF node leaks on probe failure
      commit: 32ae6ebe171aca9ce10f5790523a9865b6c08b02
[3/3] ASoC: codecs: wcd939x: fix OF node leaks on probe failure
      commit: 3ef4d9ede20db39bff34a559b04a1938fb31251e

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


