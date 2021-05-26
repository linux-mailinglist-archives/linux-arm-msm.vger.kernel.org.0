Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF7392011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235292AbhEZTFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235285AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 308DE6144A;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=Ba3lCMZzQlllBKZiz2ogorcYuGsHyJhgkMD5GSafDQQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SY2dYH1J/2SicvhZWpvM25JfKsqjMWAcc/77wZITYsGl4LSDOGgbabAMA+6xpt0Kz
         kO5zSw5IoHx3pU+KAAYcLu0nwxMXf5LzKAQcTkA61CxZfIGmRKEK/nh5TyBDWM9tBi
         /NRvkGlYtZK1x3oCIO/QYz8QSAjnFiw59Y3mwX3BYoP3DwD3KGPv2RlkGIXXG9PMXs
         VF97j4mGd/Ha5si/Tvn/ylWKZZonJSnUOYzu36t0DMawQ/WXKzZ2f4QkCai/dbUM5u
         L0qZnRuQw87MzIV16wGMnQrK46+Qnh1qYgljybtuon1i2dCWxClujrCiGjcmwtl9DQ
         /3zLfiknMM9KQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2A18260CE1;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] soundwire: qcom: use signed variable for error return
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580516.26840.13859735076808307087.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210331155520.2987823-1-vkoul@kernel.org>
In-Reply-To: <20210331155520.2987823-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 21:25:20 +0530 you wrote:
> We get warning of using a unsigned variable being compared to less than
> zero. The comparison is correct as it checks for errors from previous
> call to qcom_swrm_get_alert_slave_dev_num(), so we should use a signed
> variable here.
> 
> While at it, drop the superfluous initialization as well
> 
> [...]

Here is the summary with links:
  - [V2] soundwire: qcom: use signed variable for error return
    https://git.kernel.org/qcom/c/b26b48749b18

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


