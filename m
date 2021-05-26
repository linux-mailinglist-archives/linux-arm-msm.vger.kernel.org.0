Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5521739207E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbhEZTGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235861AbhEZTFV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4559061625;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=WvNyR6dx5bjKXUkDyNC6lVf/1OFywr6NRYbAUBxAaiA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aTKjtb1w82Gw8x3EVh1NADRRDLJjFKydFBZz/YSGylwOmmTCjRXKSYPC6JHYDhNqe
         phD1rKRwl/B27BIDerRVjuUeBH1dMfBKLza+eMQaMyTv1lswwvBO4N/lDMLr+6U6KC
         bPxdzxey89FL8LXg0JiDHmUuANMS0EQhJTJ4eQeT3wkg7aV2oiEcHW3cpc1RgT1xGZ
         DCWp/q5ROsYtEeW1I6feTt9OD7j2+v7RENXOFWgumuRtoYGLOlKwI2vYdqR/dG6mvM
         owWYwvAE4B4SQ3nDlbpoZiHMxoeBwqY0GFZM+l4aqCZqW0q44FO6RhQmbBmjxe5gWK
         c4/wtrwocRi5g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 41013609ED;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: lpass lpi: use default pullup/strength values
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580926.26840.17533539923241541757.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <20210304194816.3843-1-jonathan@marek.ca>
In-Reply-To: <20210304194816.3843-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Mar 2021 14:48:16 -0500 you wrote:
> If these fields are not set in dts, the driver will use these variables
> uninitialized to set the fields. Not only will it set garbage values for
> these fields, but it can overflow into other fields and break those.
> 
> In the current sm8250 dts, the dmic01 entries do not have a pullup setting,
> and might not work without this change.
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: lpass lpi: use default pullup/strength values
    https://git.kernel.org/qcom/c/2a9be38099e3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


