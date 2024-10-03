Return-Path: <linux-arm-msm+bounces-33020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA098F183
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28E5028248F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 14:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6669F19B5A3;
	Thu,  3 Oct 2024 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELXU7+SB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BB91E515;
	Thu,  3 Oct 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966062; cv=none; b=YSeXR2eSiNWrfzQzo4Qeik15O9XLEm+kCcR6RPIAl1geha1pzuvZS1s8EShMJW3ncu1dZsjfokjQbQY+BoE+jDGqHT2nX5DfOxjP7eX20MZvNNb6XtnUDBvYEsHTD1BhW9H3UCTzxCxPeeTcD7MlZ3kEXl/V5JsU/eLodUen6zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966062; c=relaxed/simple;
	bh=nnPP8bWPDyT8v9Qdnjq4i8N7ZoiPh70nuxYZUnnynwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m8YHXFJ1xWQJcrse66fzEAD9mm4J7z251hExoburXcikeIcFJVKrM/nZWrHIYvQKC6OpfGPgVj4ObnT011URR/+CryAgJ6GGGA0jA6/J5g5ddCflb8NQUn4O/bbk8yCi7ulKniX4Wpwv4SYjYmqbwLwWXJ3NO739YArYNJDvGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELXU7+SB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0243FC4CEC5;
	Thu,  3 Oct 2024 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727966061;
	bh=nnPP8bWPDyT8v9Qdnjq4i8N7ZoiPh70nuxYZUnnynwE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ELXU7+SBjMYGEban/p/w0N/aEX8UOeiARoBC1YJXJHmGCn8sdBPBE9ykH8ADKOfW5
	 VPMiI4iDJmcLk7RvNG7Hk9cQUBPIk+VwRYcG8+7mXlt49Hg3oWqC5GDK3QuH2Subu9
	 vnIJP9nhTRpXG97J3tMz4vftfUf2DIILt4x7Xw+VcoueGTvJC2uAroPUfRiZWC+vcv
	 JsNB4+7sOZvwflnmXzx/DynAA0Ho3KzDjpO7qR0N+20dEYZajqkIJ8QnlHcRZzsryI
	 zEbKgAB90WjT6jahRK2cWX2GWCxJ0vE2/iSUey/8vbL2DSr4o2twdh7FED+43YJZ2c
	 dCq03J0R3H79g==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20241002151436.43684-1-masahiroy@kernel.org>
References: <20241002151436.43684-1-masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd9335: remove unnecessary
 MODULE_ALIAS()
Message-Id: <172796605971.115923.16568830906477882779.b4-ty@kernel.org>
Date: Thu, 03 Oct 2024 15:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8

On Thu, 03 Oct 2024 00:14:34 +0900, Masahiro Yamada wrote:
> Since commit b4b818305578 ("slimbus: generate MODULE_ALIAS() from
> MODULE_DEVICE_TABLE()"), modpost automatically generates MODULE_ALIAS()
> from MODULE_DEVICE_TABLE(slim, ).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd9335: remove unnecessary MODULE_ALIAS()
      commit: 6061483d7141db3a805f8660eae23805af02d544

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


