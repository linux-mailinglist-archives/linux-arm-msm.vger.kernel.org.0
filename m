Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F332E7398
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgL2URt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726462AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E23FC22B45;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=qDNxJlFZCy0gTc4Dly7TVdHCBTj8fY6dVzQWqZkCBJ0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tkdbUi6ay7QP74T7VRMjZYlmZHVGvabC5HvZNzplMQ3pZBAlPhpVccR0c7GtvLaNt
         zXfDOkpAahW4if2fjgeecqKApEBNoK/ONGktWkuqlMC7eZYSqVG2yEV53Uw3mX8vJK
         Cxdll9NV3pKPfvOzNPAImG3GGgIlupNapweZfW+4JgAxRvNUgih6JjuwfivVKQZarH
         igUj7vcXgSYwY/elUuDkFQSTkGQJ5YKbwTqFM6SDRldqvs/DbMnx3+M88x1ik6w8zd
         wTK0csux4k0mh1az4rtxd8GM5MMAPTwfNN+GnfrVhrzunNQZrFc3HsdmoLOvxNk6XE
         Mw/HRjf6WnPUA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id DD4D1600D9;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_sysmon: Constify qmi_indication_handler
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293290.13751.14480662825738005057.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201122234540.34623-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201122234540.34623-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 00:45:40 +0100 you wrote:
> The only usage of qmi_indication_handler[] is to pass its address to
> qmi_handle_init() which accepts a const pointer. Make it const to allow
> the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: qcom_sysmon: Constify qmi_indication_handler
    https://git.kernel.org/qcom/c/dd8f52660cb1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


