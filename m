Return-Path: <linux-arm-msm+bounces-28404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF498950836
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 16:53:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF67E1C20B41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D0E19E81D;
	Tue, 13 Aug 2024 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn6iQWG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960818B499;
	Tue, 13 Aug 2024 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723560776; cv=none; b=YRnssjL9ohp0yAjxGIgkoRhjoke+vImJKehvC9Aik3yzyeV4/Zy8iG0eXzSAv/5Hl0LSHHund4Llrfz9Xnra5hdwaGa0a5yYFUxbUF6e0KLXxXs+1Oc3cCbEYx+Mu5iQT1R1/ZYT8Zc4rlBdmroRp36fntKNz66WZQ4rPMA5jY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723560776; c=relaxed/simple;
	bh=ksXyluLLYgdlqdn91WjgN2vBXtQGAqRyYBlq8qUlv20=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fYEgJWTZcnmFv0q7k+7kSpbRXbsUJ4bT5pBs+1fnaiUXvjIWkHZshodvm4riMy1s5xey9o1FCKmIh1aGuf7muHnGIPaZ2HIZ01iJpWehJpbd4s7xUtYlzsF77Opfze5Ek9jN0vJXRfdnFIZwrjb3j6tCCqGe8i1P9VqRaJ7M6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn6iQWG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB58C4AF0B;
	Tue, 13 Aug 2024 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723560775;
	bh=ksXyluLLYgdlqdn91WjgN2vBXtQGAqRyYBlq8qUlv20=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Pn6iQWG60deVyCYZm963Lp2xMpbZeR0kPmWcgWKo7LfxYQ+CWxjtt+/16wdtKNCad
	 COyvaaCQeDaBBaoUwAQGsGiPIJBAaYMsbYxXDBnn4k+I25PprHtaYNcUirOeZzbjxD
	 YEoNOtrCLyNsm/6qGuYcVZ5DxJWp5NBpa79dR8FUS1eL/ALQ9CQtgTTViGLwcCRxrl
	 Rsm+Zm+uXXQJvTPbKipzzvGc7xkUFn9LDbgWY0tAKFvYUjOW3wTpDLOKlETIvVpaCl
	 3x8Mq3v+72TsvOo0sjiCLyjEhhd4Th9qWyOnG2MNT8n7v0HMmK479ltVBVFDj8g1NU
	 KQ7Lpp6kLVfJw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
References: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm
 sound drivers
Message-Id: <172356077381.62411.63886383103399038.b4-ty@kernel.org>
Date: Tue, 13 Aug 2024 15:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 30 Jul 2024 12:35:11 +0200, Krzysztof Kozlowski wrote:
> There was no active maintenance from Banajit Goswami - last email is
> from 2019 - so make obvious that Qualcomm sound drivers are maintained
> by only one person.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm sound drivers
      commit: b919a27fab37e108164d657ac6e77bf870bf95e6

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


