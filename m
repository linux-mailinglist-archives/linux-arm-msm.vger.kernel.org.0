Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC2C2E73AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgL2USF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbgL2USE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0C3D422CA2;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=EijlQCnCoIsE+FC2iOtdviw7WTzo356T/t9tNXqNFEc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dDtFt9UVirVpr1meGkwSWdG8I5MvbDyQsvvWiJYscx/QuJ0B+80c5T6qxpRGLHeJA
         q7vX0LBJUZ7JchOF2uPReEVamjkvrYQUwEPCodCfI+e8A2OAm99seSGsxtCyJ7UkqN
         Y8FhECBF/MNl2SrYLK0imTFl+QKb4rk33SPVB1ORg1ZZAgGXknrij4+R0oQpSba1+1
         mImgNF8SOfeZ971romfbh2U1OXbOW8YxXxQmyftXD6JZcFZQGrDiZjccuRkemPdi9E
         TR+5CdY//GDd9Ys91pD8nSel/8WOlYW5fcfPaUt7xd+u1OM4/f0Ys0F14JmXW9rM0a
         QFCmYPWfSrBNw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 07371600D9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] tty: serial: msm_serial: Constify msm_uart_pops
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293402.13751.16913071386555831693.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201104235134.17793-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201104235134.17793-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  5 Nov 2020 00:51:34 +0100 you wrote:
> The only usage of msm_uart_pops is to assign its address to the ops
> field in the uart_port struct, which is a pointer to const. Make it
> const to allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/tty/serial/msm_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - tty: serial: msm_serial: Constify msm_uart_pops
    https://git.kernel.org/qcom/c/0d66442dfdbd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


