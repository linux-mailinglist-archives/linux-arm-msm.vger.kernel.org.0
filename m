Return-Path: <linux-arm-msm+bounces-77580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28BBE3749
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73A1D5002E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F6832D436;
	Thu, 16 Oct 2025 12:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTRSU6R+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B8A26B942;
	Thu, 16 Oct 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618518; cv=none; b=s01DXovy0i1wTowRTNnkpirKQIs3xdl1p3JCk1ueHyxohN42oQPLdifqecA5MQCSgtFlJmd5OWuFLh6d1zo0CO2/ay2J8wCWEll9eLceEncLhmR/Uft8SsXnkFtMwrVsD+j7xA2Zawpvjp/AYWqi/UxKjjHHf+XSQLXYzfrqtOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618518; c=relaxed/simple;
	bh=f+IpWRpjAufT+ugUmSZeiirkdl5RufHHH+fbTz6BEUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GIVV0TZ+R6XW2VzykIfE89PZ5f2rldhQFWMwaDnKTtd8VKeAJCSQZtYbp6khVff6ITe9Nf6Mk0GyZ38frXGRII6ICwIHpjAmJ0w9nFOIj1weVVAC9zuqhPyUnS5NeOikuVwd2NldqL8N12NtfHmNxGxFuGMM/HFCiUlUZIyFeL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTRSU6R+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE0DC4CEF1;
	Thu, 16 Oct 2025 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618517;
	bh=f+IpWRpjAufT+ugUmSZeiirkdl5RufHHH+fbTz6BEUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hTRSU6R+WOTJZfcXTxlaNyZx/nThKAkT9ywttPZ8WoW15MypiFU+Z1l0XzGvU7nUw
	 ufopkBB+u30mriQG6LXgobP0CJs9YcjDh6LQFOBs5eEs8eWoiBsHQbuz3QsyoaOPM6
	 MajsBGD+ZJne86SeN6uM7qju+K5DMvibSQ8reti3PjRCx5ucjoetEsIqHDR1uEm8Mu
	 hzVaMRV8xV8XXmLFueLUvNUVc5UyYqdo7ZywHM0nlyEZSN5TojHeUqKeaLgVRTQjDL
	 nYnBWO/kl3cRETC809Qxk2jiG0JaZ+iRpvRzhN7/BT7JAIh2MXF6wtcfibzaSupouY
	 XIjTEFEQHU3hA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, leqi <le.qi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@oss.qualcomm.com
In-Reply-To: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
References: <20251009023341.27277-1-le.qi@oss.qualcomm.com>
Subject: Re: [PATCH v1 0/2] ASoC: Add QCS615 sound card support
Message-Id: <176061851515.55339.6606725865723247206.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 13:41:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Thu, 09 Oct 2025 10:33:39 +0800, leqi wrote:
> This patch series adds support for the QCS615 sound card:
> - Updates device tree bindings for SM8250 to include QCS615.
> - Adds QCS615 support in the SC8280XP ASoC driver.
> 
> Tested on QCS615 platform with audio playback and record.
> 
> leqi (2):
>   ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
>   ASoC: qcom: sc8280xp: Add support for QCS615
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
      commit: 6079165e6e027c03e06556ff3df0ed03a34d68f0
[2/2] ASoC: qcom: sc8280xp: Add QCS615 compatible for
      (no commit info)

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


