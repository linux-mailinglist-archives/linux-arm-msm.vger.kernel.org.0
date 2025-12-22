Return-Path: <linux-arm-msm+bounces-86268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1441CD729A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 21:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2389E3015E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1538E33A03F;
	Mon, 22 Dec 2025 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViMmFbtv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1E6339B4F;
	Mon, 22 Dec 2025 20:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766437130; cv=none; b=QQ5qOQoFHtiAJ69J1pp1Fo2H66kWbdqC/w5tkhhnR1UQHHwFcZxF1DTEpfb10j4h69woUPxXtWn3BQIJbQXugpRkgTnBCy8WtT2E7G+pLylQaiMIWlj4ZXOQTKCh8MVsY+GTH104/805TgtdbFYL0Bw5CO9beXClB73bqijZotQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766437130; c=relaxed/simple;
	bh=RjcKXrzPX2dFCZErCFk///NOU9Z1yUxKAtOOeJz9X0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c+xz89aT73xPU3NsBrdiBvBiD+IUwWitp7ziDdBBrmj6lP0ic9f3euftKzr+2fHJFFXQR8YFIdvl4QXyF2Z0MyEzrfVwc992+uGf8euUAxmjS5wG6QCcva6FkNaNPVBqAUCqmbELulHaLycsJaEiQXB4nhyj7KUS3+83aR+flh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViMmFbtv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC32C19422;
	Mon, 22 Dec 2025 20:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766437129;
	bh=RjcKXrzPX2dFCZErCFk///NOU9Z1yUxKAtOOeJz9X0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ViMmFbtvRRJTBVvRHcOrrc5YEzgxCYK8lP01m1aCPoZyLGn93aARQHU5vG10L1ArM
	 CFXgNj9m5cT/T40bxcYRCu0OpKZ1WIO1Rmn3wnm+hok2FNxoTwVW3emMqr1JxSJXmh
	 2ux7NY8Envw+DSGOx10fa0ND/8+SQsrAJwW4CP783/74p3KWBvYAcz7k9Bfj4Zx0k+
	 O4ixE2KyIueGcrbwfC2n2kR9Lp0Jly1udmnXyXjdj6sNxiNRmZd6AForKiAhTJuK9Y
	 +USr2DLXZB9EpvA7ZkiAoUkWdJ8NXHFIsfmWGTPsKIIn+9FCI56gmLxGIgu6WUAYby
	 lfeR4Fd8fPN0g==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback
 response data
Message-Id: <176643712752.2127897.13538433686192847231.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 20:58:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 30 Nov 2025 10:40:22 +0100, Krzysztof Kozlowski wrote:
> Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
> via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
> Ack).
> 
> I propose to take it via ASoC tree (Bjorn's Ack), because I am
> constifying things there already, so less possible conflicts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Constify APR callback response data
      commit: 86af3c229245fe1e59f428fc6abe19127ce15f5f
[2/4] soc: qcom: apr: Use typedef for GPR callback member
      commit: c66cea195d76c7c396c4c565b967d3e2a709e762
[3/4] ASoC: qcom: Constify GPR callback response data
      commit: f3a86870c5938fe82ce02c29235326d417010ffb
[4/4] ASoC: qcom: Constify APR/GPR result structs
      commit: a2a631830deb382a3d27b6f52b2d654a3e6bb427

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


