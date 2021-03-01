Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D303292F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238856AbhCAU40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:56724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243787AbhCAUwT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:52:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3C5DC64F2A;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=SGI9qpUCb7DH8BSnw99osJ+dSBwzrzz/21Sx6cWflNk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aZm3Iz/MAAt+nCZXbS/bKxRidliq5XHnNWRQXDRRA5N+kaeRnJInn6rB44tW4ND0K
         /zxaQsXtp+0XG8nRcOnE6G/kx0d3xRJPaG8mzmhSN21AP3HnLHG+l5uz2q4/tlhQGT
         zJ/BsdsaEs3q8IwuRaKT9a7GoH4kimHx9/Wl7pCBDxXVS0GCnidOejwMbgNIHci60i
         gc83gUp2w/GxK/RSdPhniJFtcwrCYYVSNxFUDRSXVAbyCI509+cbnWOvtaFfbDY4Kg
         KQwCvD1z+7tAuqn7ol3Z9uryGMISxLcoVYBMIxWn58TEFJQG99vmQ7MbgwCf5+B5lx
         esIo1cQmAGfSA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 38E3E60997;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btqca: Add support to read FW build version for
 WCN3991 BTSoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878522.6187.14593432560311378129.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1607428529-26629-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1607428529-26629-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  8 Dec 2020 17:25:29 +0530 you wrote:
> Add support to read FW build version from debugfs node.
> This info can be read from
> /sys/kernel/debug/bluetooth/hci0/firmware_info
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/btqca.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/bluetooth/btqca.h |  1 +
>  2 files changed, 55 insertions(+)

Here is the summary with links:
  - [v4] Bluetooth: btqca: Add support to read FW build version for WCN3991 BTSoC
    https://git.kernel.org/qcom/c/c0187b0bd3e9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


