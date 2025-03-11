Return-Path: <linux-arm-msm+bounces-50967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C33A5C24A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 14:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97B853B2512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 13:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2D41D61A2;
	Tue, 11 Mar 2025 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBrVPGa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C3E1D5CFD;
	Tue, 11 Mar 2025 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699112; cv=none; b=MlcZp6VzwpujmEs9oEj+8TYU5fvo1mV/AvfYJE/q7IQL95Dwpn5etA3QaL1LwuPEqjSvN8ZdsPmNEQ+fiZflHf2HLH8+lT0dJU2BObtXfC5+/5x0V+dAzGt5Xwdl3gh+5i7vNxTL62Acy/1V/xCobRpTFkaZhyWxokaCjAzrmR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699112; c=relaxed/simple;
	bh=/I5RlmW0EfJvb1N8dfY3ZHu7xvDo7vLBrpYj+mGASwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZhZSPL9n1yPgfmAnYTIlxW/IB8TmL3BboXngcprrzc2qIF8S54wlP8/geilqW5U8sxjd9GLxwgoEL/L2DFZi7HMzT6nmK7Cp4N1Omp19cAEjlfzk7J09SZoFFglLbfQfVLg/Zv2X+Ya4QpsWt6LJLEfdnfd4q67y72ht27h6juE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBrVPGa/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182C2C4CEF1;
	Tue, 11 Mar 2025 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699111;
	bh=/I5RlmW0EfJvb1N8dfY3ZHu7xvDo7vLBrpYj+mGASwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBrVPGa/Yb5PSryC74SywhBVn8jQc7gzpAWDILPu6+BrxjReUDD9EbJimxZxBpBB2
	 A77R+Daj5+iWBunvmx/wTzEoZxZAbzhY8u7YgSuLKSwpGOM6GX0BJtmXB3rQqcN5wL
	 porq8HPv9xgoaSs2sr88CLI+BBQYSBZszUSP4uAbTxNRiDaE9eMXBeMKdyx/fVW1fj
	 opjUsNHYNKUaIACgSceADMg572Kbk+Kn5wciblkBNjhl6A8EyX9WgTsZwhoIr+FQVN
	 wCKA8Rj7XWguo//ohy5kEJ8xa9AS9URlRRn/xb4MIVbaGYFum6wQNRIE5CCImnB36U
	 7Pt41MZxAVDbw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250228161430.373961-1-alexey.klimov@linaro.org>
References: <20250228161430.373961-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sm8250: explicitly set format in
 sm8250_be_hw_params_fixup()
Message-Id: <174169910979.27942.7298008879440433248.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 13:18:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 28 Feb 2025 16:14:30 +0000, Alexey Klimov wrote:
> Setting format to s16le is required for compressed playback on compatible
> soundcards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
      commit: 89be3c15a58b2ccf31e969223c8ac93ca8932d81

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


