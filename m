Return-Path: <linux-arm-msm+bounces-59018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41178AC078C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 10:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D994E3BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 08:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6983F27F194;
	Thu, 22 May 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwgcMULs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355FE233722;
	Thu, 22 May 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903528; cv=none; b=BOT4yx53SYynkR1nz6YJ99KLgyFsX74x8PsQVCHerppzsjOCG4WOFjaYd+33lKNvqkkx8jpH9isjhrSocr0UFtEXHXefsumwsa2iFeNd2bDL+VGWQ7Hq8s+Ge2lUwqzhVeBVtew4Z9NRZuRSLxAjDLAvg0CwBi9o4EFbKQBHqt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903528; c=relaxed/simple;
	bh=texjXElObw+GNasUGILZClaSk8zqAXIuhZPQBXgKUE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=B7MB1f300csLv4jJnfn86hEG+BQwnko37iytUxgyIjxxE0UgC4tzTNzzng1+iimyc0qkhijXZ5xLDBzS78/HxtJJdYzdnoHtskitnRAzbYKUdZF87kKsw8zrn5FboSD/H9ZQZu5pvZjgcUkqI/A9wtP89e9ndFHc46LOxBR0ono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwgcMULs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED283C4CEE4;
	Thu, 22 May 2025 08:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747903527;
	bh=texjXElObw+GNasUGILZClaSk8zqAXIuhZPQBXgKUE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lwgcMULsr2hRhzZpY/gYNy4WCPQR69Ik0BAcL+Hm2D7x/OYgOR9rE6INLg67zskEQ
	 BOANIM+3l4/rkgwKzPqkuzr332RkZ227HcZSmzB8SK//EATxIUXDFrcgqE/PmXA6OC
	 yfneQSzQ+luR6AU/9tC++Ix23nprKIYVfAWQJwIsX09bTvVPEUTia61uUGhQ2VcZcb
	 A94c1d6IdWiPBkOhw+mrpQ7yXxJ2+AW53UrU6I4b8ZfXZ5D/PQb+MWQ3SWgLIm4+SJ
	 l1fyE01QpTlDt/IpS894Byh7KdPnf9T6jQoR1AHjk1ggJXpPKFyONA59XWyzckuBMv
	 EeV8uJ2jcQbHw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Srinivas Kandagatla <srini@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250519075739.1458-1-vulab@iscas.ac.cn>
References: <20250519075739.1458-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: qcom: sdm845: Add error handling in
 sdm845_slim_snd_hw_params()
Message-Id: <174790352570.11863.6206484772425321934.b4-ty@kernel.org>
Date: Thu, 22 May 2025 09:45:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 19 May 2025 15:57:39 +0800, Wentao Liang wrote:
> The function sdm845_slim_snd_hw_params() calls the functuion
> snd_soc_dai_set_channel_map() but does not check its return
> value. A proper implementation can be found in msm_snd_hw_params().
> 
> Add error handling for snd_soc_dai_set_channel_map(). If the
> function fails and it is not a unsupported error, return the
> error code immediately.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()
      commit: 688abe2860fd9c644705b9e11cb9649eb891b879

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


