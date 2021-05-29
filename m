Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C65394D38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 18:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhE2Qvk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 May 2021 12:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229901AbhE2Qvj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 May 2021 12:51:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D466610FA;
        Sat, 29 May 2021 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622307003;
        bh=y08og2W2xJjaqSvKiskAwITF/FKJ4xzzGFRrrPmOVbU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bus5FzIpHRukGXcJ+7pJvAbrjrDzYIMGbj8veJK7eB1om5LNboiqM65dmm/6NoHxr
         yTGkbQ/jCchFRNcHbbsQH4F+zn+tqOkugOWOnBF5Hi0Ci7AWFP2KnmX8Ml0JObJXDb
         0iZSeUWtF8nR5oqlQg10ay7UmLVyFtBs59MkXPSb2IxnClIMSYQ435FtnjU3uwmRxq
         XY3hxuBnipfimxvWV72Xg/t5xS3MNASS6o0GzS8gXhD9u3bMmi6AAxBCYOPFvumDSX
         Z3S/n1VnmgZrhRAGjvUxQsgusa6NjbifRyr9/UpZe7hpIcu9OKttVs338oXnKFL0fW
         s2cAgs+WvKuFw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4834260987;
        Sat, 29 May 2021 16:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: qcom: sdx55-t55: Represent secure-regions as
 64-bit elements
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162230700329.5097.11274193755063589702.git-patchwork-notify@kernel.org>
Date:   Sat, 29 May 2021 16:50:03 +0000
References: <20210512050141.43338-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210512050141.43338-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 12 May 2021 10:31:40 +0530 you wrote:
> The corresponding MTD code expects the regions to be of 64-bit elements.
> Hence, prefix "/bits/ 64", otherwise the regions will not be parsed
> correctly.
> 
> Fixes: 3263d4be5788 ("ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T55")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: qcom: sdx55-t55: Represent secure-regions as 64-bit elements
    https://git.kernel.org/qcom/c/619d3c4bf8f3
  - [2/2] ARM: dts: qcom: sdx55-telit: Represent secure-regions as 64-bit elements
    https://git.kernel.org/qcom/c/0fa1baeedf06

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


