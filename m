Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D366F3292CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243581AbhCAUw1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:55962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242648AbhCAUtR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:49:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7229264F09;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=UDbwdU285pNp6WXr5H5JTJ27aylpV3xF/+X+2DUE9kA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=l1/Oq3ESobODnvwpwcizwE4uXH1QRQQtD8sSdiLw29+OjdAZSTUewM3/0a2DTNZP7
         tyzaOWRcpuOKf27nnDQ1OThyMR1pA6cMKieJgEqrGAY6KNnoI2KeZ0K9znILJXnJu8
         urcZSXn71n/QHcnyTn9tDzqa4iBT51gxscGJprAddL4C4+0TnLYzVsQP009JpfxAnQ
         PAk5ekB7EuWMVoruCzdBi18P0Th9lDbFsxPHukF90wbY8GN4luMxTv96oTewrs396m
         hM2dktp+0pgowvk+l/O4n1gPfKi1890JB0cjOnjF+cUO5DDnkOgW9fKUXWJ1H9+Knz
         0I0qdeJTedbeg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6E9C760997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] regulator: qcom-rpmh: fix pm8009 ldo7
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878444.6187.15042870373952519413.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210211034935.5622-1-jonathan@marek.ca>
In-Reply-To: <20210211034935.5622-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Feb 2021 22:49:35 -0500 you wrote:
> Use the correct name to avoid ldo7 commands being sent to ldo6's address.
> 
> Fixes: 06369bcc15a1 ("regulator: qcom-rpmh: Add support for SM8150")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - regulator: qcom-rpmh: fix pm8009 ldo7
    https://git.kernel.org/qcom/c/20ccc362c3d2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


