Return-Path: <linux-arm-msm+bounces-33903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF11998CA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 18:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A5AC1F22A06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0A11CC88D;
	Thu, 10 Oct 2024 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSbjH3V6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886D01CC15C;
	Thu, 10 Oct 2024 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576168; cv=none; b=m2cEf/0/VoZp4U5cs7zeUwFt0CM9X0c1TawX5Odgxt7MUodM1gxFm23o9FdxQ+GLsydDq6Hj4A+IuHLK6Ko6yKqjqSLudTqdWd2KCCpeGQvZucu4LIKhSrX20zwUCMOj0UuKJAR/NCZ/uMmw7ev/MCoHckSZhUxSuGKtL+1YDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576168; c=relaxed/simple;
	bh=S+VHThEJhUPYhOYwz86lsihIiQBkPJVV+/AUAxWcvEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MGPB6+/OYPUa/1xr4W+V69U/h+b6qUJ4LKJf9coe/P4gHZBInFaSOgPk2kk4WUeGRRfBCVrmzWaYLkTMwYmY/KaVfkn+GXhgaHeWL9Z57LJMevXtqiUSdBYOdHHiHPxHabjfhMBx6t3p0NhBRIXwuYSsJeawazKbGfeCOkroacs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSbjH3V6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C79C4CEC5;
	Thu, 10 Oct 2024 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728576168;
	bh=S+VHThEJhUPYhOYwz86lsihIiQBkPJVV+/AUAxWcvEw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eSbjH3V6t/5of3B4Yyfb8Vm5h15z463xsSmgB6uLPr2njSKpG1C1rzbnvGUrF4xwX
	 mvK6bbTQYjE0lenjt58ZFwKGhMp9uS+kF3wQ/AKyVdTpoDrnHNEpR/TWL7ZM8CGH4U
	 7al910RdsBeEhShMVB4mDeSqY7jMwPn7x2Ui1oiRUS571tFJ4eJhlAE5UxN9Uwashz
	 40mDo9+He6IBpwXtLNt8oORHfu9HgmhSPrRep8RWgMJShf7PWiWHwigrJorcbwCDph
	 5x560AQb0iZKp+dyC7gOi/j7erOnrSWkO4PrRWAUQ1iC4QD7FDVwwIi8QPk7nfuXRL
	 5vbmeHK2/CEZA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, srinivas.kandagatla@linaro.org, 
 linux-arm-msm@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Cc: stable@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 krzysztof.kozlowski@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com, 
 perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20241009213922.999355-1-alexey.klimov@linaro.org>
References: <20241009213922.999355-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sdm845: add missing soundwire runtime
 stream alloc
Message-Id: <172857616502.3841093.14744929063388580442.b4-ty@kernel.org>
Date: Thu, 10 Oct 2024 17:02:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Wed, 09 Oct 2024 22:39:22 +0100, Alexey Klimov wrote:
> During the migration of Soundwire runtime stream allocation from
> the Qualcomm Soundwire controller to SoC's soundcard drivers the sdm845
> soundcard was forgotten.
> 
> At this point any playback attempt or audio daemon startup, for instance
> on sdm845-db845c (Qualcomm RB3 board), will result in stream pointer
> NULL dereference:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sdm845: add missing soundwire runtime stream alloc
      commit: d0e806b0cc6260b59c65e606034a63145169c04c

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


