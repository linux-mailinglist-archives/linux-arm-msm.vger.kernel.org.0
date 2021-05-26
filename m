Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12C3392074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbhEZTF7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235850AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C576361627;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=on89o4N3atERAuc8PWXf2lJevIHKTBS/7nq1Iuj+ptE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JmKSU0MCAlJ0jxYglgKQboPC8J9ikzd05fDBbdQCu6DseVwbUX9GBLK5Ako0QZA4a
         Y3p9OJ/5PXULXbNz6HVy/FkiLUNrbOIu9rxvyAwyeeo+kfcLQEt+3uGEL9bWHg9A2j
         Q1RmY0HLXfXlrMF0kIUs9p5Gs0rLMjcJG9W7kPIHIlZYU2LRJR9EqeUe3356zz1sT+
         zBEd7XnC5Fit9J0Npz80yL1z0B8ddCwjdZEL8HRXZsFLUP+AvNRGOBvYAFNSfZe+FY
         G2hblUckEEynrmnfDIQ+yjyXT5DdzD4rI+IkAC8A706AMyh4JSJPXSNI2XL2Xhwicq
         TUIZ3/C5RJWog==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C1201609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: sdm660: Fix kerneldoc warning
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580878.26840.17247789379979678451.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210401094714.29075-1-georgi.djakov@linaro.org>
In-Reply-To: <20210401094714.29075-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 12:47:14 +0300 you wrote:
> Fix the following warning:
> 
> sdm660.c:191:warning: Function parameter or member 'regmap'
> 	not described in 'qcom_icc_provider'
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: sdm660: Fix kerneldoc warning
    https://git.kernel.org/qcom/c/7014dfee4e83

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


