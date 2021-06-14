Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB0553A6FA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 21:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhFNT5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 15:57:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:53690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235679AbhFNT5a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 15:57:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C236134F;
        Mon, 14 Jun 2021 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623700526;
        bh=NWfwBAl37uZr0GzMxOWdBMjl8COCgIrfBVJda3rqPoY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rWKkz30eXbWepa4X39gBPY5Oc/8LEHE2qHSC5TnegqqsDZt2CmSTIn+a+caQFvvVC
         1pSBvO0749Uxq2dgXKoPRdOhijbHDLeMu1HuA88391XR68/D/rIOwsL88wUPTFoWG6
         FrziAAtZ4N8DvRCxbPhiXZpGEDcrtPHblIAoPXDtignI258IVvZBDFd2c9HP/DjMg5
         XsNejABziWzewG2APjpka5O6NUW3kTVDbrCQTSYMSpQa1LB2A6RxSuoYW+udv8cR+/
         o0FWrhmOvr7noVgGkgf6sJCmowF+8e3PVK6xhQ3Y/hTncUgSXfvgNOvONxHXatulrc
         CT61/f6R+SLxw==
From:   Mark Brown <broonie@kernel.org>
To:     agross@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        plai@codeaurora.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com,
        devicetree@vger.kernel.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, perex@perex.cz
Cc:     Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
Date:   Mon, 14 Jun 2021 20:53:55 +0100
Message-Id: <162369994007.34524.2234994672815898510.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210609072310.26099-1-srivasam@codeaurora.org>
References: <20210609072310.26099-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Jun 2021 12:53:10 +0530, Srinivasa Rao Mandadapu wrote:
> The DMA interrupt clear register overwritten during
> simultaneous playback and capture in lpass platform
> interrupt handler. It's causing playback or capture stuck
> in similtaneous plaback on speaker and capture on dmic test.
> Update appropriate reg fields of corresponding channel instead
> of entire register write.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
      commit: da0363f7bfd3c32f8d5918e40bfddb9905c86ee1

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
