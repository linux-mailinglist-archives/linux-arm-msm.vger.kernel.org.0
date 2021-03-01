Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DB8329308
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239636AbhCAU5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:57174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243907AbhCAUx1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 87DA064F34;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=vOfZD8NuFWSj8W47wQwr4RdQ9ZK51+9UbBs0L5BcbLQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vBtBk8fdhl/jW71xWz6bB+SUxgNkHAv8P0ZG9Vohm/OKlQHf/T/xrZZcLZrU3D6Jn
         x7w1wP7wLmNPbABNmBOzM9ZeOC7VJ5XelhbZlZspTLKJCKHzsm2gy/uA/QRop4ZTqX
         TvH2igONyfD6NmP3NIJ4Lakz9fG/DmBAo+wNKOxXh0h32FsRTxs/KgzfCc1gPangTR
         swpYDHocisKYT233A6Z+Qv111ExWVSIbxEtQfiC2gZFII9+yv15WWn4awnjbome7t0
         akxeZiUngg9uw0JG0bioRPoMQ+ehZ8ntng87tTxB58uDN2wsfFqYPA3QX6BBZf3/+k
         wYiZ73tyc5Ojw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8404D60C25;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: interconnect: Fix the expected number of cells
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878553.6187.4598012862875057701.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210121145320.2383-1-georgi.djakov@linaro.org>
In-Reply-To: <20210121145320.2383-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 21 Jan 2021 16:53:20 +0200 you wrote:
> "make dtbs_check" complains that the number of interconnect-cells
> for some RPMh platforms is not "const: 1" (as defined in the schema).
> 
> That's because the interconnect-cells now can be 1 or 2, depending
> on what is supported by the specific interconnect provider. Let's
> reflect this in the schema.
> 
> [...]

Here is the summary with links:
  - dt-bindings: interconnect: Fix the expected number of cells
    https://git.kernel.org/qcom/c/1a41bd222093

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


