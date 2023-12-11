Return-Path: <linux-arm-msm+bounces-4243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE8E80D10F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 17:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 140351F20FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 16:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1842A4C62C;
	Mon, 11 Dec 2023 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IhwDGvMD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C724C612;
	Mon, 11 Dec 2023 16:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A08C433C7;
	Mon, 11 Dec 2023 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702311610;
	bh=tgoKaQNovHS9RWp3+K6M2LkRytAhgXwHG6PjpqOenpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IhwDGvMDayZhO/ouKOmDaaOJzNx/xwMIjs9YhcTCcKs+t6IObyGFBnqQRsygnWr3/
	 g8LzhS5VFgM9/a6Dce6Uqb/y5hcsD/2R2ap+NbMQGlvJjQLhjbPNJhppNcVSCciB/p
	 YDlLzd8uaya95w/+DaKbPa55aUs7hW0YF1bx49uOY4HFCG7BbjKNGpN808LQ0EZOnP
	 4FgU7ocVEVgoDDxqI0DE5Uf5KKImlv0jsMu9OZpuxGPCCa8fAL9Hsk1uTR67sGVzpr
	 pRSmAieOqPpI3s4IwjjaxlyX31RaEMJa1bdhhOfpeERwX+9iNrSoCpHy+3JQU9Ish3
	 f9k5ov4vq0YYA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650
 LPASS RX
Message-Id: <170231160677.85457.6870068020415164910.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 16:20:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Wed, 29 Nov 2023 12:30:11 +0100, Krzysztof Kozlowski wrote:
> Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
> macro codec, which looks like compatible with earlier SM8550.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650 LPASS RX
      commit: 0bfa20b18acbcdd133d41e04e07a2d78bcc04bc5
[2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650 LPASS TX
      commit: 5a5085c9ce381f92399c755be6deaf1d76ad57e8
[3/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS VA
      commit: f243ef746d0ace20fe092fc1ee9987ecf003f7a4
[4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS WSA
      commit: ab8921e1da8fdca14192c44775151f50c1cdb763

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


