Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D8B300F0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 22:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729176AbhAVVlM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 16:41:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729232AbhAVVkw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 16:40:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 644CD23B08;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611351612;
        bh=RviUmAXBIeQMVflFrkCLncodprLXj5ont28SDdaD0BM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Xf8juJQ3Lczzzn97/qXnO/MVW9RK4iALZfPygkAOvcDqdDTL4hWNzNuj0KYYhMF8F
         TU/xRfAMDYh5DnKX08yiImWrI6o59aoE/QnUxv9HLqx8TymTaV7nW6PhNpO5NPDYBm
         rgLZJhSEq5KnOw1W7xnmr7NF28CrFbLqN6culcIuYL8ZM0ddGNdnjU3socnzKFsEO/
         FudsPh4N4+HleAByXkbEyzcYHktrLXjWsU94Y3mw6u29KlgV6wZxr06vS6ajl1+HlU
         OKCfgdU/5Y2n9d79XB0dHmrIzE2Nrntw9Mvr6uiSYBHwY0FA9RgZ4ln9p8ZpJoNWv7
         SG0vjjzlUveyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 585ED652D1;
        Fri, 22 Jan 2021 21:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] ARM: dts: qcom: add additional DT labels in
 qcom-ipq8064.dtsi
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161135161235.27172.3503628172160741623.git-patchwork-notify@kernel.org>
Date:   Fri, 22 Jan 2021 21:40:12 +0000
References: <20200902165159.7733-1-freifunk@adrianschmutzler.de>
In-Reply-To: <20200902165159.7733-1-freifunk@adrianschmutzler.de>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  2 Sep 2020 18:51:58 +0200 you wrote:
> This adds some additional DT labels which are handy when referring
> to the nodes in derived DTS(I) files. It will also make the
> definitions more consistent, e.g. by adding gsbi2_serial and
> gsbi5_serial where we previously "only" had gsbi4_serial defined.
> 
> While at it, add missing spaces after some DT labels and remove one
> useless empty line.
> 
> [...]

Here is the summary with links:
  - [1/2] ARM: dts: qcom: add additional DT labels in qcom-ipq8064.dtsi
    https://git.kernel.org/qcom/c/dd1ebbcf7b60
  - [2/2] ARM: dts: qcom: remove commented mmc-ddr-1_8v for sdcc3
    https://git.kernel.org/qcom/c/59595f65b3aa

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


