Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 094C82F7E01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731733AbhAOOUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:55476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728974AbhAOOUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D2F223877;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=l+v9ewmH4im30/YNQRH6QBoQWOr/BXaHpqaCQVTSWSo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P/xgwQ0ranza5MfONlI04bntLqNdIRPg7brzy81hfyEPzndMKPwiMIursN777AxwK
         6BSu7OQqkXAYnay09ZSadmiSshEmU0t3KPpTRgNyYiM698+c7IOoHltWX3VmWrqBDo
         we8DKJ7ORg3mfZVzYI3f5ngteiyfIcDn9+J8DKh8Q6xQwO27H8WOD1DvDaVJPcMOpT
         bkVRos6Q68nTBn2jd6UccbeMX0mKtD3CknFh8ULxIzdFlGGUbCko9bwKmN8+s9PcPM
         Dirux8STFOhjbejTup0cX4BH5s0URugPYfASB6k8d5/QFrAR9svVuXzbXBszso0VzD
         Akovhr1yhy7Pg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 10CE8605AB;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040906.1237.13515200882938547532.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20201222001103.3112306-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201222001103.3112306-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 21 Dec 2020 16:11:03 -0800 you wrote:
> The GCC_LPASS_Q6_AXI_CLK and GCC_LPASS_SWAY_CLK clocks may not be
> touched on a typical UEFI based SDM845 device, but when the kernel is
> built with CONFIG_SDM_LPASSCC_845 this happens, unless they are marked
> as protected-clocks in the DT.
> 
> This was done for the MTP and the Pocophone, but not for DB845c and the
> Lenovo Yoga C630 - causing these to fail to boot if the LPASS clock
> controller is enabled (which it typically isn't).
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc
    https://git.kernel.org/qcom/c/93f2a11580a9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


