Return-Path: <linux-arm-msm+bounces-72111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C378BB443AA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4D45A02B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999DD22B5A5;
	Thu,  4 Sep 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5uudv+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662AA22A4FE;
	Thu,  4 Sep 2025 16:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004700; cv=none; b=OkjyiNBSHRUX1TMB5X5TKkFDjJ0DUDU56fdbYwdgsn5yxtu9B8Wa2vGgEoq8I8GaNgg++roP18GgeCBjajVls4Ba2iy9GXqULimy+2Uz0XR1Kwqibh8kmXC5hkpTVPXfN5nN4W9R3FJNPPoDDGwS/5k98i/7IvNJLdKlH1VT02Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004700; c=relaxed/simple;
	bh=b5X/Jx1AWvrW7NnmFfOS78Vyyk2y4mzx2W7OnKcy+Es=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cKtnTfqk4q/M3l5YLZUGYHCqySA6hm4uLdjQGz4Qibe5u/F28Z1/DvJCy5K2XJrrBfayCKYuldjBPyR6kUkgM5szpxmgW4FJHkEs8ddhJ7Zz7UPH0PcM5J5PuCw5qtPH8sGcX3sjEYSWvSZsF0FKxTJpy6ieb3k3iLRi/aA3fJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5uudv+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1ECC4CEF0;
	Thu,  4 Sep 2025 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757004699;
	bh=b5X/Jx1AWvrW7NnmFfOS78Vyyk2y4mzx2W7OnKcy+Es=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n5uudv+JtZodmNC7JX8EAbZMP8WdVp0moKCQuUczXfpssXGv/iZZw4yj8XImLVKYZ
	 202IXcNY40ya6bfxZJHo6aG1ZTQyWBF/6m+p4h/G/VzR+Sv/73+rF41ftdRiAU42nC
	 Z1YIsHsYYE2frwhcPWUx8Efhz9UPM7ysoI8M0m6F42s13yijuTJ3GK/8SM4cuGGbgF
	 2Lora0/MF4HiHokPX78KpqgXnWhXsrI4QrkxNd1sjfBpm9hT6No2bm6UuqFpw1xxy8
	 Wxbv5yNrLIPjciXqQt+iWPU0xDZ228RSg4PunIAupo9uESBYoCzClogvgGnE0TKg1y
	 OWcNTreK6N02Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
References: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
Message-Id: <175700469794.101252.6741664574199797818.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 17:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Fri, 15 Aug 2025 13:39:16 +0200, Krzysztof Kozlowski wrote:
> If earlier opening of source graph fails (e.g. ADSP rejects due to
> incorrect audioreach topology), the graph is closed and
> "dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
> graph continues though and next call to q6apm_lpass_dai_prepare()
> receives dai_data->graph[dai->id]=NULL leading to NULL pointer
> exception:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
      commit: 68f27f7c7708183e7873c585ded2f1b057ac5b97

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


