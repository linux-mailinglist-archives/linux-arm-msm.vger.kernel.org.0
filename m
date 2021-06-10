Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E65B3A2E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFJOwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231336AbhFJOwC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9663E61404;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=AXem2LNdTIy5lK8NNXhvLTg3yUrmEMPKqlQzkquXUmY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gikqsizWcXR76kFm9e0tkCmzP3DpgAi42ugdvdCV18FRMOwx6S2Pnmnd8AvZvBVdD
         yKF6dvOwWiIjW8Pa0l3gSg3RcPlnk1GgECpIOLLkykJl8Q8yf+wxh/i/5A/9pnVOWZ
         r1KkNkywo2cF4/QI4qkW9Rl0nN6g4Yvhjb2wR34ZLD6Pv8bpAuBBGksgYq02lfZeLv
         EO+7/lysIU351O2Q6G2GDMtEvpVQkUtDIczZxg5go5rxzNjubshM+WahfCjGRMalbZ
         dXdp6yvb/i73O+kB0eLgaRdFD6s7ObsNg0DubTJcWmAowt0PPK26PYLU6P2/0icvci
         nJ37WlMihj70A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9140760CE3;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] Update sd card pinconf for sc7180 DT
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660559.29297.12907374505730454384.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210602191338.1995827-1-sujitka@chromium.org>
In-Reply-To: <20210602191338.1995827-1-sujitka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  2 Jun 2021 12:13:37 -0700 you wrote:
> This patch series contains change to move sdc pinconf from SoC specific
> DT file to board specific DT file. It also contain change to set sdc
> GPIO pin to bias-pull up
> 
> Tested sd card working on sc7180 based board
> 
> Changes in v3:
> - update commit message in patch 2
> 
> [...]

Here is the summary with links:
  - [v3,1/2] arm64: dts: qcom: sc7180: Move sdc pinconf to board specific DT files
    https://git.kernel.org/qcom/c/c8d6f8e5307d
  - [v3,2/2] arm64: dts: qcom: sc7180: SD-card GPIO pin set bias-pull up
    https://git.kernel.org/qcom/c/71208cd4b1ff

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


