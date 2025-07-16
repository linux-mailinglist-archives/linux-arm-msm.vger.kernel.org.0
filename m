Return-Path: <linux-arm-msm+bounces-65197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2549B072EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 12:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D795000AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67DD42F2C56;
	Wed, 16 Jul 2025 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOKeeCU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F120E704;
	Wed, 16 Jul 2025 10:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660890; cv=none; b=I2mIyj6pN+129lirOt/SErrcaHYuKi5uc+wbBGb5oZbqUQmGM6zpGhLeUFf/pTPV3EYI6HzeTWNIrHCcJ63PXC80aupq6kpD0H6RSuT4zV5j6LesqRaPebCnxChzlt7QQxQEpbewM1yYW+KCmDBEY7tFzWOLYorgBSX10HpSiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660890; c=relaxed/simple;
	bh=ZAJ4hltXuvDrA1GGiGb4i5399iwHMLmhNwupb9CXkxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dw7F7Xd++jy7ITZQdyXmRkX6BNfv9A5welbk8ZFoZj+2oxewT7pSj05NzGQbxaumazr1du0kCpNEuAYPEVu2bwTX+HbyXpOvo0c4Vd0EvONXBA7uvRWddPemD/YhD8Fv84z67knfq7gWQETV3ygTckXPZipRimwgR9MlowSe2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOKeeCU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8949BC4CEF6;
	Wed, 16 Jul 2025 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752660889;
	bh=ZAJ4hltXuvDrA1GGiGb4i5399iwHMLmhNwupb9CXkxs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hOKeeCU/pjKMC2NPJSWQ8DxIWEIVjScFWz7ziwxLtCmiGmFGtOzcvx0qzFB0gHEwj
	 y3OAaC7OkmqXklzm5qmGZyMddX5ZvHHv6x+F8EQa/5mf4t3Mz5v5IEQeyFH6uJt1ox
	 8JIoXzdurcQ2DS5bSHmAiKnPPw2A5jNQca/KpbXj5/OACZlCbUj5ZZ5D78mG3bNOZA
	 sWqPKHNfcwDb0aWX6xKZge46mh1CzDsLdG5AUcSzkBQQnYVSWO+9DZSBhXDlIqmFIC
	 GJPGPGNigitGA8Jm2ggCFE+WNxwyG1EwuLnzjfEH4VMMs58WUl3jzo8TV/TU7g1oyn
	 JYN71CvwLzciQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
Subject: Re: [PATCH 0/6] sound: convert from clk round_rate() to
 determine_rate()
Message-Id: <175266088527.17737.6588270584150732640.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 11:14:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 10 Jul 2025 11:51:06 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Coccinelle semantic patch:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      commit: 8a4d73121d6bd9a70895e65d6d1014ed6b0a6c8e
[2/6] sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      commit: 4e15a10f6fb254e33d73a6da3c4d00e3e64d2eb8
[3/6] sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      commit: a37d9c8aef1c78876eff0bc8980a889c083de89d
[4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      commit: fc62ed665eb2e8fb0f1e12ab9cdb578666704a76
[5/6] sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      commit: afd529d740028a41fa750d4491b106cecbccba3e
[6/6] sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()
      commit: d5f317fd5cd9dfdf5bbe11384001817760c12b75

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


