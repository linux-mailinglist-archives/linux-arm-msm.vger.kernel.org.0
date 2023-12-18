Return-Path: <linux-arm-msm+bounces-5287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 590D68179CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 19:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 168C41F22A2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 18:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E438470;
	Mon, 18 Dec 2023 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjcEDaAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039A53BF;
	Mon, 18 Dec 2023 18:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFD9C433C7;
	Mon, 18 Dec 2023 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702924592;
	bh=WNf8F9zXgttnknR9y7un870J7gfE6CLByKjOwtpoarw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bjcEDaAavmdMZZuniq4WVZGOIbrPr2Mlyo/fJqIt3y+IydstZ9nSR1RlZUt0cqu2e
	 rGo6yH+JkrFxO2HkBili0OVGOdNXik0FTn2E0oEKOzzWJeRJ6D5J6B+ALycG1BEuUn
	 gOS4FjSSW/2ES0ej6RokFDjB/ck+wZfq1aog2V/d1PxPFq74q0ARoGPhN/xmXfHVg3
	 77pCbg4G4NOSU5bgbMgcqk/5GqpnMDq3Y9ogunj/thkajNhaLnpdV/Ud0ZfnIwjNC4
	 zslL8V0GZh1mvzGqyVUdmwIA69hovsw6ErDPEc5t4kKqvGI4bpX2Z1qAyQRE25svwB
	 S1/8m0xeuWa9A==
From: Mark Brown <broonie@kernel.org>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
 lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20231214104052.3267039-1-quic_varada@quicinc.com>
References: <20231214104052.3267039-1-quic_varada@quicinc.com>
Subject: Re: [PATCH] regulator: qcom_smd: Add LDO5 MP5496 regulator
Message-Id: <170292459056.106043.15339194789923887713.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 18:36:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066

On Thu, 14 Dec 2023 16:10:52 +0530, Varadarajan Narayanan wrote:
> Add support for LDO5 regulator. This is used by IPQ9574 USB.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: qcom_smd: Add LDO5 MP5496 regulator
      commit: ad663ce6780477177e301756ade6cf236f36ae4c

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


