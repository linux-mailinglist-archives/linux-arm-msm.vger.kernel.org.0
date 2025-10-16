Return-Path: <linux-arm-msm+bounces-77581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B24CFBE3752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 14:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8CB6035730A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 12:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36D32D7E1;
	Thu, 16 Oct 2025 12:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJA/b4q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3E32D7D9;
	Thu, 16 Oct 2025 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618522; cv=none; b=O5idfPYZDu4OFz74RV4NSCf4NRp0H2xSUD7NgMcMsnVGysmCFCXCAuhXjSMh2zbSrp6bMsQVDwjxTqVQuB08wrnkiRYNln4zL0vXeobQBGQrVAFkKZShR39vebQ1IybiISCGkc+z8a+CZAAsV4/LLvvOelqdes1+cT/4Dxbpi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618522; c=relaxed/simple;
	bh=capGskoZmjMJHMDq30MZgjnjSp0ctvHfRPAsE6z4KLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RulVQiS7xrwyvJyPlTgvI5yrDCE8LAVdtnIC+2W6qJpUCaoX6laOIXwaBuSLBAPtf6DXzWS7B4Vfa8pZQ3QOHXN4iVqLiKQ4RTFGi5SwBmiHR3CLKLc2fYaalgHYdva5DEzqvNxZXS3a0UqJB6qAEnpjRgwuBS4SA6GuIG6NMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJA/b4q4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AC4C4CEFE;
	Thu, 16 Oct 2025 12:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760618520;
	bh=capGskoZmjMJHMDq30MZgjnjSp0ctvHfRPAsE6z4KLg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bJA/b4q4k13X3gyyiNae7f4498AGyd+HylQrw8Cecqj4mwpf0PpHPUfSPCzPayBVb
	 XEVdPl3yMpZ5jPeQ1bor2ur9k+JQORr65Fop06IiHoeyTBav4RenuANXsna5dzktBL
	 ujU5Wtj8ouhPXpOmcjjZ0HwT6JqkinFjAXZX9Ypjv2qt0p6dKRzz3N+ADmX2FTncqI
	 lpZ70XzKlKUnkFuv/fI3KaKIVlFaCHzts6ysrfF30OSJ/95iS1krKhj9wj9R5uJgn7
	 Vxhura0Vf7nAzr71jGdFBuoNUTQ7wbwT62TyLHj5rTISaBnlnPltBLsLhFW0SC4Vy1
	 hCK/+ZdpgtmIg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Le Qi <le.qi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@oss.qualcomm.com
In-Reply-To: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
References: <20251009090619.1097388-1-le.qi@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] ASoC: Add QCS615 sound card support
Message-Id: <176061851800.55339.9213487570026484712.b4-ty@kernel.org>
Date: Thu, 16 Oct 2025 13:41:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Thu, 09 Oct 2025 17:06:17 +0800, Le Qi wrote:
> This patch series adds support for the QCS615 sound card:
> - Updates device tree bindings for SM8250 to include QCS615.
> - Adds QCS615 support in the SC8280XP ASoC driver.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
      commit: 6079165e6e027c03e06556ff3df0ed03a34d68f0
[2/2] ASoC: qcom: sc8280xp: Add support for QCS615
      commit: dee4ef0ebe4dee655657ead30892aeca16462823

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


