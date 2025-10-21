Return-Path: <linux-arm-msm+bounces-78187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AFDBF6FF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9AEA4F03F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B69F33B94C;
	Tue, 21 Oct 2025 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqq3vw01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B52332B99A;
	Tue, 21 Oct 2025 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055836; cv=none; b=ILNNAut1tM4GmVjDRXP9RBjRcbj46zmyJRYPwknVxVviNf+zuPJir3R7w25qouxIDDen9IG73DTXGnJlvXnAUh5lL+bRqKMo02LjTRcH7F0yUXpxkUhpGrUgSipVPQoWozPH6Isd//nDTQHJJ63XGYcK4pIq6dmMdJkRBS6tH4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055836; c=relaxed/simple;
	bh=JRM2odY9VW0S4l+Z2OfO9X4SU0hKm51fzDYSn1D9qOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jCGUQtk1uBO6Xcfq6tnXyBh+w3KI4JZCdMRWEVe2gAixbJ2QaWQ8dVHwXzdbAhskk2CklQqAmYj9U7z5SeszZ08dB7spJKnu2PHEEoaNJ0CdHMGOHjtKOpksd2VmQqsPV+SnQORw7D45VrYBCim6dnmRwsjytpg72qqyu5UJW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqq3vw01; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8498CC4CEF1;
	Tue, 21 Oct 2025 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761055835;
	bh=JRM2odY9VW0S4l+Z2OfO9X4SU0hKm51fzDYSn1D9qOY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zqq3vw01LYZ7LCwbJr9YNGgmjgAgPqXAd3BF6WMCeNduXlbS0kgbPtAphmnurDtlc
	 vr6jYgHl3mTwWPsge18Mg4iNn+zuo6NH6eosBn/AAF16W4bjwx9aFzyyy3zxz6xdoh
	 +DofeyNNQG+fQhVorrJS754m20H34cSw784xKRmyBBaB5JkVRaPsg9Wy7X1MqyoUj/
	 qzCPTcYzM2CVUwalJVo7pJ52bZuarYWtv+kVm6xdJ4SL1xWLurhdf0/hswA5qjzp4l
	 VVA/KMFuCu4mTr5i6cW4qEboaEOQbzOk4K5hphwPMSZ6Qvsqez+Mzck4aYWz1cLp0m
	 Tri2lloucd8WA==
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <aPMyw_ryay9LA5SW@stanley.mountain>
References: <aPMyw_ryay9LA5SW@stanley.mountain>
Subject: Re: [PATCH next] ASoC: codecs: va-macro: Clean up on error path in
 probe()
Message-Id: <176105583329.178516.13846738418896857989.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 15:10:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Sat, 18 Oct 2025 09:25:07 +0300, Dan Carpenter wrote:
> Do some clean up before returning the error code.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: va-macro: Clean up on error path in probe()
      commit: 7e1906643a7374529af74b013bba35e4fa4e6ffc

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


