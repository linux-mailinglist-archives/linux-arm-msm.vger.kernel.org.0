Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78CE3AD221
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 20:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhFRScO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 14:32:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:51694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhFRScN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 14:32:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5E364613ED;
        Fri, 18 Jun 2021 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624041004;
        bh=fUOTiIeSXlv+7K7tBUwKITpreODRaAuBYR5v2LkdXuo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YHT5lzGcbVTjsBkmf2UVf9kuLNR7sIg2RTbpk9SgY5WlfZWCpKjapHpVi0IXk5qkv
         fVHAdCmjp50gK1whbQbfJ7hnDkYaAZHHuON4mpPfsJNPOkF/mlDAbaR+XfX2UU+t5+
         gv2McKxcJpUW60NVkkJhDhg8VCCK4Q6G6MbAI7wKwKxVyJFIkzaxJpMVTwTVQncGYQ
         81puAuUV6/Jy9Dm+UpSQI7ROFCwtBFhjVKgtOxY1zgoxnXbSEpsGzyAQjygvVcRmv4
         vEuzgO6QhSK9HORAPciHRxUUKVLj22/pU/QUhefrePWm0Mcas8z8pBuvnbu674lNfR
         AL1R0R8Q7z3Ow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 53E4760A17;
        Fri, 18 Jun 2021 18:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: bus votes for eMMC and SD card
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162404100433.18542.9288858048304991937.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Jun 2021 18:30:04 +0000
References: <1623835344-29607-1-git-send-email-sbhanu@codeaurora.org>
In-Reply-To: <1623835344-29607-1-git-send-email-sbhanu@codeaurora.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 16 Jun 2021 14:52:24 +0530 you wrote:
> Update peak bandwidth and average bandwidth vote values for eMMC and
> SDCard. This patch calculates the new votes as per the comments from
> https://lore.kernel.org/patchwork/patch/1399453/#1619566.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
> 
> [...]

Here is the summary with links:
  - [V2] arm64: dts: qcom: sc7180: bus votes for eMMC and SD card
    https://git.kernel.org/qcom/c/77b7cfd0dc68

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


