Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A16392031
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbhEZTFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233866AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5218B61465;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=HcWETLpur8YM9QRoGDy5HbXjjb0w6LUuy9maknDUUi8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kBnMb+GFXr8xdRNOJtRUX31rxB71zKlNyk5HvDo4okjzszBASRfDit4+rSP3Afh+z
         rATV45uvf1grnpalfi73fwBQPnE42yW/KnrLOn3fgRghk9jlODqz+6RrbPyDcadV1X
         G28FlF28aoUjDRBq46m12Cn8Avc7YwCNeBMmgiFplNZTjFEgq4lWIf2xzDQOa0tO7e
         PElVefI1kIkskGS8CEM2PXRPBYdHu49S4CguLrHrZ1KsGyqNQziNhKpSCjR9fgYf7r
         1xhbDzg5xMh26hkt+0nI16udiP6B7/zrl+wpXT43PT/pVicQMgKlm/9WgUQqBE55o9
         iZVrctDnjExtQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4E04E609ED;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: Add SoC compatible for sc7280
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580631.26840.14995963666530571995.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1616651056-11844-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Mar 2021 11:14:15 +0530 you wrote:
> Document SoC compatible for sc7280
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: nvmem: Add SoC compatible for sc7280
    https://git.kernel.org/qcom/c/b1f20fd04577
  - [2/2] nvmem: qfprom: Add support for fuse blowing on sc7280
    https://git.kernel.org/qcom/c/5a1bea2a2572

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


