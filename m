Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10606391FF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235786AbhEZTFE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235364AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 234E4613F5;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=VLvg3cGr9BQQRMwu2drtg88TfFNRW4kn5oz5GqrG6mg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WsE/eAMW0CBomidBB6Lz6QtICwp2n+Tv359DhJ7DOs+/uzxjXI52UUZempK3kbzgz
         /fHENkGnYmKFwoJvQ9cUz656cl6VSCKP1SdKDoRaFNkDfMjxhMsiGYPjrZyqPZM8YO
         bMgGP+sE1Px2Us499K73EfLRskyU9Hwfj0DQnPIpAl6CiS9uv8qkyXweDk84KRPTDG
         s5VPl07zzcYKTP1w6ShuZ67GYwcEnabioIHsi0JjQoOwMk+xHsWWVKAFNqZ698SNwG
         qJI/f6h5r8lvH4nJJtillfmZLRalP6/rLcqmGWOf7jKnVmUL/z9FYtviN+Dc5IlzJM
         j73g+0KEADGMw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E95860CFD;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Handle probe defer properly in MTD core
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580412.26840.10323745732020826341.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Mar 2021 18:57:55 +0530 you wrote:
> Hello,
> 
> These two patches aims at fixing the -EPROBE_DEFER handling in the MTD
> core and also in the Qcom nand driver. The "qcomsmem" parser depends on
> the QCOM_SMEM driver to parse the partitions defined in the shared
> memory. Due to the DT layout, the SMEM driver might probe after the NAND
> driver. In that case, the -EPROBE_DEFER returned by qcom_smem_get() in
> the parser will fail to propagate till the driver core. So this will
> result in the partitions not getting parsed even after the SMEM driver is
> available.
> 
> [...]

Here is the summary with links:
  - [1/2] mtd: Handle possible -EPROBE_DEFER from parse_mtd_partitions()
    https://git.kernel.org/qcom/c/08608adb520e
  - [2/2] mtd: rawnand: qcom: Return actual error code instead of -ENODEV
    https://git.kernel.org/qcom/c/55fbb9ba4f06

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


