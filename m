Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B31292E73C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgL2USY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726550AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C21122D37;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=s3/pj2Hd/v7iGfwSU8H8YAY8d3P+6HzGkq4/1TiKUp4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mgjvB1m/eHTnkc3dJu/38BOxSDqir1hhKH89mdHX5YFdGNTZpKvFnzidYvWbfI7ow
         YfQBwMUH/jhJbv3rdanVDltQTiyf+bYphmUEUiR9tQabAcCvBaum3540LLtWxpJt9q
         /0JiAiM2z1yisuK56ngDaI4agTeuQ58sIutvN4tJfUYlrM48l+4RgRR8EiPmEjP38P
         F+C1zSBcm+FIhCcsAks6XzLQQ0yuCMmUO8AEUhjvW/BrvRloaerMHEHK1CVSZ+EIR0
         czCvx1cOwXdKA7ukx1OGsuXC+CYkLbK+soaSgRjla5wHobo3MawXpcXJuQs3lZv9aG
         MAMwFSHQJd5AQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 13CDB60626;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: fix reference leak in adsp_start
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293507.13751.2212030497012313056.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201102143534.144484-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143534.144484-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:35:34 +0800 you wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to pm_runtime_put_noidle will result in
> reference leak in adsp_start, so we should fix it.
> 
> Fixes: dc160e4491222 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: fix reference leak in adsp_start
    https://git.kernel.org/qcom/c/aa37448f597c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


