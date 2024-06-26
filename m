Return-Path: <linux-arm-msm+bounces-24308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E19184D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D5971C22146
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33547184113;
	Wed, 26 Jun 2024 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuhA6brg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0503A8F5C;
	Wed, 26 Jun 2024 14:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719413438; cv=none; b=d3K2vZn6JSyB2BdJHj4sqAXWFjiZeHVNkhFlBjVckYpS6U2wEyPH+K1yiklrNs1kfMntOSt7Wmc6d8HvWsYExMs/DCo3NC+qDeg5snLaV/0VHKBBDVmGjCbtwBcjr/pGA1o2qvpYbfaf/olySbpowfYqAPbb7yzxmwXgc3cI53Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719413438; c=relaxed/simple;
	bh=EmrOuKlP9+a0u3gAUhglDb1ETNcSp4UHvd18zX8Qr2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E4d3NnVfpm2G9n97vu8ayj4RK4zUKSgRVdyXmLhi47pL6pfiXz5RhoTpTPKdAD3UYd9zgBirpMaAN2UGC2NdlLUYcREDTKp49td9TpBKVhFmO1zpWiqkoraU0GMc0KLu+nOXXaHH21iyWRr9Uf6NiIL9ecp21y6u2pKIB2xgrH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuhA6brg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A382FC116B1;
	Wed, 26 Jun 2024 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719413437;
	bh=EmrOuKlP9+a0u3gAUhglDb1ETNcSp4UHvd18zX8Qr2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KuhA6brg0mkyhFFvzx50d8HLTpE7JOOQy4jyRmjs6zpvc9TAx7ecs1jyJ7ETWg+4p
	 EYKWApOos/Wl7UXP2SQ2GtolMlQz8MLWoy8DJzqGziOJbf1ZidsJBB4Lvmp2b25PSJ
	 JcpEvaJpS48/ogK9d+gaokVddQFywHvUX2abaaLs0RKBJQeLBtuTFK/XxDljxTdq6A
	 GJyxB36TkhUk3Qw+1jToIwLNC3rmZibwpHrXlH6JR65g030wHd1+sD4+6dtoauiw/X
	 xi7porStEWnfzGZ/2+b+Y8lqBgFCIVzodxhC9uadGofG/P0aVfzTzOB1e58g/otMn3
	 J3WWXCQ7iE4aQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
References: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: lpass-wsa-macro: Add support for
 newer v2.5 version
Message-Id: <171941343537.1374758.899867570385507706.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 15:50:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 25 Jun 2024 18:58:44 +0200, Krzysztof Kozlowski wrote:
> LPASS codec v2.5 and newer have differences in registers which we did
> not implement so far.  Lack of proper support is visible during
> playback: on SoCs with v2.6 (e.g. Qualcomm SM8550) only one speaker
> plays.
> 
> Add missing bits for v2.5 and newer codecs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: lpass-wsa-macro: Drop unused define
      commit: 04f4de6f68eec73595682f32952467591f0cc016
[2/3] ASoC: codecs: lpass-wsa-macro: Prepare to accommodate new codec versions
      commit: 5dcf442bbbcada62631f5a376c44ff794596c2f0
[3/3] ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version
      commit: 727de4fbc5466c7150482b532f2b7f7e514134f3

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


