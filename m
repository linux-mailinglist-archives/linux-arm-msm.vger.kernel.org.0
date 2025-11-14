Return-Path: <linux-arm-msm+bounces-81909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EA1C5E71B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 18:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552A73BBEE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64645335BDC;
	Fri, 14 Nov 2025 17:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMXldhH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280E3358B5;
	Fri, 14 Nov 2025 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140005; cv=none; b=WhEEuBJ65sx6Vpl5RDfwsvTprm33dzzXN7hKAiRiI/6ZFJsH7gIU2uYHAhTa+YOASHPz/gB/hwlDpBpOTFmyJFwC2c32w50eqWtnXf8ODSFIogAeJJVQMkSbdfR9n+oHCSjGIqLSot4t5obWS2VVEdO16fL+7RacZdnMg7Sz8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140005; c=relaxed/simple;
	bh=Pt5FGeKi4jvA6cfiV7J9wEvTenimivj94cYmaDpeApg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iaEvnw/r8QcWtg+ykqiK4zu6dy8XJiJY/XVIQGjhVh0kYb5Hnuh37Bd/2IqqV3W7q7aB3h7zMgT+8v1tMM9Y3IHbBel7orIMBiJ7Zy2gM7rdq3ztkqbG9LDUXCw8rcdQcQWFkF/GjnR3h2LbMgYKfIdf6ba8wDlqcW0GrBNb8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMXldhH+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ED8C4CEFB;
	Fri, 14 Nov 2025 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763140004;
	bh=Pt5FGeKi4jvA6cfiV7J9wEvTenimivj94cYmaDpeApg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uMXldhH+QZZhA+enmWimEwT7tJZcaLgdcdX5M7M7K9A1T9qy+WMCHjjCgBLT7AFHw
	 9zUrWn0FEpuiwgR5iH+Rf+2WBWMvTSuCjhbyosJxLV/bScjF7O9psFqjs+Ee6EVo7P
	 SIMvGJg6BzcHViC9uN+cY1lFBBx3yIWY3k44RxAzMdtVSNPTtqA7JSd0sTdWoG5Yha
	 upRmPe7zqIQJC3nPOXW4qGYoZjsU+PWvK9H1UfVvKgdSTkWyWSpIDiYTPT0rbQmXc7
	 +CTQd9+tqjO/4jKLVLEyOymDPQGXl8KfMV3WvK+YrCvDitLoeSDqBVfECKJ9Nd2cax
	 kzs6lIGx7r5IQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org, 
 konradybcio@kernel.org
In-Reply-To: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031120703.590201-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] ASoC: codecs: lpass-macro: complete sm6115
 support
Message-Id: <176314000202.179998.8192520322222862009.b4-ty@kernel.org>
Date: Fri, 14 Nov 2025 17:06:42 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Fri, 31 Oct 2025 12:06:57 +0000, Srinivas Kandagatla wrote:
> This patch series fixes SM6115 lpass codec macro support and adding
> missing dt-bindings to complete support for SM6115.
> 
> SM6115 lpass codec macro support is added partially and broken to some
> extent, Fix this broken support and add complete lpass macro support for
> this SoC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
      commit: 7c63b5a8ed972a2c8c03d984f6a43349007cea93
[2/6] ASoC: dt-bindings: qcom,lpass-rx-macro: Add sm6115 LPASS RX
      commit: 65d03e84d8b8e42cf4636fcabb81c9b130cec710
[3/6] ASoC: dt-bindings: qcom,lpass-va-macro: re-arrange clock-names
      commit: 5a0438622b49df1e723960ac9c0bf75e04370fdc
[4/6] ASoC: dt-bindings: qcom,lpass-va-macro: Add sm6115 LPASS VA
      commit: 675f41b8d1675d9a51a6dcb978ff76b95cbb4b92
[5/6] ASoC: codecs: lpass-va-macro: add SM6115 compatible
      commit: 893e2fd509e968cc1d76caadee0f5d2f2c72f137
[6/6] ASoC: codecs: lpass-rx-macro: add SM6115 compatible
      commit: 8ff3dcb0e8a8bf6c41f23ed4aa62d066d3948a10

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


