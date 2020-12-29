Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7333E2E73BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgL2USW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C2B0F22D06;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=2eTHBzNJ4TZAC50sVAis2eii52w5Ws4dPrm2jEOoI2c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XkpKtW354JmP172madI6G+sbNtPpwEdsgiIEOKafvsPU7dSFPjZlBWaU1+A+oU29+
         GWON7fVrH1ZKW2xrXTATv63e6/cxggKYOp8a2cQLRhrvNxeqyssGILHwcGvQLowq6R
         py98HXhj/YPnh96SYewE3ZC2vVbEQi5ittz9n7qIAiCZOLFL5+QviQx1VshJPxbDgr
         wn5l/a0PckXB4OUQeb0sugFtlCVBnpd4yX6CTJvlQRL0Ra+50ziaL7blbHhRlwRyIB
         j05oRJKJGHgwBsLJ1hmvfx6vhEeDGT0iYrTovdyBO+C12qdcLwawD7QwmqaDtFtvNX
         TJoWUICnh+xuw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id BE8D7604D7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pas: fix error handling in adsp_pds_enable
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293477.13751.17701255775936213745.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201102143554.144707-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143554.144707-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:35:54 +0800 you wrote:
> If the pm_runtime_get_sync failed in adsp_pds_enable when
> loop (i), The unroll_pd_votes will start from (i - 1), and
> it will resulted in following problems:
> 
>   1) pm_runtime_get_sync will increment pm usage counter even it
>      failed. Forgetting to pm_runtime_put_noidle will result in
>      reference leak.
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: pas: fix error handling in adsp_pds_enable
    https://git.kernel.org/qcom/c/c0a6e5ee1ecf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


