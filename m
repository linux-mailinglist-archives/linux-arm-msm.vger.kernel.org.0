Return-Path: <linux-arm-msm+bounces-60696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4780EAD2855
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 23:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425787A5577
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 21:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496E6226533;
	Mon,  9 Jun 2025 21:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L9ILCQni"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D6226527;
	Mon,  9 Jun 2025 21:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502848; cv=none; b=W0kCantqXjOhiYESUjqOg6WmhaCJ3WwMbH3QyZVJoHe4DMjh5ny6z8uTZGwXcyo38eIvjyS4qU9gsDa4wZ/3P77dKM950HKwyBtzhyrIZnFNumV7I5OGa/HL/+zJTHw5K/YuPEURyiEymNU1lZgBjWe4MhtW0rEmxQYz6WqO4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502848; c=relaxed/simple;
	bh=d5ryB50fBGU3rzUwb1bK5ko4/jniZfD9F03PdA5Rci8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CNABrb7iwPfT29HP4MaLhtTxNNzjMJGxK43C1bc9NisdL3uptwl3bm/0OqVS7kURsfr1wR9S4LGY1VXq/tWYuJJuDa4E+h6of6LneLhyJruQgjgxgLKdN2fEJO6rPJ68wk4bGuif/m9ZeyzyumUE2AT4fKyOBXQ+BcB09PBr+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L9ILCQni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D0BC4CEEB;
	Mon,  9 Jun 2025 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502847;
	bh=d5ryB50fBGU3rzUwb1bK5ko4/jniZfD9F03PdA5Rci8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=L9ILCQni0241UVt1GJYRSMoIieGpegVcNt6eXKm10Cyt6stVqq9ZBTZ/ksM1n6+NR
	 B9co3engPmT+iRtw0c2WZm18Kf+fNKTY9BUSRw8oo9xGKiTeNmqCQN+zE15s4hD4Qq
	 69MZztoFugy/wsXr0F4fHYOPJV+CoTAs2X7UcPGcm6ggk5x/gGIYTIqZ3dQOsQp9kv
	 T08/XoC2nX6K2pgHpNeyN2btwZKPmlPFiXWbMLmWg9/9EzsWGfluZapMHUcDcGKKaA
	 FCtQ+eN2JMrwzRaUPD3wYT/+SmLlPL7tiXpuhV8UzwzP7vo8aNeMvm3I9e1Uvu8DcQ
	 YjwdOFLxow8Dw==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjr4uup4.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v4 0/3] ASoC: remove component->id
Message-Id: <174950284608.277844.8283182888349680837.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 04 Jun 2025 02:06:15 +0000, Kuninori Morimoto wrote:
> snd_soc_component has "id", but no one is using it except Qcom. It is
> initialized at snd_soc_component_initialize(), but Qcom overwrites it.
> 
> According to Srinivas, unfortunately, current Qcom lpass is broken.
> But we can update it and then, avoid to use component->id.
> Let's do it, and remove it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: qcom: use drvdata instead of component to keep id
      commit: 8167f4f42572818fa8153be2b03e4c2120846603
[2/3] ASoC: soc-core: save ID if param was set in fmt_single_name()
      commit: 6ada7351af0c4e295739adfa2c4b780c037b3d27
[3/3] ASoC: remove component->id
      commit: d3de84858811ea2c501cb45f0aafcae5beba20b6

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


