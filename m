Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7393292BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236160AbhCAUva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:55188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243763AbhCAUsH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1394564EF8;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=8tAsw6Ez3RqREfbClrYeakrsyE9Mhta04bjNRIm9LLc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iOSEB3NEUWMUFxt5lisCDcCCi05lKPh10s5Y+jb/iEtoBtnrNYIeci9N+Lwgm4ylF
         YcRy293smpVDIxHmaXgWu+/dJaY+5zy+nLyetZXLH2IqeHlgvdq5h2kjab7ke8PUb5
         2GgvEMDe7up2DQqu12WcGYAToNFZMVxrlKGVv4sxiw+11ff87EMZCQBY9yNUDLbVGM
         DR/+b4nUhShFvhKTbpJDDwgICmTFgokXozequqZxZTHbBUL5jlu18UMY4fkx0uFtMh
         D0v3DTL390qayHAi6zj76VBOOsxAd3hHv4JMdNatUw4r4I1GNDHfSlYxg8KunAZQK3
         QIX9ZJ0GteGRw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0F74760C27;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: hfi_plat: Fix warning for missing function prototype
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878405.6187.1101094921587638195.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210113102920.12841-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210113102920.12841-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 13 Jan 2021 12:29:20 +0200 you wrote:
> The bufreq_enc function should be static.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - venus: hfi_plat: Fix warning for missing function prototype
    https://git.kernel.org/qcom/c/0f9774dddf6c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


