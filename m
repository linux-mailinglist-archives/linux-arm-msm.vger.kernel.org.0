Return-Path: <linux-arm-msm+bounces-24334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A57DB918A26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 19:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D711D1C22E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A8E17E8EE;
	Wed, 26 Jun 2024 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4IYeIuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F2514532F;
	Wed, 26 Jun 2024 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719423119; cv=none; b=qWticggmhLD20RcHoMcXSdrUxdA2ean0wS1yrbd54FGc203YtZTY7zgD2qxppUcOfqryKrViMpudhklos7opf+S+JZ83HsZpRlngRpDgJySrxHxAZIjEsFPk1D9xYojV0bpJzQScyaCx2UrslWefDEjFTWWaEyah6tCSkfhCWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719423119; c=relaxed/simple;
	bh=bgYoAiD8CvH9vNhk+zX4YQSH6S0k8Ew4gkWwTOzazV4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RvjIVWcDSXonQgWilRqttUIWs6NgNu20AV0JDRQZ3dofuzrLjHBy8KnvPpK4gTpDZilHzDE4ljzyZkjBLJZLwhsyyFMEJYnxWWG7KVSB6kgMsSghyw1PLhUSwbzHSYiSeb9C3txZsKwJ3h+B92z6Yg54/zsmfkjZT/RNQ7qv1Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4IYeIuC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58F0C116B1;
	Wed, 26 Jun 2024 17:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719423118;
	bh=bgYoAiD8CvH9vNhk+zX4YQSH6S0k8Ew4gkWwTOzazV4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=g4IYeIuCanVePZMW3hpekPLgDETXrfYnffoBGXTrlwF/6BGz36iUjS+LdkXK3hPBB
	 cYALT+KXvBQkQva4NbbbsR4rgk27cpIFfMEZsGtaPQhVUjyVfr/LN158o25/Bxefzt
	 n+kuaxvXvn4JIo+PgfdLy4+PbsAI94WNs/GB6tqe2DuBuwwABIC/r2HUoO82pXqaFz
	 ODzJhB0ZMzvp8ZphOjuNWZvn1UzR7wQLFx60ByPlFsq+RIu65GA33vkLx2Ovjlw9j8
	 w+NuHXpFCtvsGq2jqRX/Dvb+CwK8Rd52nkbr9FkTB+5qvvhWMM14qDKt4/vdMnqNM2
	 oCZljRXuPIE3g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle
 unknown version
Message-Id: <171942311637.1650281.3350190675006482081.b4-ty@kernel.org>
Date: Wed, 26 Jun 2024 18:31:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Tue, 25 Jun 2024 18:57:35 +0200, Krzysztof Kozlowski wrote:
> Qualcomm LPASS macro codec driver parses registers in order to
> detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
> we know that there are earlier versions and 'enum lpass_codec_version'
> has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
> version, driver will use random value from the stack as the codec
> version.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown version
      commit: ebc1a54051b58d1aa3a8855faac8bf16b88b8af7
[2/2] ASoC: codecs: lpass-macro: Use enum for handling codec version
      commit: 06462d6f3fb3c445b5abac7b134d9fe9e361113f

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


