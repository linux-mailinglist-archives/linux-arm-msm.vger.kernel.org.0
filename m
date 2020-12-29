Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2578E2E73E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgL2USm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E56223100;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=jNeVTGv26s3iQtoJvWgh0rCfsZ68HewVgTND09jjGqE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cMQcopAkThUtw5VTPozVntS2JhQpZzHSsnNkyharFSDvwm5iYNoZzC0ahR9IGIwOX
         SB4a07wyZiareOsGfeYQ+Ig7pii56O/trDQv86s9HnxxofAjwujIXSAg5UfKkB9XeY
         0IpA1ejH6jsoFefcYYkXC9XSIMrhjQrOxdd6j3ij/E8V5ZsC7HwvkBNmPIcp4lqIzL
         itLN2dx2S4cnwJUCCFOBmTExkVkHCF+vR9FSkntvb0nppw1I3QZuISAR+dijQVhlYO
         sw5WVmViUy+pUqqQ3/wXuE3E7lAArzo3nohY27eksp8KhUxx8SwsxIdv5J/fSvpiTJ
         qzDzsx8bgI7BA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6A35060591;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] eliminate two common errors reported by any yaml on
 arm64
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293643.13751.17839822952035690124.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
In-Reply-To: <20201016090833.1892-1-thunder.leizhen@huawei.com>
To:     Leizhen (ThunderTown) <thunder.leizhen@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Oct 2020 17:08:31 +0800 you wrote:
> v1 --> v2:
> Although it's simpler to delete the empty "dma-ranges" property, and the function
> of_translate_one() in drivers/of/address.c will treate non "dma-ranges" case as
> empty "dma-ranges". But as Arnd Bergmann suggested: it's not good for the scenario
> of IOMMU disabled or absented.
> 
> This version make sure that the node have empty "dma-ranges" property have the same
> "#address-cells" and "#size-cells" values as its parent node.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
    https://git.kernel.org/qcom/c/2013a4b684b6
  - [v2,2/2] arm64: dts: qcom: clear the warnings caused by empty dma-ranges
    https://git.kernel.org/qcom/c/e3389b0a1495

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


