Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 668B92E73C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgL2US0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3AB6F22D50;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=kj+T+pakuorM9mD2pGCnFBTuwFra7jgGOaB7nC8xyT0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WYE6Ze+ONTPUcnxfS/0VD+Tk3wZuNuRq/4+u/A6XgvYnGkfJpZW5NeEuUtufkHLCf
         HucDXO4FJkGlNs01wUKxTK7IZtbQNgHyTQVq+R/Yv/wHH5Md4nEicxD2lWSGiXvXCB
         6EsZiFe/f5c7FizHoO8xADTM7MBtclZhzm30aneXXcXewel8ZKH6XcWWj/1ADrbgum
         GG5FKDhxFG1XpnfQob6B0dGGWc0M6ubvGLcryJeF989ZV7M1fI6s/gsF4SImoUnFG3
         +Of0xObXF1CqqVYEh+WoXOY12CZMaTX9VUdzevVT4FWoQMWzkuI6iXswp4mY8Wt0jn
         UyMCni80jQF+w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 36F1560626;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo
 Yoga C630"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293522.13751.9729679967787103024.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201124185743.401946-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201124185743.401946-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 12:57:43 -0600 you wrote:
> A combination of recent bug fixes by Doug Anderson and the proper
> definition of iommu streams means that this hack is no longer needed.
> Let's clean up the code by reverting '127068abe85b ("i2c: qcom-geni:
> Disable DMA processing on the Lenovo Yoga C630")'.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - Revert "i2c: qcom-geni: Disable DMA processing on the Lenovo Yoga C630"
    https://git.kernel.org/qcom/c/70f16fab5272

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


