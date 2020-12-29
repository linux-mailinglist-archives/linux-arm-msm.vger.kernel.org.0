Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303F82E739B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgL2URu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 35A2722B51;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=LtOBBbb4ahMCYWUm+QgBP3DS8jZFCIsSMiWaxNTClww=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GJnsHw/q1kGfqz1tgEYgO9Uhs385VhAZp78d8s1u4GqKa1dUK9UVE6IdP3tU7PpC3
         z919cHJEM2mw+7XSvT5mRHjwvwy4/Z7zX/no9SMrun8w2a0iD2f3dh1QnTxPNoUlz/
         Mh6WaNEW4IC+zw7GHcL2OMUUwa35lLU6GVrHPUPgJRQAuJISlLK1/Mdt1Voo/KpZdd
         wg8ywFbyxbmxIqs6zg1GgF+AAF01RP2/BHSo/NGmSm58DVAgJ0UE07drkTedS00arc
         WjgwKerSy/PpP+pMU5u4eTQ8ev6c32sBhS61rXCKqn6ajjosvVPJ7OyI+Gkq+5Opq6
         VAHEWUOZhmsng==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2DF5660591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/2] clk: qcom: lpasscc-sc7810: Use devm in probe
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293318.13751.2640014970125902687.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
In-Reply-To: <20201019154857.v5.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 15:49:34 -0700 you wrote:
> Let's convert the lpass clock control driver to use devm.  This is a
> few more lines of code, but it will be useful in a later patch which
> disentangles the two devices handled by this driver.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v5,1/2] clk: qcom: lpasscc-sc7810: Use devm in probe
    https://git.kernel.org/qcom/c/7635622b77b5
  - [v5,2/2] clk: qcom: lpass-sc7180: Disentangle the two clock devices
    https://git.kernel.org/qcom/c/4ee9fe3e292b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


