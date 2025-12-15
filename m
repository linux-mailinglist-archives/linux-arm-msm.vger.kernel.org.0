Return-Path: <linux-arm-msm+bounces-85257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F9ACBE2A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 15:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1987D303213B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8BE2F3C07;
	Mon, 15 Dec 2025 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Imau9M/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712DA2F39DD;
	Mon, 15 Dec 2025 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807107; cv=none; b=cVh+1+dunH9yR1UQVPA+QtHiKQPk+eSCuQaQ6L7ulYdMdM2kEbFygnn28WIEwE5hLqlsNw7RsW08yJ7LWwfskG50etpNKzB2mZn+RVjQjhiJuhA+BfdGWP3Hc8pcTGsoPc8AiZ3dtN8KCwlab1mG9uq4gjPMjUOXx3AQl/ZHNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807107; c=relaxed/simple;
	bh=6bmglP9RmOdGhk5B5obusc/nrNoyASh/6Kg1YIXr2CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g9WNIvSBaNuqPJBDE1XThAZ63hJqwXYMBPWqjtZ1AFiATHH+PLz96OKFq70Cv4sknoNF3Ufu93iGfgf0mXexpEW+73JKSPA+U03DaoYeSMuyFFhDRlo/l/fzt0Bx3yISJ3h8X+LylExSVs2WoaaOH0PF2Z/zVe7gRjP+oVBAmD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Imau9M/g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C8AC16AAE;
	Mon, 15 Dec 2025 13:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765807107;
	bh=6bmglP9RmOdGhk5B5obusc/nrNoyASh/6Kg1YIXr2CU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Imau9M/gu1nE9yCkQ4XBG2+glEOooCbylJVOr8orL2pRKXO7wK2mSF7FfPavOKlg9
	 fp9PXTuaa2Y4vmojYhheyxpsXAeZh4J3kY3vVrfotjnMl0GDbZv5tlBG2tQKLgFzB6
	 zhj6l3rEVbuN5rpx89zIAYBy6yLGIBYLy+wffHKTIGOW6+B1DuGKNbPLKTzDBhtREw
	 4MA5ntERwwdqkfojVCyNGxQzoN+UUUCcFtFpuxTExqQEasuEyNt9neuorKmLMo08BO
	 oGQOamYJ+Qp2oB/qX2bK8tgqkXzLt/w+Y/ZWwxMvNbBaSdy+/6K+AH56c5FV38qOp6
	 9oFcn9pxkJWCw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] ASoC: qcom: Fix confusing cleanup.h
Message-Id: <176580710495.161056.18321549435251092606.b4-ty@kernel.org>
Date: Mon, 15 Dec 2025 22:58:24 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sat, 29 Nov 2025 14:17:52 +0100, Krzysztof Kozlowski wrote:
> Please, please stop ending cleanup.h patches for very simple code like:
> 
>   foo = kzalloc();
>   kfree(foo);
>   return;
> 
> ... *if you do not intend to read cleanup.h*. These changes are making
> simple code not necessarily simpler. But worse, if you do not read
> cleanup.h then you introduce actually undesired, error-prone and wrong
> style of having constructors with redundant values (= NULL).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: qcom: q6prm: Fix confusing cleanup.h syntax
      commit: bd9e7182e36169cd7e1ea3b25b5c82b1c5698e64
[2/6] ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
      commit: c862dc9019f517893eb83096076d7eed4ecbb372
[3/6] ASoC: qcom: q6apm: Fix confusing cleanup.h syntax
      commit: 310e6f95eedaae04990072078adbb38beb149811
[4/6] ASoC: qcom: q6afe: Fix confusing cleanup.h syntax
      commit: 3c84bfa47ff29ec0c202cb139d365421c6778d65
[5/6] ASoC: qcom: audioreach: Fix confusing cleanup.h syntax
      commit: 0e6071d656fb284e003a45ce158831d4d12aac5a
[6/6] ASoC: qcom: Minor readability improve with new lines
      commit: 0bb160c92ad400c692984763996b758458adea17

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


