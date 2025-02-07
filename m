Return-Path: <linux-arm-msm+bounces-47152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9A8A2C4A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635D1188E93F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 14:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC82224887;
	Fri,  7 Feb 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMmbXUov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA9F2147E9;
	Fri,  7 Feb 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936971; cv=none; b=bNvX90Fs4BoCHkDSbw613N7Qunf5MzMdCT3RsQ+DoSTWgxwirC6B4XxC4Xx1cE2Aa3JkLT3euFqAWUigBCQFIB8zRaq8fTTpCYag4agu0FAs4lmxm00qAL+vz17eAg4SQ8VfY28vK7idJnHDWYs0kcsac8OG4c2sNltUVckKpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936971; c=relaxed/simple;
	bh=b1E1QDevKte5bnRZA+kxvqV3LiCkQOnxX2e86toI8t0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SEMhCrbnbBiaLzXLc6D/5CyH5HLHg4orD3iG+dUkpnTZv+VQZ9ONyyf7H/eRAyzgJbC9a9m17dNtkB64f+8gub917QjdeAGO4FaJrJpSHzv02IkiNanb6EmkI8zWK/P7YtQSPupX4BiZjVX8s7p6HnzggQmaoEMIOxoRyZHVFR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMmbXUov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C35BC4CED1;
	Fri,  7 Feb 2025 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936970;
	bh=b1E1QDevKte5bnRZA+kxvqV3LiCkQOnxX2e86toI8t0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rMmbXUovvLaB/Ge9hWUgrF7ZGpFufMOyLHxD6EUxPDsVz3y+7jlnxjNDKJ7uJqlgZ
	 dyDKN9NoihNLHo7KJ1FcTZNl7GYLu6rkA1jdsC4FCv03/jzHXKCRNJkGsLzvrUye1X
	 KECkwvUmY55MsQ34q8FKfjDkkdIxyoS5TFFEQR+TEaKrKjOggvKaumcsqyYE0IZ9fi
	 /Qu37xnhYknnpZ1mPB0GeZJOkWTVYD02LVpbKmfgtIrdYzKsNqHRLVEXynpvC5P0yq
	 Ef0k1IP/cKrNGNXeGmgHirJy5iba1cBoaosjGZiJ5fbLqYabpZrX7aR1Ou/NDQ8jAn
	 sMtbXmdoi8Z0A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com, 
 kernel@oss.qualcomm.com
In-Reply-To: <20250206112225.3270400-1-quic_mohs@quicinc.com>
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
Subject: Re: [PATCH v6 0/4] Add static channel mapping between soundwire
 master and slave
Message-Id: <173893696676.35212.7325321784175657368.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 16:52:21 +0530, Mohammad Rafi Shaik wrote:
> Add static channel map support between soundwire master and slave.
> 
> Currently, the channel value for each soundwire port is hardcoded in the
> wcd937x-sdw driver and the same channel  value is configured in the
> soundwire master.
> 
> The Qualcomm board like the QCM6490-IDP require static channel map
> settings for the soundwire master and slave ports.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel mapping support
      commit: 72826381215e2f9d2bd2f32f63f76a80942b7fdf
[2/4] ASoC: codecs: wcd937x: Add static channel mapping support in wcd937x-sdw
      commit: c06c4f7cbea1d8dc71485bfddef2849a1b721e67
[3/4] soundwire: qcom: Add set_channel_map api support
      commit: 7796c97df6b1b2206681a07f3c80f6023a6593d5
[4/4] ASoC: qcom: sdw: Add get and set channel maps support from codec to cpu dais
      commit: 0e9a970d7b2cb98d741bc0e32ad8c8f30c009c63

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


