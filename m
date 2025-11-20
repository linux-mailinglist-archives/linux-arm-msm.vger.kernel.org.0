Return-Path: <linux-arm-msm+bounces-82645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BCBC73444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CB6C04EC107
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B482B31AF10;
	Thu, 20 Nov 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2M7sCq0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737523126B0;
	Thu, 20 Nov 2025 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631620; cv=none; b=jJKt9a2oJVkzIV+yTrCJKKFZ9mvo1mhcysGgeGnhxisiy9H7gZ1h1UGBw9hdkfmbiyPSuF4mE2FfHY7KN/DapUeNb9MLQ52vIlC/sNbffvb8X/YQGfmiNIvID0JzjvDShO1tjvhLUvckiQ720y9WgPf9uNoAdqibY1y5LoIQOZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631620; c=relaxed/simple;
	bh=XfQswiTVWSyi5w2NUxFcWVIZ/qG15qo2KsoHEKzFk1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FUAt12fO1XCL1FKETPqAM0lnzRoaY9FRkJvhrGiuRSewFC7OgkJWdBNhXbaB1ou3r3Gh2i7BJvrEG4OLK5txEisX0MVgCQt6lt4spUqhAsLk/k2GgpdFbNAw20/9nWSstJEnOuN5VqXl29Ff1fMjP1njyaqyQ8oAbO8gGmC4KRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2M7sCq0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05EAC4CEF1;
	Thu, 20 Nov 2025 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763631620;
	bh=XfQswiTVWSyi5w2NUxFcWVIZ/qG15qo2KsoHEKzFk1w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r2M7sCq0lqBNGZb8iBGuRTW6I66mR7pviiLGKiL2YmMndmxGx0Inx0bjR+ciYIJ8g
	 dszLNFcSEWZOteHCc83Ou5W4o60ZKAlh5Nybl42ycB6o7JLxV9E0nzETNULbIAzLh4
	 rC/ZhYSuKMJGj9G9eVRfHKfwpprbTd+i7ojGpQ4uRZ97fTuOoiVAGdlI/ooLHlee0G
	 EDKvmEKC/9CwvVwc+RDQQ5TN2erPHXs6U9Hkb83MtV5TDW+cVLk/8rsd+3f4eHGQks
	 xfIRBQZdlX152dz0pP0sj+CK0BAkcMmfaZ1i5TXEdgjkiPkT+58U/L7MjRCFcHBPdz
	 Mvnuqp3ZPMUyA==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 alexey.klimov@linaro.org, Ma Ke <make24@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
 stable@vger.kernel.org
In-Reply-To: <20251116033716.29369-1-make24@iscas.ac.cn>
References: <20251116033716.29369-1-make24@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: Fix error handling in pm4125 audio codec
 driver
Message-Id: <176363161689.559933.14528225856640173736.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 09:40:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a6db3

On Sun, 16 Nov 2025 11:37:16 +0800, Ma Ke wrote:
> pm4125_bind() acquires references through pm4125_sdw_device_get() but
> fails to release them in error paths and during normal unbind
> operations. This could result in reference count leaks, preventing
> proper cleanup and potentially causing resource exhaustion over
> multiple bind/unbind cycles.
> 
> Calling path: pm4125_sdw_device_get() -> bus_find_device_by_of_node()
> -> bus_find_device() -> get_device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix error handling in pm4125 audio codec driver
      commit: 2196e8172bee2002e9baaa0d02b2f9f2dd213949

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


