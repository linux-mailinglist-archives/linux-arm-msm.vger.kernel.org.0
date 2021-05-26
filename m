Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73801392045
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbhEZTFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235788AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F2D0F61477;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=SkMy02Xi8stzKASF7kKejSx/7Co9mL5QtIFDYdnfBnA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UfjtBuly7eHQgoXkAG43jJOP338KzgZB2LhS0pnfn7VM9R1fY6khwkwVznX/48Q/6
         g4/c8fr0IsDH+i9CMXPTbzLaxpfup+s42imL6ZhEVx5fCRjnhuJkdH3O5dxBy95kFl
         Kwc0M8Ibj9uAXYSZK8VtQq9MOxEZCGPKLrs/L+M/15rRfCQqgslOFqcoPjDopEbOIo
         C46FfO3tnfzmuxVb59HeSpfywkLc4ZUM3sXJPCCLPx6D0GhnebBu+/L7qbjTfSRW4B
         BQD7/4NgZblgLE5WHLVCekunqPfp5BUyPoTVh8qhtvEXMtnNaKnGzQL+nlU8kybNGX
         LujA6XA4Ltqng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EEC4760CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] usb: dwc3: qcom: Remove redundant dev_err call in
 dwc3_qcom_probe()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580697.26840.8818822534849136832.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210410024818.65659-1-cuibixuan@huawei.com>
In-Reply-To: <20210410024818.65659-1-cuibixuan@huawei.com>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 10 Apr 2021 10:48:18 +0800 you wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] usb: dwc3: qcom: Remove redundant dev_err call in dwc3_qcom_probe()
    https://git.kernel.org/qcom/c/dc1e7e9a27e0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


