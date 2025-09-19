Return-Path: <linux-arm-msm+bounces-74187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D3B898D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55F6317EE8D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3B826F285;
	Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjhM4/5d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F43223DF1;
	Fri, 19 Sep 2025 12:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758286453; cv=none; b=Lpfbuk9ESkRwSE3nuZjvYaUwxcCGyLWKj4YGK2MymYN9Ze3cEUW++s0pkx9GmG0SF9C9UWwVi1G9sneFSFj/9Bc+b/QNZ+eu9cNb2Oflv++YKyEMIHRkBc4GD4GQRbWExxGoi8hapSPHDKJBSTmu5vBXLi0qT+VCEpGSNsSTEfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758286453; c=relaxed/simple;
	bh=gRGgMeP9YCb+uO/r93Fllo/IlIXr20yeYpXndgTVfdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H4uK104k7UzprU/KBDne4SYW5635kFoAcD+SlDe1ASIGTFGdFeBDEFrlc2/XC6YbACjUhhSojUc0ytQI0dMl5zuWFDKzHT9XxIjFUZySle/AOsT+mA3By2T4Q/HEpDegnEszzfwuS1Ar7o838rxUPLdbNIS/6kS60Z1sPazokTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjhM4/5d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB9EC4CEF0;
	Fri, 19 Sep 2025 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758286452;
	bh=gRGgMeP9YCb+uO/r93Fllo/IlIXr20yeYpXndgTVfdA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NjhM4/5duHO0wCuCM9tQNQ0t5xn4VVJFjDF/H5036veQFZe28SCg/5CQgiypUrt/l
	 S2S2tlIY1w5swYhflRgSGomBY9C2WXBkGX47tAHD+uAQIeViCDpbt2MYyRCnbxmAZw
	 sx8tR7iE2k1yB6oWiaWy/YooTeiLRze17QzKyGI1s+r+vozFEV4VdPn9nVaId1DfoF
	 lsYNP9wb31zfnfjGmhB4Gi6+/1ehCjED0EcmALd6ye4/l0osg1OiQc834UHzk9kjza
	 ouyr3N4qKRv0Skby5Lr06QrM+wC3QMeWIdkO/T70cJ6JFUWnT65paGOnTh1xb8gE5I
	 2Tc184y/oJuBg==
From: Mark Brown <broonie@kernel.org>
To: srini@kernel.org, lgirdwood@gmail.com, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@oss.qualcomm.com, 
 neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250911154340.2798304-1-alexey.klimov@linaro.org>
References: <20250911154340.2798304-1-alexey.klimov@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: explicitly set S16LE format in
 sc8280xp_be_hw_params_fixup()
Message-Id: <175828644908.102649.16187392982515202308.b4-ty@kernel.org>
Date: Fri, 19 Sep 2025 13:54:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Thu, 11 Sep 2025 16:43:40 +0100, Alexey Klimov wrote:
> Setting format to s16le is required for compressed playback on compatible
> soundcards.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
      commit: 9565c9d53c5b440f0dde6fa731a99c1b14d879d2

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


