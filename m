Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 176D72E73B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgL2USD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DF8E4224D4;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=KRvvDS3n82AblwRj7/BZMKxez6QlvPrDyeJqMQx+jLk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fKKSNlgBqDeXDbmnxp/CJHDduwiCT96g9O/TSC7VsA+cli6zXCIIQIcDgbVJCLJJm
         wYNVg8h2P3NrqJOsH0slPlQdOoBxJTGY63BrGF5gPHxnnoaxtfGIDb3SayGtd1GjKk
         J5Os38iQhWUAC/FkO0cEIEdMlVceSmLtv9oh2OGKjSHi2yAm9O902NBweKxoEpdwfW
         M42rHDUaVdC0gmOZdcunhTIDVmGwBj3k+gXAYnQ7BwWswFb7o60QhcuDH9p3ZS10nv
         rZEqk8GCOdbqHkVhyJrF7UjwRVrDKJB169IbD5/IFijB55R9V9TXSKF1I2b7zs5PGf
         4MtcTnEG7oScw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id DB1A4604D7;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] pinctrl: qcom: add pinctrl driver for msm8953
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293389.13751.4796091153615788002.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201007160611.942754-1-junak.pub@gmail.com>
In-Reply-To: <20201007160611.942754-1-junak.pub@gmail.com>
To:     Vladimir Lypak <junak.pub@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Oct 2020 19:06:11 +0300 you wrote:
> Add inititial pinctrl driver for MSM8953 platform. Compatible SoCs are:
> MSM8953, APQ8053, SDM(SDA)450, SDM(SDA)632.
> Based off CAF implementation.
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> Signed-off-by: Vladimir Lypak <junak.pub@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2,1/2] pinctrl: qcom: add pinctrl driver for msm8953
    https://git.kernel.org/qcom/c/0e74abf3a0a3
  - [v2,2/2] dt-bindings: pinctrl: qcom: add msm8953 pinctrl bindings
    https://git.kernel.org/qcom/c/3d417196e244

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


