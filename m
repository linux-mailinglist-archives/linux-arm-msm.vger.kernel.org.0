Return-Path: <linux-arm-msm+bounces-53533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6597A80A6E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD8B189FF97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 12:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842BD27EC99;
	Tue,  8 Apr 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHWt6b4o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525E527EC93;
	Tue,  8 Apr 2025 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116547; cv=none; b=nIH9CSRlANWcXIFRKw2bFeT1UUJYKv9sXmdBHEu+h6Db0rVXjpLXubw5w+yNyP4HKtFX3AsQhn+e1C9GZmghTLcuqjzJZKPhKUQDUVLmTSvrIMrnWiiOsJN9mshdEk86ACom628UtCCuGJCiHo8Q75ITnGRtCmOPwHQbNVplAYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116547; c=relaxed/simple;
	bh=vKT4C/GTC6IQ9JYbZes2rZEbu8WnSSrIU6DtAnt8Gv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mwmtxYSbqP/DB0q7FwqvikhvYpr1xx8YWZK6+WZjJnPnzjQIbwDm5L7HKG16jX0OsaacocVbxml5QIT6wdSYxgV8u5HQFvXIR+0/exnS6/fFfRPUVXKJJo48KLvEyQcrEItN6DtS5sgHMTty1gZonmqvg2h0wI07AmGim9AVjpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHWt6b4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC80C4CEEC;
	Tue,  8 Apr 2025 12:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116546;
	bh=vKT4C/GTC6IQ9JYbZes2rZEbu8WnSSrIU6DtAnt8Gv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kHWt6b4oMvIthJlMku0Z8R2pq9+6O0s1tZ/V33yDLuw1jVvTlSKngzjmPYbrSxPeW
	 upbiPdKqb1y62Q/xY7wU3BczXQqTmhtDmyAUoHawFemVmWCONGNCvPgO/DiPu3N4Lw
	 HY+L3g9gw+gMs0yQSNQtfEiA8vNI4QV4bttPvN2/r3b0bAVbiHNzs51/fmur5sHuDq
	 xQva2DC4Zy+vRRyr48b908Cn9Uhq1j6qwXsYAJf0ymM+CdHSnGEnKgvGZHXAWo2iF9
	 4pBQ1Z5KlkHcBmqvidCQ5SU5zvmx3NXD6ov8jql5kLHOL3b+8/Mr3RvEhoUAb+2a2O
	 y+wl7irHtKAtA==
From: Mark Brown <broonie@kernel.org>
To: peda@axentia.se, andersson@kernel.org, krzk+dt@kernel.org, 
 srinivas.kandagatla@linaro.org
Cc: ivprusov@salutedevices.com, luca.ceresoli@bootlin.com, 
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com, 
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 perex@perex.cz, tiwai@suse.com, dmitry.baryshkov@oss.qualcomm.com, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 johan+linaro@kernel.org
In-Reply-To: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH v6 0/6] ASoC: wcd938x: enable t14s audio
 headset
Message-Id: <174411654299.2091760.16115765833106462248.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 27 Mar 2025 10:06:27 +0000, srinivas.kandagatla@linaro.org wrote:
> On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
> support CTIA and OMTP headsets. This switch is used to minimise pop and
> click during headset type switching.
> 
> This patchset adds required bindings and changes to codec and dts to
> tnable the regulator required to power this switch along with wiring up
> gpio that control the headset switching.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/6] ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
      commit: 6417066fb41f70c5aec242a36cbb6def8c99303f
[4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
      commit: fe19245d3efd5bf714623e83f2056bc46d9339b1
[5/6] ASoC: codecs: wcd938x: add mux control support for hp audio mux
      commit: eec611d26f84800852a9badbeafa76db3cdc9118

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


