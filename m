Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE45392055
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235778AbhEZTFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235825AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 979A4614A5;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=4VXbIBYBeJ/9GwsXsuY+kTYwdvV4W5Ba3AOXJmobSVY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tNIm983Aa7EbzT1vaV/UGbEy+3as4mAMMMbejqCz4rEIVkFuegWkSQt9Jw5gwTLDX
         vKn1hnsqKM4XFt3uN4tatrXzRqYKCrvRzsNThD5TGIhHGX53NnyhDmcF+eNGJOl3iq
         yM6fCNfeEokZ8HHKc53CAlFy3gI1d3010hCpDw4GezTxNDC4zIlwe7p5DsKqRY/yVP
         Zo8YarCsxTTul3YJINZnu0oraGJ03N5o5qJZS25yY/Gqc2QaR7tvNYeQmVDRlLXqEa
         TmW+/D5cLEhrHaFFNqU/ruKFnpbAW2p7K0Lp8pxD5KFz8xtxiEzVvH8B/elwG7dlL0
         VAye0nD5CohPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 940DD60CFD;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1
 clk
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580760.26840.1841870472255061985.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
In-Reply-To: <20210224095013.1.I2e2ba4978cfca06520dfb5d757768f9c42140f7c@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Feb 2021 09:50:25 -0800 you wrote:
> While picking commit a8cd989e1a57 ("mmc: sdhci-msm: Warn about
> overclocking SD/MMC") back to my tree I was surprised that it was
> reporting warnings.  I thought I fixed those!  Looking closer at the
> fix, I see that I totally bungled it (or at least I halfway bungled
> it).  The SD card clock got fixed (and that was the one I was really
> focused on fixing), but I totally adjusted the wrong clock for eMMC.
> Sigh.  Let's fix my dumb mistake.
> 
> [...]

Here is the summary with links:
  - clk: qcom: gcc-sc7180: Use floor ops for the correct sdcc1 clk
    https://git.kernel.org/qcom/c/148ddaa89d4a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


