Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AC245FAD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Nov 2021 02:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350909AbhK0Be7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 20:34:59 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55652 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346353AbhK0Bc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 20:32:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7FB86B829B1;
        Sat, 27 Nov 2021 01:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD02C53FAD;
        Sat, 27 Nov 2021 01:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637976582;
        bh=d0ToXu1WBChqHvu9+4OZzoQe9orIt4eiwbLLvSBzF+E=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=S5EvW7g6WUZH6Ic/KEx7G5fYadnBsky+M02m4yMAzzMQ8VOQ0Z3RvAo3VUqjod71y
         V1/V2hv3A1rFfU4fOLWEsD6y9J0b2RMynwL+lLKK53fFOD7CGRZ8z39K0hTjb1gdy7
         sA4urY8iggO3Z6Qbo19X8FwELQXrmMPD55R4F7BRa0hOX6HZyhHiSxEKMjBvr3flnS
         LqLJZJUwec8V+3aXFmCpyPK/jpMLtlFF1/MzM91OZj1AVEAujXBoQTwzmfHzw/nSzK
         XjkcrW17RiEUerSRHKjPnFfHETPYyz3UFbjAEJeliMQGtDm2YP6uiBqHeYZnBmNWGa
         FVIm5XdZ9iR2g==
From:   Mark Brown <broonie@kernel.org>
To:     alsa-devel@alsa-project.org, Rob Clark <robdclark@gmail.com>
Cc:     open list <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Oder Chiou <oder_chiou@realtek.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Derek Fang <derek.fang@realtek.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Takashi Iwai <tiwai@suse.com>,
        Rob Clark <robdclark@chromium.org>
In-Reply-To: <20211118010453.843286-1-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
Message-Id: <163797657977.2987896.13648492713075934799.b4-ty@kernel.org>
Date:   Sat, 27 Nov 2021 01:29:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 17 Nov 2021 17:04:52 -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the declaration of temporary arrays to somewhere that won't go out
> of scope before the devm_clk_hw_register() call, lest we be at the whim
> of the compiler for whether those stack variables get overwritten.
> 
> Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
      commit: 4999d703c0e66f9f196b6edc0b8fdeca8846b8b6
[2/2] ASoC: rt5682s: Fix crash due to out of scope stack vars
      commit: 750dc2f622192c08664a15413bc9746d9cbc4361

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
