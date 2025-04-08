Return-Path: <linux-arm-msm+bounces-53534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9268FA80A73
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39DE502BBA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4986127F4D3;
	Tue,  8 Apr 2025 12:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6VXO/4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2042527F4CF;
	Tue,  8 Apr 2025 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116549; cv=none; b=D7wyk663BlQKHaU63LZl1Bv06hLautCQyuQRfml14+xh4vP5DY0iXNf9y1KyZjqAwB0zQ0JlJgDs+XRE4GDV4+TmC6XUxLNhwXS++O+NmpeIRAojyHNJLhY4gROtekfSU3t6ajeNh/BXES4IraqQaoMRYLBJ3enTdvyCFzUiII4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116549; c=relaxed/simple;
	bh=RkXCgoOYqGGopnCxeQ2m4GZy+271zE5MeObqtQVh0v0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tx8qNrJzhGYkeIgWzB4S1SdWg1KRbCFQ3t0qp/M13gSzh/EtiI15oeywaOoMnd3LR1p7ATWcfl7lFV5ddtOzFgcwJb3c5qHXVh769TvXvHNM1c8P35rqyeSukfuTIrw+oo8ZewAOwpmdal0ocx57aol1VGzoQn+y1e7QR/sjPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6VXO/4k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E27EC4CEE5;
	Tue,  8 Apr 2025 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116548;
	bh=RkXCgoOYqGGopnCxeQ2m4GZy+271zE5MeObqtQVh0v0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S6VXO/4kmE3ZCFfhbNv6x+JgtP/uPKEwb+t4e809fUxsYa2T96j2ko/+TbeqJJVn+
	 NGLbkKg5FHvRLJrHNzc+eDYLhn5ICvO1RxBChbJTBd4tXKKfc+E3VieeYutghqU/nz
	 ZJC+dpSoWhQhtLmX6TPil1nHcNfIPgAkOyGLTP+QjO/36U+guVd2avmwcd+ZXMfD9/
	 t7Cesxx0ZdSUvQl68b1imHXuG4SOgdXYlAdC/ionSKcl8cxMcZCI2+HZUxpTK37/k8
	 KnnnkXt9ojYkOlI1ykSieeFe9NBoR6s2fIhNdwohzeGH7zMe/Ad92SqJcisLvliwCC
	 sPZ4GToi33Ofw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dmitry.baryshkov@oss.qualcomm.com
In-Reply-To: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
References: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/2] ASoC: codecs: lpass-wsa: fix VI capture setup.
Message-Id: <174411654699.2091760.15639460218296803576.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 03 Apr 2025 13:42:45 +0100, srinivas.kandagatla@linaro.org wrote:
> This two patches fixes below two issues with the VI setup.
> 
> 1. Only one channel gets enabled on VI feedback patch instead of two
> channels
> 2. recording rate is hardcoded to 8K instead dyamically setting it up.
> 
> Both of these issues are fixed in these patches.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
      commit: d7bff1415e85b889dc8908be6aedba8807ae5e37
[2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
      commit: 7648beb65600220996ebb2da207610b1ff9b735e

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


