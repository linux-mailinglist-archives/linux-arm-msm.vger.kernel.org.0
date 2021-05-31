Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60BAE396968
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231916AbhEaVvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231377AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0DA3F61186;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=jLnQlJf2SmdqkFtfHDZq0aCwkBahnVDuNIaVa4aXyWw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AYRVX/Ssm0irGPBgyrhmair1wASyHiV1mOyFojqfifVeZ+hBd2cxk5vtd5WFd3vTC
         TWu9yEapMCKpGLvZ9dcoLSP71iK48BCd3emR6MLwVSx0TyA3jQDQf7f9hkO8IBw1iE
         ++mbsb0neAFzkewsv6yy816AiKRo2r76Hx/DVSYu65AnddstEYnEwAvnFdYfz0Oqgi
         i+dX3Sqwb5imQRusFznbZhZX302N2u9HsDujXmy8SOQKCBZrx+/GItzm2/k/C+CiqY
         gZIDUrY6nJXpJ9NnbIsGUAaAt1AM5wT4H1dRHdw1yfMz+JtbsR5LZaSfuWgAB/X06e
         F7cRIn+/xdh/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 02C2A609CD;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780600.3521.9799301173971355804.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210324025534.1837405-1-swboyd@chromium.org>
In-Reply-To: <20210324025534.1837405-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 23 Mar 2021 19:55:34 -0700 you wrote:
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be wasting power
> powering hpd when we don't use it on trogdor boards. We didn't notice
> this before because the kernel driver blindly disables hpd, but that
> won't be true for much longer.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: trogdor: Add no-hpd to DSI bridge node
    https://git.kernel.org/qcom/c/5f551b5ce555

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


