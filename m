Return-Path: <linux-arm-msm+bounces-60695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741AAD2853
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD5C16FAED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 21:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFA7225777;
	Mon,  9 Jun 2025 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMgkE+8M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88BF221FD8;
	Mon,  9 Jun 2025 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502845; cv=none; b=JyHOev6BTauC7QiJoL+vhAV2ynsFa6MGb9+yS4gtYTPWhy0all2sCB3md0PSqzAbvKEOG/F4Z6niTUNP+U2190fdSjJ0dQh0d8Z8ifZoBMYlN+tSzIvdW1zsaRZ5hKv5agP3FBhlHYiV9/8yAnJnOc1A9QCIxE90LiKZPCQQ/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502845; c=relaxed/simple;
	bh=nKBc69Ss4RL/f6HqDzYsfnuaSZqHYo5VaYM8rb8GeWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=css6ZiXqDB4lh2niNUNbSqUnLp5dxJvB1UyLPT2RWjS8hg7e0YjagANw3iD4CQyazWNBsnqxoD+3Xn5hLyD36jeQH+yotNvmcyxy6r1nx4IhzOPs8YHmSIqoh+IZ3fRtcLuqCdvI/kAE+APPOzMqI8mXE/qmwcWjFJ/rrT8AlTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMgkE+8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41145C4CEF5;
	Mon,  9 Jun 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502844;
	bh=nKBc69Ss4RL/f6HqDzYsfnuaSZqHYo5VaYM8rb8GeWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NMgkE+8M/Uu+YDD9TzoQBBqlIrvaR+kKWwQBRPp00blQwh1Uq4usimq55b2ClnPlS
	 E2KwChecqZFjgJFgx2DmbY2y4mDavg2RSIES0qu2gMpBQOomYNvpWsE/jtHJaQlu9y
	 irGMEVo6adaaDja2ADlhrl8j9TZ8vwdd3/xO2ILpLqvX+eSDk3mF/oYYhhilo2rPFI
	 60I544mJeqwf3/D/5brHAGtVhsYL6XbfCY6JUOR++fJpn+o87OIuIwZMAsmvZCcmsx
	 ZjYgasdchQrSORNYDnBeu6HpDtbPAir56TQOhzcPkEB3GF4y3q5xh/q1zPmOs04ibx
	 md1dqE7NLY0Tw==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member
 cleanups
Message-Id: <174950284100.277844.5516021122199665205.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 21:59:54 +0200, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: codecs: Constify regmap configuration static variables
      commit: 0045b902ad27f2676c2a5b6444494a8287b80072
[2/8] ASoC: fsl: Constify reg_default array
      commit: 239dab898b739f49b1bda8d65163fe4f5c773468
[3/8] ASoC: codecs: wcd9335: Drop unused sido_input_src field
      commit: 620d9687004ce877b340041b8213da166f329367
[4/8] ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
      commit: 9afc53569d800f5e3caf9401d49ad2d89f340a54
[5/8] ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
      commit: 87a2270fd1f560dbfc1b26391ff3b37f56d2a1a3
[6/8] ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
      commit: fd32bd4467c13254cb52188034fce242f0f6340d
[7/8] ASoC: codecs: wcd938x: Drop unused variant field
      commit: ff228b6b9ed8f5d7ef418b6cbece772c6617d789
[8/8] ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields
      commit: ece5d881004f041c2e1493436409dbcbea3ad5f8

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


