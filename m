Return-Path: <linux-arm-msm+bounces-47151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 365A6A2C489
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 15:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B56F47A60DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 14:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7688322332D;
	Fri,  7 Feb 2025 14:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp/MJHsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C892206BD;
	Fri,  7 Feb 2025 14:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936964; cv=none; b=IczD16flbzr/WjprK4PYf7YKBnNi5nCTiNQztgLmvdd1gaQNtzs96lBmv6ltFvqHmbocltdWQQYyiSCfa7nDpf6Wr7ytX1tJDDOKqwksaUMTSkv/ev1Zn0t1aYg5/H4z97zZ1xtS6NmjQepV5hgzNZ36nGvhLCOpZls0TFyi2Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936964; c=relaxed/simple;
	bh=q44RXL38E1YbjO9kakKKAjRxHMqYVfPk8XX8EmyAPzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YUb+fahANf67mKAu16kRm+mYR5m27EozugUtcsgQw04cDnt0OEWk75wg/2NXr+znnZKsm0X3imydlQHpREnQVbWnK8k9aqCrToN2R/HpmHIetr8fWilhkqpd5V+hJGBi0fm+p7Igq7fuZivSmxhLy1VK8M3VibXNvRLEmc2nZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pp/MJHsT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0967C4CEE7;
	Fri,  7 Feb 2025 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738936963;
	bh=q44RXL38E1YbjO9kakKKAjRxHMqYVfPk8XX8EmyAPzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=pp/MJHsToP/eI4vw3BQV2gmga0vLg1hkFvmu2HrkT2V2JAgs77faufgfVTZVGurB/
	 Yl5d/h2qsI4SWjmOKfR/85wp9DaUA1LxbPqOH0o2ZWbbFqtexDBMBAhZg+NmeQ0aUZ
	 WRU9jX2kn3gYLecBYxIrosJKuGW04hlxGSeeQB6OUVZrgLP0XfOsZQVDr3+hiNMK2Z
	 k3aTA6IrWB/8sbrkhw38rJ0JAiRXn4U4KWQHBW9/k/xV+M/4EPoamGjIyySs5p9cfU
	 Q7hxR6mikv91gpaJnH6lUqPctCtgHkO17dWeDhG6FvY0TjXNrsr9k4CJE4Y5eOgWwb
	 W/zxje5CsSgFg==
From: Mark Brown <broonie@kernel.org>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Dzmitry Sankouski <dsankouski@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
Subject: Re: (subset) [PATCH v8 00/14] This is continued work on Samsung
 S9(SM-9600) starqltechn
Message-Id: <173893696051.35212.8853631432356836429.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 14:02:40 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 09 Dec 2024 15:09:04 +0300, Dzmitry Sankouski wrote:
> Contains starqltechn device tree changes.
> Add support for new features:
> - sound (headphones and mics only)
> - gpu
> - panel
> - buttons
> - MAX77705 MFD:
>   - charger
>   - fuelgauge
>   - haptic
>   - led
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: dt-bindings: Add bindings for WCD934x DAIs
        commit: 8478dadc8148af311c3d43d4867cfb6632686ede
[02/14] ASoC: codecs: wcd934x: use wcd934x binding header
        commit: e27c125040b1e1f26d910b46daabbe55e67fdf3b

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


