Return-Path: <linux-arm-msm+bounces-2699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0A97FEDB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 12:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED092281C63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 11:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619243C09E;
	Thu, 30 Nov 2023 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgBsYjC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E7134B6;
	Thu, 30 Nov 2023 11:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F456C433C7;
	Thu, 30 Nov 2023 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701343393;
	bh=xr5JNGOp0U++yPhoXYwejOX8hAi+ZFtXqD6om/BbAXs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QgBsYjC3gnQPs3AasGVAnvSuquHzgencfpclZocgw0PS5jw+ivTgpbCiZ/6k0aHK5
	 SUYpH3O6+JfQ3+JWxx/Qw6VZQXj0XNVbU2sioRKindebyQPYZvZqzIZpS9oh2EZmPf
	 7c+vG9IIRth7yCInARzG/G6l3Qu8YrhnIDJZq8kyFb45hegD9Fo+MJGAqr/b+LAO76
	 PTHAzxjqO34SjuN5zf8kLo3L40505MdJUuxnMYo9I8RP1q9ceL6w7X1cUknIIFpXwY
	 OSMxUIKe+E0+6CtR+CoKTVOMt0ZUuSagHvr9+v/WT12kL8FQ5PTaTH8o+MTuKC8RFU
	 ae0uSg1Sk8sCg==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Sanyog Kale <sanyog.r.kale@intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire
 stream runtime
Message-Id: <170134338891.9221.12703514760679769792.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 11:23:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Tue, 28 Nov 2023 17:56:37 +0100, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoC soundcards will need to allocate Soundwire stream
> runtime in their startup op.  The code will be exactly the same for all
> soundcards, so add a helper for that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: Add helper for allocating Soundwire stream runtime
      commit: d32bac9cb09cce4dc3131ec5d0b6ba3c277502ac
[2/2] ASoC: qcom: Move Soundwire runtime stream alloc to soundcards
      commit: 15c7fab0e0477d7d7185eac574ca43c15b59b015

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


