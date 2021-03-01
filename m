Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF593292E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239068AbhCAUyy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:54:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:55270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240455AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C826B64F19;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=6Tae5o2MZqspMvbeCc63DlDlQOTZ8UcOwP3z/C+wrM0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=trEWqhT55vab352/SInsUbN7forj20g6/CaAnJW8Sllb2g3uBU8BEbCPvl+fqbG/Q
         D3IF1GE+QveGgT3sEky54GLEpnA/GbLf5skm/bV5bXqUUqc5FbXQ2F6guXQ+FfAUYF
         tY6u30CRoV3sqeH3wBSC3F/LHGqpwPwr3x8VQu+/FG5zls0HIlLvjFjrW3x1Sp5IlJ
         cT85t1olOUAij0isQUUTm8VlzXAD7AsIv9or145OGh9tyJ9sCkwpB1RnP+pdmkjzS9
         92xeljpHDEcyh/qYiH+gfvTVqYo/AH50rOjIqUe1kaptgGO/W2Y3RDQXT1FMEAtgr1
         8V0IpCHDl9X0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C41BC60A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: Guard qcom_glink_ssr_notify() with correct
 config
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878479.6187.9685516961779310598.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210106035905.4153692-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 19:59:05 -0800 you wrote:
> The qcom_glink_ssr_notify() function doesn't relate to the SMEM specific
> GLINK config, but the common RPMSG_QCOM_GLINK config. Update the guard
> to properly reflect this.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: Guard qcom_glink_ssr_notify() with correct config
    https://git.kernel.org/qcom/c/8527efc59d45

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


