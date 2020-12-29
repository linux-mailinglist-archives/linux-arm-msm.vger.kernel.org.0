Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B182E737D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgL2URZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgL2URW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 30BBB225AB;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=rO0+GukY3sOuKZLN92hgO7Hkwer+hb1Md8VUDq7gU/Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=b1Rha1AtudvyZaGrod1dEz5yTpQsis4qONwK07oHwQXvl1gdkLstdT00XiArkOuuk
         DkR1unfYtdp8p5xjKFqP0spS3R8xNNs10yPgqaN3acQs7/v/Qnn6yFPk25RomkU2LD
         57VbxwdMguvR5jiYgFPAL2NyHLWUg95oWL6RghL/1cni7M/um4Ij3kZZ7zi5Z9xPCo
         h65V5yWjOfHExbvBiWqLq6Ons0tIB37TZVpalyyPhJIHVOIIJFE0/k8rlOk3Lrp5vH
         nKl+zomUvd34guYOzh/9/YRuIkvZZzIxAl/ohsPDjcoZeKCTEG3NwsRJV2NnMYOUCp
         CGUtDNGx4H1bQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2D1E360626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] coresight: tmc-etr: Check if page is valid before
 dma_map_page()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293218.13751.16131170028607994798.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201123102133.18979-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20201123102133.18979-1-saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 15:51:33 +0530 you wrote:
> From: Mao Jinlong <jinlmao@codeaurora.org>
> 
> alloc_pages_node() return should be checked before calling
> dma_map_page() to make sure that valid page is mapped or
> else it can lead to aborts as below:
> 
>  Unable to handle kernel paging request at virtual address ffffffc008000000
>  Mem abort info:
>  <snip>...
>  pc : __dma_inv_area+0x40/0x58
>  lr : dma_direct_map_page+0xd8/0x1c8
> 
> [...]

Here is the summary with links:
  - coresight: tmc-etr: Check if page is valid before dma_map_page()
    https://git.kernel.org/qcom/c/1cc573d5754e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


