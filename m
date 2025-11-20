Return-Path: <linux-arm-msm+bounces-82644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F80C733A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 2DDEE2C19B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654FD2DAFBA;
	Thu, 20 Nov 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKfF73rS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287A2D5C74;
	Thu, 20 Nov 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631617; cv=none; b=AVOWWbqZRivhRR1b0S0q7hh2gtX9TqPWnKrCicKF1fzk3NymvS6n5b5ZKyaTIzAkZGDO6GKsFV1Vl9NvCAUztDN6EIzM+Wavs8jDZoXGOsUmiffMg7fjvQCKF3Yyvq/HErR8lUZIMFXV+dzCB5SrypkoOu16oacYLkibv7v/S2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631617; c=relaxed/simple;
	bh=mle9micMgPxJOYqTNBN4UC+hRCO+Vzu7gBsiog5Faoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KK4p7oJRZLOmn1Xfs+DfeGRTJ6BeUYukWPy3Jw/uy0kRyfeA4zaQ9nifYPDXY0ME0uVE6Q50UZrcr3GOc9j/TYXwTdGZPVAqRFejE9AxLRzQz6uqthcOpdGyCM7bcdxFhwiNgDO60TDYJlKPwjDdW8Wb2zeh0rr5bleDwdgwLus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKfF73rS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D03C4CEF1;
	Thu, 20 Nov 2025 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631615;
	bh=mle9micMgPxJOYqTNBN4UC+hRCO+Vzu7gBsiog5Faoo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TKfF73rSBNgHoMee5iQkCIluPrrhedniU6I+iQdFJC1eifDZLhiNaFR53AaKaJHbY
	 CB8XAnQ/IXKY85f9LMIYxoeuAEAmqyBBFvPnIbO0FCvGAT4YojsxO3IDKWE2DCwWm5
	 0Iu4Pya6NHd2wRFBpYYfDzLZFDjDH1hRzVL4qjyRG6BeZe/bvMXBObz2fxVnAjonHD
	 CWePOQo5L0sG4G+9ssuNZ6np3/Fs6k7JDHWDQWuVCjSu1ySkqNcyKfTiAlKWFx0m9B
	 jnSJJlpxGeHUI3AVyzoCGz9QS+A6T713XsuxXgwhLptzQky5GbrFcace8OM6702Kab
	 5EE2INF8JSKgw==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 dmitry.baryshkov@oss.qualcomm.com, Ma Ke <make24@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 stable@vger.kernel.org
In-Reply-To: <20251116061623.11830-1-make24@iscas.ac.cn>
References: <20251116061623.11830-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: wcd937x: Fix error handling in wcd937x
 codec driver
Message-Id: <176363161218.559933.9857333808970075663.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:12 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Sun, 16 Nov 2025 14:16:23 +0800, Ma Ke wrote:
> In wcd937x_bind(), the driver calls of_sdw_find_device_by_node() to
> obtain references to RX and TX SoundWire devices, which increment the
> device reference counts. However, the corresponding put_device() are
> missing in both the error paths and the normal unbind path in
> wcd937x_unbind().
> 
> Add proper error handling with put_device() calls in all error paths
> of wcd937x_bind() and ensure devices are released in wcd937x_unbind().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd937x: Fix error handling in wcd937x codec driver
      commit: 578ccfe344c5f421c2c6343b872995b397ffd3ff

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


