Return-Path: <linux-arm-msm+bounces-81910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD256C5E899
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC97234B8A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCBB3375D1;
	Fri, 14 Nov 2025 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R974YA7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E998E2DC345;
	Fri, 14 Nov 2025 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140009; cv=none; b=B29mQAB4wSKyZ1NZx+yLWUdHK7alPxFHadM3xP3ylxmuoxodiDQB0QLXF4madR1QGn91zN67t64B1Ycso0rkb9X1I7piStK4APWsJ1AVqPdKmJlDyxWHmoBquH7QdW0e7RJUo7WMx5D8ff5N29MIffSmzxIPrHqoumsnTWmg+/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140009; c=relaxed/simple;
	bh=8VM0uG/P3AR5x2Yp+ncyz04JSf7l6wNPUKaGJaMheJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uKO4ePBZYNY3FC4kv5ihGtoqGRzHZIxut08ZFJb2h67X1ZvOSPpb6Vo3NkJECpTAuRYvMjiisyeRdDRTA1jOGmVShB9ImGYYZrdGYsNMQ3AqZC1tmBY8UGWSbFXcym8QQydATSssXVflzfxTlU2qZJTsejpuE+soTplf159qRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R974YA7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A64C116B1;
	Fri, 14 Nov 2025 17:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763140007;
	bh=8VM0uG/P3AR5x2Yp+ncyz04JSf7l6wNPUKaGJaMheJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R974YA7vC1puvxLtRvK8xFQpfqpYFKZq4IriY3+/N5P/me0XYwLAtT8bq5Ny8bVVi
	 FOCDD2pRuRFT960qIiqpOITBNDLgp1oEWWAwBjwAbYid+qeacAQvyhh6AyFYS3lTYS
	 QwWA8D76GmrEuM39I2U+W9usi2cMehSp5VRp/5G4/ipdMSbYcAo3JPBJ6YvkDQvASd
	 a6KaFRpFaoqDYMtZVkWVdPTDg7oaCPbiYjOVEdG1Kbejur6geqXGxpSC/LwlqHMevV
	 XmUQxouRFDFM9z9peT9029eaHTSmSgVZk6n3cKP2R1wE287v3hX0dtv18EI+Ft/Vid
	 06jNt2IWIk4fA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
References: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
Subject: Re: [PATCH RFC 0/2] ASoC: codecs: pm4125: Two minor fixes for
 potential issues
Message-Id: <176314000498.179998.13753639237348930413.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 17:06:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 23 Oct 2025 11:02:49 +0200, Krzysztof Kozlowski wrote:
> I marked these as fixes, but the issue is not likely to trigger in
> normal conditions.
> 
> Not tested on hardware, please kindly provide tested-by, the best with
> some probe bind/unbind cycle.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: pm4125: Fix potential conflict when probing two devices
      commit: fd94857a934cbe613353810a024c84d54826ead3
[2/2] ASoC: codecs: pm4125: Remove irq_chip on component unbind
      commit: e65b871c9b5af9265aefc5b8cd34993586d93aab

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


