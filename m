Return-Path: <linux-arm-msm+bounces-64815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DBFB03EFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330101897A9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:49:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC026238149;
	Mon, 14 Jul 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vowa25Dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5F61FAC4B;
	Mon, 14 Jul 2025 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752497359; cv=none; b=Kqiit943OhWEidzjSXS0kPjbOyAetB4zeFG1IspcAElxTbd+N33YFKt7axDikRbI/VO2jIXWZgcmPVDmP3kd9ZE2v2u3l+g7y8MRsMbdoYTOBym2k5GHPw1rqUIrTJwp9mFbjpLujv91k0d9/dpZAZa9qtE/HHN0jSSrOKu7oO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752497359; c=relaxed/simple;
	bh=N/f33CMuyRsXcRqpNJ4vLf0/iLZImvju1Ttk7ZPo+h0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IQTVOFlUQ9lFp2PH5kr+YoH01YkVlWh43nH7/bSMCNWjgRKoKbfwyVnnPCOGK10nLgVdH9o5NHJ/IOfy21xm1tRGOKq53Jb453AUAJBB3al4x9p6LrS2noCcuSRLfLhRogIVpgYForqUUzKL6vb1Szf5x/Xk4YbFc7b0UySAmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vowa25Dy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FD8C4CEF4;
	Mon, 14 Jul 2025 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752497358;
	bh=N/f33CMuyRsXcRqpNJ4vLf0/iLZImvju1Ttk7ZPo+h0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vowa25Dyn4V4MtBTE6oPxFRnat/0qvi5nuhad4OSsQmMyoi/kr7GyCyTptTELd1Yt
	 +wsIy8b/raueJ0wEnmuHhQGQz5M1WvzAcFdnyNNqX2MWMU6yl7TyAaaJ4UMk0m/U1D
	 wZoXCBBay6R5Mt18mqlOc3edy7oXqvwrfSs0ozKJw5Zf2yfi13BtR2s0WZs2cJ8rAC
	 scaC3QR4OZgeYlAFMVgk2d3Bl614J1TD0Q/jVfBwEKZW8nRPuLXGxcZlHh8pa5tM9D
	 6p4H/AbO8JCgoA0o+9WyX2qH8ZZDiixYzTahWnM5F1ArJ0Jfijsc0FSVug+f74XHP7
	 J2yR9YO0gTHnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
References: <20250711-pm7550-pmr735b-rpmh-regs-v2-0-bca8cc15c199@fairphone.com>
Subject: Re: [PATCH v2 0/4] Add RPMh regulator support for PM7550 & PMR735B
Message-Id: <175249735528.52337.17952107558438792594.b4-ty@kernel.org>
Date: Mon, 14 Jul 2025 13:49:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 11 Jul 2025 09:28:38 +0200, Luca Weiss wrote:
> Document and add support for the regulators on PM7550 and PMR735B, which
> can be paired with the Milos SoC.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] regulator: dt-bindings: qcom,rpmh: Add PM7550 compatible
      commit: 729ff4a936c6f3faba78aaa8bc4291b6477c6576
[2/4] regulator: dt-bindings: qcom,rpmh: Add PMR735B compatible
      commit: 20a01de0808364c26836cc8f47ed3b59a40a927d
[3/4] regulator: qcom-rpmh: add support for pmr735b regulators
      commit: 28758434900ff4c4dce4e104fb5982ef3c0141ba
[4/4] regulator: qcom-rpmh: add support for pm7550 regulators
      commit: 3aa47d2ec83316c24e1ed15a492b331802dc6a69

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


