Return-Path: <linux-arm-msm+bounces-27961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A058794824A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 21:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5616B1F21A01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 19:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA4116B389;
	Mon,  5 Aug 2024 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ4xXIkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE26813D521;
	Mon,  5 Aug 2024 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722886031; cv=none; b=BOQAtA5GIaL2wxdRsS/ARBRHAJ9BfRHXcywbr/jXKPPj/s2JNsLMeCxCz255nxRFhImpFsBg7WbW+bBHOwyCse9C5Jm/Ggk9w8K8GDPzIMOHWG3oaqlG+2QGqZNFF+hWYQoKx/w8sSYhzWaAewRnJaY6oSUdYcyT0McmSozlH2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722886031; c=relaxed/simple;
	bh=90UvNn9K0mZ6VrUXGfzqNLue5sPsRmDgWkhqlksvKHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qpA38BFii1b+wgfbA6ui3NrrE5mm8LO5Bt2ea5T6F10Ni+pfpww+kcOraAKz21YQPOc6Uqc5DTLLeUmUevaC+0lJoxEfCeuVmlNTs/EXBGN6k79ZzVa4oAdH2Z2UdqRLzh0DPFdD2jKlWZwPf7DDqGCKAuvcVlLHapBEm+FBvyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ4xXIkX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416FAC32782;
	Mon,  5 Aug 2024 19:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722886031;
	bh=90UvNn9K0mZ6VrUXGfzqNLue5sPsRmDgWkhqlksvKHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pQ4xXIkXzdww4DSnoBtUXTP2AgYpid/Rv4LvFJEs1ZEUcUj92JsyVM8l8Zkxyamh7
	 2K2iF3O3Al/2zB2gQdl5dDk+xKm928QHeqWIYfP8GQzBKTsVHbrb3CmuB5+7YTdqov
	 UywWvzSaTcdldKe/xGKlr69a1yc8ZfL+PiTORqX6IEc3PdahXNz+rtD68aG5aHosC+
	 /MclcdPlCuVGZ7v5YQ+E6/68n2lntkyghABGyXE17Was3kh0/lygbpLowac25Hbwk9
	 pxf7kLQap9nHV7gDJoE6htfXy/cGQOQMFawLvZSyMU8TKS4RslBzhzuGsGZYcPZVXz
	 FPA+zP0dCDZuQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
In-Reply-To: <20240729131351.27886-1-johan+linaro@kernel.org>
References: <20240729131351.27886-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-macro: fix missing codec version
Message-Id: <172288602778.71820.9069423638402649413.b4-ty@kernel.org>
Date: Mon, 05 Aug 2024 20:27:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Mon, 29 Jul 2024 15:13:51 +0200, Johan Hovold wrote:
> Recent changes that started checking the codec version broke audio on
> the Lenovo ThinkPad X13s:
> 
> 	wsa_macro 3240000.codec: Unsupported Codec version (0)
> 	wsa_macro 3240000.codec: probe with driver wsa_macro failed with error -22
> 	rx_macro 3200000.rxmacro: Unsupported Codec version (0)
> 	rx_macro 3200000.rxmacro: probe with driver rx_macro failed with error -22
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-macro: fix missing codec version
      commit: 9a1af1e218779724ff29ca75f2b9397dc3ed11e7

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


