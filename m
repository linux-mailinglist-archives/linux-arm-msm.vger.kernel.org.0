Return-Path: <linux-arm-msm+bounces-42537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6D49F4C5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4161E1894502
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83BE1F3D57;
	Tue, 17 Dec 2024 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz1Jffin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937431F37C6;
	Tue, 17 Dec 2024 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734442047; cv=none; b=W/JRhWKs1NLqKOIvnCgVKFNfxTxFJEMUhZ7iPxs5ZHfPMTxrMZLaPJBq5Zctn1rDMazoQRL64XdDvUPTPXsN54+M5dl5fWdhBPMLkI9rll77xLeWK+M5fGYzIc2QMZZjQkqG64YVywhDQFAN4lveUDN5VmemmQEm0NHcYZfcRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734442047; c=relaxed/simple;
	bh=2GaD3sMPebMUphWDx5huB7scIRnQSIGcV+KEy7uN5qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KNsUUDxEIG3mY+d39zcyfRo64dRE4eWUULvwlF/vs+9ja1/3oGXGxCz9OaZD7gyPruV8HYDZuQUF6NxDjlLvTcmXxAmxydEvq7hlSGreKv1/6IVAnVqbMp2cSyZLNyIzfaUpiKsH6IF3XyCwdHxHJOWSjCmgJDruqyMOWW49P4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz1Jffin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF8FC4CED3;
	Tue, 17 Dec 2024 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734442047;
	bh=2GaD3sMPebMUphWDx5huB7scIRnQSIGcV+KEy7uN5qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bz1Jffinq0ThMU8TkWhB67W4ebfuh2N4+xhVCEFd+zULQpoQGcLqlnjqPaWuNJAZ5
	 6sqzz2JrL5qdjzOq2fqk73zMAwCC+AoZfHgz7YPvD8l64H3VN1ONQ7kVcEMvrf2EU3
	 DbVaduFy5jd+3YyHNVoy68lA90uBsJh8+p9Yh1xhFigAxcDo5K3dYnEkBcpQlRDg/v
	 ZfXeEL2hsnvF3XBwWKbD35ZWFgNI+cThuEsyAr5PTIeShXDtbQNH5jPjthsnSWyUvL
	 MxKWQSHIv3lHCj97qHE0/v4KlUdMFL0Q132f8gjyYwM8c2yQSnk7++b4eUfwON5Jcc
	 zu6MUuIN12Wug==
From: Mark Brown <broonie@kernel.org>
To: konradybcio@kernel.org, andersson@kernel.org, 
 srinivas.kandagatla@linaro.org, Alexey Klimov <alexey.klimov@linaro.org>
Cc: tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241205023344.2232529-1-alexey.klimov@linaro.org>
References: <20241205023344.2232529-1-alexey.klimov@linaro.org>
Subject: Re: (subset) [PATCH v1 0/3] db845c/rb3: add i2s playback support
Message-Id: <173444204405.31585.10764828283359007380.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 13:27:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Thu, 05 Dec 2024 02:33:41 +0000, Alexey Klimov wrote:
> There are i2s signals provided in low-speed connector on such boards
> as required by 96boards spec. Looks like it is possible to actually
> playback something via these pins after adding missing parts here
> and there.
> 
> I tested simple widely available cheap DACs like UDA1334 and PCM5102A
> and they works just fine without need for mclk. I guess any DAC that
> can handle 48 kHz and 16bit will do.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/3] ASoC: qcom: sdm845: add handling of secondary MI2S clock
      commit: 8bfb66c75cdace542dabe87841152614fd5b8d91

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


