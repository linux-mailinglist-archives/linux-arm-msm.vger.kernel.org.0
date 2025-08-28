Return-Path: <linux-arm-msm+bounces-71186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA4B3AC62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 23:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0F616E42D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 21:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818E42D640D;
	Thu, 28 Aug 2025 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5AThcyg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D97E299A94;
	Thu, 28 Aug 2025 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414851; cv=none; b=oppDc5jjRwuovUc4qRsBVvJSeqsZ+wXrCrb2BR1WiXYzwznxeO6QR0AChOVpFwv78szWLKGJzfmAlHZnuJufpxcoHUW16PhHslW/FHAaxPQMay1VIsEuTLtdMioJH9HexmIaNMv/ujOb8SPnc+RKUrCgeJ13htVa3Ev/LjJhxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414851; c=relaxed/simple;
	bh=1mfJAQzznVLveZ7RgLUDpOCOCFLyynsUt/BWfnVNoB0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pcCgP9i+m0izuumGRgCyvEjgRQ9ee2J3tPd/8ZdVGmv7u1RbdcwQvpOkoBzmbgEJzXtwv267hhcv8rbLbVsguFAE5kyamjnuyDdisK36AjfXd02KHDVHJ7djH+R6DEV9BZVyrPdNLRDVZUx/KBNoMy7AnxlSVz6atGZZ7cuHdLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5AThcyg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA473C4CEEB;
	Thu, 28 Aug 2025 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756414850;
	bh=1mfJAQzznVLveZ7RgLUDpOCOCFLyynsUt/BWfnVNoB0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=G5AThcygZpdQdqRE6T0Lqjezz05KZU4l1EhenZTlNMs2zifKfZEoAWL5nh1P4csO8
	 fIO2MYi6cAI6hWmBiGpZmGF3zAt18a/Mcwn2gQRJcIOsdKyoCXRmwhHFJT6e5U7U8P
	 Sm4+0n4ocr5c13765y3YvfT1Os5h6jQ+qT9PkjVPLKgqo2kxEL569no/az8LrEfYoS
	 783zWRsKfsHS6gbgchWIxwCbDgCmhnXVmq17+LoNKhrk40eg39+zarQyBA5/Ux3/dq
	 LXjEzq2uOOPaSmsNtTbSPjY6o/enWTBvD+ybCptESiG5aCHgFuTSF6v6eY+9ibmxPS
	 DVTN5NLqbsBuw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Ingo Molnar <mingo@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Peter Zijlstra <peterz@infradead.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250828075406.386208-1-rongqianfeng@vivo.com>
References: <20250828075406.386208-1-rongqianfeng@vivo.com>
Subject: Re: [PATCH 0/3] ASoC: use int type to store negative error codes
Message-Id: <175641484651.364214.11154703611395809612.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 23:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a

On Thu, 28 Aug 2025 15:53:56 +0800, Qianfeng Rong wrote:
> The 'ret' variable usually is used to store returns from some functions,
> which return either zero on success or negative error codes on failure.
> 
> Storing the negative error codes in unsigned type, doesn't cause an issue
> at runtime but it's ugly as pants.  Additionally, assigning negative error
> codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
> flag is enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: amd: use int type to store negative error codes
      commit: d985b60f47893e8fd43989662111bebe78311cd1
[2/3] ASoC: adau1977: use int type to store negative error codes
      commit: 784771cdd77091e7e93b78b5de55006295cc7b8e
[3/3] ASoC: qcom: use int type to store negative error codes
      commit: 11f5c5f9e43e9020bae452232983fe98e7abfce0

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


