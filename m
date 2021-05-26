Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB1C392077
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbhEZTGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235853AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E4052616E9;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=dBEbzWAukL7QpMLLKQf3OVSmNO2qhucVuO15ueurvBU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BxAgZtHpE7f14rU2qjwwmgTeZFIV0NvDIKicq0O+YrkyfCa9S7bu+Eip6NHAmso5c
         bjhRRPYVPEHbFqRdctmZzMUIF+wpEQpHBvT5KBWsj8RnaZHi4gowroJ0huT1IrepNK
         JUnPligPP72+gcbNTCHarX1pixXIr2FjEzdo/4W6+84YYUYXVIdy107kpyP7GTrSUF
         IIWgzT/G8f5FOqu128dtf3j8c08UclxF+jysnMPJ7ssj+yU2yYhiKIYNDtBfpe5Z58
         1oZB2puplsid/SL8cuDWopcHc/IkAQt3o3XhOdL77JiMQXltnfAnWdoRXwAnTGEnIs
         GZwn+fpeHO1HA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DF791609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Set drvdata to NULL when msm_drm_init() fails
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580891.26840.16130299208721051590.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210325212822.3663144-1-swboyd@chromium.org>
In-Reply-To: <20210325212822.3663144-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Mar 2021 14:28:22 -0700 you wrote:
> We should set the platform device's driver data to NULL here so that
> code doesn't assume the struct drm_device pointer is valid when it could
> have been destroyed. The lifetime of this pointer is managed by a kref
> but when msm_drm_init() fails we call drm_dev_put() on the pointer which
> will free the pointer's memory. This driver uses the component model, so
> there's sort of two "probes" in this file, one for the platform device
> i.e. msm_pdev_probe() and one for the component i.e. msm_drm_bind(). The
> msm_drm_bind() code is using the platform device's driver data to store
> struct drm_device so the two functions are intertwined.
> 
> [...]

Here is the summary with links:
  - drm/msm: Set drvdata to NULL when msm_drm_init() fails
    https://git.kernel.org/qcom/c/5620b135aea4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


