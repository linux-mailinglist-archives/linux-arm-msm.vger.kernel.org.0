Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8233340D2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 19:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232574AbhCRSgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 14:36:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232645AbhCRSg3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 14:36:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7166C64F3B;
        Thu, 18 Mar 2021 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616092589;
        bh=tcUmX62o1K3vI11xFYaD4YzszYOXdHv/IYyBaJNbW7U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b7Bbz5kfzJlUNvIMxkKAsK7XoiljfqK9ZUUDX/U410UPtnN34ZG28QQ34BFFD9Q9J
         KQXu+EJn7mZ+XZ0fimScwIqZKE9zH+cnKn+JOIgRZTWVoY0PO+JQu3mVSF28Ij4Zie
         9MEe2IriDa9pUN+xi+yGjWiGGJo+1joPJLVbh/M1WDFaM5grX6SfA79GuWWvzySoba
         VusT1KOb4dN3iutb8/PYv0FHY3ljVSTN/0UxSXhc3fQMG17HrEyiuLnfaB2RdpUNP1
         gEtvUm67F0F2HSF7Kwtq8+FX0jhh13Abc0raWQ+e4OJXvLYAf5XZL3+KSpZFYrpspP
         0moDH/DvMR0Pw==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: (subset) [RFC PATCH v3 0/3] Add support for Qualcomm MFD PMIC register layout
Date:   Thu, 18 Mar 2021 18:36:07 +0000
Message-Id: <161609215625.42159.3219588322808647787.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 10 Mar 2021 16:39:51 -0800, Guru Das Srinagesh wrote:
> Changes from v2:
> - Split up framework changes patch for better comprehension.
> - Dropped PM8008 driver example and converted it into example code in cover
>   letter and commit text.
> - Added more info in cover letter and commit message as per v2 feedback.
> 
> This is a follow-up as promised [1] to the earlier attempts [2] [3] to upstream
> the driver that has been hitherto used to handle IRQs for Qualcomm's PMICs that
> have multiple on-board peripherals when they are interfaced over the I2C
> interface.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regmap-irq: Extend sub-irq to support non-fixed reg strides
      commit: 1066cfbdfa3f5c401870fad577fe63d1171a5bcd

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
