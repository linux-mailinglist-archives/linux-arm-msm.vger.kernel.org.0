Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B08392023
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235313AbhEZTF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235332AbhEZTFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D526861461;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=dHyNXDv4IwNmMlFAWLRzCnKawDjkwN5jbFrwfgtse14=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FDwH2fQ5YyxN3HNMsFH2e+zLszLi9L38UxwCybl4c2SEn9Vw9aMFxYvsOrhdpQLyl
         orlrOcAPCh8nWsTXyke5fmLyzxS8Iq1yLFt6019DUyLO0GoBCxs1v1TZ8E/Mm1azE3
         GXy2dcJyHXBouzSF22YPbh71D0LFtd4gT+PznaqPUHjbJ7WTBhEYxWbUE9sBK206DD
         u3wfS5rOtlAi4vfPdiiQ/0eIiFQyWgP7uFlJZmjx/vHKMMnYkbgON7neJwQHKVPTXA
         xzdaW7/4AWZ7jp36nJo2AVNXvjckUKd3ZQE4QZ/faXwb70YEC9OGz3di2z3rEEEvb2
         WGdvPLdRYyBSw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CF70060CFD;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: qcom_glink_native: fix error return code of
 qcom_glink_rx_data()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580584.26840.12080268869990017208.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210306133624.17237-1-baijiaju1990@gmail.com>
In-Reply-To: <20210306133624.17237-1-baijiaju1990@gmail.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  6 Mar 2021 05:36:24 -0800 you wrote:
> When idr_find() returns NULL to intent, no error return code of
> qcom_glink_rx_data() is assigned.
> To fix this bug, ret is assigned with -ENOENT in this case.
> 
> Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> 
> [...]

Here is the summary with links:
  - rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()
    https://git.kernel.org/qcom/c/26594c6bbb60

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


