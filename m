Return-Path: <linux-arm-msm+bounces-77769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5BBE885D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 14:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 395564E233D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 12:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81912E6100;
	Fri, 17 Oct 2025 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGtgxx/k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49F6332EC7;
	Fri, 17 Oct 2025 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760703170; cv=none; b=GOAAjltVFGdWEU4HU60H+AU+V5R+nksa3QTVF9LIKlv+oax4zSe06Qb7EaeDfRa/C4hWFn9bfbUulBD0ESr+dXFU3EF/mXesTrwgCIj1WGb5GvzuZmh8cnwxUyH7mo6FyS+meN7L3kmuvpdgejRa5l9CDqpJ+xGDP3Q11G8hUsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760703170; c=relaxed/simple;
	bh=I2FeStt9KQh1dR02AO/r46TmWMipSTAJl+L4OO1SPy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TOoRqeWLuNL4wc7ck1iF3InUu68NA8XmoaOh9/8eo221Wsi9PVgxSwwAyLwB2OWqfJwkqcwnJn7AeQn6JgxfMU0c5op001BudIP8mMZs2399t6n3AqThTIFMebBY+147Z+801c1FXtG4FoMOlLaHVdotg32wHSXBSxuDaasFXig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGtgxx/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7127BC4CEE7;
	Fri, 17 Oct 2025 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760703170;
	bh=I2FeStt9KQh1dR02AO/r46TmWMipSTAJl+L4OO1SPy0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UGtgxx/kQJlxQpwJRo2XeNaXEwRtE2kw+HG6N5OKMWbpFwNZ6GxTkHmKky6uErPNQ
	 5VZuhfcXQ21eLkGY+FFGbs7SPYeneL5rS/XhoVwNpe366D/d17MPkM8UzjJ36k0kav
	 YFchKx6L2oeg6V/c5Q6wLYqMfwqaAOrDliZk/fODZgMsnpYN9jNWspX6KJkNJGir5G
	 tXSHHpXjZY6Iax4sLzHEeQ4WWMAw6mBUm8vZKQui2/6U2g2vTypnz+WMthyFjNYVJK
	 DIzNStyZ1pKpIXcoAt6XeIqCwq9a6hyzRUapncGStl9ekdFhYRkQNpN3LXxaOeRBup
	 qwvLMXo4lL1Fw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
References: <20251015-knp-audio-v2-v3-0-e0e3e4167d87@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/5] Add Audio Support for Kaanapali MTP
 Boards
Message-Id: <176070316717.57228.1650379945743030609.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 13:12:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268

On Wed, 15 Oct 2025 13:27:14 +0530, Prasad Kumpatla wrote:
> Add audio support for Kaanapali MTP boards. Introduces supporting
> dependencies required to enable audio functionality on MTP platforms.
> These changes have been validated on Kaanapali MTP hardware.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: va-macro: Rework version checking
      commit: 281c97376cfcfc8cef4f5ed5dd961a1b39f5a25e
[2/5] ASoC: dt-bindings: qcom,sm8250: Add kaanapali sound card
      commit: 367ca0688e4218e51c3d4dfdf3ef5657a62cf88d
[3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
      commit: 4673dbe9837e3eb2fecdd12f0953006c31636aac
[5/5] ASoC: dt-bindings: qcom: Add Kaanapali LPASS macro codecs
      commit: 15afe57a874eaf104bfbb61ec598fa31627f7b19

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


