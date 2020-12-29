Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C82D2E73D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgL2USi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A752D22D75;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=t96BLhdyLD10uCHzHp1rj4wdjhEq8ks1sUE2unitJzo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OUgyFxd1T9FXguqLPmuF7jJ7NOQuav2FF+2Ar7KYpW7haU5jfnWqwThstev7RHdPT
         olUETIG0Ce/HXdD0R2PkJr5Di33psqizrpb2UTeT4+wN40ON5/z2ePg6A/QKY9Z6Df
         XTHtD5qbmUCAQJnB6qM1DTyPz4/FXi5NNZifxa36Hloee8mhgZdIKtyVJ8qGRXnFTs
         MY+agYaeElPro+bRcILq8dOa/0HI+Nh4SA/b5oW8SjMHeFPklbtf2uFGkS4n2zZpJ5
         MLdhoqj2uzCcT/r3b6puS8Rr1mRqusIumchxerSTE6AXBF+ekDv94N3LYCfQ5AG83X
         3sI3Fr7ODTK3A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A32536063B;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] drm/msm/dp: fix connect/disconnect handled at irq_hpd
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293566.13751.6433431520306503885.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <1605733214-14280-1-git-send-email-khsieh@codeaurora.org>
In-Reply-To: <1605733214-14280-1-git-send-email-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 18 Nov 2020 13:00:14 -0800 you wrote:
> Some usb type-c dongle use irq_hpd request to perform device connection
> and disconnection. This patch add handling of both connection and
> disconnection are based on the state of hpd_state and sink_count.
> 
> Changes in V2:
> -- add dp_display_handle_port_ststus_changed()
> -- fix kernel test robot complaint
> 
> [...]

Here is the summary with links:
  - [v3] drm/msm/dp: fix connect/disconnect handled at irq_hpd
    https://git.kernel.org/qcom/c/c58eb1b54fee

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


