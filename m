Return-Path: <linux-arm-msm+bounces-86270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9632CD761D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 23:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47E33009569
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 22:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8FE2D7DE2;
	Mon, 22 Dec 2025 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhUI2llO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C81E5207;
	Mon, 22 Dec 2025 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766444181; cv=none; b=S72Lui6zgHAQrW59KfkvoG2HY9iYXXScz3z8osDxdzc47oAcLy5vQTxPpgB1SnFEWHrnGPktSP8I1ILK8COSmyl8uw5lulCralnxAfDd8oKKTDijtclJoNVq+p0F/rI4yt8jKKgfK2ocWaahF9uL5jDb9SaUcOtAVFwsN6mB0hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766444181; c=relaxed/simple;
	bh=RR5+wPEcpUy5+WM2lXh923XG6b80vG6FW+TMP3k925o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gb8kxwKPNDMUZfj2IC2UQOQkj4DoXdeSJF4EenJs58ss0SGt256sPPCeykAhjDnAspesz/fe0GcvM4IA421wME0pFEhyz66jXHIs+qtJlz2hsqGKMZmURvUa5HfOp9r9/NG22WiDUsW4UI66112lySbPauSkDec//UbXmUmT3F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhUI2llO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0209C4CEF1;
	Mon, 22 Dec 2025 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766444181;
	bh=RR5+wPEcpUy5+WM2lXh923XG6b80vG6FW+TMP3k925o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uhUI2llOQ3xDzAUhRVzTDaW1rGfBYq1xUN83VvIWkzO9nhHbPJPxr171D4M2ibDGE
	 QZdB8lQ6B0UcGoxU82Q5XzHRA5E/VU3ZXkPyOO9DzUgxdbVHVIwzlVPuYCID7ZewVT
	 lE+IEsH3XEBb1XEMktytxRpGzttc88KbAwdGs2V8HFqbV9H1RwEG5JoQGbE/bfuF0M
	 SCN/rwH2yQVH5hGyrhg9EqkmDTnFjxOsTSV/Xv23Vq1JkixVhqMp9nRJfZ8vdVZjmU
	 xj8ROUF/hSU5w0hbNyD0Z3FyailgVsgaDFyeT6fruN8GhCeEUOOnqMYnjUKUkT8GdI
	 OKynaQ5Ovm1wA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
References: <20251219-b4-container-of-const-asoc-qcom-v2-0-05fd2ecc06fe@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] ASoC: qcom: Constify few things in audioreach
 and topology
Message-Id: <176644417935.2691602.16694159244085079057.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 22:56:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 19 Dec 2025 12:45:43 +0100, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Drop first patch (one removing unused arguments)
> - Rebase (new speaker_protection functions appear)
> - Link to v1: https://patch.msgid.link/20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com
> 
> Several functions do not modify the pointed memory they receive, so
> marking them as pointers to const would serve as self-explanatory code.
> Also safer a bit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: qcom: topology: Constify pointed topology and vendor structs
      commit: c4be067a7b67f616b9ec85423a20be6be9b8ec37
[2/5] ASoC: qcom: topology: Constify pointed ar control structs
      commit: 5e357c7e5e0920bd806a4e7c446c83715315f923
[3/5] ASoC: qcom: topology: Constify pointed DAPM widget structs
      commit: 61fc95c4e3b26b3d1259a87124bdc25e4f71a8df
[4/5] ASoC: qcom: topology: Constify pointed snd_soc_tplg_dapm_widget
      commit: 49675f5e750a2a5d530c56d130017d0337eed18f
[5/5] ASoC: qcom: audioreach: Constify function arguments
      commit: 4ab48cc63e15cb619d641d1edf9a15a0a98875b2

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


