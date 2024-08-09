Return-Path: <linux-arm-msm+bounces-28218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 127FC94CB78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 09:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 239FBB23B01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 07:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8082178370;
	Fri,  9 Aug 2024 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEFpYwQv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C400178367;
	Fri,  9 Aug 2024 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723188837; cv=none; b=R1ptmj+bH/P/QU+c1ZjxuBZKuIGMHfzrrAvsMA+M4K0afYRaIGTjGA8HytauxPzYg5JSjhvaCDdQ4dY0qwRchginrry/cyB3+BQbqAy/mUjfhhvO2IrzkQEWVFgNKkIU4Wiv9e1QXQnOI1Q3t1hD9YPW21VZPZPVe3w+i1jskhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723188837; c=relaxed/simple;
	bh=MKkruNKNh4Cg9ReIgGScwKqxFuJeRLtS5G6RkOok3Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jMsYcVNg/uMW9s7FvM6T/rHJ+jLfeiZlTcP+TZEyacgyU0hix3Zx31KYqPeAiJUttugiL/iA41aTiKYOW9xoAYHrwio7R/t9cL4oHta3jF/l6MKgOAVRqrLiMnRCpTBXP4fW68mmR8GN0yubDHDQ2ka6+67rj7hRPmCUi9vpDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEFpYwQv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE99EC4AF17;
	Fri,  9 Aug 2024 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723188837;
	bh=MKkruNKNh4Cg9ReIgGScwKqxFuJeRLtS5G6RkOok3Fw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEFpYwQvYQ1L0WYxxq/s7qQXEI3q25gBMZFmlCKbsg281NUSyb15H0qlzisr/Ibz2
	 s2TWdXvOIrkwrMEafegpg1b1d7ogihi3hbJgV+bSQ6BD2MLUAk4EFRw9UJ310umgZ5
	 /ZLBHNOA4huDgkWcPCk6gHKLe3gq6+ojGJO/KcW3YVZZ1J5geYaLebAMiY5gfmcxuP
	 7s9dB1VNxnamt1sWz7fonCis3KAj1mLPn7hbDKLy+VlaSaPbh9jgbva+MhRe8Pyyoa
	 Xkxdvbnq61eeVmG8jrZpQf/NFYJ2shUuVjpJi9q1K4+UHNfWHXHNzlKPTrBDYgJbOS
	 SJlzuCTObHwfA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
References: <20240803-codec-version-v1-0-bc29baa5e417@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: warn on unknown codec version
Message-Id: <172318883316.484675.7690867442520809785.b4-ty@kernel.org>
Date: Fri, 09 Aug 2024 08:33:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Sat, 03 Aug 2024 13:41:39 +0300, Dmitry Baryshkov wrote:
> While debugging broken audio issues on some of Qualcomm platforms I
> stumbled upon the kernel not providing the actual error information.
> It prints an error from the wsa_macro driver, but the actual issue is in
> the VA macro driver. Add error message to point to the actual error
> location.
> 
> va_macro 3370000.codec: Unknown VA Codec version, ID: 00 / 0f / 00
> wsa_macro 3240000.codec: Unsupported Codec version (0)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-macro: fix version strings returned for 1.x codecs
      commit: 49f6202ce991742f451fc724f03d0c17460d06cd
[2/2] ASoC: codecs: lpass-va-macro: warn on unknown version
      commit: a9a7a2d80790d06cd32c535e2e7b10f72ce592e7

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


