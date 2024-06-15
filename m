Return-Path: <linux-arm-msm+bounces-22767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394539099D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 22:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E6A11C20EAD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jun 2024 20:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C17954CDEC;
	Sat, 15 Jun 2024 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyxHC6nz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AED0CA6B;
	Sat, 15 Jun 2024 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718482614; cv=none; b=s7Cw/RReZk/M0cWV1NrIglOG9p1M1etaKc3A1ZoM4CJaGRms63YYAeu0GXiOZIrL3sEcWgJbASsdNkC0MNCRfJoYeZ0Qawb8bRAj6znwsFlXfrnFwhyGaM0iT7RZqFGYpVMbs5J7XxRq7TJ8rqfY2fsMnitAc0ULKVK+1M8jbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718482614; c=relaxed/simple;
	bh=pCrt5S/DSr4PuaTph6fAbVYP8xLs36/o9IobvSvkmWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sDdxLNlL6x8a5Qp+Ble6hyXK2CmogsJjTwdr4jyy02FddArHUw28oyhKB2cPS9JZQWj4Hu+b5BJhM6nO9IuvNMk5abmjjVYXqL0Ef9P6QBqLrgHuSpcMwGt/1G/3BD2QAaNC+PLkx0N6pahru4mXLHTWo2/U0qIJL2WjpsrdM4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyxHC6nz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA92C116B1;
	Sat, 15 Jun 2024 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718482614;
	bh=pCrt5S/DSr4PuaTph6fAbVYP8xLs36/o9IobvSvkmWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SyxHC6nzwAqquEmlQKWKNXLyElDe5jUKPt6chW4nG+46PVMrYoDApoC/kKCDFSnJI
	 fAkn4CBnx5IfRrLOlijGAHhIoru3V+uevAY+7eNz2JS6eu10cbHXldk7ZxVTLAu/Q7
	 TLI2F4j/TZRlJhJoSARBcW1pSo7hyCPHELLfZTOkrn0T7SKL0iGA7LFUF61udFjjk4
	 YIZPNdeLjcgxU6k03a2omJCUTTd0i7+Aki9f5Wtz2y6SWuDPQyMfLWPHXo13Li8zr8
	 mAqS8DoD4tBM+uuQ1Gy8VsXExlDoLKtJJ80z+cGsn1ygLDngoMOCZ11CFvde4qgtce
	 kcjAJpeABYrUQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Banajit Goswami <bgoswami@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
 krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
References: <20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org>
Subject: Re: [PATCH v4 0/3] ASoC: codecs: lpass: add support for v2.5 rx
 macro
Message-Id: <171848261202.320905.12613370824204863532.b4-ty@kernel.org>
Date: Sat, 15 Jun 2024 21:16:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45

On Thu, 13 Jun 2024 11:49:30 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to reading codec version and also adds
> support for v2.5 codec version in rx macro.
> 
> LPASS 2.5 and up versions have changes in some of the rx blocks which
> are required to get headset functional correctly.
> 
> Tested this on SM8450, X13s and x1e80100 crd.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: lpass-macro: add helpers to get codec version
      commit: 378918d5918116b95300dd7f03913a1d0841f223
[2/3] ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions
      commit: dbacef05898d65f586fb9b90ba367e6bf898d68d
[3/3] ASoC: codec: lpass-rx-macro: add support for 2.5 codec version
      commit: 432e5074f805d0f976c7430af376a0dd07f1c6d7

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


