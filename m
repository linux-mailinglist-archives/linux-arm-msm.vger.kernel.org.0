Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B3E2E73E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgL2USx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgL2USw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 948EC23103;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=QEnWd7m9tevWlqAdF50h/jk+En4e4UfYHkQ/rwaPywE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FdmE2FZutuuA410P0tXH80pHDCyB/PvLyYlN71tio5r73ZD8QDf0ahwBx2MR3iWpw
         FJXfaeBrvM3px5L7VIDM/sxIFxvsTvu3uB3ie0Z5XWEipac0b+/EJmIHvFRj65ifhV
         7c3h0WgkI8l7AqidzN12U/z9dO/YhCVJ5jZN4U8AL9P9x8iwKx0UqZcFPNWaHStaGe
         OFh5JjWYETU8E4pkBKbFJAcLqNTsTIJzwbQ141Nmg7TimJdiZMpbOEh3DjtU6SD27q
         /dhoIgyyfsd4QK9GWfkFbEfFA/VGRAlO8k8sP4289ywRGcGvpVJl6saF1r00Giulo7
         5hUhmfAoCcSCg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8D78560591;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Remove redundant null check
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293657.13751.925872688847647756.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 14:04:22 +0800 you wrote:
> clk_prepare_enable() and clk_disable_unprepare() will check
> NULL clock parameter, so It is not necessary to add additional checks.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Here is the summary with links:
  - drm/msm: Remove redundant null check
    https://git.kernel.org/qcom/c/dd29bd41d4c6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


