Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90853292AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241933AbhCAUtj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:55334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242484AbhCAUqp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FAAE64EE2;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=PALl418vUPJqVN6AAWUyucX+gbK66SUtB7YQlrSeTCE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sjqB+xylYewwvzqBqqrAElo9NAcYznWJEmnvsPvZZLyuI+HGtVJ975M6FA03e02Dz
         tLx+EqFwKfOzKVZsSZ9sl0Rm3rOT7HqYX+DbDoSZ/NDXcQ7HJNlSApAMX4otzOHEHp
         3ikn0Pq7fwWQMMT04QECcjzrOV7pY0zk1ZO335Zawr4TIjhUID3qb4hEw5mMcnnfR1
         1NIjAaQxaInFesWp69fhhJuBDCg+2hzRSS+7HH+S1JugfDPoZiywK8fDFuvkQ6U1+9
         drV0f4teeHsQXilYdPbSwIilSRetoyFm6ECO6ZJRcvul/WdtH30JMFDgaEoodORVax
         I/x2byu6tPwOQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8C43260C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: fix some kerneldoc comments
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878357.6187.11849610948205603184.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210105235603.32663-1-elder@linaro.org>
In-Reply-To: <20210105235603.32663-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 17:56:03 -0600 you wrote:
> The kerneldoc comments for the do_cleanup_msg and cleanup_done_msg
> structures describe the fields, but don't prefix the field names
> with "@".  Add those, to get rid of some W=1 build warnings on
> an x86_64 architecture build.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: fix some kerneldoc comments
    https://git.kernel.org/qcom/c/df2f392c61b6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


