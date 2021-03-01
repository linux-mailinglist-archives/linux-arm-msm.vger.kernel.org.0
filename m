Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7A13292AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243593AbhCAUta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:54738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241933AbhCAUqe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A834264EE6;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=jFdDthBJJ1tWwfRY2Vnc0CwuOR+291WRAB5+665Z0bw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=L33YDytA5kfi1tLtBEU17dyoEikCvx0qHmcQkfijtlfiw6ChVV2gZU0Urlqx5xsKP
         Gx2erPyu77zngutN1q6edYYQVXAIslpOAFerFLhW31eh3/ys+60eiNM1+2wIqY1CE6
         EwLqHCcQj5dAHfhzWngu8ohTZYZ5Zs9ND2wRQxU7B73NuBKx57PlSlju4zvEar7F7P
         b+pEK9ema/HTvnd9rH+26BWhgmaLxtbV2ROb4UWEBl401dFjvHNr1c8n12gCcNfCUR
         2ovED9LiqSMH/IwvjyM6ZaUysekNp0v2+cgzA1hUskwG7p2zCQlg4y2isNz9uJ539d
         VtGI0FNi5n3Xg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A4D8D60C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: qcom: Add SC8180X APCS compatible
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878367.6187.11902369696917115622.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210121014130.1612454-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210121014130.1612454-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 17:41:29 -0800 you wrote:
> Add compatible for the Qualcomm SC8180x APCS block to the Qualcomm APCS
> binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: mailbox: qcom: Add SC8180X APCS compatible
    https://git.kernel.org/qcom/c/114c93bf2859
  - [2/2] mailbox: qcom: Add SC8180X apcs compatible
    https://git.kernel.org/qcom/c/d10c851f25f3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


