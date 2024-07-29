Return-Path: <linux-arm-msm+bounces-27287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FE93FC40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B16D1F21135
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BAB188CDC;
	Mon, 29 Jul 2024 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFnLcZn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8E0188CD8;
	Mon, 29 Jul 2024 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273454; cv=none; b=q7JAb28vIP/aT6uhKbJN4F8BQCbxWWYJ554jA8/OnMbHkOGEbv8ZcTz12lou+j1mGaNkHJTY0tQFqSNwttO4lvJtsA2CpLFFBpgxrHWa5a/It7CaLmvItq6YNvmH0wYtRLOr8L6F7qKa09SVQrp0ofB+kU26gig/Kkf0fSWcuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273454; c=relaxed/simple;
	bh=DNrVoUJkcRCMV4GV4Cb5m+gKYLNldACz3l/Xe20yxuQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fzxhfs6I6QIyOLCyUucfBHwDyykmQQit5UUwdQYauj5tiJCRX6Pnz0beu0erHZS6LhXHditFSjlR9oSk5WF4mRhkuYGCzMnq+wFB+A82fV4bikk0LQCjRFl8OM866qactGDfau7Ug1rrWDgbHQ77UG336YJtSjV0c3IDIRYXrOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFnLcZn/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5BFC4AF09;
	Mon, 29 Jul 2024 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273454;
	bh=DNrVoUJkcRCMV4GV4Cb5m+gKYLNldACz3l/Xe20yxuQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=HFnLcZn/OptUIW8YU8D1Vi9bESeu55eoV8fBlFc0xw5Nl3N3AOH4RK8TxALMYUfV4
	 O7D+zbQZTTgHIL3QsIu+L6MSje4TZ09ZL2iPEXn7vqdCNZ7LIuC0Cos0+EoRrSnyr5
	 Qxz/kZxxsoDN7We1OWWvI70kAHpB97v2K/6bKLaRJz62sDxyk1QhVsmOuDzIujhPBt
	 K5SVx9dKmql83GU8c6NrRdwOyV6ik26tHgMdTT+p9Nf159L3NuraeL4hbhgkQZzHff
	 dVKnfEE5G8EAOuZllCIcCKr5qbBPAaZ9etKLqI6LY9xKipo4mpqILSDnMxXaJ5dJGC
	 8DOz4t7xD8/tA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
References: <20240723144607.123240-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in
 VI mixer
Message-Id: <172227345178.109775.370117860725078883.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 23 Jul 2024 16:46:07 +0200, Krzysztof Kozlowski wrote:
> The wsa_macro_vi_feed_mixer_put() callback for setting VI feedback mixer
> value could be used for different DAIs (planned in the future CPS DAI),
> so make the code a bit more generic by using DAI ID from widget->shift,
> instead of hard-coding it.  The get() callback already follows such
> convention.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-wsa-macro: Do not hard-code dai in VI mixer
      commit: b3f35bae68c0ff9b9339b819ec5f5f341d798bbe

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


