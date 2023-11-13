Return-Path: <linux-arm-msm+bounces-590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CF47EA3E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 20:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30132280E70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 19:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652202375F;
	Mon, 13 Nov 2023 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vGEzhC91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423867E;
	Mon, 13 Nov 2023 19:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E1EC433CA;
	Mon, 13 Nov 2023 19:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699904432;
	bh=Pku/AXmSkmETBoNY2XfS16sT2QpxqRxPSU/j8yciQ/M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vGEzhC91V07BOuK8Jbxel2UenXl9kJFd7nA88SPftbENAyZeJcErL7BR6g38rRobQ
	 tzPrf+hUjVwEcBqwtdQUMBdlVjo90V2wqukXwQFpzlTl9PVT1Z90AJ14ltvEHY5Ttg
	 wNYx2U9rASpyT9LAX2/H9JKMI1kkuROoa7FbbCEvVhUwKUcPs8+N3XvAONshd+tjrV
	 CejvZC7O6zxZFLNdCkzqBwEaodp30foC84rjldsbtmoaXl6DUQeJvirIuah6vsCEuf
	 eENr4GGXtokqYKW9/kvaSSiD2LwWzQtDZDYhEb9DmNm9HwUdJ2nBjRaDazhbt7HHQQ
	 Eb/pScxJSGhBQ==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Robert Marko <robimarko@gmail.com>, 
 Dang Huynh <danct12@riseup.net>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net>
References: <20231106-pm8937-v1-0-ec51d9eeec53@riseup.net>
Subject: Re: (subset) [PATCH 0/8] Add PM8937 PMIC support
Message-Id: <169990442820.3294075.3854725538330307845.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Mon, 06 Nov 2023 19:08:28 +0700, Dang Huynh wrote:
> PM8937 is a power management IC. It is used in various boards with
> MSM8917, MSM8937, MSM8940 and APQ variants.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[3/8] regulator: qcom_spmi: Add PM8937 SPMI regulator
      commit: c0d6b2acf78e3195a6b100a236210f2e6e42b0c0
[4/8] dt-bindings: regulator: qcom,spmi-regulator: Document PM8937 PMIC
      commit: f2b003c8235e0afed60ed426e891e41dab131821
[5/8] regulator: qcom_smd: Add PM8937 regulators
      commit: 18cc1cd011131d878be2619b56eff7bc2a278bdf
[6/8] dt-bindings: regulator: qcom,smd-rpm-regulator: Document PM8937 IC
      commit: 40e13ae67c6fc2897b49398d6f804b5d1ec63fff

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


