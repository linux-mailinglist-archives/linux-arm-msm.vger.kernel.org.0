Return-Path: <linux-arm-msm+bounces-87744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A49CFA4A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 19:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28C2E30124D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 18:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 012D333C52E;
	Tue,  6 Jan 2026 18:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+1Rr/Eo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B525CC6C;
	Tue,  6 Jan 2026 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725284; cv=none; b=dEsfEukML/7Df5lTubGSigelG7yJA4+RnLMkuFkPFQHCcXiB/BDqhCcisG3n3FVhwezXHjTlexnurPR+blYMEp8nya8myMIwvdB+m2MXCue0cPGlgm8cgeqTxQloidk1Cms6BDdXAGkW6vKhs81V2lFP6k8XBvT/+KloZHQEbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725284; c=relaxed/simple;
	bh=9EqdNSLfHaFAFJa+20f5p4Xvwf7+oAWhRKGngbn+aTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kpbk4dUthqhaIerpjYh4XQxKFLoi0BTnNS8Laf3aGyxI3XuPfAQoqnn70O8BcH4VmFfiJgeW5TnLpJShHgZmEVZSiuPHqeqnJvF0Hw1vDN0mpK0Gb8svnvqKu0Q6HQVPxXifp0PNtL3N6oa7Rn6nFt8jYOBleUrASO5LlIY1xrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+1Rr/Eo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ECFC116C6;
	Tue,  6 Jan 2026 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725284;
	bh=9EqdNSLfHaFAFJa+20f5p4Xvwf7+oAWhRKGngbn+aTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c+1Rr/Eo+ff2ysg3Zh4edeRO/OorC9WcO5N9g6kjRskumZ9sFfHwDZyxB0okoV2x4
	 yrx+kXWAvRqLwb1BBHn4ex+4ddJI1KUmQtqgrzjs34Wp7P/s6owDV2GzV+9875PA5Q
	 0Nq1KNHcpKOIUCRyYxxbTY61YLEuengNYBg8rjtzKl+bPGaGBzss0tBAm0kf3qUusK
	 UIh2UdoO/bprU4jdcqb8PZ8Eso0XWsgmJilObN82ICncUrKt6nw83SqqQLowG1M3/m
	 QR/6H82DVL06cdWAZquLQ5PqoAnfDXmN5Og1d3hgKab3kF02L4yQzV/WgBprCkKEFJ
	 TuPNPa5W8+J8Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260102111413.9605-1-johan@kernel.org>
References: <20260102111413.9605-1-johan@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: codecs: wsa88xx: fix codec initialisation
Message-Id: <176772528289.317829.14666571712516939644.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 18:48:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 02 Jan 2026 12:14:09 +0100, Johan Hovold wrote:
> The soundwire update_status() callback may be called multiple times with
> the same ATTACHED status but initialisation should only be done when
> transitioning from UNATTACHED to ATTACHED.
> 
> This series fixes the Qualcomm wsa88xx codec drivers that do unnecessary
> reinitialisation or potentially fail to initialise at all.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wsa883x: fix unnecessary initialisation
      commit: 49aadf830eb048134d33ad7329d92ecff45d8dbb
[2/4] ASoC: codecs: wsa881x: fix unnecessary initialisation
      commit: 29d71b8a5a40708b3eed9ba4953bfc2312c9c776
[3/4] ASoC: codecs: wsa884x: fix codec initialisation
      commit: 120f3e6ff76209ee2f62a64e5e7e9d70274df42b
[4/4] ASoC: codecs: wsa883x: suppress variant printk
      commit: 46a16d89d097ac2c93b63382a37d60aa7f21dc71

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


