Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55022329282
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239812AbhCAUqp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:54062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238369AbhCAUn5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 073DB64E69;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=R6GLhDnY0S1tC1FqdJI9txn/nJW/s/KDLvLGrpvaFU4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uetjDm7NZPBYjFP50/3RDgoboTp2zL/DbPsyY+MnoXq98sED1Z3k8HWJGPHZvCm/j
         v1Ih46m3RBThAcxB5wbg5xnKFPEbMYfAENM3x2WXN84/DgemDh8E806AcabRgQa4kk
         8XJwa3KnA1HqpjJWA6BYaty6qNUrNuuvWH9HIXheUvFXaYr7K32SWk9D+8sRrEHWpF
         jzwlEVGyqQepLs63V+Oqz3RjW7F41vA9uDpGpZuzlFloHpGsnst7Jxv6LZpJ9ZfTmS
         juHZhK4ig/vCDCIrE9+Z8AjSCG3pIAY4WR8h5wkfRDFp1HzF3A8lpdDAL032R/7Q74
         tmSq8ic6Zc3aQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0241F60997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/1] MHI fix for v5.12
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878300.6187.2682642829044028363.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210210082538.2494-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Feb 2021 13:55:37 +0530 you wrote:
> Hi Greg,
> 
> At the last moment we noticed a regression which existed since last release.
> Since we are very late for v5.11 rc, please consider merging this patch for
> v5.12.
> 
> Thanks,
> Mani
> 
> [...]

Here is the summary with links:
  - [1/1] mhi: Fix double dma free
    https://git.kernel.org/qcom/c/db4e8de1935b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


