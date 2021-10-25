Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E64D43A45A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236531AbhJYUWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:22:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234924AbhJYUW3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:22:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F6A460C4A;
        Mon, 25 Oct 2021 20:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635193207;
        bh=8/lE+Rw+hs0dWafxSglvZpeqcrrS6hSMpzbi5jt7Px8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aJkbHXINlvg8me+QOrHkSFdctvD9N4edDtBZ5PndHTpIVSuIV7aChGRN/LUnz6B7z
         Bvr5nCzE/ojSG+j60L01y042AsSlzHLj4YBDs0lWocfCw7gcOK2DIEwWAuvnfVWC81
         UyoKMkMdTkCoFdaJtCZhBMXjTYVwVsVgkd8eT5NQYlU5p1ki+sY05pz7PUQRa+TAIy
         1RIDO3IfjG/DFdRAx+O6GzR1X28ZVt6Do3yA1OeeQfp43UhOMyaR2SuSd2bUN/7Lvd
         U6evhSfk5yLxzZ0gnqpSZf3gBhPynsDGoGgLcwiy/CjiITAP9DLCJohuu2OFrOPi1e
         HiWb/ShuMLxtQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1375960A17;
        Mon, 25 Oct 2021 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node
 for sm8250 target"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163519320707.11471.18373841162059472795.git-patchwork-notify@kernel.org>
Date:   Mon, 25 Oct 2021 20:20:07 +0000
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 14 Oct 2021 16:54:10 +0300 you wrote:
> From: Amit Pundir <amit.pundir@linaro.org>
> 
> This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
> 
> This upstream commit broke AOSP (post Android 12 merge) build
> on RB5. The device either silently crashes into USB crash mode
> after android boot animation or we see a blank blue screen
> with following dpu errors in dmesg:
> 
> [...]

Here is the summary with links:
  - Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss node for sm8250 target"
    https://git.kernel.org/qcom/c/e091b836a3ba

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


