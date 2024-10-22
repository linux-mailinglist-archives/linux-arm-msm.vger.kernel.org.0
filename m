Return-Path: <linux-arm-msm+bounces-35483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB99AB9E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 01:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 582BD1C22CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 23:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD4F18593C;
	Tue, 22 Oct 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fshk/KL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B04C130AF6;
	Tue, 22 Oct 2024 23:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729638946; cv=none; b=aRHjgUEYRPOFtOK3o4fI10alzkSdvBW7DoDNpGalacd46R5hpBG9eW48cb+nqUvDDIFt2mkKgaj0qgCj7nx1piUa6QjLruyXMgu8zHnD9YSsFrB0yts7g5h74ETgHVDEPqXLvlAFYN3o9EjlXmFgCVKB8nMi+tXTwoOGlB3XA2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729638946; c=relaxed/simple;
	bh=eIOJlPjE4CtOTt1MXDUhDT+O5xXsoiSWn8H7fZVwGxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HS+hO+SK/wNulJFWK2cg3AWVvGaE1PC/8UdrUDRWN8GeV5/0sAz41OkQqgAvFlz1tiPVSGQ6WA/wO3GMj7nAAtH//JQ4sWgCMdnpm46nWrvsRycqXjyIlvf6KpP4KUCUVfOVlFPVDgY3ha1O0zF/PVbcTBIBdZ/hBiL8Mwtmdpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fshk/KL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77E2C4CEC3;
	Tue, 22 Oct 2024 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729638946;
	bh=eIOJlPjE4CtOTt1MXDUhDT+O5xXsoiSWn8H7fZVwGxQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fshk/KL0wmHyB3KInp62gSM/+XziHiUxrBWxqQ8BgECtuedldbuc3PfLKA0JK+QB/
	 5FN9F1ls+12KhWizTA448YzpgtOS9r9vUq/UAx67rKJpXZB1I3XSiaSqFNaBgdK59w
	 v3VEXnmbmlZ8KtJXHzP6Tz35mE+JWM3uor31O3sck+sdjt47KfAs2htjPS47wmZdvf
	 NAzasc+iDfoki5el1su+dR91indjxrgCb3rfZ/v8z0N9b5RIDek27p33bMkdAZ0uBa
	 Wck+QTtUR+TfsMNRtdQccbqLkqOgoySG7ph4U2HlbN+Rog5OEOnhY+oyREf8gMRLGU
	 4dZrSb4S8huVA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20241012101108.129476-1-krzysztof.kozlowski@linaro.org>
References: <20241012101108.129476-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: sc7280: Fix missing Soundwire runtime
 stream alloc
Message-Id: <172963894347.334190.2415888818283876880.b4-ty@kernel.org>
Date: Wed, 23 Oct 2024 00:15:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Sat, 12 Oct 2024 12:11:08 +0200, Krzysztof Kozlowski wrote:
> Commit 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to
> soundcards") moved the allocation of Soundwire stream runtime from the
> Qualcomm Soundwire driver to each individual machine sound card driver,
> except that it forgot to update SC7280 card.
> 
> Just like for other Qualcomm sound cards using Soundwire, the card
> driver should allocate and release the runtime.  Otherwise sound
> playback will result in a NULL pointer dereference or other effect of
> uninitialized memory accesses (which was confirmed on SDM845 having
> similar issue).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
      commit: db7e59e6a39a4d3d54ca8197c796557e6d480b0d

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


