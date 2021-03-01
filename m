Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023EB32925B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238439AbhCAUnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:43:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:53174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238369AbhCAUk0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EA77464E05;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=JRmPCpQGkn02IPDPsQa72Y1Uvw9eFqQikgy0rP2UECg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=C/IU1Tm8wYYGmR8ZHdV+JfuPn3C4NEmRNnqvg4QR37xDLByCAgASVAEICQLK+jjbG
         +8K/b482B0COqDQpJ7JfccchgnjOxd1nUXinmnoRMLjY18tBaKemGTO2AZZLdHED8S
         Glyo+Wi+vaKzFRaJpuEZB7NkeeHFxn6rIyPzkkQlQcgEST1+XGmX+9o2HZSXaJhcqA
         sMMTcInBqQIa1fwEDJKaqeZ74eeGDdwOzBBLIR7cZamqxSCplg4q/wQIjQnXDL+bvV
         xPtYU1aOF3I3QVWmxXobOu5G8Xm5AsVz0F7OluPQ/gZJf6s9y8Q3oEY3a5ZsnA4VJo
         h8dQScVwy7uDA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E592C60997;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] dt-bindings: usb: qcom,dwc3: Add bindings for SM8150,
 SM8250, SM8350
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878193.6187.17789761878521187566.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20210119173748.6729-1-jackp@codeaurora.org>
In-Reply-To: <20210119173748.6729-1-jackp@codeaurora.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 19 Jan 2021 09:37:48 -0800 you wrote:
> Add compatible strings for the USB DWC3 controller on QCOM SM8150,
> SM8250 and SM8350 SoCs.
> 
> Note the SM8150 & SM8250 compatibles are already being used in the
> dts but was missing from the documentation.
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v3] dt-bindings: usb: qcom,dwc3: Add bindings for SM8150, SM8250, SM8350
    https://git.kernel.org/qcom/c/7a79f1f7f7e7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


