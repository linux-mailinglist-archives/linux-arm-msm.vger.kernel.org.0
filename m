Return-Path: <linux-arm-msm+bounces-49322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940EA4443B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B232B3AC247
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 15:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A03B26BD80;
	Tue, 25 Feb 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DdulrPYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237EC1FBEAE;
	Tue, 25 Feb 2025 15:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740497008; cv=none; b=ZjSDmn/3LJ+1ND3RxzaCdpnUUZGbZcH/tI966fg0OJZRZhaW4mfEw7dDEntz482OZtIXaohl4xQxO0tWb0BIyAXLvs+218lFMwb3jrUoghR4r+PIhWId23E23r0JKRSFMnqnPjna/YkYqh0FunpQv4GkSdVrIrzyNwZXMfL5Kz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740497008; c=relaxed/simple;
	bh=+afvHQcPpEDdsffOzlrEAUhpoQQo9ExNXkrAwMiFtzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ulT1ldZcG50vtTz2sYOjkUDvkpMUQtgZVGsjx+NYYqsLZA6pmTL3YoslEVfV1DZ6z4LAi8Zb8iSTIbW5QFWYByz+yo/TQWRjbptfQXlPgkEGCo5NAiNNmAU7u8+3kv8RtT9sHGbwW6OVmUK4W29GRp8LL9dHj8dyrWavpWgT2Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DdulrPYi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2286C4CEE8;
	Tue, 25 Feb 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740497007;
	bh=+afvHQcPpEDdsffOzlrEAUhpoQQo9ExNXkrAwMiFtzY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DdulrPYiO4NYI2Abum2GXf2vOdqF24uZiIF52zev0BRIecEoAg5xjww/v6PHDjlyC
	 D736Y3k0lt7oxBL75mEeOvWrnUMnIDn/5UXAgd9h7R7MX4ikVK6J1KYqAC4M0gQYdD
	 CVjikHSFWsU0ikYqyt8r9JhlGPu4kPHUCL1WbXj+DEWz2vyQdC/ZaQ2vd99Chl9cBy
	 lrG0Ih3n5pSvKmpN/6R/1drlFLNMjhPrvqbi8kX8+bpHQ7zsk+cllBlild0PEDlO6a
	 dC5A8csJ4M+yAsGTAoycII5YbWGjBrokf0BNPQRk49ROpzJp6gX1oOfvqSEnGO9qfE
	 P2Xvjs7vgachA==
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
References: <20250222-q6apm-kcalloc-v1-1-6f09dae6c31c@ethancedwards.com>
Subject: Re: [PATCH] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc()
 in q6apm_map_memory_regions()
Message-Id: <174049700536.77394.10930423942125840620.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 15:23:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Sat, 22 Feb 2025 14:55:20 -0500, Ethan Carter Edwards wrote:
> We are trying to get rid of all multiplications from allocation
> functions to prevent integer overflows[1]. Here the multiplication is
> obviously safe, but using kcalloc() is more appropriate and improves
> readability. This patch has no effect on runtime behavior.
> 
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6dsp: q6apm: replace kzalloc() with kcalloc() in q6apm_map_memory_regions()
      commit: 63d93f4d0f38fbb95a55729fbd2cc4920743931c

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


