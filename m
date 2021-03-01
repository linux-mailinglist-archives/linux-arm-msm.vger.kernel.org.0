Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37170329286
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243653AbhCAUqv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240525AbhCAUoM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:44:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id ED22464EA4;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=+kZPfosVVdZUacckkxPeGitSVrIB8zklXPh2i4IIlFQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YoF5O6gva9RbZLXHV22Zv5z43M47vWHiFvOyBLsQzPNWGZKO/8DRjsuLZ07y/rKQS
         OwG16hN+G+oIUEL3wIEuQTPw5TobLBTRfhDroViExWsjYcdAq/VHjbmRYOt21oGrYM
         wEOfIppfbr+ii9GKJDK+mUCub1rnF4Qm+AcEhFBGXelCtFFDv9Y28Lheh8YKnOiHcZ
         qwMebK9XY12rHYorkMlE291+K21zGUoRz/DyT0iRNJAy2U8fQEdVNvJRgZcN7qMtOr
         JOYBcQHmMQyITBAuzTWG9G9p2u5ALM9eTjDKYAzbcEegAHuuYsrsMKfVzzI7MIk8Pb
         d/sQx6NBsabcw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E761E60A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878294.6187.4545892945424841706.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210115090322.2287538-1-vkoul@kernel.org>
In-Reply-To: <20210115090322.2287538-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 14:33:21 +0530 you wrote:
> Add compatible string for sm8350 iommu to documentation.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: arm-smmu: Add sm8350 compatible string
    https://git.kernel.org/qcom/c/70b5b6a6daea
  - [2/2] iommu: arm-smmu-impl: Add SM8350 qcom iommu implementation
    https://git.kernel.org/qcom/c/d8498b1e4ecc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


