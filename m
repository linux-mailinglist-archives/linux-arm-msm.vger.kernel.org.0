Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C136239204E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235336AbhEZTFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235823AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E51161581;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=VXxB3OSCRLUNRS0/QNmJZQlZ0L/4jS1/krffGRxg23w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lFHez2lAeDQNmLW5HWfWqonC5QqNcWami9aahKM48qn703dbF+Pqx1UojfNPFMa5j
         ilH6spgLkvPUXFw4z6LAC1WnVI00kgwykhjfpf/clSqLsBmdGY2ZAgW+lcJqocZ9fD
         Y7tKJKY7ETM0jWVQu+TJCynXlQjzywbFajvwh8nFueOZbz5JJu4+PByxOArlVJ1ezB
         q4ntBlHecNeia2VdK82MLUMlCmE8uQeYWL00xIveTVisWWCtD221pgw2XNNsoFdOfL
         dluhQNZDpv8gZgVM0gxf2Re10CT/UCkm98pHEWqeb80v7lO9jrQDyL+20CF7qrV7kE
         Zzm+x3O1Zztew==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 69F8E60CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: mailbox: Add compatible for SM8350 IPCC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580742.26840.9027926355696969397.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210312051203.3555751-1-vkoul@kernel.org>
In-Reply-To: <20210312051203.3555751-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 12 Mar 2021 10:42:03 +0530 you wrote:
> Add the compatible string for SM8350 IPCC block on this SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - dt-bindings: mailbox: Add compatible for SM8350 IPCC
    https://git.kernel.org/qcom/c/2a7db0d6eb5e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


