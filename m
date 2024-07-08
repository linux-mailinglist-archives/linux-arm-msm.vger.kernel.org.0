Return-Path: <linux-arm-msm+bounces-25510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A092A7AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 18:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA91A281C3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 16:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F5D146D49;
	Mon,  8 Jul 2024 16:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnHGlxpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C688145A08;
	Mon,  8 Jul 2024 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457812; cv=none; b=ImTGyXPhQIRmnsonAa6tP6rVBPyBoL2gEIaPyTVm+FbfMHB0lkiXqx43vURdjsQRIPJnv48IEZ0TlxM9/8feyjFnPa20hf9ginZTrePFr8jUDDGMi2rBFUhUU6Zj2+3hk5Ts31ILZljBfzxRM61RSd/Ychimk28545JHWhqzxMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457812; c=relaxed/simple;
	bh=PCa8npqHnUycecA44yDRVAfSZz/Tb4vjGe8JijsOnOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+bC3ir68gMgY4/EidKzAa7dYhLeOIl7ZfY8xcckraihBYrhW2yePaDUTL2OpxWOhIi1tGQSjfC9kVVBd7clgfjjPPIelPJ26Nv9/CjfC8rK5ql76Dk0xGbSqS2k4/g7s7SJf5ZIx7GxjAlhh03EgEzleGyHUJnWHV4nfGfIkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnHGlxpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA8DC116B1;
	Mon,  8 Jul 2024 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720457811;
	bh=PCa8npqHnUycecA44yDRVAfSZz/Tb4vjGe8JijsOnOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SnHGlxpYtJAMCJb2Mc3uz23Aj1k/oCplSoxg9sQQu6Xj3E7TDjH3hIuJPa/5yGJSr
	 ciiLoxdUu0r0CEESsCO40md/UqWZO4CUTd5/Chmr4GvYUtoOhbA1OQ0XZPcN2BKkPw
	 R7w6RZSEd7G926ka3nsy1n7mU9pD4xOGHgEyYhXYYNWORwbAGigbvW8g8eMSIe5XhI
	 3DK6d84LLd4ZvNISXHDWoNixDkLVxt/3CeF+OXdM8pybihmpTB02vB1aI2vHj3ObeS
	 IR0/RgnsuN8yvtQQrMevtLmjFeQ7/rSVL9e8dRliq6udtq1FLxBa5HqmaiI/vjGgqT
	 Pwyo+wkV06IsA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
Subject: Re: [PATCH 00/11] ASoC: Simplify code with cleanup.h
Message-Id: <172045780936.93798.11339150703981455652.b4-ty@kernel.org>
Date: Mon, 08 Jul 2024 17:56:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Wed, 03 Jul 2024 14:10:54 +0200, Krzysztof Kozlowski wrote:
> Allocate the memory with scoped/cleanup.h to reduce error handling
> (simpler error paths) and make the code a bit smaller.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/11] ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_add_dapms() with cleanup.h
        commit: 408e49381750ca22fc584a37636f5035d2cd4c25
[02/11] ASoC: codecs: audio-iio-aux: Simplify audio_iio_aux_probe() with cleanup.h
        commit: f9cbfb66127bfc2a47dece3dfcdab2b79ab06c50
[03/11] ASoC: codecs: wcd9335: Simplify with cleanup.h
        commit: 6344ab5d0826640799e0c054ed4c0846b3f87ccb
[04/11] ASoC: codecs: wcd934x: Simplify with cleanup.h
        commit: 56d426f5525d1ad919e20663ad01a58238652df7
[05/11] ASoC: simple-card-utils: Simplify with cleanup.h
        commit: 6440e7b2a058c50a05ebcc58f35693c50522fc1a
[06/11] ASoC: audio-graph-card: Use cleanup.h instead of devm_kfree()
        commit: 5725c16af2678d334de0bcb85b42cfa50b32e04c
[07/11] ASoC: audio-graph-card2: Use cleanup.h instead of devm_kfree()
        commit: b39f7713ece62b2b0a3cfad7a75a0eb0ab71aa4e
[08/11] ASoC: simple-card: Use cleanup.h instead of devm_kfree()
        commit: 7d996c8a5fea700e816379e57f4983e2611519a0
[09/11] ASoC: ops: Simplify with cleanup.h
        commit: 1a7b846818210cbdf8994bfee1340c09342a5b3b
[10/11] ASoC: dapm: Simplify dapm_cnew_widget() with cleanup.h
        commit: 5b3cc85673bcc7bb961a3a6fa229cbc4fe0441ac
[11/11] ASoC: dapm: Simplify snd_soc_dai_link_event_pre_pmu() with cleanup.h
        commit: 522133d4401010d936b0588a5a975c2c965cb88e

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


