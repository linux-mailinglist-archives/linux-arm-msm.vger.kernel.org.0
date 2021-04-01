Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23673351325
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 12:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbhDAKRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 06:17:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233744AbhDAKQy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 06:16:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BCBE61056;
        Thu,  1 Apr 2021 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617272214;
        bh=g/hgGSo1Nvw907LmGK7wh2fIResxZVHy6j6UfGcKAZM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RNrBNDZEvYCu2/y7uHwxrRBMa+qQF5jqMKGxpbG3xQE9XbMMi/v1hfxc4oSiLbSzQ
         RwQGgnPrZdhhSt/kIQP8NXUOontxL/GQptMWDQvyUmvrFtv5L0Mz/+nB5j2zKdjGpG
         LOSewFTzZ3pZa6vDb3N4v7iufHmHeN10tSiFylK8bg1w5gsuMFv0sdvV4dqJJCQRy6
         LWQUCjbyht2fOJ34JMH63i/jQuzDfPh9PXozS1lZ9dWwtVXipyyo9UMZBab0pdIZ1S
         KgYtOOo7YSdL7N6x/NHHdWJJKfu2Oef30MgfDeo9Qr3kNodVRHZvQVQQsGYjLyXKyd
         OvgV0usysKSsg==
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        David Collins <collinsd@codeaurora.org>,
        Joe Perches <joe@perches.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 0/2] Add support for Qualcomm MFD PMIC register layout
Date:   Thu,  1 Apr 2021 11:16:17 +0100
Message-Id: <161726943419.2413.4844313396830856637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Mar 2021 12:28:52 -0700, Guru Das Srinagesh wrote:
> Changes from v4:
> - Only one cosmetic change: Moved the declaration of num_virt_regs under
>   num_type_reg instead of under num_main_regs in `struct regmap_irq_chip` so as
>   to reinforce the idea that it is related to the type setting of IRQs.
> - No other changes.
> 
> Changes from v3:
> - Implemented the scheme proposed in my response to Mark in [4].
> - Dropped the RFC tag from this patch series as this series has been tested on
>   target with a client driver utilizing these changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/2] regmap-irq: Introduce virtual regs to handle more config regs
      commit: 4c5014456305482412b35a081ca0fb4fefd69764
[2/2] regmap-irq: Add driver callback to configure virtual regs
      commit: 394409aafd017adfcffd075595cb01cc456a9327

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
