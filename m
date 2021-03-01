Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1053A32923E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243519AbhCAUmB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:52922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243670AbhCAUiy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:38:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F3F860C40;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=4fzjcazvady7KhHa0j7fdqbaf464QFsnuM80QWdwwSw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=btVGH3vcIe0r4oE+/1iWo/SAf/oi62Q+tUR1LFo7UwVqJEBUkI7K5zeYwgGRIHMDe
         TIEup1hvssU7KzJy3eaWCHag3FHc7DDDk3heSiXW2Or5D1whiRhq3yBKoqrJk9wWR6
         k83y8sLvJgVHWLuQzuiXuF43nc27gPuSfIfESpdUsapX1gvZ9MZy3CQLIniuH/3JQJ
         w1XkNkWlkgc0l5i6TcVbfR8lAYlE3uPZ+2ZATsLFaaBz0MSsrgK+3BDwEiNuAJXOax
         ZUjoY9A3N3h8O9xfi82uH5rJWHvRgrpeLJ3481aBbcIGEX1LG2aLLp9rCP7tWvaINF
         6vknVqk5O9LTA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 93CB260C25;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] nvmem: qcom-spmi-sdam: Fix uninitialized pdev pointer
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878160.6187.18390535840764176523.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <1612376126-31001-1-git-send-email-subbaram@codeaurora.org>
In-Reply-To: <1612376126-31001-1-git-send-email-subbaram@codeaurora.org>
To:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Feb 2021 10:15:26 -0800 you wrote:
> "sdam->pdev" is uninitialized and it is used to print error logs.
> Fix it. Since device pointer can be used from sdam_config, use it
> directly thereby removing pdev pointer.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [RESEND] nvmem: qcom-spmi-sdam: Fix uninitialized pdev pointer
    https://git.kernel.org/qcom/c/e2057ee29973

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


