Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2EE2E7367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgL2URI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F76A2242A;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=7yfsuYrkbvcvkpI93xTQpPNAsJFGssVbQkXMrOCf0W0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Xq4FNmHSi4UxpeehXoRFxBZhTizEWB7s3J4to2I16+ETTqGh/WdMDb78Jm45tCicB
         2BIDSTRDuNbsBSK2FXEZLWEchedBZePfo6Z4HV9uFnHqVXOpmOvRND/b9W+NW/TC68
         jhmQzCBDfHNyyn9yW3hGuRb5Y6gnqY9nFc2ZmaEysv8uuhYnpFWIBf/AX+ciEguxx+
         ObG+nysQhuDakvQLUoSwqNLZcpZ5JFR4fOrdm2G7EDB8sakuCa8/++3WTZsuJPb9j5
         hfSjs1ake2sqmNQ+YZiLI4gUW2H4DcWlh+g6zXpiW9sWO1D2PGjW3ea4fagaVx+AGs
         Sf1ZkBcGwpu7Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 3A9F160591;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293123.13751.16626624607906761950.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
In-Reply-To: <20201210102234.1.I096779f219625148900fc984dd0084ed1ba87c7f@changeid>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 10 Dec 2020 10:22:38 -0800 you wrote:
> I would repeat the same commit message that was in commit 5e4b7e82d497
> ("clk: qcom: gcc-sdm845: Use floor ops for sdcc clks") but it seems
> silly to do so when you could just go read that commit.
> 
> NOTE: this is actually extra terrible because we're missing the 50 MHz
> rate in the table (see the next patch AKA ("clk: qcom: gcc-sc7180: Add
> 50 MHz clock rate for SDC2")).  That means then when you run an older
> SD card it'll try to clock it at 100 MHz when it's only specced to run
> at 50 MHz max.  As you can probably guess that doesn't work super
> well.
> 
> [...]

Here is the summary with links:
  - [1/2] clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
    https://git.kernel.org/qcom/c/6d37a8d19283
  - [2/2] clk: qcom: gcc-sc7180: Add 50 MHz clock rate for SDC2
    https://git.kernel.org/qcom/c/043577518f02

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


