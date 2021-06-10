Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87AE33A2E9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhFJOwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231337AbhFJOwC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A2C7561403;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=aeUzSv3RWvduDi38y+s95zkDTvxZXaVk9dtTFdmLtg0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S+3cekheZCWedLb0wfYlUoqzh7vfjc16x/sG3lpuL0UGA3i40MI+PZTqabcRd7EJn
         oPbp2pD/Ex6cDArYJhUogKHIVXjsV5yL0+TabiF98YgVA1rXiqoqV3W4dsT9Q7yZM2
         Bf23ajs1ZVAYeB6v+WTkf6VFctJYmP4/09Paj5Uw/oDdpNA+4D6EYlEsMyasZivzoT
         7ecJ2utryJgZ3W70eRCJfyh4r1XSmmfs5DMLCZHHGy6ZVV3gD4Z0Tj6eyUY4wtYeFZ
         rlzOK6AQh8Ls4Evf4OH9tPQywp03y7hDV6IbMg8SQqugZwRuFfHc+sMup4wKVYqlAH
         jfZCq6PP/M2Ow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A69B60CE2;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Modify SPI_CLK voltage level for
 trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660562.29297.2069366897696649782.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210510075253.1.Ib4c296d6ff9819f26bcaf91e8a08729cc203fed0@changeid>
In-Reply-To: <20210510075253.1.Ib4c296d6ff9819f26bcaf91e8a08729cc203fed0@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 10 May 2021 07:53:12 -0700 you wrote:
> From: Wenchao Han <hanwenchao@huaqin.corp-partner.google.com>
> 
> On coachz it could be observed that SPI_CLK voltage level was only
> 1.4V during active transfers because the drive strength was too
> weak. The line hadn't finished slewing up by the time we started
> driving it down again. Using a drive strength of 8 lets us achieve the
> correct voltage level of 1.8V.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Modify SPI_CLK voltage level for trogdor
    https://git.kernel.org/qcom/c/abbe13a2ffd9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


