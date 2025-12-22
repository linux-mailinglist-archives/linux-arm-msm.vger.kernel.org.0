Return-Path: <linux-arm-msm+bounces-86271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9747CD7623
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 23:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8A1030249FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 22:56:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2765D33D4F2;
	Mon, 22 Dec 2025 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtPH0iJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D8334C08;
	Mon, 22 Dec 2025 22:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766444183; cv=none; b=PhFKHhit0SCB+vfcaRVjfimmz9hnFdLcOZA4LRbnu7ywt6sxuAsT76R8/6JBbUVsC50rhXCWLoKZcDa4LZlUhs5eDTXJrXSVHXPy9iv6ELxeyt7OgXE0oL2HAe7E0ZLzfqriFpyT5CQM6EP/vZ/REfyZNEU53JREdwkd7SkcscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766444183; c=relaxed/simple;
	bh=slwF4LGEeOItWEHJbtxF2RfUGh8stpQCq97A5MCUP/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZElXTZpPTSScxL0hwydsaWEHZSa0cn9viksXlOAki4A+EsGxIZuwPrjA6gJfo6lzD2AjOBj97c8gHY3IuuRhWZQRA7G66frdn8v+r7b56tUWNlral1D0qLzvaEY4qCz2uxQdqPAB3Y1WnfBiQPoJ6KfFGoTGk/pMQionLzcctWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtPH0iJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6ADC116D0;
	Mon, 22 Dec 2025 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766444182;
	bh=slwF4LGEeOItWEHJbtxF2RfUGh8stpQCq97A5MCUP/8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BtPH0iJ+u8Z7ihnRArd9f7yASkL5cznW7M4RFrTESDOrj+wWsv0NFelL95DDHpKE2
	 NqBZmT3rePm7xleEOWRuyNiRAJFcARYntlXDQdXrD8A5K/Uip216bI5JnmbX4jwkKU
	 pVppEKqKTi9HQFsbEr/cdkenIUIYwW4ntFyIFgaCFzKdNhC0VQBY+ttWZ2bYj9qYPI
	 bASGPy+kCfuYrIWI89Yz/7Np8Bi4AQVYYaiNvHZ6sHp6mHjYxU8C37tMJ0w7fggJl3
	 w/qof389Vkohxal+D9W8c7aFB5mQzHZ7AoBV8TPF651QfGApn2Pab6k2CfqqqARGbt
	 VXCgWUZZ6mK8Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251219142715.19254-1-johan@kernel.org>
References: <20251219142715.19254-1-johan@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: drop bogus container_of() error handling
Message-Id: <176644418126.2691602.4012078053889750862.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:56:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 19 Dec 2025 15:27:12 +0100, Johan Hovold wrote:
> The dev_to_sdw_dev() helper uses container_of() to return the containing
> soundwire device structure of its pointer argument and will never
> return NULL.
> 
> Johan
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: pm4125: drop bogus container_of() error handling
      commit: 54fa71f5f965fa3ec8846cef9d1154bcb2ba2850
[2/3] ASoC: codecs: wcd937x: drop bogus container_of() error handling
      commit: 61a50d6f58b41e8a7e68d8fc8fc6bfbe30d790d8
[3/3] ASoC: soc_sdw_utils: drop bogus container_of() error handling
      commit: 870b10f61d527fec594e0888f18cc4f32c47433d

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


