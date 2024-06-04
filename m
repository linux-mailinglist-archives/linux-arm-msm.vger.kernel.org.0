Return-Path: <linux-arm-msm+bounces-21584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2308FB16C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 13:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E194CB22B36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB65145A07;
	Tue,  4 Jun 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxdEBGd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26D13D881;
	Tue,  4 Jun 2024 11:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717502061; cv=none; b=UxmB3qkDOcAFUHs2i1zp1Wcgs6hmPrqWG1vjXsVM5V3XTH3sXYY6fOlh3+Do6DjzqrMW0eZZtbDE0XLcCmvaEBLoFC5YOqFYxSW7HMuUTOiPCJdiIXMf+QcyDdI/b2XgBv/vInr50UpiD9WegEDCa9tOSjYAG+5gBeEMUZKrN/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717502061; c=relaxed/simple;
	bh=yJsKvIpOvhSJFjFDzdGRI3kOnJRBx1kUm/4dwBlOq4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lrrGdiTznyWHBSQqBH0LSOXy0S571zpoXQRBTexGyKL0HgtnmHAxsehWLbGWMZulp8/omssnS0CMrV8tDkcRvbPALhEFDRrbItpYh1OAJT8q8SzLb7Vu5EJ0alKz7XbTLFVBn5TT0ljv916ehkegdyUw/BhDJA3iEZBLCWfA0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxdEBGd/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA72C2BBFC;
	Tue,  4 Jun 2024 11:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717502061;
	bh=yJsKvIpOvhSJFjFDzdGRI3kOnJRBx1kUm/4dwBlOq4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dxdEBGd/EjK5q+GKPU0fUg9u30TPAnyhliaupQKC/VYT2CGQUzASR2k4FPGtfOFPa
	 U/thJG0kwtoQtuuLGypvc7sqOuoXaksOZgOjiRRyAF+2r0JbhMJpCW7hEU84RFg/hm
	 4SjBA/BJZpV2rO7q2qP15/PgVJCdz83x8OJMM9fs1aF2+i58FINDDe2vtWvFLQvc/+
	 xHRAeJC6avCdvlIs0vU1iR14TTIJedI9ULs3Mkw1xxZKOlFEf8bJ28CdWXUPv9PGmn
	 uWVPNmmzvQ5TJiKHWfZ3L0rHEOe4n5yKVv+uaGa8/gDXAYrkRzYrf5KgvWrRmy6s+1
	 1AhXX+mtNpiNQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
References: <20240531-asoc-qcom-cc-lamsm-v1-1-f026ad618496@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
Message-Id: <171750205882.24919.10241558031542040630.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 12:54:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Fri, 31 May 2024 01:30:54 +0300, Dmitry Baryshkov wrote:
> Not having linux-arm-msm@ in cc for audio-related changes for Qualcomm
> platforms means that interested parties can easily miss the patches. Add
> corresponding L: entry so that linux-arm-msm ML gets CC'ed for audio
> patches too.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: copy linux-arm-msm for sound/qcom changes
      commit: d3cb3516f2540e6c384eef96b4ffeb49425175ed

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


