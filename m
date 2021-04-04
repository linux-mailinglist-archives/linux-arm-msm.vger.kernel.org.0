Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD98C353958
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230169AbhDDSKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:37290 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230495AbhDDSKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E889161364;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559811;
        bh=mL8/nKYmvhoPrgU0ZVKyEZ2Qefc5/EkBJDoavaLUxR4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EbwYeIZjFD+6lzFmIkjf/EQTp6rHV/TrUqcpCTR/IIR3Gw+tjjJD8Nse8tKzf0LJm
         RArXUH54/5xxP7L2/RVhOehXJvxV0G2W4htm8yD3ZlZjZoCKgUDlwTQ45cHOTv7xCj
         tBdantPeU3eY5+R0zIXXujILPuAzM6J+J1xfRkgxcUc0kuypxJ2U5wDpD45DxbjtZO
         lAhYfJvKVu43IP0h8Dld2sGq6aXTelPh4Vr8AzqWDiFZ/KJnGXX/EVvQoTdsccdGsb
         nJbiRDjmVSff0+vM1/FsvRVLS8nnUpbSp5T91wi23TGaWZ/zmasNmh10K2R21BtCBf
         TSBB7K85SCcHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DBA9C60A19;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: Move rmtfs memory region
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981189.6823.12175460995264490654.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210330014610.1451198-1-sujitka@chromium.org>
In-Reply-To: <20210330014610.1451198-1-sujitka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 29 Mar 2021 18:46:10 -0700 you wrote:
> Move rmtfs memory region so that it does not overlap with system
> RAM (kernel data) when KAsan is enabled. This puts rmtfs right
> after mba_mem which is not supposed to increase beyond 0x94600000
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: Move rmtfs memory region
    https://git.kernel.org/qcom/c/f66965b06b15

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


