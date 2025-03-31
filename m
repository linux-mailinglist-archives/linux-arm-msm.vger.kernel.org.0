Return-Path: <linux-arm-msm+bounces-52888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8662A76CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 20:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34AA16557A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 18:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983CA214A81;
	Mon, 31 Mar 2025 18:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WayCWVAx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F491E8337;
	Mon, 31 Mar 2025 18:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445411; cv=none; b=ZeK/RbNXeYgFSk7zSGny+yeiSBd4qSkwosIDGXO7X126jN9AX/HTP6V4jCJRSMZVsLY79MJaFT5A2kS7Qq5XRABrz5PEMHlD/eEFov5zxhLgaKtXDFEDYvtnp2bppXZXUkAaInuPZmEaICnTjmJ71TkeGw1pYGmFfinQNuqgnTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445411; c=relaxed/simple;
	bh=L1e3qp2TrMMmW2/yyUo2BhZEpkokq1ICKclytliROm0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JPVgAJAuQla3t5a+KjSPPxW6J2prjPMVm0EZiAaEKBjp+T+bQdFP3Vf5SklelpT+2kEsbq/JzqCUJU6Zbz+pfNnzyUlJzK2R9CnJwZMg1rpyGT66RRH2CW+KDebgVcx8aWHS3rlEFR4Mc9nKFVornFofxu2+fKKsIAaB5Ul35UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WayCWVAx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DD8C4CEE3;
	Mon, 31 Mar 2025 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743445410;
	bh=L1e3qp2TrMMmW2/yyUo2BhZEpkokq1ICKclytliROm0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WayCWVAxNR6Bo/rxK9ykqVvuk4zGixPqTW6fCBwE9B3qpxjauRWYeMu31MB3yxdGd
	 gAOZwfvqFFZVYzsoAx4ZK2VtMQ4o1bxJympLsZFvi9msbxjz3Tnq20xL02142vAqKu
	 0MzYiuynyvlLWQdZBBhgJDee/nT9hOFzXCNe+sKudbfq/UWdSkMngrzaWsG24h12uv
	 LfjvxO+6Wc5+lhw8i6+BHgaiJOd15t29T97pEL6v9KftADaJI5dUPqAQNZSMSQjAo0
	 6LC0v6xcPitOqtMNzjRNVchW6poq9HWj6kbA7vhHEObNEh1eCDfti3nVUVBsFjWJ4r
	 hQxZKsELhahzg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.kozlowski@linaro.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 johan+linaro@kernel.org
In-Reply-To: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
References: <20250314174800.10142-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 0/5] ASoC: q6apm: fix under runs and fragment sizes
Message-Id: <174344540887.168242.14373975206597931512.b4-ty@kernel.org>
Date: Mon, 31 Mar 2025 19:23:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 14 Mar 2025 17:47:55 +0000, srinivas.kandagatla@linaro.org wrote:
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see significant Audio quality improvements.
> I have few more patches to optimize the dsp drivers, but for now am
> keeping this series simple to address the underruns and overruns issues
> noticed in pipewire setup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
      commit: 3d4a4411aa8bbc3653ff22a1ff0432eb93d22ae0
[2/5] ASoC: q6apm: add q6apm_get_hw_pointer helper
      commit: 0badb5432fd525a00db5630c459b635e9d47f445
[3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
      commit: a93dad6f4e6a04a5943f6ee5686585f24abf7063
[4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
      commit: 3107019501842c27334554ba9d6583b1f200f61f
[5/5] ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
      commit: 5d01ed9b9939b4c726be74db291a982bc984c584

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


