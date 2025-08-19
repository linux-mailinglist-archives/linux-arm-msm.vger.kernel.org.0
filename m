Return-Path: <linux-arm-msm+bounces-69822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1ADB2CD47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 21:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6DB03B02BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 19:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDD5342C91;
	Tue, 19 Aug 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skQp/BYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CAA342C8A;
	Tue, 19 Aug 2025 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632825; cv=none; b=dIXu/AbATERC+unkPsaZrO0iftRM82x5cAY7o6ZlKIKrw1TQNJ5uC+ZzCswcRjBCDasJru4xQfsvHtJUpefwjxD+KmDuovzgX+3nW3V256wVcU4pk62y2ZOireXnvCeQY3myxUIUzDLBnHvkpqpre+p51NNjk4dzdM0Cd7tMDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632825; c=relaxed/simple;
	bh=GBfKF09b+2epbMEdIrT2YbBaZkiaw3OQUA9l38qNwao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j7ysj1X1iBzRAr23W1pgXFftZpQ1AhdEciiPfmumHxbpiwKsFX+YJ6mfoRD02t8QmN6xiGn0jseP5EbuatEyUJrIxmIqGP992m8xDG9vW2Y6ONntMSoJINwINsE6JE46zxJLzAJBxUegJB18p9nTc425DVgdjovc+41jsCgnK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skQp/BYn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9553AC4CEF1;
	Tue, 19 Aug 2025 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632825;
	bh=GBfKF09b+2epbMEdIrT2YbBaZkiaw3OQUA9l38qNwao=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=skQp/BYnFUDamCUbt3/js9qmrDslC4xa42rmqRSumsDLhIlG9ndB/iarWNXhW+hb3
	 0il1DgD+1XfXDL208xqAt0Oa6WeK0zEwTw/kKaA7hZTFeLTnQfz/PcSMIDqP/H7cwI
	 b+wn67xRHPVGuqo9aOKBEKXEjD1U0ZmfJks/LfabnuozCNYjvqRDmhmnOwc3PeGRIk
	 8NIgik49beEH2vmTfBehrvXCbVCoFjt4nUX+0cEqsNFzhxajg2MiuwtRCgYiqj1/l+
	 5N8oo9HGLd2h9Hygs9Hrzf6fbVqmIFN/pVEaS3LBiIWtqF9YWX/N3tcGvsSVJnIcPD
	 yUEWp9lAJPeNw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RESEND PATCH v4 0/6] ASoC: qcom: audioreach: cleanup and
 calibration
Message-Id: <175563282335.270039.7788680159319198523.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:47:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Tue, 19 Aug 2025 11:01:45 +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> Sorry to resend this series once again, as some of the patches seems
> to be dropped/rejected by email client from previous send.
> 
> This patchset:
>  - cleans up some of the audioreach tokens which are unused
>  - adds missing documentation
>  - add support for static calibration support which is required for ECNS
>    an speaker protection support.
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


