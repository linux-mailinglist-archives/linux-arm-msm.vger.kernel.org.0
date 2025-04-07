Return-Path: <linux-arm-msm+bounces-53458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC66A7F181
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 01:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAB72177544
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 23:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF0522DFA4;
	Mon,  7 Apr 2025 23:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgW4XTfV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919422DF8F;
	Mon,  7 Apr 2025 23:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069742; cv=none; b=u8XpubvvVVlTiuFnNnm8hJMPSxCdaJ0FvGBawH5gxrvwcesy8ePu/XVgSyrNnFSONUnVejESlamrjC/tkirGDWI/GgbgDg6LSy9X3mj92CvdEY3Xj32hBTJHFJCL+J+FREupghRm/iMN622N0gRjc6qEFTZIeV1/m/sFvFDJHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069742; c=relaxed/simple;
	bh=gWHU0YirxvL4wTbJogBuZ0d2pc7rrE0mYt9fbvBUgu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KEplfFLOXJd1rsKcTanqn5XMPpCYFqG365XrgPfvdCL9Zmf4tFKgzrypqew3lato5ZtlBEfsSp1Yxc3RyOAoTv10v5kzLDHwvqQNk2STM6ywlHHBZnvPcOzkRB6cSDSnZBGvdYXRCJOgVUJGfWJRfrwJimj5ZLF72Sm1kp+d3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgW4XTfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FAAC4CEDD;
	Mon,  7 Apr 2025 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069741;
	bh=gWHU0YirxvL4wTbJogBuZ0d2pc7rrE0mYt9fbvBUgu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MgW4XTfVWuL6k4JUO+q4ozYCOPJB9zR5/RKStK+0vhnTKVWQ6+zPHqaRcZ2SCtdtn
	 2KjgXUQZN/hRHBqU/UGBeFsBM0w0eiR0XHzLsDzQHlPRFoo9J4tNMH8VOgUXj6oUCK
	 +oc29TZdl82Oc/0ZCB2vPV5NI5Ua6gloF9b1gwPn9E8nqsI217V0/9NzaNM3sGzF68
	 PfswAuuTRStUXfhS+k5BLkKIM7WEM27CVM9IjXd6c4n0ZyFB73i0pWnb9i6QMGKZQw
	 nWVxkbrQVW8dCuwn/sZEO7fHiaSIpo7YV2mGmtieXgf9sjs38PW8t8ty6NtPFPLOG7
	 0P3TmYwEAJnUg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Evgeny Pimenov <pimenoveu12@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, lvc-patches@linuxtesting.org, 
 Fedor Pchelkin <pchelkin@ispras.ru>, Mikhail Kobuk <m.kobuk@ispras.ru>, 
 Alexey Khoroshilov <khoroshilov@ispras.ru>, stable@vger.kernel.org
In-Reply-To: <20250401204058.32261-1-pimenoveu12@gmail.com>
References: <20250401204058.32261-1-pimenoveu12@gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix sc7280 lpass potential buffer overflow
Message-Id: <174406973881.1344763.7683351579116465463.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 01 Apr 2025 23:40:58 +0300, Evgeny Pimenov wrote:
> Case values introduced in commit
> 5f78e1fb7a3e ("ASoC: qcom: Add driver support for audioreach solution")
> cause out of bounds access in arrays of sc7280 driver data (e.g. in case
> of RX_CODEC_DMA_RX_0 in sc7280_snd_hw_params()).
> 
> Redefine LPASS_MAX_PORTS to consider the maximum possible port id for
> q6dsp as sc7280 driver utilizes some of those values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix sc7280 lpass potential buffer overflow
      commit: a31a4934b31faea76e735bab17e63d02fcd8e029

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


