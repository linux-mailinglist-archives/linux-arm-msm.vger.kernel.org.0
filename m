Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E03193312EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 17:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhCHQIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 11:08:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:40786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230135AbhCHQIK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 11:08:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9222C65227;
        Mon,  8 Mar 2021 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615219690;
        bh=unytn+VSFwHvrGycVScysAQggJb+07mg32CXgmA3230=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=AC/5wj6rCiHqmZOu+V+al9aRJa/YRfEPp+AQmUI59iGaO/tu2VAqoR6W514lViPzD
         B6iJHAqbb+DyCaiZr1P9oQfKCxCq2uaX7qccwBULyY38Gj7ASVXlycFDH699zktapL
         n8aYATlNx1zrDimYNFUryWVafSPUf8OEvJegvt9F7sWiHQW/3VzQXuxXLeZ1u6e3Qv
         eK9d5F6p61UwUrM77Zw/L96l5yL5YnAEsiTL0JtDPnWw5D71ApRuhGzClt7bfrNdnc
         cGYxjr2i+fG6QmBdJ10tpkfsRtxDHAjJPOd3pCZ+gwhWCpxkiBd5MXX9hAyl1wH5yW
         +Lk7HEs2/Ab6Q==
From:   Mark Brown <broonie@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Cc:     Banajit Goswami <bgoswami@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:QCOM AUDIO ASoC DRIVERS" 
        <alsa-devel@alsa-project.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210305005049.24726-1-jonathan@marek.ca>
References: <20210305005049.24726-1-jonathan@marek.ca>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
Message-Id: <161521960847.9621.10965090880693667383.b4-ty@kernel.org>
Date:   Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Mar 2021 19:50:48 -0500, Jonathan Marek wrote:
> Attempting to use the RX MIX path at 48kHz plays at 96kHz, because these
> controls are incorrectly toggling the first bit of the register, which
> is part of the FS_RATE field.
> 
> Fix the problem by using the same method used by the "WSA RX_MIX EC0_MUX"
> control, which is to use SND_SOC_NOPM as the register and use an enum in
> the shift field instead.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
      commit: 810c4ac485e9de34624469a1c5ad1453699b993c

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
