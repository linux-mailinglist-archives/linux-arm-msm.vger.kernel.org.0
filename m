Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6471B392066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbhEZTFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235683AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5189461623;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=sy5V871Y+tYidvZ4AvpArjvInHMSqwByN46n7kb0ez0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lkkvohQUF7ftQ4lDSQOSyWfJyBVNDiPxfcigXv/MEkAOHErA824paQywHHAzGT06S
         1QCg2aqVRdgp0rC60jX+NLuClaLiF9GCSm4J57J268OfMhFkcYOg42X/dk9hMhZUEj
         e35m2fQMO1cHbP6c19zaUY4h2Tw2UKbCis+KIJuSAZJyLKz4LPf4k3lQAk/hh222b6
         MNnlDALMzjvbJjq0a23AIWw/DHwUmf/wQVFdpINDij6bY0/AVh3/YurcP3581dJFVc
         9IXPCyk6yimeBP5G8Sht19YkNBcp58asAfonSY5DvIGuuPXm1kNJRadLSmz8roVqVu
         4pjiMS5ixYs9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4D7A5609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] phy:qualcomm: remove duplicate argument
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580831.26840.10640633689591060791.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210319113612.494623-1-zhang.yunkai@zte.com.cn>
In-Reply-To: <20210319113612.494623-1-zhang.yunkai@zte.com.cn>
To:     Menglong Dong <menglong8.dong@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 19 Mar 2021 04:36:12 -0700 you wrote:
> From: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> 
> 'HSUSB_CTRL_DPSEHV_CLAMP' in 'val' is duplicated.
> 
> Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
> ---
>  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - phy:qualcomm: remove duplicate argument
    https://git.kernel.org/qcom/c/0d811cda22ab

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


