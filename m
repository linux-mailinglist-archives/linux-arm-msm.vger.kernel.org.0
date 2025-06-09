Return-Path: <linux-arm-msm+bounces-60694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C06AD284C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2680B3B0EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 21:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9522C21CA02;
	Mon,  9 Jun 2025 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUPkIIyl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632ED1E1C1A;
	Mon,  9 Jun 2025 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502838; cv=none; b=CyvzjHjfuLa48qQq6fpqQTwtXVe53pETM38+Ly6t+0MetgIJRy9GFqL6WNqPHgAlYKAom4q/5prE1+cvtpMzPvD2pMSkeWtZDsBi9nK15N1RGIHNwvV9DfffgJd5oGsP8D4SrTxJJrwYphemWl8wHFwt3ogZTi7wHS2Jfh+3//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502838; c=relaxed/simple;
	bh=zqrMe1sn7XHdZVE7LCOKTyfEo8TpwJkf0G8jdLXjznM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fxwn9PJHo4gNH5l8rIc7FCgK127qF/3LH60Tmdmzftg5DCBh8x0Y5aZN40J3EgTnKnxJ1JSxNcxcLxeO+T2TJCYq5UiaeHoAVZioKnUBjp2x3hESm7WVuVQSUt2ANRCkACzaWHIJ+5S6qv12iSyk1y8mFwLTXCblyUvqAxEgTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUPkIIyl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCE7C4CEEF;
	Mon,  9 Jun 2025 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502837;
	bh=zqrMe1sn7XHdZVE7LCOKTyfEo8TpwJkf0G8jdLXjznM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KUPkIIyla7GStsdPfBCxwIp7zBZcKRNwfODNlQP68t8IhkD9BJKZ/FiALoJXLptA6
	 +4cyStfaNISmp5STLNwFyfFhjYJH1rquAxXNX14e3H6tvnpAZFiABYqTQP8bSiS7MJ
	 rpWpypO876E76VkRrsw7JsYtTX6wdnKcNgufLrihS79RAdwlqR3JCmnsA8e5bUXTLL
	 azPyyEnaolGGbuJ/zdKLQXs6qnFq9uYe0R97005Wzen8+drUcMFB7JDwTuHh3Pb3bS
	 mHmrxFYWBE1I1wwPpKe1KksyymrYu/vxQflKfBGGN4M3yzTzaCvO3jA3/4TxcZY6gF
	 KXEXe/XveO+Ow==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/5] Add DisplayPort sound support for
 Fairphone 5 smartphone
Message-Id: <174950283411.277844.1603420608213566024.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 07 May 2025 10:01:36 +0200, Luca Weiss wrote:
> Add the necessary sound card bits and some dts additions to enable sound
> over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> 
> The UCM files can be found here:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> This series - in spirit - depends on the series enabling DisplayPort in
> the first place, but can land pretty independently, especially the ASoC
> bits:
> https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card
      (no commit info)
[2/5] ASoC: qcom: sm8250: set card driver name from match data
      commit: c4b79a2fbfb28308e958e4ffdd988f3cf678fe2a
[3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
      commit: ed82808c6a0f333e51fee4e97cbe8e0189b7f354
[4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      commit: e6e8897995a9e6028563ce36c27877e5478c8571

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


