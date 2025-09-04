Return-Path: <linux-arm-msm+bounces-72112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 376AAB443AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 18:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E15F5A0741A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A31309DC4;
	Thu,  4 Sep 2025 16:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BcVwFRLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBFE3090D5;
	Thu,  4 Sep 2025 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757004703; cv=none; b=Q9UeK2AdUxZM0IXijvZN9IlKvvmN+SrO3lK7xD1lO/P0pkXfmn+/lJLZGLUbBaLCnakzCBklnTHdxYe60xjYpy3KQfpi4eLoAy8h0f8faiD2p2YVJGoLBy1B6Dkv3C4cxcIO+OVH/frkEp+qQihqVdX+uEe7olqFOtazYsyU4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757004703; c=relaxed/simple;
	bh=+8ovVQoNr3xnSgge3ZNc/bWr+AwjWhQbChG07yqVIPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L8YON6y5bW0IPuE07JoG8nNcjFcpb3+J1NXWCYfTqENhqmUvR3CVRwsXt4poEAaA+Ruq3lDGrwQPJrnvSRwrVPwe7I4GbxEJbyvQRZ3HtwnhEWI0F+XOnudWB8l6QhS6k7E7BBtIBkANflU34nYtizVeKSaZXVQp2NnxlAyGGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcVwFRLK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF48C4CEF1;
	Thu,  4 Sep 2025 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757004702;
	bh=+8ovVQoNr3xnSgge3ZNc/bWr+AwjWhQbChG07yqVIPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BcVwFRLKDLv9D1Db6hTlu6+Q6+qbGdM1I+F0uP9Xn0yz9zOIJlXpSoaE6OXxxuUMi
	 ijCXt6FYfhy93yve7WHjVIlW7HknW2G8QKe9tVRQm8fwE3F34LIbCklA24an7v4gET
	 MkfD9kAIlHaH0MPKZp38UA+Ep6PFWby/GLLgV2sdIVwbB5BXxev0erUbmdJySA6aui
	 SygA8NaWHg3925fQibmFWClHyH+KAP8M9E+tz5EqvQAKiUJuSccwZqjA5RWXVC1Nz2
	 rA1lRsKmIqu/KfSoGxkkFCmfGTK2TDsGDvUmNaUSF1wuN/h1LaruqpNYaxnkCWzKh+
	 KpVgtc165d9Cw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: stable@vger.kernel.org
In-Reply-To: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
References: <20250904101849.121503-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
Message-Id: <175700470013.101252.2850768839303017703.b4-ty@kernel.org>
Date: Thu, 04 Sep 2025 17:51:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dfb17

On Thu, 04 Sep 2025 12:18:50 +0200, Krzysztof Kozlowski wrote:
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


