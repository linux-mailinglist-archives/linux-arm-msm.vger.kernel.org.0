Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62BCE2C8D95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbgK3TBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:01:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:42534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729474AbgK3TBa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:01:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=auSNpNELuDZKSofnkBekjgHt/GUrnC6eDpeVXnwcMXI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pf3BAFjHhzraeyzhyue/dvPCh8yciOQxOgvl1jpcMieyas41Eh6sBXsWmQhsHBExY
         B+MjgnsqWhcNvugLgDHC+IYfKUFOzhEGgRkxi34etvHJX/Qab7ZfIjkhvQOowLlSGN
         jguEYpQ3Dn813wE6+cXVY990Pp3H11DUhkjfc9Tw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3] dt-bindings: interconnect: sdm845: Add IDs for the QUP
 ports
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280710.32741.3702743058843786554.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:07 +0000
References: <20201105135211.7160-1-georgi.djakov@linaro.org>
In-Reply-To: <20201105135211.7160-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  5 Nov 2020 15:52:09 +0200 you wrote:
> The QUP ports exist in the topology, but are not exposed as an
> endpoints in DT. Fix this by creating IDs and attach them to their
> NoCs, so that the various QUP drivers (i2c/spi/uart etc.) are able
> to request their interconnect paths and scale their bandwidth.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/3] dt-bindings: interconnect: sdm845: Add IDs for the QUP ports
    https://git.kernel.org/qcom/c/8742bb4bf203
  - [2/3] interconnect: qcom: sdm845: Add the missing nodes for QUP
    https://git.kernel.org/qcom/c/cd5fc457e5d2
  - [3/3] arm64: dts: sdm845: Add interconnect properties for QUP
    https://git.kernel.org/qcom/c/05b801afb7d7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


