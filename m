Return-Path: <linux-arm-msm+bounces-72124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F67BB4456F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52D5D542C10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84120341AD6;
	Thu,  4 Sep 2025 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdSFiJfK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAD3314C2;
	Thu,  4 Sep 2025 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757010697; cv=none; b=OSfmCiDa1d2PyQrFEBCnHF0DLBCS+JrWiCA6vBW9FbTJROJf5Ync80hjjhVUI297iYt9xiqv0XSVlTYbxpvOBAm9rRQ1H02y0GUlPHAjSpwNuvC8RFH86Xqegq7ST7U+tZVoUyHw0nP6TiDzTAr2L+sNtCiBunFoXmkzPWe0nZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757010697; c=relaxed/simple;
	bh=7u/e3klwmqFzyMK45jgmJVmWPGp7rvMzKooOqb/X5zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fdH2ykK8a2rJ0fw3FufCHAkpM6YztkGdW/tQDxOJzaM0C4+z0FFU8tgXM/v1XQlVmMkRcxJ4yFWA9Yz/TiCfYu1Xqc0/Hz294abAPSooCn8ignwYtOOQCioFcHpwAzYLwZ6OLTBEoLvxgDcnwV2J1TTOOLrAUENnrsylye/nZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdSFiJfK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8F9C4CEF1;
	Thu,  4 Sep 2025 18:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757010696;
	bh=7u/e3klwmqFzyMK45jgmJVmWPGp7rvMzKooOqb/X5zs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pdSFiJfKA13JZFs0TMj9TgPe8jY+bziwsfKzPmJZ6GS/WapWXFzUzpKR6QVgKx7ZY
	 hDwbBLlYFNK6qdMQLboQP2FEk2qmgwqhQt9GrusYZYbHeDCnkX4uWyztFEUiFvmp27
	 TUO1bxJ0THPG+dxQrD4ohei2SKYOk3kdPgBxjMRQ3xoGfYBIj8/K/KBAXIWqgcUy6b
	 +XX6dYfYqbh3agnBwzIRE+4BHgwEhAuUar4XJXrjLtri5MqFysklaR/idb9jBOMFyu
	 zmwHlL33ODk3Yn964Wm8JDdjJdKsAXrletjnNlwVI6I/GG/G+uE5eXkI+MqBPB90k2
	 WJc8i3y3HBhfw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>
In-Reply-To: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
References: <20250901074403.137263-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: Fix playback quality
 distortion
Message-Id: <175701069431.126195.14104429101124802886.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 19:31:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Mon, 01 Sep 2025 09:44:04 +0200, Krzysztof Kozlowski wrote:
> Commit bb4a0f497bc1 ("ASoC: codecs: lpass: Drop unused
> AIF_INVALID first DAI identifier") removed first entry in enum with DAI
> identifiers, because it looked unused.  Turns out that there is a
> relation between DAI ID and "RX_MACRO RX0 MUX"-like kcontrols which use
> "rx_macro_mux_text" array.  That "rx_macro_mux_text" array used first
> three entries of DAI IDs enum, with value '0' being invalid.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: Fix playback quality distortion
      commit: d0f61658db58583b3acd1ada70a5352c39cd0388

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


