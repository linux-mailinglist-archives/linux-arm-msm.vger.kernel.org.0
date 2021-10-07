Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C731425F36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238388AbhJGVji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:39:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:51210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235775AbhJGVjg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:39:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 769C560EBD;
        Thu,  7 Oct 2021 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633642662;
        bh=LnM69uNfSHqFm/JN32p/Z48yLK7e9Udj6Zp+QoLE4+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C/NxVNmC8TapIoPJI/2BXWPniDR3aZwE8q24Or+tcTfs6IevxBGUhzFRzuOEFBYRl
         EFh5Xw7NSQbr4qtGbh+VyBBgEGcwhfKVVRQ1g4O3UbnTOzsx2O1gqx8Blt2X8osOCT
         v/oowuF4VLDKA+3saL1ijOiOZ9OCdiRUYuLmmw8CWpCQ6Ty9bkuBSMd4CF7I9J4c9f
         oc1pmDqtG+WvKBRHqhR1XBIRY1gmIhz6Rc5JuQIk7AD0G23corbH+1l/0rCjCUp+ce
         746Areb1KOvw/atwBrlphWNvJdQ7yW+Vvtgze98+NX6+PMcAzc4/qqb1gaR1SWh5gI
         EDTjdn2pucjMQ==
From:   Mark Brown <broonie@kernel.org>
To:     devicetree@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org,
        perex@perex.cz, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, plai@codeaurora.org,
        swboyd@chromium.org, srinivas.kandagatla@linaro.org,
        bgoswami@codeaurora.org, judyhsiao@chromium.org,
        lgirdwood@gmail.com, rohitkr@codeaurora.org,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, tiwai@suse.com,
        bjorn.andersson@linaro.org
Cc:     Mark Brown <broonie@kernel.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH] ASoC: codec: wcd938x: Add irq config support
Date:   Thu,  7 Oct 2021 22:37:23 +0100
Message-Id: <163364264608.649699.14778607826601877244.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
References: <1633614675-27122-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Oct 2021 19:21:15 +0530, Srinivasa Rao Mandadapu wrote:
> This patch fixes compilation error in wcd98x codec driver.
> 
> Fixes: 045442228868 ("ASoC: codecs: wcd938x: add audio routing and Kconfig")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wcd938x: Add irq config support
      commit: 214174d9f56c7f81f4860a26b6b8b961a6b92654

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
