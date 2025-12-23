Return-Path: <linux-arm-msm+bounces-86374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA4DCDA074
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6984C300B6BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8976345758;
	Tue, 23 Dec 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiJJQZZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98821321F48;
	Tue, 23 Dec 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509619; cv=none; b=iDscJGmk2dcacR6dp77xJbW5jSqrVvmQMwmZYCOe4boFDPZHmI+L1TPUuPkMhq2j2dd3F2/8nfwgfJbCGB1By/SYkieKUVXtiipIM/FZlpurI6e/RpHZ++ZW+V8sWrd365nhJTCcOj/HCYNrR+jI1yiufaaVMMzAfuwJ23IMvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509619; c=relaxed/simple;
	bh=RjcKXrzPX2dFCZErCFk///NOU9Z1yUxKAtOOeJz9X0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hqZYEhsa9j3+4TSXjAdB/3lnk0A6UVSFvCgTDpfshS4xXstwXDrkyilLV1mcr73sja0N6MW5hKObPE6kVpOtZ+QnodtPYyxPd8AFfPbtx6s3gOsimdiOEJz+wA/JQ1+e3VP9vw0cqH7D2uoYt2zW/d8eY++ZUyLtmEBk0rQI9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiJJQZZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B82C113D0;
	Tue, 23 Dec 2025 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766509619;
	bh=RjcKXrzPX2dFCZErCFk///NOU9Z1yUxKAtOOeJz9X0o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LiJJQZZZ5jy/j50Jmjw5Gc8PX+hP1OmNL2l5nG3owLDVHhdETpI3D1TI+pNyrA3p3
	 62eyo94b5Py7lSwKtCRyBRnQwpoxRPaS4DjGaI2KxUrGE0lDrsXit7E915b6DoQjEJ
	 eEiCos4gIWg3snJ176AjGm+7Qpn7NwAkbZ0K6sLintjZK6esOlMPrcqwdTSA+6uwTG
	 JLBt+pq3/4W16aGWcd0r3+Uz1YcFT4xATRzJlVJxvkdUH9aGWFLZ5QnWO07qKy+uXj
	 nZz9xxgDjYIfRreCg4XaFLdeqL5IWis8Jtma6WV0QB6lsNSKcfB+y3q5wI9XEZW9mw
	 h6KupngaGWtOQ==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
References: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback
 response data
Message-Id: <176650961679.445350.176502409480176664.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 17:06:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Sun, 30 Nov 2025 10:40:22 +0100, Krzysztof Kozlowski wrote:
> Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
> via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
> Ack).
> 
> I propose to take it via ASoC tree (Bjorn's Ack), because I am
> constifying things there already, so less possible conflicts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: Constify APR callback response data
      commit: 86af3c229245fe1e59f428fc6abe19127ce15f5f
[2/4] soc: qcom: apr: Use typedef for GPR callback member
      commit: c66cea195d76c7c396c4c565b967d3e2a709e762
[3/4] ASoC: qcom: Constify GPR callback response data
      commit: f3a86870c5938fe82ce02c29235326d417010ffb
[4/4] ASoC: qcom: Constify APR/GPR result structs
      commit: a2a631830deb382a3d27b6f52b2d654a3e6bb427

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


