Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB1F3292CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbhCAUw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:55416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243581AbhCAUtb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:49:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7AFD964F0A;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=0R87sXtivoozsY4NWEuvHHmfSnzrTzc4CAYus1X0bIE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DiuPyOp9QQZuRYDuSt4J/5DsW2tD2f+PUNhYW/3RX5mu0RhUPnN+tf1v2AkU3xhmM
         qSxSSOs84flrQN2UsudyP+chprhZY6K2XFPym5ngAsqe0GW9hKgc1vEJjViJm6/RZz
         QVrHYFPvgInyW2eAFYuxgBQqnIxg+ZdBFw8vV9MYjXVz34Zb3k1aOD5P1bh7D5+h5d
         SuCNdUiY3UuGCKPG9uHL8CPcSg78LmfgpWFgHIav/U8X1nOE1jcDral1uA4qqVT/3Q
         7jp+1upRiE6Yx1NboBEFQFMc48fKJQo87cfN0CiW/Y/iyg/g7m3v8WzNHj2qRh+yWB
         zqWjEcaILLDjA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 775B360A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] Bluetooth: btusb: add shutdown function for wcn6855
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878448.6187.6436420762564424534.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1608286331-15760-1-git-send-email-zijuhu@codeaurora.org>
In-Reply-To: <1608286331-15760-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 18 Dec 2020 18:12:11 +0800 you wrote:
> From: Tim Jiang <tjiang@codeaurora.org>
> 
> we should send hci reset command before bt turn off, which can reset bt
> firmware status.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v1] Bluetooth: btusb: add shutdown function for wcn6855
    https://git.kernel.org/qcom/c/3b0d5250be30

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


