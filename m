Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941D139205F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235792AbhEZTFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235705AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 11EDF615FF;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=2fSAMjD8fUR1NdlEuFFkCKM66fAVkqdUDumySRHymBQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=N+LIS9oc4rMuUiBsZMSkhpY6cjpqoHIj9upzsSNrvKeaKjI2Mn0dVChZouMzuHJVF
         tJAKzob2vSxOd02AS3ogiAl+dOAhwL4O8wZxkXDcBf/7N/z9fqUhOIjA6+NGby8ga7
         CGXiQ/1CWHUU1nGcz9uAIvKo4LOGxvMg9wzj/05TXBNf5odqGa+3AzDB2GYilAigCV
         xXLqdAG4NXTQgBOiCROC7IfkiB97zoL4aqifnRBaAHY5A+bZYuZ8M0nzDPRPyXB/nj
         n1JLf/TEC7O0Njn+VHySPNbLZOFtGg/zzhkdPoDf0IzNY7bfak6ue37ZZ5ZNWuw7K+
         WypFtOeyfTJhg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0DC9060C29;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] usb: dwc3: core: Add shutdown callback for dwc3
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580805.26840.12606610069552750251.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1618380209-20114-1-git-send-email-sanm@codeaurora.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 14 Apr 2021 11:33:29 +0530 you wrote:
> This patch adds a shutdown callback to USB DWC core driver to ensure that
> it is properly shutdown in reboot/shutdown path. This is required
> where SMMU address translation is enabled like on SC7180
> SoC and few others. If the hardware is still accessing memory after
> SMMU translation is disabled as part of SMMU shutdown callback in
> system reboot or shutdown path, then IOVAs(I/O virtual address)
> which it was using will go on the bus as the physical addresses which
> might result in unknown crashes (NoC/interconnect errors).
> 
> [...]

Here is the summary with links:
  - [v2] usb: dwc3: core: Add shutdown callback for dwc3
    https://git.kernel.org/qcom/c/568262bf5492

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


