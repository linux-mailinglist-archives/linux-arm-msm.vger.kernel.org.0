Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E92F2E73B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbgL2USE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0128422CA1;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=IXk6EgzCgFrsUKpf69PqJHXxmn6MwjzkkilS/JDnrqI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SjYAF2MRHkhdfKWp5PItaRv0KXiKhe80SOpB592duAZyiiTj8t4QAWJOW0VUAd1jN
         r3yiJMWdPGsgvRzUxJXENDzYrqtq8voovg2fX+Cp8HQAkLxTfIN7qQWPlEzI/hMtWu
         mOGhi5lz7k+Z8/jx6fvOy/HNa2p9jK7TTz9P3JwJ9y6eFgP4cWDzXEKJk5MYCgLo/5
         b9xdLvyiJQ3v4fmT+wqKU/HZizWXEkJgi8mDC+oMRcuFODNuEtMclIeB65Qi8418nH
         orQH2r+0ZPfKC++cji4Yv/LW2GSKh9c9kUC18xN6azx9Bx1gG/n0W1bwfsR0FqYkq1
         IxzHOSjy0Kv/Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id F0C3E60626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Add binding and driver for SDX55
 pincontrol
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293398.13751.2280973786499765340.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201109062620.14566-1-vkoul@kernel.org>
In-Reply-To: <20201109062620.14566-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  9 Nov 2020 11:56:18 +0530 you wrote:
> This series add device tree binding documentation and driver for SDX55 SOC
> pincontroller.
> 
> Changes in v3:
>  - Add ack by Bjorn
>  - Fix dt_binding_check errors
>  - Add gpio ranges in binding
> 
> [...]

Here is the summary with links:
  - [v3,1/2] dt-bindings: pinctrl: qcom: Add SDX55 pinctrl bindings
    https://git.kernel.org/qcom/c/c82d4776a1dd
  - [v3,2/2] pinctrl: qcom: Add SDX55 pincontrol driver
    https://git.kernel.org/qcom/c/ac43c44a7a37

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


