Return-Path: <linux-arm-msm+bounces-27288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A64BC93FC45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 19:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EE0F1F2185C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 17:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62B3189F55;
	Mon, 29 Jul 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWRUWMIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCC818309C;
	Mon, 29 Jul 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722273465; cv=none; b=g6WXoNvfQy7yNt4ClUXRGPh4VIMwhYUG4Vw05C+7ciy0jQLrk7DXDbkXQPSULXeeR2Xs7L+QgPml8qyTewUNZoTrzcC1m8WsdFRwwlWgSSzVvDyXe+FMHlg1ydlP5fo+yZEFCOjVD2PtFNVWEkqKwWQpOe7UfllYrofNs8sd5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722273465; c=relaxed/simple;
	bh=PgElLeI3tFPy/LsURTvcVNpZeWCApAcr+hd4F8EhJ/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FSbJS/4Efiw/HXvu9H+TjkoNUdkMkjJNaAyhDdvzbVAcJM+VuRZGKAaUqQQUP8G/vHLH2KV8Jn+kUZhFOje6efJqQllqh1tfMfGc7zZSbjMVIsjoqWV/rfmkLXMCckEJGTD5sCkxcVORCKzIt6GnUoV/yVnLwGcoUileLn7XFT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWRUWMIQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E468C32786;
	Mon, 29 Jul 2024 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273465;
	bh=PgElLeI3tFPy/LsURTvcVNpZeWCApAcr+hd4F8EhJ/c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KWRUWMIQdA/RvQwuPlYCs6Dtxi6qaZm+SsgMtmWr9hwxabdg2BhDaq4EMijH4kec9
	 V8hzV+g/HVG7F/57DtSm8Fl4vBcTuBd7vqtpCkkcBQIcxoDOBiLovpgI1qJeouFh+b
	 5dXSd8cOxY85kyj39TZ2lN44hOJyOcnOu4derSo0Ed7M0wpYE2Q2pLJ3ih+3lbdM0n
	 Vd7NvZvH0njAY6a3nvIaIjV82lCgXglUix9iuOXleR3bxbqDPU8gs5la2vl48mM4Jh
	 gBb9+/Ob/cFZdVOH6yh9uuM3RXdT1YP6CvguuUW8+BzMPH7zeTIlTWclAoQsihafT5
	 k87n9fNRU9JlQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
Subject: Re: [PATCH 0/7] ASoC: codecs: wsa88xx and wcd93xx: Soundwire port
 non-functional cleanup
Message-Id: <172227346318.109775.1944723976181257603.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Thu, 25 Jul 2024 13:23:42 +0200, Krzysztof Kozlowski wrote:
> Few cleanups to make the code more robust or readable.  No functional
> impact (compiled objects stay the same).
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: codecs: wsa881x: Use designator array initializers for Soundwire ports
      commit: 874d04fe15d12cafa09dd36e8555cea4eb0653f6
[2/7] ASoC: codecs: wsa883x: Use designator array initializers for Soundwire ports
      commit: add41ea55060d5e41d62268aa0bda2a27e0f5053
[3/7] ASoC: codecs: wsa884x: Use designator array initializers for Soundwire ports
      commit: 125ed86b0d669334dbc567f441d10163ff0c44bc
[4/7] ASoC: codecs: wcd938x: Drop unused defines and enums
      commit: 06fa8271273d8181cb8727e63aeec3f87a48d8c7
[5/7] ASoC: codecs: wcd937x: Move max port number defines to enum
      commit: 42f3a2caf80910d0c251b2a407d4d220c0d3a79f
[6/7] ASoC: codecs: wcd938x: Move max port number defines to enum
      commit: 5e388488f0a1dd6d340f3925e7b371e212ee3cc2
[7/7] ASoC: codecs: wcd939x: Move max port number defines to enum
      commit: a9d843e6b231e550f8141f27e930f90ded4edae2

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


