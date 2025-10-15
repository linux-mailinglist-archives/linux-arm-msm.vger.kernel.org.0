Return-Path: <linux-arm-msm+bounces-77459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4041FBE0468
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A72FB5057E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF3030216B;
	Wed, 15 Oct 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwERAraI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6303254A0;
	Wed, 15 Oct 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760554373; cv=none; b=PKNd8D+uflEjXV2qkJT11Ys8o3R505Py4jwKrofQBhptJeIyf3fOrBd7Bmm/dVLl1SEcwAZ4R7FHBkIIHvlnu0UJ0YfNulTCriFjeYuYGMBJE6QYO3fQax9krqAInE+ywEEyYGws0PZjzUZT5kNKDg7s6hDQTqnjoSv1pPD31Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760554373; c=relaxed/simple;
	bh=i0+X3nOUGvzMFvFCisMg5FLUBu9o5WalxuWHZrsg4wI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zl+Os1bRLh9SAhDA54arEjda5V4M+RCGND+vjEZmj+9YaZ3il6INWG3oIVIA7Zzi0QcMpf59Yr4jSsprAhPsral6I2LFh8nJq6onw9KDoa2V7i+mNXjh/IVwDsgXK3PObvGuqK2FkgTNzEnjLY9VZywfWsHE8pZqTKo9IWpsaLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kwERAraI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC437C4CEF8;
	Wed, 15 Oct 2025 18:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760554372;
	bh=i0+X3nOUGvzMFvFCisMg5FLUBu9o5WalxuWHZrsg4wI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kwERAraIux4js8B2HUR/dqYvM5KEdx531bVcPsL9Q3t35UC8Km8GgpBCxR5ZcamhZ
	 +dacXCfwYHGolouQqF3bAJJt5xpILDUnJaYFptMg7wfq/QxmcqdgfxO4R6+ziF3Gcw
	 V7Gr8vT6Pgn6tU3ZrYpzkHStZhYorZ66k7EJiTEgVg7VtRpRrN5oBHtlWcT796N8L6
	 3FC8vRKL7/ZkdlreEw5g7jiRckhRHe4BzfWjdz+N2LLqunv1CsrRf7GgevFY6Dl2rR
	 3meFIU4YOW8TcPXHT0lRNBUJ4QwEOwC2XTMoiBEUaWKrCSGIVq4o0OEdzL4Q1GFcYO
	 Ypb/AsAVoIxNA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, perex@perex.cz, tiwai@suse.com, 
 dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008145801.3479-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251008145801.3479-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: codecs: wcd938x-sdw: remove redundant runtime pm
 calls
Message-Id: <176055437050.231901.9790775935564885133.b4-ty@kernel.org>
Date: Wed, 15 Oct 2025 19:52:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Wed, 08 Oct 2025 15:58:01 +0100, Srinivas Kandagatla wrote:
> Component bind callbacks already does runtime pm calls, soundwire codec
> also tries to do the exactly same thing resulting in Unbalanced
> pm_runtime_enable and disable calls.
> 
> Remove the redundant calls from wcd938x-sdw driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x-sdw: remove redundant runtime pm calls
      commit: d5cda96d0130effd4255f7c5e720a58760a032a4

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


