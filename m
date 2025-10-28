Return-Path: <linux-arm-msm+bounces-79226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B757C15B6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB1F1A22EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595AC342C9D;
	Tue, 28 Oct 2025 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbGSqMDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639E342173;
	Tue, 28 Oct 2025 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667792; cv=none; b=pZBt6JeuvMdC4h0nH88CJAqE3tl5NybPPq8r9V8s0dYRELoCJVKikb8uwLdX2Nt3vULFnhiLCL3w6NEN+CRJDDAgiek8+2NLIo+g2C2eyfIxQagDIA0ov0EVYkHL2Ed/5l9L/rjXFkiSeMDk/xA3giM3jiGE33L8ykeBARNB0mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667792; c=relaxed/simple;
	bh=Ae8P5LuWUoMUbKBLMiZfN6RbP+pxgug2Q49TavZJAnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hYHkp37oGBdZX65wS/I1XuhVuQYxkuO1vocuo7hduVc5r9taQQhzTCpzqJA/KCy8HK/QDeYKKRIVXQT+uqPESwHrWiZVwo9Tae3HboeuwinhcKk01Mj01cOxigrjkWFjLdWe9K0Nd6CswAZ7a26JFIGR6Cn+PLkKG2EtNAm/OVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbGSqMDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AA5C4CEE7;
	Tue, 28 Oct 2025 16:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761667791;
	bh=Ae8P5LuWUoMUbKBLMiZfN6RbP+pxgug2Q49TavZJAnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jbGSqMDlHfKPAkVC8Ay7Vbav08zYNs8U48L4fPVJfkt6WYEbpliLUqwHtg+dwl8ky
	 ODP5P1i6A1Dp4xRP7owrJtoMJjHs5mbo4KWbMKo4uDFg9PpQjgXPImSzVdFHUZutUu
	 CC04BoOSW4St7+O7eujOJMIPtJzfZsrIa8pP6zLZ/UHuAoKGtcvak3PlTrKA7SlNTi
	 TQAUqLBkbYe8wO5l9l38ASag0HAJTDStLNoF2D8aHx1FuK2c9yBDMbYGE18oUP2PkD
	 ywllDgLk4qgW7tBp9BwwP9wUEHHIyZnJbxcYD5jn9nQcctDhvOqF+5kuVfU/lF7B2q
	 BjvO8f3H/ar1A==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
References: <20251022-qrb2210-qcm2290-sndcard-v2-0-32e9e269a825@linaro.org>
Subject: Re: [PATCH v2 0/2] Sndcard compatible for qrb2210/qcm2290
Message-Id: <176166778871.143847.17063915806888837575.b4-ty@kernel.org>
Date: Tue, 28 Oct 2025 16:09:48 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 22 Oct 2025 04:58:48 +0100, Alexey Klimov wrote:
> This is a small patch series that serves as a preparation for
> adding HDMI audio playback support on QRB2210 RB1 board.
> The patches here are for sound subsystem. The other series
> will focus on qcom DT files.
> 
> The original series where one of the patches here were taken from is
> https://lore.kernel.org/linux-sound/20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org/
> and sndcard compable patch was added as new one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: add QRB2210 soundcard
      commit: ee4407e1288ab85be16bacc45195b8bb23d44760
[2/2] ASoC: qcom: sm8250: add qrb2210-sndcard compatible string
      commit: e973dfe9259095fb509ab12658c68d46f0e439d7

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


