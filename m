Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00653924E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 04:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbhE0Cbm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 22:31:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:45966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229956AbhE0Cbm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 22:31:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0688961073;
        Thu, 27 May 2021 02:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622082610;
        bh=uI5ZDixG2Bw53cCGUPBe+fq8l7QloltvVf2V9fCfbaw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fV0Whpk2snSrSd5SnwpKzFVD309/9d0cEn3PgHV6rx9oaltaRF6en67Ib83t7B8eq
         ti7H8swWyCG33yQGg184N47sWOf+m49XOtpoVxg5n5+04TYnxdv3Av0/duWd/OW4L1
         j1fUTN9yc4AGelMFXnISogq40qQfuDCYSBDPitjqMtyS8AKQVCOwE0sEOGtHmwl3yj
         7I/3zuVvdSBSa4Q0/OCslQ0yNdH/lRTLicPSGWnPbSjVwPr+KarQqEn2WRjAtM0xUe
         S81JqyI+yhUSD8OnA56f8pPfQWv3O8kL3wEhWiHZJ3Xp7MQq4llg8BpkTUviJ7d4vh
         eJNgk9CZf+ejw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EE92960A56;
        Thu, 27 May 2021 02:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: import PMIC IDs from pmic-spmi
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162208260997.29587.7884332794298146802.git-patchwork-notify@kernel.org>
Date:   Thu, 27 May 2021 02:30:09 +0000
References: <20210526200843.127916-1-luca@z3ntu.xyz>
In-Reply-To: <20210526200843.127916-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 26 May 2021 22:08:43 +0200 you wrote:
> The driver in drivers/mfd/qcom-spmi-pmic.c has a more complete and more
> up-to-date list of PMICs with the respective IDs. Use those names for
> socinfo. Some IDs seem to have been assigned to multiple PMICs so keep
> that in the name as well.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> [...]

Here is the summary with links:
  - soc: qcom: socinfo: import PMIC IDs from pmic-spmi
    https://git.kernel.org/qcom/c/a75b593cb73f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


