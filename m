Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD93A3292FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243568AbhCAU4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:56916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243874AbhCAUxI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FE5364F1E;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=+US0aZCWSCHaIpupkBBXmirjqJhq2USowVX3OCFYyz0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MOSc/DohDfdCn4fvXfUB4g9oqzAUaUTnFjW2HA++sgXMSkErvSgPdpABdq+2zeJ7Q
         gYBwXWGXaMSU/mEjneyFfPImGkLiEQ9sI+4AjOrLunWOUNT/kEBYTKJwvqWcSpkJA+
         EzxXZ5DYPTRGRCqqR0t4McP3joL02wuOG+1tt96/H4CMEG1yaayoppQEd5eYGWklAM
         NGoaxBQrcv5KWRQUQmqAKW81oFsrxACsj1kEHNrxmOAHNxMeTQpxwL+B4iJDJYQ0d5
         24ax/jYV2tH6rK/wsVM2n2Hy0eI+s5OkUFWaWYEksv4IiuiY8+CXEcayiPtnoR3QJZ
         Ne0fi13cmGovw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C0C660A1B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] Bluetooth: hci_qca: check for SSR triggered flag while
 suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878530.6187.9139641744759677995.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1612277862-13022-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1612277862-13022-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Feb 2021 20:27:42 +0530 you wrote:
> QCA_IBS_DISABLED flag will be set after memorydump started from
> controller.Currently qca_suspend() is waiting for SSR to complete
> based on flag QCA_IBS_DISABLED.Added to check for QCA_SSR_TRIGGERED
> flag too.
> 
> Fixes: 2be43abac5a8 ("Bluetooth: hci_qca: Wait for timeout during suspend")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] Bluetooth: hci_qca: check for SSR triggered flag while suspend
    https://git.kernel.org/qcom/c/1bb0c66332ba

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


