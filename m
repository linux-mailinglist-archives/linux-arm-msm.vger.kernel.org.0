Return-Path: <linux-arm-msm+bounces-22286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 606639038B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F33C1C20E1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 10:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A837114D2A4;
	Tue, 11 Jun 2024 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqBHRojf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4014502C;
	Tue, 11 Jun 2024 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718101170; cv=none; b=WArshJrJjaFg2+JD8rhVIgcqon0dRYe0DzUmbRofciZbOjxga/YJaFg4BNhP8P5M/fGkYYUqTPgLxUohFW/3o3XqCvx3dAa2dBlOZfvqvGQ2uZeuPoz1HvGrSGaJQR2TI0I3xkI4Mi8AV2tNyREO9cLblEhz5wm+4h0JchdGnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718101170; c=relaxed/simple;
	bh=w/yxPxCvkaDeWtKKMpFlZEVsnhxa4e1/eJvbybjHLrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eg+c+ZTnQLmvsARi5GAQCsCTla28LqeJY+pubMxYfbSXX6CxUBF3csljMiCC6J3O2mzy4KSFNleOYz0LCpJ7bw73IeVp8KPKh4/hf7lQHU6iNWkr/5falGGycZ/ztm0ZvSZkPFpGKgWJVxerBvsycMgG3TYh2kc1oWZ5vITIQ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqBHRojf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB9BC2BD10;
	Tue, 11 Jun 2024 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718101170;
	bh=w/yxPxCvkaDeWtKKMpFlZEVsnhxa4e1/eJvbybjHLrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BqBHRojfxWBJxHMMY8/swGUpBo8czC2/+DcqD1cxVFPHLamyhEjgOs3lWpEcDw6hT
	 467sC4Tcdemtc9jX9HV8WTGIUxxcouz72HxLi7DpaMP1Q+TgodAGTLT/FH7nEPyRx9
	 n3jC0XkBo5PyfatcDJIsI76TwUiROfk3tG8pa1FrhgTz9yTGSGTySDqc4PdDD4y5Bu
	 qPUgNsBktIyQdkxLB25GWOAwTANPZ35+RMmM1OD0rXJblWnMc0wC05eYWc1LYsQOvv
	 jp/xvRw6WKMLAcFAGK3p4+vMm8mnrcTfOoFxRNUFOGyULalKIC8jxg0ol+JH5R33RY
	 to4VzzHl7zCfw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, 
 quic_pkumpatl@quicinc.com
In-Reply-To: <20240524035535.3119208-1-quic_mohs@quicinc.com>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
Subject: Re: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Message-Id: <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 11:19:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370

On Fri, 24 May 2024 09:25:28 +0530, Mohammad Rafi Shaik wrote:
> This patchset adds support for Qualcomm WCD9370/WCD9375 codec.
> 
> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices, RX and
> TX respectively supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 6 DMICs and MBHC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: document wcd937x Audio Codec
      commit: 27173bb0b64461acf4e00f1bae3b15d8d2348c14
[2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
      commit: c99a515ff15380ec5f8827049914145ba908e8da
[3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
      commit: 9be3ec196da41b20b624ae4ed0303df58548644e
[4/7] ASoC: codecs: wcd937x: add basic controls
      commit: 82be8c62a38c6a44e64ecb29d7a9b5cb35c6cad4
[5/7] ASoC: codecs: wcd937x: add playback dapm widgets
      commit: 57fe69db7a015e828ec69d819707c5b8eac6d052
[6/7] ASoC: codecs: wcd937x: add capture dapm widgets
      commit: 8ee78493be89c42d016f941a9b00c203ec08daab
[7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
      commit: 313e978df7fc38b9e949ac5933d0d9d56d5e8a9c

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


