Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2503312F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 17:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhCHQJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 11:09:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:41294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhCHQId (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 11:08:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8858A65224;
        Mon,  8 Mar 2021 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615219713;
        bh=JV7A9FCjhMwuMmlXCfqQxddIGS3wPZPZjwAOeGbs15c=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=FKYEhmyFIhBnWq40vKwL8LkMzD7lhL06vlE+F4doSaAHlbKFgmbnOTwZw42eJgMNr
         LI5++EEs/xtrn/Xa3NGw6SJlaysLL/ivJbLtGtTRZQCQGCdtc4RYJS4cuLXxgQ+048
         3DObcknD4u57IocmCMDNuS6gYMMWckk+aCBDn3t4QQG0paiybjuvO4FyQEsvAJRcRU
         57RQWzPhQZtwDfG795/26r3Aj/fBE/FMNRBipVjpHzwiJDbvDK/Xjl41CVKpkAVaNg
         opDZxNG2+8oSRQjGWMs13tmMIFHdTF1TJbxc1PYBtB8NQUdHIhaB6irnVw92N8CHvU
         Qk2JSAxZ1Oimw==
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
In-Reply-To: <20210304215646.17956-1-jonathan@marek.ca>
References: <20210304215646.17956-1-jonathan@marek.ca>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active decimators
Message-Id: <161521960848.9621.4204009948012215992.b4-ty@kernel.org>
Date:   Mon, 08 Mar 2021 16:06:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 4 Mar 2021 16:56:46 -0500, Jonathan Marek wrote:
> An interface can have multiple decimators enabled, so loop over all active
> decimators. Otherwise only one channel will be unmuted, and other channels
> will be zero. This fixes recording from dual DMIC as a single two channel
> stream.
> 
> Also remove the now unused "active_decimator" field.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: mute/unmute all active decimators
      commit: adda199c1ea2bfb02e73829e6f1d374075958c1f

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
