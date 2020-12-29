Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EA62E736E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726258AbgL2UQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E5FEA222BB;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=WmyNjWeJ3qD5Z9Koj/3ToWQjB0isYuoYVx56eUNONLU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bgtUyE3gDQC0zyWSqsySYTMGEVwZFe/GQCOKWyQxhjrBChY+J1mX4KAp0cMeLksJr
         G/S/CDSCG2ug/vnTK3tO7IgW5HJfdVJCbxkV71dx3zX9UL8+mXOm/lKAAjcTxZK0dj
         A9Y0z/cUPsUHRT3bT08ohJ7WeZEgux5hbxDyNw83Nekx+0c7hrQKzgoKU8RyK9dp/3
         1oqY4my1t9mOGCE6Rc1hFcOV4bnh0m52fIukgvOciqhTQOVGbQGu+2BFjmP/eVXq44
         OYGax0iwOfBTWyFWbhscktfizKXMUfD7QWEjK3xcaX5kO7R+/IeRwrDnJK5RaGghcf
         r3kYeuBULrUiA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id DC68060591;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/3] venus: core: add shutdown callback for venus
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293089.13751.747738752613299525.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <1600930786-18275-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1600930786-18275-1-git-send-email-mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 24 Sep 2020 12:29:43 +0530 you wrote:
> Add shutdown callback for venus driver.
> Handle race conditions in concurrency usecases like
> multiple browser YouTube browser tabs(approx 50 tabs)
> graphics_Stress, WiFi ON/OFF, Bluetooth ON/OF,
> and reboot in parallel.
> 
> Mansur Alisha Shaik (3):
>   venus: core: handle race condititon for core ops
>   venus: handle use after free for iommu_map/iommu_unmap
>   venus: core: add shutdown callback for venus
> 
> [...]

Here is the summary with links:
  - [v5,1/3] venus: core: handle race condititon for core ops
    https://git.kernel.org/qcom/c/9696960f1347
  - [v5,2/3] venus: handle use after free for iommu_map/iommu_unmap
    https://git.kernel.org/qcom/c/de15e6231e6a
  - [v5,3/3] venus: core: add shutdown callback for venus
    https://git.kernel.org/qcom/c/7399139be6b2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


