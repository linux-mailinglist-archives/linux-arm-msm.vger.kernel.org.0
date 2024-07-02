Return-Path: <linux-arm-msm+bounces-24879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265D923C62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24B51C223FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F8C15B14E;
	Tue,  2 Jul 2024 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsFQzMwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABA91534E6;
	Tue,  2 Jul 2024 11:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719919804; cv=none; b=VN7nz58bIwr0qnfYRBpXMjqvfaSFCH3CI5qPSZTsBhUsF2VaxtoxuOr1X6uFhTEGozWUrjvDoKXPhUIZoK9AdZnu6FUa878meUmcdDzbBCgqaKF/jlavi9TfxA/NFJJeC0bZuGFqkVREFn4uvWsswFxX4gEGrB4YRIhseL4DP+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719919804; c=relaxed/simple;
	bh=8VjB7u2o1X6Fkf4ljzLQulZ+iIR1INcOkKXgXFjoEP4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kDvC1f2BXzQOhz8RniXBCUdp0fw2s6/V+8TXqiaX+2zW7TZk9qFzSUPxhfmlWH0J9FOuf8V0qbRtqBMOVn8km4TmFUbVjDaQ2ttYQetWkAFD8EL7Pppo4R3sYNVja4iM2rNjdmmGJfwz7ew8ZFGrRgURnkz2bApLJRXCdJcZGiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsFQzMwg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE852C116B1;
	Tue,  2 Jul 2024 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919804;
	bh=8VjB7u2o1X6Fkf4ljzLQulZ+iIR1INcOkKXgXFjoEP4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MsFQzMwgt8Dy9o13LHIHXMusSsQkTEC1XvOsyAP6RSb/rBFCn8lrmAFmMHdqrHed3
	 ycKjB0ZCtwaURxZt321m9Qsmp3TUFeIDgWWm3LQDC9+JuhpTv7n/t/mjmIE9G/D1q/
	 fQ0GVgEZDbHasKgk0wsfFOiC7KZ4S1eCPF9R01JuwvkdCIjh38zxlRCzIDK7ygCrlz
	 8F4eYxJ0gGcAmZc6DUoiUx0WWFMYpaNmuS17q/VsUcdUXnWwu1uffIdQNOxmg3NUmp
	 DeZeJcuwRuMJIB/kEUbSuFoD3UfGBOoeFQwKElhjX5DT7pUCjfKZYAIdotTAD1aVBW
	 cll11JNGiBC9Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL
 pointer in probe() dev_err
Message-Id: <171991980162.18111.8940228821828803310.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 12:30:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Fri, 28 Jun 2024 11:58:30 +0200, Krzysztof Kozlowski wrote:
> The 'rx->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer in probe() dev_err
      commit: 2e068fe01ecbf677d414d4c1b02eea1636dd614c
[2/2] ASoC: codecs: lpass-wsa-macro: Fix using NULL pointer in probe() dev_err
      commit: 765d3a2aa195882e231835f5d9ac4d99affc8c07

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


