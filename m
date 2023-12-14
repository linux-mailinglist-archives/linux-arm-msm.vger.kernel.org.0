Return-Path: <linux-arm-msm+bounces-4784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 865458135BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 17:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B89031C20C21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 16:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117BF5F1D9;
	Thu, 14 Dec 2023 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qInvvByS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79595B5BB;
	Thu, 14 Dec 2023 16:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85324C433C9;
	Thu, 14 Dec 2023 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702570160;
	bh=BtuX+LpIHpPDBUaCyCsL0E10EY6M/BLs3C/xlRTLU0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qInvvByS98yo7+5vVUjNAWfHGwpi9LfLFaIJ7qe5JFHRkzsc4kDKIj+NBMmjc3n9y
	 xiVay+M9u52dj6grCGdtbCtSTENlECHmW9hPyF1GUpMWH/+gUP3HwZcdrl4OeB9JrH
	 IckheFu8KVQoVXK2MMJxzs3n1R0R5jmVeI19Zi7qlOcZtEW87kyRfcwS7GHp5y9NqD
	 lMVZFxEWsoAU1A7SN7gm8TNFHPSctfI+NEkugpvYqneGXQ0dfPUJPF7lKuDR+LU154
	 q4TPCtPHk81eQ7rPrGZO0n/jfenHspUt8IbHIQrrFtfVQQTYkelHTlkv990dffl6CF
	 uidRNr7/WSv7A==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com, 
 quic_subbaram@quicinc.com, quic_jprakash@quicinc.com
In-Reply-To: <20231214-pm8010-regulator-v2-0-82131df6b97b@quicinc.com>
References: <20231214-pm8010-regulator-v2-0-82131df6b97b@quicinc.com>
Subject: Re: (subset) [PATCH v2 0/5] Add pm8010 RPMH regulators for sm8550
 boards
Message-Id: <170257015715.68407.2531628045925276337.b4-ty@kernel.org>
Date: Thu, 14 Dec 2023 16:09:17 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 14 Dec 2023 10:59:10 +0800, Fenglin Wu wrote:
> There are 2 PM8010 PMICs present in sm8550-mtp/sm8550-qrd boards and
> each of them exposes 7 LDOs. Add RPMH regulator support for them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/5] regulator: qcom-rpmh: extend to support multiple linear voltage ranges
      commit: 27591ea2f7751223e79fa41f11bf687777a38399
[2/5] regulator: dt-bindings: qcom,rpmh: add compatible for pm8010
      commit: 638baabe951eb16607b7e4bb197998562afd57a6
[3/5] regulator: qcom-rpmh: add support for pm8010 regulators
      commit: 2544631faa7f3244c9bcb9b511ca4f1a4f5a3ba0

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


