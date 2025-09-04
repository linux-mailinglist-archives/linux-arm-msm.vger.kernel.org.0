Return-Path: <linux-arm-msm+bounces-72123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E9B4456D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26B4E3B20C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95C8242D62;
	Thu,  4 Sep 2025 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClFTyuNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB171A23A9;
	Thu,  4 Sep 2025 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010694; cv=none; b=Sdh+Mal2IDYOCJuQ34z9yuCbJY9+5YVMaoBJ1178JYiq08fxA7xrsLLlK2GeESqhCV4Xy3qrlaiC7J4Jy1TsGkXUBwS83gcfoIYZaAppAfoQpnAILMgLiDVcbEH5VSX1zgU+bUZIhSAI4bBKtEt2NXMVzCQ7wG1tAQbhplJuYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010694; c=relaxed/simple;
	bh=WcXnrHTlhu8va0dzmb4X75sfdCpkS+gzjv7ugnNZtYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iyhfqwcPzuK3zqdhEnu/oN0HQMC5N+iTkRKUABuNFv2iHr+dKjx0hOHhDB3VNDR+9gIWl8PmamtOWsdtVWo8FZX9rxqlKG9HVgtb2xMrQ+MZ2iCuKREC64oB8D5N6Jgz56IYZO93ys7pvxd4ZWpQ+HwVM6uefe5jdqC3d8+3Ih4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClFTyuNk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A4C4CEF1;
	Thu,  4 Sep 2025 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010694;
	bh=WcXnrHTlhu8va0dzmb4X75sfdCpkS+gzjv7ugnNZtYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ClFTyuNkLDOoieldp8WPV/7FGD3JLXmqVcRt70H8j0xolLq0SqPMHJUdSx88c5w2X
	 qQ8W3WfJm7vHTVZbfExpfF/kv9JB71UrK2NJ48ok2a5c6JICodzzRO2MBl8Weni1vp
	 vQcP+Au1Xi24Whit9VZHe3vUSOVpe2TVYQhzerCo5U4pTIHZlMcYRr+Wmg39A6aAzR
	 7Pm8Pz8GOUELNDkGliXnoQE2L3ugbK3KaGu5aBHL43pykszqoCImwvZX3TG2HrTPPK
	 RWeFZ5wqycdnYc8Ea1srAR6tyvJA63eZiLyeNqaFBvTgPkcGu6p17OwRxrMbX6RWuc
	 8Xl30TVlpqEEA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20250831151401.30897-2-krzysztof.kozlowski@linaro.org>
References: <20250831151401.30897-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: Fix speaker quality
 distortion
Message-Id: <175701069186.126195.4295379119424857942.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 19:31:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Sun, 31 Aug 2025 17:14:02 +0200, Krzysztof Kozlowski wrote:
> Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
> AIF_INVALID first DAI identifier") removed first entry in enum with DAI
> identifiers, because it looked unused.  Turns out that there is a
> relation between DAI ID and "WSA RX0 Mux"-like kcontrols (which use
> "rx_mux_text" array).  That "rx_mux_text" array used first three entries
> of DAI IDs enum, with value '0' being invalid.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-wsa-macro: Fix speaker quality distortion
      commit: 9004a450fccbeb40a71cc173747da37a459fd4dc

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


