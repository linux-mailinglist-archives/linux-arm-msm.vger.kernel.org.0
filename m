Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CA2392073
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234758AbhEZTF6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235704AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B9C8A6162D;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=fEBX6+CJ6UzyIj2SbMGeVcOQF+Usw9TQqce9TPnyNXU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DUMKwnrfTTzNcdj14aew0LRzuf+xfIGQ4cfgQciZyhs8o55ReU3ZIRQGGS0X+7iCu
         vuTzEeUc6F5Y+jJKMJxS72lKvIkgmo08f5aMQ1PCDPJdnCjvgBdNzl+CU02YPyTgFw
         yxfoL5vPBSGHbU53YR/aQtrADH02IxO3yS9p516rdmadZ38SjFBy3NH3MIqcg1cUYX
         K6lXddWauWD3zTHIXPEI4Uq8C4VyKpsS+RePv7kpnRFzc/hjUvQp3b6F7dM39flExT
         bSflndUE/U4I992z7DXSrgqWnDP1bnKeElZks3b8ANygcMgGOqp0QCao6WlslfOSqM
         4//yS16nQhrHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B5670609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drivers: usb: Fix a typo in dwc3-qcom.c
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580873.26840.188497512120532408.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210316041430.2203546-1-hefengqing@huawei.com>
In-Reply-To: <20210316041430.2203546-1-hefengqing@huawei.com>
To:     He Fengqing <hefengqing@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Mar 2021 04:14:30 +0000 you wrote:
> This patch fix a spelling typo in dwc3-qcom.c
> 
> Signed-off-by: He Fengqing <hefengqing@huawei.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drivers: usb: Fix a typo in dwc3-qcom.c
    https://git.kernel.org/qcom/c/064ece8d7ca7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


