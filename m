Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84EC22E7369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgL2URI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C564221F8;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=WsXRb96TT9wDqGHmQB0Nts6CaCzNCzcrnY/aOslYLv0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a36vBVmpwiLbFkzlTyP1cFdC0hE9Y7y34olnjOdIha8yGERZoogcVMSszejidqoAc
         j6kiYBOCa9p+grrLzNRh4mZrw2df+sYZjP5bEQ2QQXH/z+Qkh/29xGrUSvlbxhG4Y3
         6evRI8jQPP4X5ToVA/TShMyKsop87EfVxSE9SDeDNh+uauwc+sqHLKsV8V9Fwnn9Qc
         AMCzDYd+vfgksp9quar2TAwccOzQvoxuo+H6qEbRo5t4NbAC5qdxrXCHUEUHoAX9B8
         475oQiTatGxsrof2ROsQMPwCHu0DOPsEg5+1R1512aYNYyI1jYsenni7luhHrS/q9f
         UERl/4TfDA6tA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7780A604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: define to_clk_regmap() as inline function
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293148.13751.13317865745070543134.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201026161411.3708639-1-arnd@kernel.org>
In-Reply-To: <20201026161411.3708639-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 26 Oct 2020 17:13:57 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Nesting container_of() causes warnings with W=2, which is
> annoying if it happens in headers and fills the build log
> like:
> 
> In file included from drivers/clk/qcom/clk-alpha-pll.c:6:
> drivers/clk/qcom/clk-alpha-pll.c: In function 'clk_alpha_pll_hwfsm_enable':
> include/linux/kernel.h:852:8: warning: declaration of '__mptr' shadows a previous local [-Wshadow]
>   852 |  void *__mptr = (void *)(ptr);     \
>       |        ^~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:31: note: in expansion of macro 'container_of'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                               ^~~~~~~~~~~~
> drivers/clk/qcom/clk-regmap.h:27:28: note: in expansion of macro 'container_of'
>    27 | #define to_clk_regmap(_hw) container_of(_hw, struct clk_regmap, hw)
>       |                            ^~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:155:44: note: in expansion of macro 'to_clk_regmap'
>   155 | #define to_clk_alpha_pll(_hw) container_of(to_clk_regmap(_hw), \
>       |                                            ^~~~~~~~~~~~~
> drivers/clk/qcom/clk-alpha-pll.c:254:30: note: in expansion of macro 'to_clk_alpha_pll'
>   254 |  struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>       |                              ^~~~~~~~~~~~~~~~
> include/linux/kernel.h:852:8: note: shadowed declaration is here
>   852 |  void *__mptr = (void *)(ptr);     \
>       |        ^~~~~~
> 
> [...]

Here is the summary with links:
  - clk: define to_clk_regmap() as inline function
    https://git.kernel.org/qcom/c/8d8c3131248d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


