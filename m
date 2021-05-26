Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 185A0392065
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhEZTFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234186AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4087061606;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=Np1g7UFEoeHz/+y/4bwxX0MxlHWkQIvwqCk6ZU6jsX4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VlmN0taQBD4Dm8C+NUjJABQ5DpSUqXXEtMt+sHodFQhyyHYdUIn17+y7wDEzE0APJ
         VygimOPI8ChQ4wYLPHoo8J7JJHhIL2EdMGd8DQ8gz8FY5AJFfFy52bRknyV71CNoL1
         XQMwBa3l7ztlOZ4VuVaBajdVMPgxlXq/XcCOEcr6RDlV6z840UuXd2ItDea6W+3Sub
         GuUQdntaqtPEQpVLFKd4PouKharDqKYlBdWoQ6OmW86L+3Qx8u48CLQhe9rrwFoSv3
         mZ588t22EN9q87D+deO5CQ5egAzcGSQ1I/p33lWmEUA0QQkyckLCptj+ZQX4QPPWNX
         QCYdNnK6xievw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C4C160CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] usb: dwc3: qcom: Honor wakeup enabled/disabled state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580824.26840.784357057838824311.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210302103659.v2.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
In-Reply-To: <20210302103659.v2.1.I44954d9e1169f2cf5c44e6454d357c75ddfa99a2@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Mar 2021 10:37:03 -0800 you wrote:
> The dwc3-qcom currently enables wakeup interrupts unconditionally
> when suspending, however this should not be done when wakeup is
> disabled (e.g. through the sysfs attribute power/wakeup). Only
> enable wakeup interrupts when device_may_wakeup() returns true.
> 
> Fixes: a4333c3a6ba9 ("usb: dwc3: Add Qualcomm DWC3 glue driver")
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] usb: dwc3: qcom: Honor wakeup enabled/disabled state
    https://git.kernel.org/qcom/c/2664deb09306

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


