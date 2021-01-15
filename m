Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08AD92F7ED3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732822AbhAOPAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731779AbhAOPAy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B229238EE;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=GV+CCyvNJIIWZkpfLSZkzpRhAnXyQ9rsJNaJR+KpyCk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kOMrTrsywm4JwX0SOcSi1icZ5pBHltzMiyrtaSBXybZRkZU0DKUK844fUFZQ7q7Ft
         t2nnH7F9xgFZ/D6AvpykWYVwu5s+Wd7Ax5TmCvfijB+1ArkDY+Wb63s/uZnALc7JhL
         2Zev9+C3f9VZNhZxOpJ58s0ZwTDosfy5o2NlnUaVLBGYELd/QUBE/V6ziEbqoq1RQT
         5jyltEAjBqWoQVkTTHzHt466IgP6Q6wTCVQbV05jXWMURoJg/LayyG3sLHdC4FFg3B
         GIvyNVVNn9uoRfKoBhvV9m/DVegrD9bUo8n5jvFmevcx/wfVNosbXsjZQILQ5XsV2l
         Vlo0pPHsa9yQg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4F53F60649;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Open read access to all for debugfs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281032.19141.6107642134035001138.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20201216071926.3147108-1-swboyd@chromium.org>
In-Reply-To: <20201216071926.3147108-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 15 Dec 2020 23:19:26 -0800 you wrote:
> There doesn't seem to be any reason to limit this to only root user
> readable. Let's make it readable by all so that random programs can
> read the debugfs files in here instead of just root. The information is
> just that, informational, so this is fine.
> 
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - soc: qcom: socinfo: Open read access to all for debugfs
    https://git.kernel.org/qcom/c/8333b2c26c2f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


