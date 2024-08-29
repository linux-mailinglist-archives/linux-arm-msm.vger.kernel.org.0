Return-Path: <linux-arm-msm+bounces-30069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 218EE964D42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 19:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 547891C22A8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8641B790F;
	Thu, 29 Aug 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVrb3ssf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0A01B5826;
	Thu, 29 Aug 2024 17:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724953972; cv=none; b=aXIrt6UugGGuyIn3X31WbGjJqXxhxl7vUhXocbIZtgHnDvgpn2Xo/JxjJmdJ5Jg+6EBu7pGWoPhootIPAj8NOulbXyeNuTNcFchjRFy4WrY2n+6+Uh3WPRSa78beCSPxVk2M8XGGW12e/ScpJMqAu4rpVIIAu8Kv5qaHrNYfQko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724953972; c=relaxed/simple;
	bh=IyscI7y7AS5vyGO4ltoxUCnQBeiReO2ZEWbhbs353es=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L9lEX7cRd6dZN8G44b26vfortr/kR+iCpRDnc4hyDyLo4FlyEszxBf3EcX+9nv20wWG3Ee2tDUUUywdmIvP/LEsT9zGPZnWO18M+XDPAOfyJWB59ovx1FVdnNIhN7e1xHG+DzelKCNSpPlJSgT9lHkkhlXdIfW7Vd+aeRpsbFhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVrb3ssf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0C17C4CEC1;
	Thu, 29 Aug 2024 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724953972;
	bh=IyscI7y7AS5vyGO4ltoxUCnQBeiReO2ZEWbhbs353es=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=cVrb3ssfm3PQ/qGzYjYNpS9HP4RejoFXv3Ai4Zuw97CyY/TV6Lh3BWUsJASunfL3l
	 u/ddu2Piv3AD578TFmNJmIDVwrutlHgTljQpfOF7kvsi43gCqiuV2jtDU4lKDe/Uu7
	 qUEnz661wtE29pqYZvG9BpIqGUq5SQePRxwuqXrOdAsjA2UqlatYPxAFuwBcScKcc7
	 4JdGg9F1MsClr9tn7phOSGPU3w1aFNAwhk9DBKggHdALOq7leVgqTsiygaYfD3jvM2
	 fOWrmt3t+hQX5rM0DrtXT1uZxkjYdUjR1UtJ7ltHyZBSq/MwUh9yZcTwbnpDDLFCa3
	 /9tOD4HYmlpRQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240809110122.137761-1-krzysztof.kozlowski@linaro.org>
References: <20240809110122.137761-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] ASoC: codecs: wsa884x: Implement temperature
 reading and hwmon
Message-Id: <172495396971.847387.2753598492467294945.b4-ty@kernel.org>
Date: Thu, 29 Aug 2024 18:52:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Fri, 09 Aug 2024 13:01:22 +0200, Krzysztof Kozlowski wrote:
> Read temperature of the speaker and expose it via hwmon interface, which
> will be later used during calibration of speaker protection algorithms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa884x: Implement temperature reading and hwmon
      commit: 6b99dc62d940758455b0c7e7ffbf3a63fecc87cb

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


