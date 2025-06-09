Return-Path: <linux-arm-msm+bounces-60646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD00AD1F06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 15:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A14A3AD337
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59315258CE8;
	Mon,  9 Jun 2025 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFGu8TNQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241CA257AF4;
	Mon,  9 Jun 2025 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476411; cv=none; b=DpefmESRwpHK1uCcTiw8Dz99x9uqjjTV5fOKrPvtrJs1s0Z6sfE/U9n0Cg/7amYdSAH9cY/NUWnKw7bXRpbGRaENf3xmtmai3c4lKL/jbznHMeG3rHqOLxVQ3FwunuPmjOQa+9Z+wljYX7qgP0J4lkFur4CGdJmTY+wZv13480E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476411; c=relaxed/simple;
	bh=btPt4PnoHqgf6jzLcbEkymMlePrHj9/nbbiIeJEqU2Q=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ILiA7EdY+uGVE+QINctn5/RcgRXE7CLI85FCE4XhRwtA2QBb09F7ePAK5dbjBPImsnSisxklWZZ+2VPLgbbfTrS5ywXdf43MAEsgKrnXB6iiAMCRAS4lfScaGXuDwdAB6k4llgah6QYOXVy/BZN1ttGXMXp62HWbD3VHCqN2IWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFGu8TNQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405DEC4CEEB;
	Mon,  9 Jun 2025 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476410;
	bh=btPt4PnoHqgf6jzLcbEkymMlePrHj9/nbbiIeJEqU2Q=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CFGu8TNQw8k0ASy1ZRiR2LrPsgmHnuSe1JUowx8+7PJZ39l1+fE6DB1ju6C+CT0XI
	 HrLAKAo3d949GZq0+f1kta9XB6zTMem67HS021gmOdtLpl5hJPrqxFKBccpo8t8DPv
	 kTWwJWxvdHlNh9VCr0+YwWobQBEFYlYedgo3D9/c81dFYw9c9mDavh8/UZ+U0BSmS4
	 0cBaBQj3x7Zq2alzyaGg3qXO1MUR9wQOLPA8QHrXXm7Pd4lt1b4RP/eVe694FEskG/
	 v2+d0vfD+4IKPK7uRs0tnScggG4n/E0k2Xc83f9EE20Wp/41pIMIpqziLe89C4jJm7
	 pceUD2r2lixEA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250523121811.380045-2-krzysztof.kozlowski@linaro.org>
References: <20250523121811.380045-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI
 identifier
Message-Id: <174947640900.126747.17690897321632994593.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 23 May 2025 14:18:12 +0200, Krzysztof Kozlowski wrote:
> All four Qualcomm SoC macro codecs define DAI IDs in an enum starting
> with AIF_INVALID=0, which is nowhere used in the code thus actual DAI
> IDs start from 1.  Drivers do not have their own of_xlate_dai_name(),
> thus snd_soc_get_dlc() expects the DTS to start numbering DAIs from 0,
> which creates confusing debugging scenario, e.g. DTS should use
> <&lpass_wsamacro 2> for WSA_MACRO_AIF_VI with dai->id=3.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass: Drop unused AIF_INVALID first DAI identifier
      commit: bb4a0f497bc19558ba7fe9feac814286fc7ebe85

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


