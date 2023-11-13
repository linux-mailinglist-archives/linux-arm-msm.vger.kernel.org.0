Return-Path: <linux-arm-msm+bounces-575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277C7E9E10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 15:05:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D80280D9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 14:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786E020B35;
	Mon, 13 Nov 2023 14:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OkhPOVvZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BE033C9;
	Mon, 13 Nov 2023 14:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7504C433CD;
	Mon, 13 Nov 2023 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884334;
	bh=6scqCP6KmruB1FI722uEIB9ZpX+PcxEvio8fakOFAAs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OkhPOVvZL0e1+6pkDkC6APCiOoT0QgxMKALIXRTsYat/zRx/6GhgdJAbvl1rRAjfF
	 MyzIFpgo262OPgoOcV31zr6ClN2eZvZwF2mnc6vnPVevUYpk9u3fh1KDhGzgW89/aJ
	 xtMsCZKzvJkfr2rLK/iGu8VJkermAwCYGLUsHNF/b+la7oJT/LOkTRmBhjyk6JuX27
	 pEt+i9AOLvDMCRr7U5o9QLL6yFa0bDJoPfzCuFLcHX8nOZEC73lvzBrjEIGyexGV51
	 vJ+uOEn2RkJMw6ZXFJimhZDxLUdXUh3IlO3SbN9ZUi0HBbrsY1fN2akwAPC4lAAe5q
	 e5qNgMX0h2aZQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
References: <20231106180422.170492-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
Message-Id: <169988433104.3280890.1283507627992945147.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 14:05:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 06 Nov 2023 19:04:22 +0100, Krzysztof Kozlowski wrote:
> Add sound card for SM8550, which as of now looks fully compatible with
> SM8450.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: qcom,sm8250: add SM8550 sound card
      commit: c239b79315167d3e9b4b1e537b00e1ff5b87a317

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


