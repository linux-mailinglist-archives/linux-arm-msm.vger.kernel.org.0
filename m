Return-Path: <linux-arm-msm+bounces-37068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBA9BD290
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9379828219B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07D41DD86F;
	Tue,  5 Nov 2024 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGJQOmvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F651DD0FC;
	Tue,  5 Nov 2024 16:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730824700; cv=none; b=smsEDVTmHXUaogQNsWjFn1Y3Wz8qf+l5YF9jOqcBUoJlfjUxXfS6FlAq5jgXLMYWh48l3211FSMe8LFk4mCdI1lowDDs0uR1M4gby9OhZ1bkjKPuV0HB1Iqr4uaXKVfHKBbXq36xCaSGbCWYnJvHTKiW49dftM8Lnb/7HNLknpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730824700; c=relaxed/simple;
	bh=X8hYb6RBCYK9495zyoYmXa26zE6IO19upKOSziGx0MQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W5jfb3afsh50WMaBqMQeiWyshNvFe1CWWyuW6xyzdqdljuGfpDwkspteAU9E7H99NkvVPNADbH3IQXCOs0cGFUn0V425iejEuosWqeLmP5K2Y83LL7ydc5+TxwLc59aFY3TjeygMRH/mMzL2jWou8DsLjkN7UmttNxF/usZD348=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGJQOmvx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387ECC4CED5;
	Tue,  5 Nov 2024 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730824700;
	bh=X8hYb6RBCYK9495zyoYmXa26zE6IO19upKOSziGx0MQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZGJQOmvxwqXjlOS+rTITdHoA4FGyRD3GXgP+R2tm9jFp1joz3SuvcR0mKF8OPGU04
	 6ytKxaDVANCp8Q4W074xUyGD/11Q2R6afZZ+pyrBAPsJOpr0l4DzAhChxEe98VeYFZ
	 rJ34djLZB5DzSGRmlv7H4AJWwG1+95ZcuEUCMudP4zj+pjyNlq7ApNHsbPO0vpocHd
	 KmWm9Nl3mscCpLrACeWK4/mDy80Dbop2L3QiK9rt2Wvo0QS0hLBck7gDMyW9FKuyWy
	 rNMdVBBQDTSQEVasDUitXtlH8KSL0HKgMHMoy9h8kHK4GRp471TsQgkjoyhklgbYz9
	 iYVe6TY8lhSvQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
References: <20241101165159.370619-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound
 card
Message-Id: <173082469795.77847.14820990076674451218.b4-ty@kernel.org>
Date: Tue, 05 Nov 2024 16:38:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 01 Nov 2024 17:51:58 +0100, Krzysztof Kozlowski wrote:
> Add bindings for SM8750 sound card, compatible with older SM8450
> variant.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add SM8750 sound card
      commit: 393de01870bcf2ea1eadd21ad12f927d78cbb726
[2/2] ASoC: qcom: sc8280xp Add SM8750 sound card
      commit: 4b9f02b6c5376b65dac398c4f06804c914cbb7be

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


