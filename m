Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83971355A6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 19:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhDFRaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 13:30:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhDFRaQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 13:30:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A0A58613BC;
        Tue,  6 Apr 2021 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617730208;
        bh=04Gb+bYRkc4CIpTvXKHoQ6Fc5ajkyybu/IfWhaEdyvw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FRpmglVbzTOosO2xeI8A26r9nf5S8+MAAR3JGQpi4uHMKTlH3WEIp4FreYA6+C3ZY
         Uu4hBTh6aiA1HlTjKAjA1Mg6McRWxl8tYTpacx30IbQT4c5+CZVAknQzOGTM1Y30jR
         gP886YwhFaOJr+b0RSNnlVJlZij5W2I+QMN9Z35DavsX0yDJdxWDEiiiQQXEM2vf6g
         TPiI88V+K0B43QudsLWMW1c2xryX5uxOgOqhbv8rNvTrShNzDMASKcC1X/0Oc3eXDE
         5W75ALlMPd/zOHKEWJEzc9b8wLX49NrIYYemSiVAJAbkyBFXRkcQRoCO2L0qrChZcv
         eBMqI4+eqDRWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 90B7F60A19;
        Tue,  6 Apr 2021 17:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: sdm845-db845c: make firmware filenames follow
 linux-firmware
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161773020858.5139.7579054729629456032.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Apr 2021 17:30:08 +0000
References: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210318201405.2244723-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Mar 2021 23:14:05 +0300 you wrote:
> Cange aDSP and cDSP firmware filenames to follow filenames merged into
> linux-firmware tree. Switch from split .mdt files to merged .mbn files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - arm64: dts: sdm845-db845c: make firmware filenames follow linux-firmware
    https://git.kernel.org/qcom/c/7443ff06da45

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


