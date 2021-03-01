Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86904329276
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240344AbhCAUqE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:54484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234900AbhCAUnQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A143E64E60;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=R9cxfgjF863Msp7Q/vqgsAGR9B58t9JbhEHD7AGIrv0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KvHgaeNeDdhmrUYtF5eDESrOF8Pt8D+i0wMGk8AOoWTyMMcxwZhaJOB271gsSjHxR
         lypmQuwDONtDzRTuuFJHRwQ+4HfCFde7JvZT+Fabtmh/QnGl/XXiMdRlaWvyIbu3H6
         SEO7CxZR9uC44vhkrLYNa2nAJ4+JeINSb7LLlILRnzlMsrO1PTo0afroGBNK7d2lWT
         aj9c48px4m9TKouNnOnm5Jk1AOyOqq9EmHM+DxbI4O9rCgNu2FBgf2PjccTS1iHAxz
         4DxvGGWM0opF4OVjHqC5lwIhzQ+/9jSmQhT+h+CmGlJJ036B384CgQrRYezr1Iyalk
         ixL3smphzQ4qA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9DA1E60C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MHI changes for v5.12
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878264.6187.15185101853258739577.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210205130141.GE3221@thinkpad>
In-Reply-To: <20210205130141.GE3221@thinkpad>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 5 Feb 2021 18:31:41 +0530 you wrote:
> Hi Greg,
> 
> Here is the MHI Pull request for the v5.12 cycle. As like last time, I needed to
> do PR this time due to the immutable branches with net-next and ath11k-next.
> 
> Patch details are in the signed tag, please consider merging!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MHI changes for v5.12
    https://git.kernel.org/qcom/c/37f1cda4381f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


