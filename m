Return-Path: <linux-arm-msm+bounces-77351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41154BDDDC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2BC5F4E2171
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C623831BC84;
	Wed, 15 Oct 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfPNMN2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BA31B83A;
	Wed, 15 Oct 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760521795; cv=none; b=bCnM+nhTqw1omdLx4W4Yc7yS8Tgi8WWo7alcrUWOPD7sdgNkYSm8R9qSuQdWypLWmReJD98PPhP8ZZoomZ/LUSs5LW+b0+f2lebWqs50557JSGArn6ZIIQ2KVavevbzXPAGUAW4oSp7rXdrvIqLDjOpfQ2aPSvEw5dcXYInFRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760521795; c=relaxed/simple;
	bh=OYMROCoZHnaqO33sOfdV6rng2d1cxkIwSoOiiT3CysM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lS90GSMdQaeH+uVsiv3uhWYrweYp/HaOW/RbmZGbzg/gwpIxiv/SUY0li919ObD43lQ3MZMIXvj9XGNhpxSy9G1VrHoxFaLhBjE9Pv7Of04BPo1RJAlxjLCXNA5EMzRSAnW3SWMmIzXI958S9qfzNkW8TwlMJMYr1x0h52w7PVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfPNMN2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD430C116C6;
	Wed, 15 Oct 2025 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760521795;
	bh=OYMROCoZHnaqO33sOfdV6rng2d1cxkIwSoOiiT3CysM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TfPNMN2A+laHEU3k6WAoHxQo9wZwhS7RHBFZZSf8NF0VGd9wWGEX2CyVkHAlOu0ri
	 HU9Ztb20QWjGKYc34aYl24/saulMqeRE5GUv2pql5lv+1NLP24aV/kxS8HfsVHulHg
	 R06yqKS9FSpBqDqiiB9C9QvkiM13tFXmPt9xkPGjzHD+QhkcfHteDHT4fb1LS3x1xg
	 qKGy6JeBt7CR+sLlzSwfabVXxOhLL2SuCHSQ5T6UFasXjfdCGvCzJgM2uVNC+S2SQ2
	 NxzmwQJvHeRd8vObMh/8yGFY/MzBStJ570C/1whki6rqOX+tavErZwGZyxY1expNvR
	 ieqVIdwy00qRA==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 TangBin <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
References: <20250930094103.2038-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: codecs: Fix the error of excessive semicolons
Message-Id: <176052179341.20166.15683915200114042850.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 10:49:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-96507

On Tue, 30 Sep 2025 17:41:03 +0800, TangBin wrote:
> Remove unnecessary semicolons in the function
> pm4125_codec_enable_adc and pm4125_micbias_control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix the error of excessive semicolons
      commit: 5e537031f322d55315cd384398b726a9a0748d47

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


