Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B2D392035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbhEZTFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235795AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4251961460;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=C4QQ8KVJLw8AclmAetxpx/Y4Ycfl7FSgj1bsUxFGk+4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bD/SAcCgk6abv1WZusI3cJSRqMJTje75fimxlnp2EmUtG8PECHTnPlpxUIxhLmJin
         HjbsRyiPJigkFW4/9Kwhw+S+E6HQQfZO2eWNnVe+JuyKeWZcSOnEHzqdZ13aZQCpr0
         k9DO6qp42oGKjlStRJwOEulXKNXLOJqLgmaOPbZ1y9csBMpPlLkMN58TRil+qlQhHV
         7YD82Hh9OSshSoAiq24HNOuIKY+aD2UcnqS3ZCjYmEf/xbWXP3pwE+dzQL/e1T2eE4
         /GUhIBgfYfyNidMs0y4qIr7muOXEgzNInv5OKLyLGJ1DWe/maQFc2qv6VYNFwXMzvF
         5M0HDLWlO8uSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3C64B60CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: icc: add interconnect tree
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580624.26840.15783676897976101637.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210328171618.2759956-1-vkoul@kernel.org>
In-Reply-To: <20210328171618.2759956-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 28 Mar 2021 22:46:18 +0530 you wrote:
> MAINTAINERS entry for ICC is missing the tree details, so add it
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: icc: add interconnect tree
    https://git.kernel.org/qcom/c/173ef5f84b6d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


