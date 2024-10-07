Return-Path: <linux-arm-msm+bounces-33417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C925993292
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 18:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FD61F23A17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9269C1DA61E;
	Mon,  7 Oct 2024 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXKwUn+2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4A1DA0ED;
	Mon,  7 Oct 2024 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317323; cv=none; b=bmqdz0mD5wOOxbAj0PZoRY4sudDE0lFUAg5GKytByFyz1/olgG7IhQfYznGGkoy4+36mGEQK+BBlpi64npKNFZ07w30QaLzuk1Orsts/CffXlPVl9qliSmLYGhqfpZb1tdEywF5TB8tbe4qd2LGSQ0SMpDft1sCj8s1srgpd6kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317323; c=relaxed/simple;
	bh=mUuo6txmIEDR3eT02qMPxRUkQ3pSgtSh8zOcBTnydIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JklTRWpkNOGIEpio8mLhwLTXjdwg68SWPPXAwwdzJidHe8JPNqHcwSeDGjJ5bO5TLritPZNymT+CQyPd1blbJg5KPhZ7TS1mpTCmHy008OTSvP1jTssxKf5S54yP8UvoaFJ07av1EFeuEGRN5YHYdrviJHUytjz5KVYPcYcZWjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXKwUn+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F41E5C4CECF;
	Mon,  7 Oct 2024 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728317323;
	bh=mUuo6txmIEDR3eT02qMPxRUkQ3pSgtSh8zOcBTnydIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lXKwUn+2eA5vK7xBDkdcvVubwbOLgLpDLu0LodP6iOoJI1B5v8YeEzP5rFHZ7L+5j
	 NgmUDFi6/9MnViCLgB8Ezru8PzldP8u8RzwzLMNSU0poBI6W+PE9LnqvXWQ4CsOhQh
	 LnFmSYqnY7oDQxLdYPMnLCXp8FaDGs5SVdpqhGZUnMOCZYdaMqFD77oZ0A10bH9agv
	 XOr3RbntTzdsmLVVmjiusqEEdLsbtz0I2AiP7bnynJ5L8bln1Ucs+F0BkYdTQoULqK
	 93/9yOU+W8S9OXFVYidxmoyNZnjz75RE0dTX4VfvIF6A378K8ztNp/CsQA1Wg3Z7FH
	 xrXB7oichItHA==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Gax-c <zichenxie0106@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, zzjas98@gmail.com, chenyuan0y@gmail.com
In-Reply-To: <20241006205737.8829-1-zichenxie0106@gmail.com>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-Id: <172831732069.2397838.4870703241089364783.b4-ty@kernel.org>
Date: Mon, 07 Oct 2024 17:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Sun, 06 Oct 2024 15:57:37 -0500, Gax-c wrote:
> A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
> possibly return NULL pointer. NULL Pointer Dereference may be
> triggerred without addtional check.
> Add a NULL check for the returned pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
      commit: 49da1463c9e3d2082276c3e0e2a8b65a88711cd2

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


