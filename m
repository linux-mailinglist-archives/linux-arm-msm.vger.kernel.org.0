Return-Path: <linux-arm-msm+bounces-23778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C167913D2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 19:22:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D7311C21660
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 17:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A781836F9;
	Sun, 23 Jun 2024 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p3SjiZTY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD771836F5;
	Sun, 23 Jun 2024 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719163311; cv=none; b=afFGelDfXk4RoErgHxNukWUGAwncjCE4LAhW5mEtdox5V4W1CXbJXk/h6crZ5EY9z+dTLxVD+H9ufQA9u5O89tDfWIvJApauaeDFpndU8S5oyrG7eJM5MClwnt3v2S47diejU9PickEVsBIfVZaUfTXn+aF10jgfg2gyO7YGSJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719163311; c=relaxed/simple;
	bh=Forj5XhRH3uV4vJJQYS/LVUyREwgZsaM1YGmaz5sfQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jpQOove2i/PtoM0qW86HSUxs634p7gSk+EO2cMeczqTvGb3Z0PcwWmigBy9wr6jGuwWo0pWl/6xvjZRtcms7kU7DcN5wKYO+iYng0SduFBKmlf/NwhF8Dw6Kf6ojvM1yUBJ2bU7XbITercZiSLYnceqrsDLT5shrBSyiaowfguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p3SjiZTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D533C2BD10;
	Sun, 23 Jun 2024 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163310;
	bh=Forj5XhRH3uV4vJJQYS/LVUyREwgZsaM1YGmaz5sfQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p3SjiZTY9vSSQhiRynn+3++nSIt9JrU5+9sbXsi5hbOH9iQ/P33zsCa5XXQy4D9NQ
	 remTyo5SzzDimPpXgp0GdgDfYrWhfGf66ChjPI4IZoWf363cNtgpy/VPG1jFBTQYB+
	 zszRnG0e8vxs1FI3oq0Sr2+yWU4UDWyubH1ODmfFOmmlLZl+jX/nvSoiT5fTFzIn5D
	 kYngjln+Kh09QTyl1D8qcSufi/i9op8+lXAIH/7BktrQ+lwloo4TGL9cwaihcCIEiA
	 ieIl6TMVjg7xK0t6AuQSdLZ/4taaGLxGqt9GGqZEdmHvyVKLViMQTzB0a08IZHtS8w
	 gRdadcJiuUGDw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 krzk+dt@kernel.org
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-Id: <171916330923.350242.338813871607705802.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 06 Jun 2024 11:49:18 +0100, srinivas.kandagatla@linaro.org wrote:
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: q6dsp: parse Display port tokens
      commit: 6d620e50bb055e072c8c50cf95cd397fc24378c2
[2/4] ASoC: qcom: common: add Display port Jack function
      commit: 735db4ea16caaebf8e4884ec0c2e419c96391ac8
[3/4] ASoC: qcom: sc8280xp: add Display port Jack
      commit: 7e815bb9abd16f99c987987242a9fe13dfa0f052
[4/4] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
      commit: 24790a3cd1bdc083f9989f2fdb223f6494ebc99c

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


