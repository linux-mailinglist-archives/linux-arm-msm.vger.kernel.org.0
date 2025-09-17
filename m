Return-Path: <linux-arm-msm+bounces-73900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9BEB7E852
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35D9B189797C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 10:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5B1309DC5;
	Wed, 17 Sep 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLQJn48p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A027E040;
	Wed, 17 Sep 2025 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758104520; cv=none; b=DQuPtePvxjN40NCmyARg9zg01nae3OEHmTOiyvBR/iUTtA0S988Lk0dGpy3DI3iqa++Iw7g8LMkQUP9t1etNDQKL8R4gMKJ5XprkBEAzKnzdm2bjFOavvwNwYZr1ql5QsADVhQjTgDix4OI+EvFwH4OoV3RYAk7gB+HLCE/0u08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758104520; c=relaxed/simple;
	bh=IVCUjYc4OBwHM0WhT+gYBpl5v7L2Ur8UEicZvK88Ytg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sC7qnnZyUc57cTM5fvoBrS/7xU/qGYbcB7jX2to1PAE/Mx9lzwH5QyHTAxwMlSagc74ztVDSghYBZgUekAizTfE6iUg+X2WzcaolaRnx5g1z8mCNTUXwe0MKwRtmSc92x7bxcxb0qQIBFP5OJNcHb4oE5wAzN8MKAo4MaO1CnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kLQJn48p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF73C4CEFB;
	Wed, 17 Sep 2025 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758104520;
	bh=IVCUjYc4OBwHM0WhT+gYBpl5v7L2Ur8UEicZvK88Ytg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kLQJn48p2P1+ow0y11IhI6AZNPpZXGTs9h55UcPxz7pmNr4G0EHuaAjeYC7JAmoV0
	 wUb3i1ccYZ+3Jrc5ogCJbTwAzoUrqSjcuyl3k7kRCo8poeSSAyGxUPGl0YPRDKRIn3
	 bOnjcJZk+0T2sLwpoEEj09xKmt474/MIdAXwYde+ahfRzLXIpdwMCjb1hf4SRehQTc
	 B6skd2lyoqizqTO+XRU3FAuNxdBytP1v6UsgPpj1DNDHAaNFHkwGVtuNyV4H7FHDy3
	 UhGO6MN08RJ1/y1cEZTZpXH5G7yxRlUpsSykRvHZdbBhreZLAjCEQ3dx3sDh8eqRjE
	 OWJUM1uCcnm/g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 christophe.jaillet@wanadoo.fr
In-Reply-To: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
References: <20250915-pm4125_audio_codec_v1-v4-0-b247b64eec52@linaro.org>
Subject: Re: (subset) [PATCH v4 0/4] Add PM4125 audio codec driver
Message-Id: <175810451529.38693.14025233524845208295.b4-ty@kernel.org>
Date: Wed, 17 Sep 2025 11:21:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183

On Mon, 15 Sep 2025 17:27:47 +0100, Alexey Klimov wrote:
> PMICs like PM4125 have in-built audio codec IC. The series here
> adds support for this codec driver: DT bindings and codec driver
> itself that consists mainly of two parts: soundwire devices and
> codec part itself.
> 
> This audio codec can be found on platforms like QCM2290 and
> on Qualcomm QRB2210 RB1 board.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] dt-bindings: sound: add bindings for pm4125 audio codec
      commit: 88d0d17192c5a850dc07bb38035b69c4cefde270
[3/4] ASoC: codecs: add new pm4125 audio codec driver
      commit: 8ad5294849379543782e290e8e670b69e4580a24
[4/4] MAINTAINERS: add Qualcomm PM4125 audio codec to drivers list
      commit: b9cb410d48b00a759f0947f2491785f4d0486c68

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


