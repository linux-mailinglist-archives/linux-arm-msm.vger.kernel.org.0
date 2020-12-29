Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173BA2E739D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgL2URu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3CD4322BE8;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=0FnvkElo9SXCEqCyOlC7nRyzXWdC2OvW1w89k5LHrYo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dKyn8fA7TIM5ub5JEQOlFmcnlV0o3fo17tPOmze4cmBYDYOMgtQ0ow2KRh3FZ0h5P
         NYxsdeifKlZd5fPHTw2Pl7OpiQqP5Qgy2LjTbgRR3XANV1e8iqD3LudjZCFud5JlqL
         ArKTePradMUzAsL4jWrwPHvcLwFYSJ0COj5lsKxKTvCl/oosD3uIVXlTdkwBqMsIlE
         Bwmo3q0bbDefH9/TtaD4eG2q1PJ99DjEIUinIbrH7z+zCjEX4o6dHltoZUAHEs82YT
         VGK2G1KY+3w4udu4wRlTX5/gPYd5246KkKv3gyM2v3PfnZbuZgQyUhXcb9z7A7FJqQ
         ERTT7wDSdGbTg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 38D8B604D7;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: dsi: Constify dsi_host_ops
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293322.13751.16081819682906560836.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201108223738.16535-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  8 Nov 2020 23:37:38 +0100 you wrote:
> The only usage of dsi_host_ops is to assign its address to the ops field
> in the mipi_dsi_host struct, which is a const pointer. Make it const to
> allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm: dsi: Constify dsi_host_ops
    https://git.kernel.org/qcom/c/8b6947a81e56

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


