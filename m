Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291312E735B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgL2UQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgL2UQK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C8E922209;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=RK/r9j46KDPzWovP8+LZql8b9kmuKquEj3IRab85utA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LFzUY+M5ZfZ6Z1jHoL1uamFZCU3X6uR5WaW16thChhnwD4QAGacNtSWok+tSkN7Kc
         MgTHs78J6Lj7IRA69bm49ChYDqVEnLewQpMfZMvF/wlwhAY+b/7ksu8n+CAcQio9QM
         mopioXf+YG2nl0lAB6DPYF3yklxK/e1EVMoogfq0H4dYxzWLpyZIKa2soTAL1y+m7r
         TcNwEKr4YiMTWMoHtI3Hz1A4LEjeWH14us1pJhJdvge9lWsgFyqQfjwgCQtypJsWZd
         SgcCC0Z6fHnJSYdxVY2ZszuNphZJ8JRxOaFeadra7TtnykaEzsjoGLXxMiZqY1NEkM
         PRs/ZnwkWmGCg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6E43A60591;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/7] arm64: dts: qcom: sm8250.dtsi: add display system
 nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293044.13751.16174690079043448755.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201203142105.841666-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201203142105.841666-2-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  3 Dec 2020 17:20:59 +0300 you wrote:
> Add device tree nodes for mdss, mdp, dsi0/1.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 302 ++++++++++++++++++++++++++-
>  1 file changed, 295 insertions(+), 7 deletions(-)

Here is the summary with links:
  - [v2,1/7] arm64: dts: qcom: sm8250.dtsi: add display system nodes
    https://git.kernel.org/qcom/c/7c1dffd471b1
  - [v2,2/7] arm64: dts: qrb5165-rb5: add mdss/mdp/dsi nodes
    https://git.kernel.org/qcom/c/46967bb61a20
  - [v2,3/7] arm64: dts: qcom: qrb5165-rb5: add gpu/zap-shader node
    https://git.kernel.org/qcom/c/0b2033dcf4af
  - [v2,4/7] arm64: dts: qcom: sm8250-mtp: add gpu/zap-shader node
    https://git.kernel.org/qcom/c/9e301a547a7e
  - [v2,5/7] arm64: dts: qcom: qrb5165-rb5: correct vdc_3v3 regulator
    https://git.kernel.org/qcom/c/04c8e3f7e9e9
  - [v2,6/7] arm64: dts: qcom: qrb5165-rb5: add lt9611 HDMI bridge
    https://git.kernel.org/qcom/c/d004c631ea4e
  - [v2,7/7] arm64: dts: qcom: sm8250: power up dispcc on sm8250 by MMCX regulator
    https://git.kernel.org/qcom/c/3f2094dfbe69

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


