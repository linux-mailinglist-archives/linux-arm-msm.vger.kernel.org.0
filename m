Return-Path: <linux-arm-msm+bounces-31528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF43A9757D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 18:02:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79DDE1F2710C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 16:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234451AB52C;
	Wed, 11 Sep 2024 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oO8TUy93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9AB18661D;
	Wed, 11 Sep 2024 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726070564; cv=none; b=CHQK6ieoMTH/Da1WyV96wgBa5+U0hyjp53Hr7kFXh/wZUuGy4pRUj+yisdqox/ByFPDUUJ6zG6120WaHcKbdJ3dqM4O3Qlt3nwRBSK2j/jZyqgAhX6hJG2ojUqItjXqZzX4FQZcA2xsABrsaKfKcEHGkvL6NqQJGrOVmCQ+HrO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726070564; c=relaxed/simple;
	bh=CiD5hifkfSG5Fk3ZwMnWP2C4/b515yIQMdp2KqZygAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dwG13PSdeH8H8Ckix+G+ucSErN5mVSqDTagn5TEvd5wC2/V4vOX+BrbthdZwVHMVZVGS6S9m/KDocl+Tebn7OK3oRC9JTL2W5n7m8bVqe/Z0/vZsDJlhefE97AXfREKhdxkP4dfdPsa0GTz4HK8DT96TLXMFy6ULOXXK2WxzekU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oO8TUy93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92166C4CEC5;
	Wed, 11 Sep 2024 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070563;
	bh=CiD5hifkfSG5Fk3ZwMnWP2C4/b515yIQMdp2KqZygAc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oO8TUy93S6eXG4cyKpEFT8MQ9/klM5g+3NbSo2dJ/JjBoQkoUR+7KlkJCsHvVvubA
	 /FUKNwbe0AWNOtaOxvVAuoD2TRMWMfTvv3m3t4+OaD46tuQsRxrGTu2eYQUnPqcqKE
	 HMxLiQ+Fp+urCygR43iUB9ma11APafxcCzafkUnYz6Exz+PgvSLsett8tG6HCzei0d
	 puDmtokLU/E2pQK4osLtu7Vo+HRBmGRCJ8oyrzhx67OWRKqiFHQe12SmUy9Xx+D2c6
	 Q9tEbUSomGxYwVJAZNxaZet1pUAQa4EwONCv12dmjXQX3vE7gdLNDzNuv0/FAn3/Fl
	 YIP+nu7HmgIUA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jens Reidel <adrian@travitia.xyz>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@mainlining.org
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
References: <20240826134920.55148-1-adrian@travitia.xyz>
Subject: Re: [PATCH 0/1] Add support for primary mi2s on SM8250
Message-Id: <172607056132.105227.11889587704269825553.b4-ty@kernel.org>
Date: Wed, 11 Sep 2024 17:02:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Mon, 26 Aug 2024 15:49:19 +0200, Jens Reidel wrote:
> This patch adds support for the primary mi2s interface on devices using SM8250
> audio drivers. Tested on SM7150 (xiaomi-davinci). SM7150 sound is close to
> SM8250 and we intend to use it as a fallback in the future.
> 
> To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> To: Liam Girdwood <lgirdwood@gmail.com>
> To: Mark Brown <broonie@kernel.org>
> To: Jaroslav Kysela <perex@perex.cz>
> To: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux@mainlining.org
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: enable primary mi2s
      commit: 851e3a2a4490b03bb8dd0cda1b8b2a78f6a92805

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


