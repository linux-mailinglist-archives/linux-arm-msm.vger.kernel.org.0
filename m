Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58637391FF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235794AbhEZTFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234987AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 33BD161402;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=e6rW+vQhKZUlWID9T8HPYTMl8EucCqoKFLC9uDBQu84=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UaM/NhF10tZRrtpGf6uUjLTyV+VdtIbJzo86J0aXrAbDXPgMB/36W9b8gUDRKRiKy
         M1Qqg3pEr0XxmS/Q66qusA6OBckaVxI10bM+vFkWJ3kP3udYOHjgp3prjzQlUoOqMG
         mvVz/wWPFWKMKWi+Mq/rUnZ2Jp3Tdci0GZSR7b6szvb6oXfPp6JzJNqEuoFFAiW+JX
         98DClG0SNboxAG+zemnETmkICFt8jEVpXmSjqjIDRbELCL8OxEF7lJk1Gb008LV1LK
         AkhEQAHlgS83E4fAxGDogdMKpettE8kGD1X1kaubYpXeaW4fzUH4jyoYu7kkOZ1EUt
         kEdjs4JI5f5tA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2F58260C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: Make firmware image optional for controller
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580419.26840.9451895669612579833.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <1615315595-37750-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1615315595-37750-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Mar 2021 10:46:35 -0800 you wrote:
> Some controllers can opt to not have MHI download a firmware
> image to have the device bootup and can find the device in a
> pass through execution environment, ready to go. Thus, MHI
> controllers for those devices do not need fw_image defined.
> Make it optional to accommodate different bootup modes.
> 
> Suggested-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - bus: mhi: Make firmware image optional for controller
    https://git.kernel.org/qcom/c/4d5f52838d11

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


