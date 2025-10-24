Return-Path: <linux-arm-msm+bounces-78721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC4C0592E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96023B3180
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 10:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBD130FC24;
	Fri, 24 Oct 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDKhpq/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E65930F934;
	Fri, 24 Oct 2025 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301525; cv=none; b=cA473g6xuMK8XUWNVVnE/k7j3+mIkGSqQybnTXUeUAXsIWD6Z/hocwjCiGug6naUh9ZViNQYj8l815lZSOSzTwWydLXxaA0TeR9JqsrwbxYAYczaAVq3A5zETOmkeguSi501Ou8CxepTGZ0/LogwJ2J4zWgtN78wK8jANV3MyJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301525; c=relaxed/simple;
	bh=SpLZn7BSv4Vw3pFCms90Qtx52dcb5B/g42/myX03T7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J4GWWet2cKoep2Wl/Q1UymywWY8CPK8FDqxlCzK+TR8jcc7859ZtrPOHDri3RK0bGrbHo9fHaa/oEBdphoSHAxj1mnLM1tBqXSyhPBtOYIOFa3kn4OQ4Aft7Y4cGdHXDGbCVTrMbLdCW4ckJxnhnUNicFrJMuAjZMhx29nebx1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDKhpq/W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BD3C4CEF1;
	Fri, 24 Oct 2025 10:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301525;
	bh=SpLZn7BSv4Vw3pFCms90Qtx52dcb5B/g42/myX03T7w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eDKhpq/Wujx7wo/wzDNrOp6rQ1OF933VW2NQJ9FoRNO6AF/Hc9Y6VMq8TbtZYI0hZ
	 7n1Xg0gW4rOGSc9KDcP7ZViXFjOONGvsNnzmU+D/L+Ccq29fyqOolFTWwaZMTP8y5a
	 bLF4FayRHyKwsYT7J/gpMnRo4KMIVKo2vXin7DwrKFdHJ9oyd/DYshop1Eq2fuOJ11
	 ybGNTIYw78Cdpz1dWTRq2WtrjslFA5ecpdd3d6327Oo8/362bWsAYcy/OekdQe5kdA
	 4W7hyBYLYlPMwnrkqnkTKFEYXojlS3i41POsstov9Lm31h6RMeF5IRidtwNXZ9HDYj
	 HtsvyEQnhTyYg==
From: Mark Brown <broonie@kernel.org>
To: gregkh@linuxfoundation.org, srini@kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: rafael@kernel.org, dakr@kernel.org, make24@iscas.ac.cn, steev@kali.org, 
 dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 abel.vesa@linaro.org, stable@vger.kernel.org
In-Reply-To: <20251022201013.1740211-1-alexey.klimov@linaro.org>
References: <20251022201013.1740211-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH v2] regmap: slimbus: fix bus_context pointer in regmap
 init calls
Message-Id: <176130152229.12682.10943579014725901124.b4-ty@kernel.org>
Date: Fri, 24 Oct 2025 11:25:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 22 Oct 2025 21:10:12 +0100, Alexey Klimov wrote:
> Commit 4e65bda8273c ("ASoC: wcd934x: fix error handling in
> wcd934x_codec_parse_data()") revealed the problem in the slimbus regmap.
> That commit breaks audio playback, for instance, on sdm845 Thundercomm
> Dragonboard 845c board:
> 
>  Unable to handle kernel paging request at virtual address ffff8000847cbad4
>  ...
>  CPU: 5 UID: 0 PID: 776 Comm: aplay Not tainted 6.18.0-rc1-00028-g7ea30958b305 #11 PREEMPT
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  ...
>  Call trace:
>   slim_xfer_msg+0x24/0x1ac [slimbus] (P)
>   slim_read+0x48/0x74 [slimbus]
>   regmap_slimbus_read+0x18/0x24 [regmap_slimbus]
>   _regmap_raw_read+0xe8/0x174
>   _regmap_bus_read+0x44/0x80
>   _regmap_read+0x60/0xd8
>   _regmap_update_bits+0xf4/0x140
>   _regmap_select_page+0xa8/0x124
>   _regmap_raw_write_impl+0x3b8/0x65c
>   _regmap_bus_raw_write+0x60/0x80
>   _regmap_write+0x58/0xc0
>   regmap_write+0x4c/0x80
>   wcd934x_hw_params+0x494/0x8b8 [snd_soc_wcd934x]
>   snd_soc_dai_hw_params+0x3c/0x7c [snd_soc_core]
>   __soc_pcm_hw_params+0x22c/0x634 [snd_soc_core]
>   dpcm_be_dai_hw_params+0x1d4/0x38c [snd_soc_core]
>   dpcm_fe_dai_hw_params+0x9c/0x17c [snd_soc_core]
>   snd_pcm_hw_params+0x124/0x464 [snd_pcm]
>   snd_pcm_common_ioctl+0x110c/0x1820 [snd_pcm]
>   snd_pcm_ioctl+0x34/0x4c [snd_pcm]
>   __arm64_sys_ioctl+0xac/0x104
>   invoke_syscall+0x48/0x104
>   el0_svc_common.constprop.0+0x40/0xe0
>   do_el0_svc+0x1c/0x28
>   el0_svc+0x34/0xec
>   el0t_64_sync_handler+0xa0/0xf0
>   el0t_64_sync+0x198/0x19c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: slimbus: fix bus_context pointer in regmap init calls
      commit: 434f7349a1f00618a620b316f091bd13a12bc8d2

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


