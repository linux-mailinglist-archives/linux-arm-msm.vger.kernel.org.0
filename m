Return-Path: <linux-arm-msm+bounces-30307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697B9669D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 21:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9918B2549E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 19:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312291BBBCC;
	Fri, 30 Aug 2024 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXcp/9+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF11531F5;
	Fri, 30 Aug 2024 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725046237; cv=none; b=EsTvDOgk+3r8B5L7/BfFIqzk/IKEYmHbTWdGJIH7+WSWFs7cwXCrEU1f3d7l17+70A1A1hVb1saogbHULQyjKQeJ3/yRxRzjlC7LKk5EusDljyIixP3WAQTNQddmbMQ+nwCCVM5TJP1vZgLR2ZbVEb4EOc6wSdKkZchmrp8hsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725046237; c=relaxed/simple;
	bh=rz8KDKw3aTWGQcJdgAqnxUa0Kv/DBZMxKlXY8HtiKFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FaySeFG/s3oIhW/0I9LJv+yWfA5UjmTWrcc0AN+RnMItV9Qu2wAIo7D8UaW8SVIRfT6qiMSZnqWbOEp0pjTKZwmIpPGXgJ0dOGf1WvNd10MqJ8zNBqKtejCLKCcYPDIUcvcsxzUTd9dJ2BT/ACl5XEIlIuWJNRagjlDe7ySvYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXcp/9+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC793C4CEC2;
	Fri, 30 Aug 2024 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725046236;
	bh=rz8KDKw3aTWGQcJdgAqnxUa0Kv/DBZMxKlXY8HtiKFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jXcp/9+snMJHOYEgWuq8md6a8c055bh4zmF5ps27aLwFi5MpxHT10AitTZKkvZbt1
	 nZFxYsO+Fqko0Vbwu+1leQo9D2jZhOMqBc2e0U+9zYp9EpLGswwYBMXk6ycolf74zO
	 Mpn0hr/CtxZOBues2jY7VaWFauXfq0RBk8QH7nbKS6+p5tiZ0aCnLiKO2FOYNOjp7q
	 +vzCwlLJL27xEPOQCp3P8/eWnlyiNa/Qb+xwKM/VXKk78JbZSbUWTxByHlQaM0yWxt
	 wIciwVXClMWc8zuJzvVN4MtAVXK/SXDrcKA7Ic5taHyccl63gIsgN44tV8xq0IAHId
	 tdLYhOGEMgNnw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org, 
 dmitry.baryshkov@linaro.org
In-Reply-To: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-Id: <172504623446.461126.12391681424311035210.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 20:30:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 16 Aug 2024 10:12:10 +0100, srinivas.kandagatla@linaro.org wrote:
> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> platforms, they do not have a reliable way to get the codec version
> from core_id registers.
> 
> On codec versions below 2.0, even though the core_id registers are
> available to read, the values of these registers are not unique to be
> able to determine the version of the codec dynamically.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: set the default codec version for sm8250
      commit: 77212f300bfd6fb3edaabd1daf863cabb521854a

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


