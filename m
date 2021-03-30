Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3965934ED2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 18:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhC3QGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 12:06:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232102AbhC3QGJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 12:06:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10B34619CE;
        Tue, 30 Mar 2021 16:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617120368;
        bh=26IHFrffaqAWxvS40u7qOPp8h/qopG6fb7xg9SJkSvo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f68in51wQUPiZZAP7ZJeCYsRAwxqRIx1oy6ZxJhSIU5xcYXNquCEjUqbkDtSknVwg
         vFgWJmG4c+udLX45YaKMegwqplT9AJuYqpxO4KcOi65yMm8fYc9ZtU1smvjgfOt87W
         grVEX54/Lecz2tlJrBXcXHKKDtKvahQithtPxUnGnayTfdGT2wnW/qfRiui0KKUu4R
         ieoewUrOycnKARQKM5XZkfKmG9FTbyLddK6MUMKCCVYgP5xhB9Lrs7Um1hlTz4G3eg
         bL/EBjgXCvdNeAka/2NpVHbznbfGiX68VSZZsvj9RtyMKhYGy8W0MC4vt7eFYnVBYF
         Ax3HGu9eo+icg==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH] ASoC: q6afe-clocks: fix reprobing of the driver
Date:   Tue, 30 Mar 2021 17:05:49 +0100
Message-Id: <161711993559.12915.3715212253584619506.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
References: <20210327092857.3073879-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 27 Mar 2021 12:28:57 +0300, Dmitry Baryshkov wrote:
> Q6afe-clocks driver can get reprobed. For example if the APR services
> are restarted after the firmware crash. However currently Q6afe-clocks
> driver will oops because hw.init will get cleared during first _probe
> call. Rewrite the driver to fill the clock data at runtime rather than
> using big static array of clocks.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6afe-clocks: fix reprobing of the driver
      commit: 96fadf7e8ff49fdb74754801228942b67c3eeebd

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
