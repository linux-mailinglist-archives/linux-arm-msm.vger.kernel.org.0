Return-Path: <linux-arm-msm+bounces-25303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F574927D2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 20:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0536C1F2104C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 18:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E884553389;
	Thu,  4 Jul 2024 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7O6TYn9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3445979;
	Thu,  4 Jul 2024 18:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720118141; cv=none; b=h9kodB1ZCIS7nVIyx57IcQAXCt4UpdiA/P2l3AS0vcs350e04Y5v8D8XqO0QxVOCmpbinqbvRi5biSVbtHO3KIUSZShdAXmiOKW9yhKhR93DOaZQBRP91IFS/L93beGcI1z85hk3v6lI19QsJF8UTppu4+MBfGMVO8nAHt5hf9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720118141; c=relaxed/simple;
	bh=x3m9D/QtwKRfrkMQATybZBTtL+idcV8O373Ppn4287Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T1u3U0km9ROdRw1N4tUogTYOvZVMbtI1MVdA0FbTcb4m3uPAlMOacGHaXuXDzNrBXWYjMswpi9yVMnZc+461tXYY4PivmJmRRV8/UcC5GSObPOo7vVKP0q1lhctpkQmAtPnWOhlpqDt7kkol8UXFrQJ0Hc9BuV8xWAm6YL+TiaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7O6TYn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D540C3277B;
	Thu,  4 Jul 2024 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720118141;
	bh=x3m9D/QtwKRfrkMQATybZBTtL+idcV8O373Ppn4287Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z7O6TYn9rH9U9DNLwoH+7LVOv1bT0wKHvm3jZsMwLwm0xQauZ5yqUfUICRZUaoqlq
	 uJOlm13ATmnokGbIaQS4Pqr8dQQLEw3sWGMj72OdlQxqk9QeMxj6eqQPbT0438060X
	 87MlttsNAmfJmWtgzDVyygHVih2fXs8IowOGn9NI+Q7HftzvIQSHZvS8fz8e/MpkyW
	 QBwuoEHCmbPlSvmhqy5LRSgg8L9iQ25LBZ0zbkOm5XRnxTtdc1RRmCNoXUN0620yJ4
	 uuGWj3Ebawe/NqmPrN4E+9iWGuywmvsf8voA1gEiNJ2ou78kI3UfLuwmlhaldRCK8Y
	 yxCgW+NAB73KA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
References: <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-rx-macro: Few code cleanups
Message-Id: <172011813890.108577.12531319893239383182.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 19:35:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 01 Jul 2024 09:39:32 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - New patch #1 to fix clang jump warning ("ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm")
> - Link to v2: https://lore.kernel.org/r/20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org
> 
> Changes in v2:
> - Use cleanup.h instead of devm(), therefore not adding Dmitry's review.
> - New patch #5.
> - Link to v1: https://lore.kernel.org/r/20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: lpass-rx-macro: Simplify PDS cleanup with devm
      commit: 891168dc4a6c637ca76c64e7bde6917b96b9cd54
[2/6] ASoC: codecs: lpass-rx-macro: Simplify with cleanup.h
      commit: ee5e13b2c92324938c2bffc44b36b5a29fc28087
[3/6] ASoC: codecs: lpass-rx-macro: Keep static regmap_config as const
      commit: 0c02cacf62fd90bf9f0c6c33e9a4862cfc50aab4
[4/6] ASoC: dapm: Use unsigned for number of widgets in snd_soc_dapm_new_controls()
      commit: bf95919fe1917efa8f5da83057ff9fc11130aa55
[5/6] ASoC: codecs: lpass-rx-macro: Use unsigned for number of widgets
      commit: c72585d79249fb07ca3e3c91022e312d21f20f40
[6/6] ASoC: codecs: lpass-wsa-macro: Simplify with cleanup.h
      commit: 67820eb9f4895791da46df42ff7942dfc1353bb2

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


