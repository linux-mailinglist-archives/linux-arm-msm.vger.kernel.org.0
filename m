Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 472313292C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243780AbhCAUwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:55302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243819AbhCAUs1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4267D64EFE;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=a3MlUMBMlJXob0gHDLUGU1H7NyuiD/RRnS0sbNnISYg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bKAn8oNl2USoxXO4A6lleLNP/WMZSgTE5pX66xQGywtpygyB45RZV3Lz6o1HrkBVb
         ihRG855dpyulAQcbQIi2PHTI0z/kWKxfscQZcg7etGuKT2j6AWrTv66O5dxe/Fe/d/
         h5hawJCwif+vjcwrrk/D1nQAVKOSHppJIKA0faUXuNtwQeNwJDoSgZxvcTmuPu7fSI
         f1cWPXXjwZtuz+aMY/2uTwapc9VVeZ/VOIfqDu52aoZJKTO2BlHj+nU9lzz4M2kpnN
         eFX8lqhL7A45BEsqhJrXXN4479R9UcYFiKeU0fNjODDZIaSYDGOvvDxv/pXzFgRKwv
         5rxCRtLiAjeHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3BBD160C26;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: remove unneeded variable: "rc"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878423.6187.2668744342922223999.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210202123214.15787-1-bernard@vivo.com>
In-Reply-To: <20210202123214.15787-1-bernard@vivo.com>
To:     Bernard Zhao <bernard@vivo.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Feb 2021 04:32:03 -0800 you wrote:
> remove unneeded variable: "rc".
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Here is the summary with links:
  - drm/msm: remove unneeded variable: "rc"
    https://git.kernel.org/qcom/c/5ca6d0268df8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


