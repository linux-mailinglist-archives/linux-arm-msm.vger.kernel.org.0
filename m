Return-Path: <linux-arm-msm+bounces-35051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA09A48EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 23:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B47F61F25D51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80051917D8;
	Fri, 18 Oct 2024 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJjLM/4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DCD1917C8;
	Fri, 18 Oct 2024 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729287048; cv=none; b=rkkqQ4wEq3a+3pkc4aZYQFGQCxFvyeOr7wMPtr2PwiU9yleDeh0SWfdpR8XHrgyeMUQ3+3ISkdUtmQ8oLjsyzSqFZL2dXb00XzuLscfVsZs7k6L2iyOQQW90ukxORRIBZjm9dT9YoZL3PvFPxUGZR2C4VPSJ6H+H+zW1LCgzl3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729287048; c=relaxed/simple;
	bh=MBvpy7HNHufo7wLNxsJXwBL1fUDO4qNiLSPyC9CNR9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sVCEBsgZqAi0FWbAKjlmSVIAKSWXPA/387edERVNK+2qYBCzW+V4LHZZo9rGLGN4W9pYm5kuExvE39JeRdzYKfFqpqQ8AbSh+0tij4WjLjIBh+VdqHlmzRxzo9QJSzcUQy0SM5DlwQ9yaUCQfRaW3G+1DfrPgBEAm+eK0MJWuLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJjLM/4n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D1AC4CEC3;
	Fri, 18 Oct 2024 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729287048;
	bh=MBvpy7HNHufo7wLNxsJXwBL1fUDO4qNiLSPyC9CNR9k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fJjLM/4npGMaxDfWYLOMbTvcgUJ/4ikAk3+TAjzGKNxvNdiC5aAqQkNHb1QZtQnnt
	 IM/02lHUTohrU8D+wjbPTNmQLls2tAhvCfY1R899FwQX9cG6s+SkgV712yLCMrmLoj
	 //BNItpzUWJ3T/YY6U6eBoScChqqmIdcpR2hlDowZnOngS24YW3AbHRmmTZtpRSI4/
	 sR39CYgNlcsxl1u9VAYPebcBeMGoaMNNCA6ARGuz6e3OjWeium2QRMVzVpxSm+4Ndf
	 9LUTOA4H2qW7avESAvz/P1Kaa71i8WPfimT0nDIRDthNWqkDt8ud2cih4Jgii304Wv
	 pRuAJUjQOL63Q==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
 linux-sound@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, 
 vkoul@kernel.org
In-Reply-To: <20241016221049.1145101-1-alexey.klimov@linaro.org>
References: <20241016221049.1145101-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro
 for DSM_CTL and SEC7 regs
Message-Id: <172928704586.212383.11476018993792884716.b4-ty@kernel.org>
Date: Fri, 18 Oct 2024 22:30:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Wed, 16 Oct 2024 23:10:49 +0100, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory. So far
> the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n) macro for DSM_CTL and SEC7 regs
      commit: 9fc9ef05727ccb45fd881770f2aa5c3774b2e8e2

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


