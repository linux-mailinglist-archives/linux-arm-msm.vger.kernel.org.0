Return-Path: <linux-arm-msm+bounces-34193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17D99B4FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 14:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFC541C21874
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 12:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880FA186E40;
	Sat, 12 Oct 2024 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoHQMVTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F9183CAA;
	Sat, 12 Oct 2024 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728737452; cv=none; b=M0u6SUGelw8To+Nr0MQsvpjtJaZslO1emW+6/3uanO+ogp1VGkgn4GvkNhTk2EUDiMoA2PYClHCJQwcXedQgRtc6HuoGkXECVCs7bkGoDfKkbwp+xxvV9PLE/iuBuZgI5QZE++H2Ta82j0wniuaqvK7hwLdztR3Nkcn6cRrI2Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728737452; c=relaxed/simple;
	bh=7oQXNtNUYL0OjUtuqZC5xP1WxqiwNA7nZryyNsHdPSM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mPi52k2eKC5Z6PEcogsWB0PZK25jvkPRPJXtb4fP21e1OEyQb0jcXXwZoroQxzpRS9Pnc8TreXU1mFidQu24c94qBB6xXvLmg77Aj/J8hSJVQeIKLZJm6Hf2HTEgYe1v4t8ZMXsr1qJuM8y4huhHSomW2UoWfeSRT79DySfHEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoHQMVTk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E68C4CED4;
	Sat, 12 Oct 2024 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728737451;
	bh=7oQXNtNUYL0OjUtuqZC5xP1WxqiwNA7nZryyNsHdPSM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eoHQMVTkXjMmrmjEkpNb3grnuq/CZrUEfg1dgSX3bokX3TBhLAT2kH52o+9fu1wbv
	 QpotIZj26pXAvjtEsaJ3IdyOC1qndkgQBia23u2bkNgLlkqPxEZWrGuMDkyUjR+CnH
	 oQuTwEENJjOoRzzHdYomhJ8Q4y96m8RfTMuvciZ6s5peX7qA9dgUT2Mqiki/hExP2J
	 CIEbhna9um1ZPPFAKcw/T4pzN33H+m2Fb532GmEclfBb959SgqjK2z+2perkOJdLib
	 CIyba/V9UmkoC9ZiZuPKbirksvLxZ+5L8Trp+UVIWo3KlUDR5t81XCnSmk7CY7PA0h
	 N3mwI3tXpQYhQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241012100957.129103-1-krzysztof.kozlowski@linaro.org>
References: <20241012100957.129103-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: Select missing common Soundwire module
 code on SDM845
Message-Id: <172873744990.3950734.14854047170413382738.b4-ty@kernel.org>
Date: Sat, 12 Oct 2024 13:50:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sat, 12 Oct 2024 12:09:57 +0200, Krzysztof Kozlowski wrote:
> SDM845 sound card driver uses qcom_snd_sdw_startup() from the common
> Soundwire module, so select it to fix build failures:
> 
>   ERROR: modpost: "qcom_snd_sdw_startup" [sound/soc/qcom/snd-soc-sdm845.ko] undefined!
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Select missing common Soundwire module code on SDM845
      commit: b930d8647869802a0d430aae6b1b05c3acb24a41

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


