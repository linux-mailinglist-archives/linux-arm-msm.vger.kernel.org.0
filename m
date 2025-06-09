Return-Path: <linux-arm-msm+bounces-60693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F02AD2849
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FD04189124E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 21:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D29A223DF8;
	Mon,  9 Jun 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpVPsiol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C92223DEA;
	Mon,  9 Jun 2025 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502835; cv=none; b=gTthzkjY1gvLMJHOOcnqKY3qphG0/dtrJjRblFTfSSmP7TxjvulrGF4mXhFL+2uQ7/uefBRVSitNl0smZkfSnY5rNrdCBANcjb5822FJY6I928J8wVhkKczHIcmN83XknsEMJ5nBEnQhBrFhtVzYOxpJgjnkWcpNhrAF0tq2FZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502835; c=relaxed/simple;
	bh=jN1KcLo6nFHfMRBQoEH4fQh9W9AeDHtA0Qxl0rCn7SQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mOytSXut5vrab7MZ8seO4y0Kk6gBpbNadx2zrW+yHIiwf+KSCqwZE4oCZDylwBvLaT6GzrGHxwsyk11rtrspbAdkaLOfit44p6bfkNbktUM6MnVgTt6/nwm1mPjke7Wv1r6fpTKIDOD8jGEeyiJRZ8DixiqD78xS20WMicyig5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpVPsiol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951E4C4CEEB;
	Mon,  9 Jun 2025 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502833;
	bh=jN1KcLo6nFHfMRBQoEH4fQh9W9AeDHtA0Qxl0rCn7SQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gpVPsiolJT2hNWn1PWw7P+3qJt9538jwylTmYepJyHspanDs/AWrYFuivKaLYGs1c
	 sDXHaPEzFCv9NCPuvtBkS3HmWsAQkiLmfA3nppD0TWQG4TxDvUhryXONVzI4nyuJzh
	 EbvLVCozcdTGyUJw2M1uBr5wSPoJSFGz5wagliloRkXdvZ+MXJ+YKD0RlZNcKNS/Tj
	 PRzo2T98TtL7wKcUYNSG6zX0NJ1OypkvyZaR8N4QMecs3ieWYt5djULezSVelOSsh4
	 SS3RNdWoU/OCPhwwnopJoxO8HcjlTSHnFH4O7RFy9DuZ97BbGUdVDA7E89k8yqpuTw
	 JZxPPhs1veHeQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjrttmbe.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 0/3] ASoC: remove component->id
Message-Id: <174950283234.277844.8116822825289372255.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 00:45:58 +0000, Kuninori Morimoto wrote:
> snd_soc_component has "id", but no one is using it except Qcom. It is
> initialized at snd_soc_component_initialize(), but Qcom overwrites it.
> 
> According to Srinivas, unfortunately, current Qcom lpass is broken.
> But we can update it and then, avoid to use component->id.
> Let's do it, and remove it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: qcom: use drvdata instead of component to keep id
      commit: 8167f4f42572818fa8153be2b03e4c2120846603
[2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
      commit: 6ada7351af0c4e295739adfa2c4b780c037b3d27
[3/3] ASoC: remove component->id
      commit: d3de84858811ea2c501cb45f0aafcae5beba20b6

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


