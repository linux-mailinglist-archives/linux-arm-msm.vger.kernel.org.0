Return-Path: <linux-arm-msm+bounces-27285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFAE93FC2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F941C214EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 209EC15B57D;
	Mon, 29 Jul 2024 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNCMJvnB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B8D15B0E3;
	Mon, 29 Jul 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273433; cv=none; b=oB9b8RZWxnt1JTtGORE4VEtqekNvT8dUmYG2xpRs1j6Ia/HpsRQ27kHjaizNDs7tNbm7+Uy51Cdlk9Pt8oFovr1MNLTg3lqHiTvkC3PoJeLpRVc6ara9Vf1tciN2i69+NHH0pGnRbqTzwWsPRlhYCUVVglxSBdCWUdT8ZsoAMhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273433; c=relaxed/simple;
	bh=A6vdhVEPOCt1GZLSIT08jaj2sy7xUIqD8bI7n3yYE7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VXatLKg3TCztgwVsun5hh5fbaM8H3AJNxkiJrHy9Rl1JqxsYsHFqapQLYWZi27bW1A6cITo159mWJSK+0oWgdRuwAjCxqgSl1zNV06jeGMWG4yHp/xrWpV3J6LfjrPdjdYJfo5K5WAKMSj607jMKKGehbp/4/wGrk0mql8Hizb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNCMJvnB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6CCC32786;
	Mon, 29 Jul 2024 17:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273432;
	bh=A6vdhVEPOCt1GZLSIT08jaj2sy7xUIqD8bI7n3yYE7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fNCMJvnBHpaNAn4wwtS+XoW6xc/iHu92p5xl+5QFoGiDhJtcoo5JsWCBXk7uBfuAY
	 pAGIYfIW+E5Q2+DQ13EBF9qV6W4+QNXIuaBNFIsE3vNw+mzprOxejCJYJsyOLiEBaS
	 1hAWvZ3FA5BVsLQ/Z9XDs/CgAe/67ouCuPlbn39P30E96UtG5G9Tyn5yG/CVS5Ba3x
	 3cpDP23sjcEC0litdniCvOqOTCQXZsBGof2JMtjZLrTjIYYDgnGKA7z5q8rzBgyXvp
	 RDNDwVhYrunqqkILDHE4MgXBB1KhZxWXVWnGC0tipRyG5t73Cvg1Ap50G8Q+pNsgHQ
	 qymL7GnlC13gQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: codecs: wsa88xx: Few cleanups
Message-Id: <172227343010.109775.12144627736852943571.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Wed, 10 Jul 2024 15:52:29 +0200, Krzysztof Kozlowski wrote:
> Few cleanups around wsa88xx codecs.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wsa881x: Drop unused version readout
      commit: 3d2a69eb503d15171a7ba51cf0b562728ac396b7
[2/4] ASoC: codecs: wsa883x: Handle reading version failure
      commit: 2fbf16992e5aa14acf0441320033a01a32309ded
[3/4] ASoC: codecs: wsa883x: Simplify handling variant/version
      commit: cd15fded0e1090bf713647a5bcfd83e372152844
[4/4] ASoC: codecs: wsa884x: Simplify handling variant
      commit: 7eb62acd43c9299630f0e859f56981072401c5b6

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


