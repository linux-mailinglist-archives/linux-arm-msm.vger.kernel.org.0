Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A7249D3C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 21:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbiAZUoB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 15:44:01 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33534 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiAZUoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 15:44:00 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B01E3B81FDA
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 20:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 616A8C340E8;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643229838;
        bh=kOL1f3ZPL8TL+8f55sfbYt6O3ZZTEa0h8vDFSPpF8Ag=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J0nPW4Eh6pE6gXyJr8A8vOU354XwqVngpQuxowQuTgvrrRaTlLtf7Ih6EaKa/M9ks
         c6yfJDqBM7ww9Ui49IXG7lDJjDrbrSDZnIK5eGguoFyPWhujG6qzFJNL1ZqIQ3H92W
         0WnO2WnWR7Cmmgy3kIB22BbMM9NqNZFri+K0mon/D0SPUVCg/wCTtqegJ2Fd0RJhlQ
         cbAGrgoz9vNbpNT1G6hHv0jcrihnYO7rxxCfUwpdyg4SVNfocP7YvBOh8PutZNnJdQ
         EeysYGz360shV0VDvFtn2Fk0PqDKY3upLEEyLxf8mLU6Nwzeg4rckz8uokrEH+fbZK
         SUTs0C4/RBubQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48642E5D084;
        Wed, 26 Jan 2022 20:43:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: Remove "spidev" nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164322983829.21535.1626815891749017941.git-patchwork-notify@kernel.org>
Date:   Wed, 26 Jan 2022 20:43:58 +0000
References: <20211217221232.3664417-1-robh@kernel.org>
In-Reply-To: <20211217221232.3664417-1-robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 17 Dec 2021 16:12:32 -0600 you wrote:
> "spidev" is not a real device, but a Linux implementation detail. It has
> never been documented either. The kernel has WARNed on the use of it for
> over 6 years. Time to remove its usage from the tree.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - ARM: dts: Remove "spidev" nodes
    https://git.kernel.org/qcom/c/8a3804c030e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


