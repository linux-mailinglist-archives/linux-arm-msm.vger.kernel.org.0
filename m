Return-Path: <linux-arm-msm+bounces-52554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97866A71DE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 19:01:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D9D93A7D41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFD1241678;
	Wed, 26 Mar 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rjp16ML4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2C824111D;
	Wed, 26 Mar 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743012030; cv=none; b=C5psZr32A+UWX2hKO36daHWOwk5MxyT/AnoFaQ3xthMpo2Gyw3/txnCe0gjdvej+JoDUA+HmyKv2fVu9CeFja9VckWwQXI9g+4ecam+Ls92SoWc/ob14KHrMGNE2UySnW2bWL2guz2vBPfF/3jXd04mVrSfcNYAj75G4zmSICHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743012030; c=relaxed/simple;
	bh=+9mdqXTserWpJh+sMmzr1OcLYPE8C10aqKYmDg6mrWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IcQri7AGiG/f5b7UZ5VAmYgG0sfnqtcEty/4R6VnyQIRodNWWEjAsFcc7sQfHgXHYLbCg7GCnHSyVwteQ/vVNNwW0wWL+GjJJuk0HZkKzQD3IU1/9qMTzKhmDcFeOUqpAfufP671H+J4nGJ09/ZR9xJu/ijvntcrtlXifPC9+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rjp16ML4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 673FBC4CEE2;
	Wed, 26 Mar 2025 18:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743012029;
	bh=+9mdqXTserWpJh+sMmzr1OcLYPE8C10aqKYmDg6mrWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rjp16ML46Sst6EvTVgU/5p6wmfqFqZ7k0dJ0MTmKF5xlvPtAPDevWium1Z1R+1X0T
	 JV+D5BJJcnIYt7oKRR8xAVLa5aEjfY7ClNelOugV7FYRw9d1PzMOh/71K6q6ODVLET
	 bYrIhqBF8fQMIR9ja7CWSSXwMQTNw6adWME5JvMOOu9h5mf4Ho7ia8ngHIQ3YxeWOy
	 W8zjZE8GcMdktp/MKUDoFB1X1JVKuEmv7I8+6yI3tp0DLC6/z8nL1HxrYvu/826mJo
	 yOHo3i+lw5gKoUm5+wCnIrH8vlj5OftDImMkqFaiq1AovizHz/iytRocce3K8ZzKcd
	 Pa5oO/8ItVLpA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
References: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: codecs: wsa88xx: Correct VI sense channel
 mask
Message-Id: <174301202814.134636.3486543506033559539.b4-ty@kernel.org>
Date: Wed, 26 Mar 2025 18:00:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 12 Mar 2025 20:24:58 +0100, Krzysztof Kozlowski wrote:
> VI sense port on WSA883x and WSA884x speaker takes only one channel, so
> correct the mask.  At least this works during my tests on different
> devices with both speakers.  With original mask (0x3) I get
> noise/garbage.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wsa883x: Correct VI sense channel mask
      commit: ed3b274abc4008efffebf1997968a3f2720a86d3
[2/2] ASoC: codecs: wsa884x: Correct VI sense channel mask
      commit: 060fac202eb8e5c83961f0e0bf6dad8ab6e46643

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


