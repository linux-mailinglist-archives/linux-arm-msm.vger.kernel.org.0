Return-Path: <linux-arm-msm+bounces-79723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D8C214C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 17:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96CCA188DC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7272F12CA;
	Thu, 30 Oct 2025 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPWo7jGB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B72EDD50;
	Thu, 30 Oct 2025 16:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761843013; cv=none; b=qZwF5X9bzSN2fFgpontRKWAS7r1sauwPZ9+EXkCqleao9Y2b3MqEknCwSgLzfFUCCFWJZ81zW9LICjONfDxRm+Q0uaXfW0rw0CYgDDneZxwsz9YAxwORbhzx0IGUArVv0vlQyLWmdjMGdhxMrLyf9cyT/GPZlRfv1l0i85t60tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761843013; c=relaxed/simple;
	bh=wM6l7e3Nf4LcvVJrb3Xhd7nnE+R01eov2qbOdpkRQbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mWuQcvHtykDd4AWjw6Fjtj3Lba4AK1gHhgML44m7H5IVAmUTZt028CPcJZt3SOgB608wcLV2UtMTjwIyErlLXgvKoWNlzyOdfz+Z3sdQ4h0kW+cQx8vUVXwQajx7cmV4u5yWrHpo9MnsxI5irsSeSPxlo6BDd51iByPU0YV/MRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPWo7jGB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E90C4CEF8;
	Thu, 30 Oct 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761843013;
	bh=wM6l7e3Nf4LcvVJrb3Xhd7nnE+R01eov2qbOdpkRQbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mPWo7jGB0+RCc2HY/paQ5LkzfNA8fPPqZFC4DhvcTadifV1BuymYXSTATrSNgjjXI
	 bRPltFREqJEH/cSnaEzu1c2VpNa1pboTkxFmQTqAI5I4UAwt03pMAKvuUpXu50PbWj
	 Ghqr/ODrKHVUqQAR5TP/qBvRFqOUg48UhW70n3TO3fzrGClzwrTkszKqjdhi/wvbnb
	 zs4tzSiHxICMKqD2JIVAi+4z4l4fWo01tw/Kml5lTqA+K4C5q3r4FBLMzZTdXVIeIH
	 QnbZgkDuYolGufDsZwCqcSE5wI42N/wv3nVhTdLjUEjKm58UnsmqFb89uV2Zrv4umJ
	 pS0k3xo4SAgLw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, 
 alexey.klimov@linaro.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251022143349.1081513-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: sdw: fix memory leak
Message-Id: <176184301177.119935.14003591741907115293.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 16:50:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 22 Oct 2025 15:33:45 +0100, Srinivas Kandagatla wrote:
> For some reason we endedup allocating sdw_stream_runtime for every cpu dai,
> this has two issues.
>     1. we never set snd_soc_dai_set_stream for non soundwire dai, which
>        means there is no way that we can free this, resulting in memory leak
>     2. startup and shutdown callbacks can be called without
>        hw_params callback called. This combination results in memory leak
>     because machine driver sruntime array pointer is only set in hw_params
>     callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
      commit: bcba17279327c6e85dee6a97014dc642e2dc93cc
[2/4] ASoC: qcom: sdw: remove redundant code
      commit: d02460317ed9c95aa2c5f6ff1c70e22e1857d95d
[3/4] ASoC: qcom: sdm845: make use of common helpers
      commit: 5fa671232f703a404caa05c581411ea858c4cf16
[4/4] ASoC: qcom: sc7280: make use of common helpers
      commit: 8fdb030fe283c84fd8d378c97ad0f32d6cdec6ce

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


