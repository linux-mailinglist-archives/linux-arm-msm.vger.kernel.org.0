Return-Path: <linux-arm-msm+bounces-85662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6854DCCAD6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:21:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 474A8301B94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4D2338930;
	Thu, 18 Dec 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVL3BDJK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA33329C40;
	Thu, 18 Dec 2025 08:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046069; cv=none; b=dGhs5rwKpqx2vMhWN7CoxtnqyvekyuzoToeFEjAS42Klf5Sabsbdmq9qrT/OPo001b4vFpc8epdmqqsw0HYyM+cRyFrCKvONHIKOhIMF1i+yU0/eFF045Ab82gSVPGWrSgKAAVHsIIIgQ6/LOghTr3uuTlmEaOb5y+qjVGwMteg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046069; c=relaxed/simple;
	bh=eHaXCMfNPrzGKKskN0ftcIIedst5WnhbseQpDz6pWOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=vEmHaKaGOtC08Rnu85V7z+P4EXzOW1/0BTLsQglqYLqhSyynVPJyqaZLgcBDExq7IL9EYIyuVtozUUSv1f8aYr+ZcIJw7YJNg3+sDzl+v8TqGjr3ky+F0tyJTTTDWjfjVqgThWH0znc4kZCTpqWvi3b5KBncBr7/0t/AqHpW0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVL3BDJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1C5C113D0;
	Thu, 18 Dec 2025 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766046069;
	bh=eHaXCMfNPrzGKKskN0ftcIIedst5WnhbseQpDz6pWOc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gVL3BDJK87Tty1gmGoNnwxGNkY5Xw+KRSXfRU3ZjV0NdBFyq3rwm7LOPUngYZbzZU
	 6zLuUH/n//TLWJYsG4bml2u0yasTF90eq+sjLUsw3mjIoKftzjL/gZ/AmDYykmhJqs
	 z1FeaBd2bj+jiHKK4HZn/9f0QC7aA6Ce+Z86IInmOdQad51cHum/lX68BMjlJBLDPB
	 MM3+QE8lBwhgBofFv9eEoiJiRHl3hto0JFUS9VBA5dP2hCvizCNDr3oPTTbP/GlEnA
	 CDUV+KJoinY4O7SoMqy0IvVePiq4RTfyaVaUGmI726jZO3FnN0mBVDV3ZhhL9hfjWP
	 P2BU5tc6smjjg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] ASoC: qcom: audioreach: Add support for Speaker
 Protection module
Message-Id: <176604606703.48417.8295362346139487733.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 17 Dec 2025 10:46:03 +0100, Krzysztof Kozlowski wrote:
> Speaker Protection is capability of ADSP to adjust the gain during
> playback to different speakers and their temperature.  This allows good
> playback without blowing the speakers up.
> 
> Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
> and sending it as command to the ADSP.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
      commit: 0db76f5b2235ab456814ee8e4e2cdf0cef09dd6b
[2/2] ASoC: qcom: audioreach: Add support for VI Sense module
      commit: 3e43a8c033c3187e0f441ed5570a0fb5dcc9dafb

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


