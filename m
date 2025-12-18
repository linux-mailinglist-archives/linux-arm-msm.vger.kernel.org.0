Return-Path: <linux-arm-msm+bounces-85661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8596CCAD67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C46593006FC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 514F1299AB1;
	Thu, 18 Dec 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT6fI06H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C691FF1AD;
	Thu, 18 Dec 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046068; cv=none; b=I0B1y9zfHKPbl2c4Un7liHlug9df17qkXnoi/OTXlHvsWuoh6Gu6ulJh+PfSZk/E/HfoKW58zHxzBuipbXo/U0t5TmPMBkNKARPjS3ZMZKSCkJ6dTEYDWgMNcaHN9Z1+zQL3saMbdmlA+0Rql5f3aetuAwi3O2A8m/MH9SKgbw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046068; c=relaxed/simple;
	bh=YwOe/Yo6AihlgMw8tJfRxWFjpLQf3aQ6KLj1QD8bwp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ixvLcwsEbPp3CxdPtxDpuLJQPHCS1wWAjudoM2VifySAkv/o7ot5LyG1ndBWB5ys2DGU+NCPxwk/KhAC2QDQSkDd4l4py3hx4QRXOqegVF7+Ya7g2QoA6AXfRLkwMhv09VFUk1/HbMNCf7PFSdNf0Sb5m1JyUk/vxDs2WrMu2NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT6fI06H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFB23C4CEFB;
	Thu, 18 Dec 2025 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046065;
	bh=YwOe/Yo6AihlgMw8tJfRxWFjpLQf3aQ6KLj1QD8bwp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PT6fI06HKwbchTfiqEjdqSD6ORwCj78RbRDtpX0iYka3F5A9nefaKpuwS0kmwk2ui
	 MQLAW6/lnw/iulR14QkpRlq4604CQlziP8SCV9TDzGydEZDzp010EHdbpEoXRwSGhh
	 AyfFDJ5l7/XJz3zPZd4kgCcAJpYRRKBFVcMT8OpOBc567Je3fxpvu0AQfH/j2ZNO0q
	 1umgWKyFDwRM8OGlXoVPuhKCJdabp4WxqsT0N0l8TbHe4kzV0V4fYNFKL6oBM8ubOA
	 1kyBZNKjUjdQlG8+K1YZkXZdIkUnxJPiu+is9njXutEtxAdESsp4hA6qPnE0p4oDbh
	 AYLJJ3KU+MhsQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
References: <20251008104448.117167-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
Message-Id: <176604606357.48417.1586328124379101511.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:03 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 08 Oct 2025 19:44:49 +0900, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
      commit: 0db76f5b2235ab456814ee8e4e2cdf0cef09dd6b
[2/2] ASoC: qcom: audioreach: Add support for VI Sense module
      commit: 3e43a8c033c3187e0f441ed5570a0fb5dcc9dafb

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


