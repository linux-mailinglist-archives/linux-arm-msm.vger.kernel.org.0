Return-Path: <linux-arm-msm+bounces-52694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A349AA74016
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 22:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC83189195F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 21:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB311CAA64;
	Thu, 27 Mar 2025 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxuJcS0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C21624C2;
	Thu, 27 Mar 2025 21:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109910; cv=none; b=rQ+mH7mqrsCrrl/CZ0uiMyr6t998+d30BznXRK4kEzrNPL2ubZ0b4nL+gihez9VT7IO80o5qZEc9aFzWjlpZUYp+kdyOC8iZ/q1BgE8cixOPZ2KvdcqwbjUZSmYRFaaFrA8FjcF5QDetOQK73qGFPu+ORiBDQa41Jd5/6zaR9dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109910; c=relaxed/simple;
	bh=2FnkE7kyKzooN89ZP+W7jaZvCQm8AS6VHiuvwyP/8fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lCOwv4kcwknTcV92US5XwIxpu75tEEs3keyjqSyhIuDxYGfHzsU3zviT5Qt2dGcdTXvSqafXj5Es7OflVX8W1SZS44SS7m5fSKYAjLJ4rYfS83vlKHdAHTkbuubSz0bdiI5KLyC1+8tXA5bUqSFZJSfVsRTAYHoxIB2N2CO5u18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxuJcS0G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F3EC4CEDD;
	Thu, 27 Mar 2025 21:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743109910;
	bh=2FnkE7kyKzooN89ZP+W7jaZvCQm8AS6VHiuvwyP/8fc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jxuJcS0GRKgyRFFHIST9QTQYkeJ0r4qSncJfMoEdcVbTppLxbPR6yftvVN44ZM8tJ
	 KFZ30Ja8lFJ0ePfwPSadNLEvAsUyG8nIoZlc+0OUvxJaUcNta0Y/mOH0uE70ggGII1
	 Qh1TiY3+bestzVKrgxflKUEhNP6YoYby7781bKFajVSRUjlvmxQn71iVkJjd7T4Pa+
	 LriVtcv/6hNO2+jip2P6NdVRJ+U+3xPb/+clwXYg3/zeNaMAtSpFAU4mBEXPubgtd8
	 BOBxe6kLrf7eQdnShxen5sBpDrliOxe2HV5N15ivuCUK0KUNPt7UT+H6+riPXqT2Os
	 hhn0fn8clQNHQ==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 krzysztof.kozlowski@linaro.org, pierre-louis.bossart@linux.dev, 
 vkoul@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20250327154650.337404-1-alexey.klimov@linaro.org>
References: <20250327154650.337404-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params
 error path
Message-Id: <174310990724.446560.8160330650752927571.b4-ty@kernel.org>
Date: Thu, 27 Mar 2025 21:11:47 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 27 Mar 2025 15:46:50 +0000, Alexey Klimov wrote:
> In case of attempts to compress playback something, for instance,
> when audio routing is not set up correctly, the audio DSP is left in
> inconsistent state because we are not doing the correct things in
> the error path of q6asm_dai_compr_set_params().
> 
> So, when routing is not set up and compress playback is attempted
> the following errors are present (simplified log):
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
      commit: 7eccc86e90f04a0d758d16c08627a620ac59604d

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


