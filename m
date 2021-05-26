Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4AF392038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbhEZTFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235802AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9283A6147D;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=kfJCeinPQJCSgGrhwzuj4C1hP3uH9vNFnEN3/YC8q7A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RpN99adFX6Mhv8qWaCz8hw86Thp55QRLAxvCaanMTEBU3cPVsANVTWdrx0Bb38kA2
         NByy8vDCjqVBVwzrDhbMzwlekN6xwdc3kTK/j8iR20lNwtHCgMSIggWJqJqIK1MKa8
         TDf522ZSOgsdxW2avXO0n71dVq5M6Q9iYxvDn3ZR8qL40Acp0ZXq9W5LG66kJZM/XW
         O1Sp/XwMP/LSL9lTQAcQ1dhlBRJaj6WgIRbdHfFz/CKsajFPxNDt0WNuLX+BIgL/Jt
         L2+0QM93l1vc4bEoSrRqKdLQWw+aJIb/Njhh94J3g6PmVZmdXJ+sFxDa59YkMfEvbh
         VgzAzfDtouY6Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8E0C0609ED;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: sm8350: Use the correct ids
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580657.26840.13180677893742640829.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210401094334.28871-1-georgi.djakov@linaro.org>
In-Reply-To: <20210401094334.28871-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 12:43:34 +0300 you wrote:
> For creating an array with the members for each NoC, we should be using
> a local indexes, as otherwise unnecessary large arrays would be created.
> Using an incorrect indexes will also result error for the consumers when
> they try to find a valid path between the endpoints. Let's fix this and
> use the correct ids.
> 
> Reported-by: Alex Elder <elder@linaro.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: sm8350: Use the correct ids
    https://git.kernel.org/qcom/c/7a3aad40c68a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


