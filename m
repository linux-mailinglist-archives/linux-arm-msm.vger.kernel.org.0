Return-Path: <linux-arm-msm+bounces-69820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CFB2CD42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 21:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C98F61C28580
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 19:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B77C30F7F9;
	Tue, 19 Aug 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2x6y5u0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49F325A34F;
	Tue, 19 Aug 2025 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632820; cv=none; b=u0ybYZRaPYmZzCEerRlWQmgy6/3uIfFWJrHARY1KbJgdqCpsObLPO4sIi+NiXW+oWQ8+wnkIyn88eo0Qo+jtTqtvNIIvOKKrvq3MmqT2JiafC1yNrh0mukcOXNiXzrA9JjXdf2xJW6t4y4YtixrVLlNHM3vSKBHmdiZ8gal+R0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632820; c=relaxed/simple;
	bh=zjsvWOjFJwzEISD7/TnWq3ysj6+L+RhzzIvzDdCnXJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U2XEQxhwnkY1Uw50kSyDv+czTggtHKqPM+T6474bn59pzCqAOjgXCd3BYvYBINC2Q9BeEKtSvc7To1TRlRyUW4ldP84cKpIsXzl54BudYhc5hrKOZ07/BASvdOnt49hx27YCIJGTKMJ5g5o9KnGAytCAfvFPrrkZCFFDp4cmUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2x6y5u0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5C4C4CEF1;
	Tue, 19 Aug 2025 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632819;
	bh=zjsvWOjFJwzEISD7/TnWq3ysj6+L+RhzzIvzDdCnXJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K2x6y5u00YF/HE2NztJGI7o1vqCSW0B9zOqzhEX54FLTUPu0ogNku/pf0rlGk3Qd7
	 gQz3Btvy0kY34rcf7jDUtfqo1b08FTTCDXeFyhb2sd1R0y3q8aVgV+A51Cchp80xjN
	 m0Lznn2pksHONzkOq7hr1hB4dsF9snBCNUED5FecWjfZSE9wFMow1s1b6uoaJU7ZuP
	 A3/CizjfB7b4eKOSOLjNSAMwc15ThTXseg0tehISoK7sI4AZvgEamkhbZAs2vSJbLL
	 OvmKRBTR8M1P+HnKYukhskviI2D7VWRJf8QE27a/ZRcbwfEaAdqc2fNaWiaQU13isw
	 OmzmmCCd3A4Cg==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] ASoC: qcom: audioreach: cleanup and calibration
Message-Id: <175563281751.270039.1018203120207920690.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:46:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Mon, 18 Aug 2025 13:50:49 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> This patchset:
>  - cleans up some of the audioreach tokens which are unused
>  - adds missing documentation
>  - add support for static calibration support which is required for ECNS
>    an speaker protection support.
> 
> Tested this with Single Mic ECNS on SM8450 platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
      commit: 12cc0ff3cdd95f2bc0ffdc63bcd9da231eb33199
[2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
      commit: f07b81b573b28e5cae5c1482001ad0d6c0b7c051
[3/6] ASoC: qcom: audioreach: add support for static calibration
      commit: c7ed4c2debfd192f6071f4ab33c092d419abb941
[4/6] ASoC: qcom: audioreach: fix typos in I2S_INTF_TYPE
      commit: 0f5787df78799c7c8a7dbd2de5ff15250d8d3a4e
[5/6] ASoC: qcom: audioreach: sort modules based on hex ids
      commit: 97a719fe7d7001d361490b44985f8b4c7ea6ef98
[6/6] ASoC: qcom: audioreach: add support for SMECNS module
      commit: da9881d00153cc6d3917f6b74144b1d41b58338c

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


