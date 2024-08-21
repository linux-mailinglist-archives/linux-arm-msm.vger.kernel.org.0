Return-Path: <linux-arm-msm+bounces-29211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A855E95A158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 17:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB07F1C229CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 15:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB14E14F9CD;
	Wed, 21 Aug 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVXmxd1e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC714F13A;
	Wed, 21 Aug 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724253890; cv=none; b=cNJQq1Jr3rxjVsYGO+fDqh1S0cKFZBgywwLYeDpbp5/dIC7IDs2OJuGlo3LkuhA5OxHbob5sflCQPmhkqTOBJFUHU90oXXvQnqTKfCWDtgJrz/gCgyxG9rLsMFininqCevTj67i92g20qBogyAYWMCWj3UnKf9n0PxajmFEtdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724253890; c=relaxed/simple;
	bh=W6Dm+pw4jKVI1NoMBaeLuQYMNAlSSIuKPuzkfQBk0wU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C6wBhOgx4hX/1nPuA3ydjCCkbGfg+diyp2SropG+IE3ttuzq6iIIV/m7et6/F3IQ3DhG2LZzZTQwUiwcyPskhG9zUbDs4SchI8VgBY5YUcT8ihcN9LzGUngj/dMt8lFdF3zgYyqshq25PCN1WSHIoA6qzpzegP0iAPmD7dUxYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVXmxd1e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D56EC32781;
	Wed, 21 Aug 2024 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253890;
	bh=W6Dm+pw4jKVI1NoMBaeLuQYMNAlSSIuKPuzkfQBk0wU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YVXmxd1eK1rsVkqeL1K3kB85wpV5tsEhKpBR7XuGnOPqUwBOqNEcxhL0cvCXR9l2J
	 QkixuXmAmzleeGVMTlAAaW4PUhlGy2Ik+eP7EMqc5LQEaJL70m+kAlousN44o2lNoN
	 6YLvZyb2iBqgwccb0ckkq5bCwef5FpwNqbLZGqyEnAFWYZOAV4VI72XWiJY7seFnnc
	 pLW1Yzr5Mbcn85sx9TVhsaEzBlYue48aXHMyBEeuqd8d2nMH6lBN7R8JC2M93an0HO
	 ur93a+PHoXdbrVZ+3jNjYoDtSO7myjqO7NHoug1uxh8uWcUswhgwZNbdAYSZPRs5t7
	 kc0HkwI38pC4Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240821114927.520193-1-colin.i.king@gmail.com>
References: <20240821114927.520193-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: wcd934x: make read-only array
 minCode_param static const
Message-Id: <172425388817.1704682.13476563163594836442.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 21 Aug 2024 12:49:27 +0100, Colin Ian King wrote:
> Don't populate the read-only array minCode_param on the stack at
> run time, instead make it static const.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd934x: make read-only array minCode_param static const
      commit: 6f6d8b2d49299492e704030632ab79257685e5d3

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


