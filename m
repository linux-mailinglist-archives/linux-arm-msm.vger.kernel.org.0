Return-Path: <linux-arm-msm+bounces-23777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9E913D2A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 19:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436A828351A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 17:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85EB6183093;
	Sun, 23 Jun 2024 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq29rr7T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D253C38;
	Sun, 23 Jun 2024 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719163305; cv=none; b=DI5gll7Y7F9btiAsYG2dTWiHdg7XDECJ1sPXr2ZZL8h1ZJMougPiD6MbKmioL8Z/YmNhLxz7G6N0mwNv/Lph5rHk4guqFTmvdFyKzfGNtZEFSBx2NgGz/Mf/I3AZLwcq85o9acgkFq2XMbvASPSXnVbx/9hfKVZTcXLmT9YwGqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719163305; c=relaxed/simple;
	bh=lCnpI6MGZ7tqlfHmo6/4lQWWdf2FV5VM4Utg4pbRtes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R9BB7UdOzwdIe1jsOA4g/PM7IRMKrYY1C0hnOrzz4/xmwFCOrMZMnQnzygpF2pr4v2q1A6Gnix55qK3eXkl2SKcYXTOIccm1ql9D6arDqJsKHmFzXqTbs9CQTsm5cSlWKQKdtiO/Q5WlJ0s8qxi5NI3gH5Py5gKiTeiigro8Spg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq29rr7T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0B4C2BD10;
	Sun, 23 Jun 2024 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163304;
	bh=lCnpI6MGZ7tqlfHmo6/4lQWWdf2FV5VM4Utg4pbRtes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oq29rr7TfplWGhY9I1T+8UTDsjBlfbhLmKJ7zUn3d0nl0sFWwQ9rm1i32rXS88P50
	 pDH5bAODX1/zGOYQrfMwGHNqB4PMZWM1iUciFte8Lr1rYB9Nr9AwcyzWHDtzg8o3aF
	 oD5CSz1kOWjWXCA/kODq3SNggZYLkHpEafY3EnU+QoxsJmp2n8LV+kMzPwefc7KULw
	 WCX8+Mh2E0AnpmTMkrHtY8e07kUvbjrWtbpviTfXD4hCjFQbKBIIPHqWYT6Fj4z3ZA
	 KUGjfSv4qOiHVchYVQJH+LSPo9t9AaSPetUaj2qZLA4HgABFyYx8qbR6yTBsvPDXcW
	 HZAixc2ES1KLg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
References: <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
Subject: Re: (subset) [PATCH 0/6] ASoC: Few constifications (mostly
 arguments)
Message-Id: <171916330129.350242.13312693360705760410.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Mon, 17 Jun 2024 15:03:18 +0200, Krzysztof Kozlowski wrote:
> Make few pointers in ASoC functions as pointers to const, so the code is
> clearer to read, a bit safer and allows further constifications (e.g.
> placing some data as rodata).
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Constify of_phandle_args in snd_soc_dai_driver
      commit: 2fbafecb0f05818e25f6c926c6f9ad9ef597429c
[2/6] ASoC: Constify of_phandle_args in snd_soc_dai_link_component
      commit: 020b37d06f97de289940805bc821190d5858eda0
[3/6] ASoC: Constify passed data to core function
      commit: f3ac3da7e4d0957b3402fb31a4ca480e739e086f
[4/6] ASoC: Constify DAI passed to get_channel_map
      commit: 785d64c4941221044940ab199e6625af17296470
[5/6] ASoC: Constify return of snd_soc_dai_get_pcm_stream()
      commit: de267e7a6ea8e6fa29af2287adfc9fc9d87e6dc9

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


