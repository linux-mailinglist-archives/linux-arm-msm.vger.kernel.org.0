Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F042E73AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgL2USD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D333522CA0;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=shL+DxFC44e/yWz65f5d2sDj0kbVlP3Tr3LHO5/UnGA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WOKFew3XNYE/aUwX3bIsrRzXSpSjAp+8U/PCZ7C0zF9dpOvNRPQ0cLSO61GHxUqwY
         uySWNwhDB9HVSTaMOM4pXr8FofPaJjEJS/jTZCvwFybfX3kgutgNXBQbOvyxvtirru
         GzLUfsiPpauV4lrAnIauoutpKQlIh/hu7goOy8Fmyrk727pZFpgDeo8/oluh6ssG/Y
         VwUgE4o8VijxIoTgBWlokrlNhD+NgDPOR8dE8hcn1lQf51ZnDanlb3PbHk2WFN4m3K
         JKj2rJUTzrSg3HAam+if++L2iTCCKFWuxWps4CmgMhYc+S91lv5LAbHsenPKJFUE+q
         iM/irjsfASPOw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CEC6B60626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: sdm845: Enable keepalive for the MM1 BCM
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293384.13751.16493935239304119933.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201012194034.26944-1-georgi.djakov@linaro.org>
In-Reply-To: <20201012194034.26944-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 12 Oct 2020 22:40:34 +0300 you wrote:
> After enabling interconect scaling for display on the db845c board,
> in certain configurations the board hangs, while the following errors
> are observed on the console:
> 
>   Error sending AMC RPMH requests (-110)
>   qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x50000
>   qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x50000
>   qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x50000
>   ...
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: sdm845: Enable keepalive for the MM1 BCM
    https://git.kernel.org/qcom/c/5be1805dc396

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


