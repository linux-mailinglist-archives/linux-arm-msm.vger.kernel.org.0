Return-Path: <linux-arm-msm+bounces-28629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6D952F72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84421C20C6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F3E19DFA6;
	Thu, 15 Aug 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz+3WBKP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D031714AE;
	Thu, 15 Aug 2024 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723728763; cv=none; b=tlO92MA8krggAeYBfUSbksRz/Xi3+U8XGSm2f27Kp0OgxJIWJduZkmESPQa4NYKqONLHLh2r8e+OAWEX6/+TkhDT6WoNnbBXt/czlSXxt6LAj4cZH6mPpEMER3WRpABORnsMRIfGniXkDRH+IdfKn3HKD6vpqm0O35vxzYKCwAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723728763; c=relaxed/simple;
	bh=DK7p6Hi4z0x9zpCXYWf5u9eW0rFFXTc71hq6Bw4Y/bg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c9WXsK5Vv5H6CYSKUlAB/Gdn2vDVtQetD1Br6yxDTo/XZM7+p7MeC57x/QrlgLYrv9amIT7SdceovwREMPUD1rsKNjZKIpoFT9fEqls+77QLePmjfVcCdonO3Hp5jxqwA6ul0b9Td3/xt52URhT75IkmHbfAxu+Lh1uPP1mGScE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz+3WBKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F77C4AF0C;
	Thu, 15 Aug 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723728763;
	bh=DK7p6Hi4z0x9zpCXYWf5u9eW0rFFXTc71hq6Bw4Y/bg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Dz+3WBKP2pNfh3Uv9+keP2qYeWlxENhxKPaFA+kwWRmHnOdp2vPj/tu0TUvC3NfLY
	 rcDUSM9VSqJIUP+Abk38/zyNcZInXF3wTXobxIsXdZAfe9WcWbOWdZhX9MbEU9KDSw
	 2QHFP3pgcA0KrM1nU2vTlxoZdW3BLO8wVyqOtZWf5UzgZ1TSUcsnmsjSUekY/7xH4v
	 CeUeQSkMAZxoxNFfr6xCuXuhIBi54NEhkBUjg4Pbu1FI9hgrypQ3v33mRpS+VaxbL8
	 lp9bk2tE3BoyAA8l2JjYpilU5BB3eb33BO6IFwuPRfVmMO/wgu+FiMOG51Rcq+uFOq
	 IGDTXfIgd3D5Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20240813185827.154779-1-brgl@bgdev.pl>
References: <20240813185827.154779-1-brgl@bgdev.pl>
Subject: Re: [PATCH 1/3] regulator: dt-bindings: qcom,qca6390-pmu: fix the
 description for bt-enable-gpios
Message-Id: <172372876138.37563.7896512013547080088.b4-ty@kernel.org>
Date: Thu, 15 Aug 2024 14:32:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Tue, 13 Aug 2024 20:58:25 +0200, Bartosz Golaszewski wrote:
> The Bluetooth module is obviously not an ath11k so drop the word.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: dt-bindings: qcom,qca6390-pmu: fix the description for bt-enable-gpios
      commit: d275e9918cc01d27ab511e5dbf2aafc1e782628e
[2/3] regulator: dt-bindings: qcom,qca6390-pmu: document WCN6855
      commit: 2416d2f87be431d98b2b05137fcd1f4da9a83894
[3/3] regulator: dt-bindings: qcom,qca6390-pmu: document the swctrl-gpios property
      commit: 39b8cb4e1b51191dd0da03b77fbd8b2a2e3e7645

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


