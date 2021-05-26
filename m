Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF123392033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhEZTFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235796AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F65C61468;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=oE8mIG7Q6pu1Y1IdOggIlAyiulvCZlvJHy0i8l78uWI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fParh1mByYP4h7UZBUiUkF+RXSaikXk/hOGDspDljc7S2QdcqVUd65CeB1i/0rofp
         lxoYDYaAZvnYlshdsAbEk7gZ36+Eu+AeCbE73ivEjBVIDGejkNzmMpgHqcLHKL4iAO
         3+3h4Gq+CCoJAg0ipgVyY1cTXancZ/Xb8ubO/hbKM73D1wcOW1ouo7TMQSOftUUDg1
         CF1NJJ7jfDEGTaChggQD7S53jsHxaWGkWZlMIc6oNKTikqtz0nhyd6NT9q5xwFEhB9
         OAMNbeKzi5gbECf7/WBqfdzssSIP0rAUtZac+HHAA/9JbK6CBrL7N6A3br4hspZ/fI
         RywEmaF/27BaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 59A0460C29;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] interconnect: qcom: Add SM8350 support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580636.26840.2044147640840091241.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210318094617.951212-1-vkoul@kernel.org>
In-Reply-To: <20210318094617.951212-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Mar 2021 15:16:15 +0530 you wrote:
> This adds support for interconnect support for SM8350 SoC
> 
> Changes since v2:
>  - Plug gaps in indexes
>  - fix typo in commit log for patch2 and kconfig depends (for real this time)
> 
> Changes since v1:
>  - Fix comments by Georgi, split the header
>  - Fix the macro for qns_llcc
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: interconnect: Add Qualcomm SM8350 DT bindings
    https://git.kernel.org/qcom/c/c009ffe661f6
  - [v3,2/2] interconnect: qcom: Add SM8350 interconnect provider driver
    https://git.kernel.org/qcom/c/d26a56674497

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


