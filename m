Return-Path: <linux-arm-msm+bounces-27296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D176C93FE59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 21:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6461C225F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B87186E51;
	Mon, 29 Jul 2024 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XUrKe0VV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F585947;
	Mon, 29 Jul 2024 19:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281854; cv=none; b=g6YDf2eSJoIGcplJhRFVXx7/i+rVKUqKu9fAasbgZGw71S7TbMdP0xUvweQOMN/jEU3L31vru9DfztH4RcP6gLyxLE7LgUqHgqSUEyZ+CxzAdjBsItITNf+xSqLPV0ZQn0yge6HB/KkiXCB2npT9A/ivZlg4r0VQ+ND/j0JHBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281854; c=relaxed/simple;
	bh=lQ1UwaSVRVCr28nA9MaSL3OK4CCm3hBI4Kq6+31BSqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZktlTnncVajWPKhfLz48QzFJQDHI5QIcFvCiBVJCkKvsHyWWRF26TSiUAji0tzcVxA2+7zmF9XI/tqWu9dfKsX6aTu/hp4yvw/hr+qSn5bZoG48ebWqqwYCejO7K5cbVf46MwKE0YxkAl+A6vSolOtjlrljCoBngfU3qaE4Q+Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUrKe0VV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA431C32786;
	Mon, 29 Jul 2024 19:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722281854;
	bh=lQ1UwaSVRVCr28nA9MaSL3OK4CCm3hBI4Kq6+31BSqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XUrKe0VVUZj94jTxc8zqQQzjE9ymJYbBPAUKm9WXeaaAPjwudJ7XUgr5DtcD8uGRA
	 ohdogn/7LFCPN6kcrLqkohq92gXMdVL0ax9ubaiNZm3wzk3cCIlP5aGqpSdi5u//jO
	 6iqRrBkbVBHQqU/JWZmqshQQ0MAy2llTqnskQIa/ahzK7h+ACyj7PuR4K5z06DaPUU
	 ZtRddCROjSiT0Zk3uiOWXDx+979TCIIucX2imDjjOChWD+zKmQD8Ug8wLUBRPvjWkv
	 19fqCpUw7U0J3rRrKVDwRTf9WCjZwWcIuVXMpshJ+CpzHw5VUT6no60zqNoYx3SyOs
	 i4zSuUNixVwQw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
References: <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire
 ports mask
Message-Id: <172228185142.141226.9862825989484734633.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 20:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 26 Jul 2024 16:10:40 +0200, Krzysztof Kozlowski wrote:
> Incorrect mask of Soundwire ports - one bit too long/big - was passed.
> 
> Theoretically, too wide mask could cause an out of bounds read in
> sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
> driver, e.g. adding incorrect number of ports via
> sdw_stream_add_slave().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: wcd937x-sdw: Correct Soundwire ports mask
      commit: aebb1813c279ce8f3a2dfa3f86def0c0ec1cbb8d
[2/6] ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
      commit: 3f6fb03dae9c7dfba7670858d29e03c8faaa89fe
[3/6] ASoC: codecs: wcd939x-sdw: Correct Soundwire ports mask
      commit: 74a79977c4e1d09eced33e6e22f875a5bb3fad29
[4/6] ASoC: codecs: wsa881x: Correct Soundwire ports mask
      commit: eb11c3bb64ad0a05aeacdb01039863aa2aa3614b
[5/6] ASoC: codecs: wsa883x: Correct Soundwire ports mask
      commit: 6801ac36f25690e14955f7f9eace1eaa29edbdd0
[6/6] ASoC: codecs: wsa884x: Correct Soundwire ports mask
      commit: dcb6631d05152930e2ea70fd2abfd811b0e970b5

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


