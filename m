Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DD0392075
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhEZTGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235851AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DB1F8616E8;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=TGnLO+xvIDWY+UP3k2wQYwRtr0AnmDy+WcnazwhCP5w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o9J4p2+6NLiQY9AMTarVF3FwBIlVptTth8XqBXkDtOWBOD06grHYm1YnGZRlTeebA
         I9RayEa+d8rKhrjH+Bvtoy4R9uQHRX259wMoy6zXtqcdxmjLi/qrGmgYtddtgmY0Sy
         s4LsjossUr1K76HrzQI+f9w/Acj3WWGgVZqiIbJhHtW1kaWiQfgkCkY3YeuL/QBNVw
         HbJR09JKGkVGlX9xMOvbwzsc+oBAQcsTObFZTksQ//PaWdBJy+imFNrea6biukjU9D
         QgBV8fAU5/CrlTziUwE9ibszaaitkr7AE2uGw7yUhqO6Z5ihGFojectir0gGVJB9wp
         oDRln6zvN0aZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D70B1609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Add more IDs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580887.26840.5467278582366892310.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210504203612.95056-1-luca@z3ntu.xyz>
In-Reply-To: <20210504203612.95056-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  4 May 2021 22:36:13 +0200 you wrote:
> Add the IDs for the following families of chips: 8064, 8226, 8610, 8625Q
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/soc/qcom/socinfo.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Here is the summary with links:
  - soc: qcom: socinfo: Add more IDs
    https://git.kernel.org/qcom/c/9bf8257fefc9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


