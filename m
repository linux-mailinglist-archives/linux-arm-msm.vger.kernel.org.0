Return-Path: <linux-arm-msm+bounces-47148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB8A2C490
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 261433AE425
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 14:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34641F8AC0;
	Fri,  7 Feb 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVwJtefr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9001F8904;
	Fri,  7 Feb 2025 14:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936952; cv=none; b=nPFTW0i41J+ybXwtYVdU5/NuQqvghHzgrlCzhz5u6NeC5qrAkPzT6wBBpUHM4t43RSAJGVC/Nr3b8Ae/5Jv40R5BqU1kB/m3A5VF2dvY0ogOOhqB0QoKAfV8V9EvTPwsoo/f9ujYgTyY68sNAF6VUEqvLPNz/qv5k0PuynUUB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936952; c=relaxed/simple;
	bh=9c7ll7ByFsejq5s0nUA0I8Zo037AKWmHwCfUg+90rmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WWrp7H06TXxXrsM6iU5V/HASoZquDSUIl6d95HgnO/ivPmCo0NoFyImntHigxmfMd1EKR8OnwXfPM6ydiJxV3lF5Rn4Po+Ob3ZQl8sf7T/ObeZy/smT9TiaQJvSIbI8G2dRhIPWB04LyHrEdon9+qpRa4y7+DaKArFNoMf3hUcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVwJtefr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F70C4CED1;
	Fri,  7 Feb 2025 14:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936952;
	bh=9c7ll7ByFsejq5s0nUA0I8Zo037AKWmHwCfUg+90rmU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AVwJtefrBLaM4rw63mLgUYmzPcyI0iQop4gu6PqVy2v2g9uq2DFu8Apvg8mNarXuk
	 0ZZZfH+8Y7+fLozNZYkgmAw5PFgs3irC4rp6CqSo1qnDgyrl46kDs/Cybo7Nvq61cO
	 ri1iw+W60e7oTPJ7eczxIzubVkERcljjZ8YvvYoHmwSX+B7/3d8nUfY0c1aadHJmtV
	 Cj377ckudkn1j3j/WdxTTrDh7Nc5hOkeFDf5Xkj14AF8JXTx59LleMzcMJAVgqXsYS
	 w2f1/Ock9fh6mHldRg4oDszqdgzULXGpGdBei5zg02M/Zb/3a5n08J8i/n2Uwg9pdW
	 TT5tqrvIRVSVA==
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
 linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com, kernel@quicinc.com
In-Reply-To: <20250123042823.2067740-1-quic_mohs@quicinc.com>
References: <20250123042823.2067740-1-quic_mohs@quicinc.com>
Subject: Re: [RESEND v5 0/4] Add static channel mapping between soundwire
 master and slave
Message-Id: <173893694834.35212.14357376286762551331.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 23 Jan 2025 09:58:19 +0530, Mohammad Rafi Shaik wrote:
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


