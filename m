Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C36392026
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235201AbhEZTF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235360AbhEZTFE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E65A561462;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=nBKXJidCUBDpM+W9SoBl8OYx85J3ZIaRbvhQ/TdI/o4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oHSHTtgDPWycb712VvQQrCrNqzfJCfND3RbFpQgdK9QeaXHMmLHvzC6nqR8/Uj6jy
         qO8OuT7//zMshKhSStdS+Pnso4uGApMgFcY74NeBFnRTg4WuDgRss6qrX48oXfF4GW
         IYfdo+fsZxBozio46Cby4rP6+NFDiqqln/mR4Qi9tDWfmJp4rYiypQYloQhVlKZc/X
         Nol90kgC6uBNbtrjrFHSI8eSSXAmlvFP2uq9zU3whCuVnKpdc8cJ4AtmaHZJztp+DB
         3f+Z9vE/HVxPnFdd7GenjonG06w1muzaVOGpGeJiyR9Z5gl/bgj79b2vIbibXy107H
         7Bblv64rYyAdQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E1E69609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580592.26840.8402647358786963489.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210311154557.24978-1-srivasam@codeaurora.org>
In-Reply-To: <20210311154557.24978-1-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 21:15:57 +0530 you wrote:
> The max boundary check while parsing dai ids makes
> sound card registration fail after common up dai ids.
> 
> Fixes: cd3484f7f138 ("ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] ASoC: qcom: lpass-cpu: Fix lpass dai ids parse
    https://git.kernel.org/qcom/c/9922f50f7178

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


