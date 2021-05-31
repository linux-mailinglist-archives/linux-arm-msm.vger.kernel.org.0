Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BBE396971
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbhEaVvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:39238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231714AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B5BE61375;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=a8b/C0heqBfVAFtFNeNjP2HHFrxDfpDwb+njMh/rbYQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Pq5mqy94zL6S1Jb1YEOtIHXDZcZYA8spBP6LqgXwARY1l2Zh/F1TXysZVUFsZFFbJ
         R/hmI+MxBcr8VcB8emEO7E53SM1E2VqjvhZ1/vMhBaYvqeS85ILVE+rVnwJoLOvx1c
         dn5nSjxbriaVT6WASRkJgBMF7hg0ouoLTtBYux+TvAe5Opwz08wEEvHWJyybHN1bUT
         rGxf30innYJVkD1DQaMC/S58Fey7lhejl8qzik7FtwMTzlekWmgLcY/a30kYhyzZQp
         sXnLWjzJpQM9gY/9rCKzhE+gK2LrfNdI4Bnr1y9hSnmoWu+q+kU9NPAgPMk+MKxp2Q
         IJM80MXHE6R/w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 54A9B60CAA;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780634.3521.10041642739676810501.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210324231424.2890039-1-swboyd@chromium.org>
In-Reply-To: <20210324231424.2890039-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Mar 2021 16:14:24 -0700 you wrote:
> We should indicate that we're not using the HPD pin on this device, per
> the binding document. Otherwise if code in the future wants to enable
> HPD in the bridge when this property is absent we'll be enabling HPD
> when it isn't supposed to be used. Presumably this board isn't using hpd
> on the bridge.
> 
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Fixes: 956e9c85f47b ("arm64: dts: qcom: c630: Define eDP bridge and panel")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: c630: Add no-hpd to DSI bridge node
    https://git.kernel.org/qcom/c/c0dcfe6a784f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


