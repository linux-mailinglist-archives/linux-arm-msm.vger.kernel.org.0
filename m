Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06862E73D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgL2USj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726583AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D824022DFA;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=d8U/e3iTtoEY7ur94eBMB9kTD0tLVQt6M+Za2ziCWS4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o/vkEyAtlPfsU+U52f1te7penrd+A7nUK8yGbszTJRpo2WXjq5sDvkcZvukVEsSG3
         VZ+4a/JHTS6x+7F9YYDNx7oo/ZH9ogfRUDgY/NKFJBzMBVSg1GBKvdbQwCilvY4N01
         VWd0gnz/99omxaVMYpOq1vtF+oWekZRNeDJGU90/wOHTFWEAQMR6GRKBu9UBIcjmu/
         DrCUB/p5dinRCTY++wnrg5YdDXyjbSLUvJrL1qKdYQumT1I9D5WU/4AS/UKnbSpH7v
         GfjiXaam8LUZk5uGUXj5HnrG+M3f7bJUKzF/BLLVoGHuhz5WVC9XcjKp1ZCg7sd3yd
         AOTlYapOFj+2g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CEF56600D9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk
 ones
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293584.13751.4553001791578739369.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201114174408.579047-1-sboyd@kernel.org>
In-Reply-To: <20201114174408.579047-1-sboyd@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 14 Nov 2020 09:44:08 -0800 you wrote:
> Let's call pm_runtime_get() here instead of calling the PM clk APIs
> directly. This avoids a compilation problem on CONFIG_PM=n where the
> pm_clk_runtime_{resume,suspend}() functions don't exist and covers the
> intent, i.e. enable the clks for this device so we can program PLL
> settings.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> 
> [...]

Here is the summary with links:
  - clk: qcom: camcc-sc7180: Use runtime PM ops instead of clk ones
    https://git.kernel.org/qcom/c/8d4025943e13

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


