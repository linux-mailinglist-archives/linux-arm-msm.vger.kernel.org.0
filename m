Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60A9331699
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhCHSuZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:50:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:58906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230481AbhCHSuW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:50:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E9DB065194;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615229421;
        bh=fLX3u8rwO3IkQrMZQ6HQk76rG3gFN7Obd+obkwZWKf0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RDyAFLC9T6yYBO9CfZzwcMOJk2P3KLrbKlmUAaOrC9fPaqOe7NoZx+BsbvE6+RSMC
         0qIlOOLOoO9/Q7tllJbvGrgxz9U7/WuE0b1cL1QMs+ZGabgbVThWBEHt5yjEXHIEaD
         cCe3C4TQBHSjoY67MyexTCtgv69PY8OkUPP7ZpL5fP2hd1oIFZL5PrtmEPTlulOTBY
         RZNSsSnekDwUzyr1j4JBuozRmoxwRshhpV2t07XjICLCKoblYvvnpCvQwHz25VLtyr
         E3D5v/0EEJs1yoz1CB0lW00sj1JKes8PplC5uavcxGRtBat/ZhsNO03kBoCqgnaxAS
         3+v5rfHFGTFCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DAA57609E6;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/13] arm64: dts: qcom: Update sc7180-trogdor variants
 from downstream
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161522942189.22364.8096044818035654341.git-patchwork-notify@kernel.org>
Date:   Mon, 08 Mar 2021 18:50:21 +0000
References: <20210301213437.4165775-1-dianders@chromium.org>
In-Reply-To: <20210301213437.4165775-1-dianders@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  1 Mar 2021 13:34:24 -0800 you wrote:
> The point of this series is to catch upstream up to what we have
> downstream in terms of sc7180-trogdor variants.  Notably:
> - It incorporates minor changes that snuck into the trogdor and lazor
>   device tree files since they were posted upstream.
> - It adds the "Limozeen" SKU variant of Lazor.
> - It adds support the Pompom and CoachZ type trogdor boards.
> 
> [...]

Here is the summary with links:
  - [v2,01/13] arm64: dts: qcom: sc7180: Update dts for DP phy inside QMP phy
    https://git.kernel.org/qcom/c/466952306ea6
  - [v2,02/13] arm64: dts: qcom: Move sc7180 MI2S config to board files and make pulldown
    https://git.kernel.org/qcom/c/64aefe7aaef7
  - [v2,03/13] arm64: dts: qcom: Prep sc7180-trogdor trackpad IRQ for new boards
    https://git.kernel.org/qcom/c/e1120b906c22
  - [v2,04/13] arm64: dts: qcom: Unify the sc7180-trogdor panel nodes
    https://git.kernel.org/qcom/c/bc6d6c2185de
  - [v2,05/13] arm64: dts: qcom: trogdor: Only wakeup from pen eject
    https://git.kernel.org/qcom/c/93d6bbdbafbf
  - [v2,06/13] arm64: dts: qcom: Disable camera clk on sc7180-trogdor devices by default
    https://git.kernel.org/qcom/c/1e7f50e04f18
  - [v2,07/13] arm64: dts: qcom: sc7180-trogdor: Remove fp control pins in prep for coachz
    https://git.kernel.org/qcom/c/db97900a0165
  - [v2,08/13] arm64: dts: qcom: sc7180: Remove clock for bluetooth on Trogdor
    https://git.kernel.org/qcom/c/6ba57fcce536
  - [v2,09/13] arm64: dts: qcom: sc7180: add GO_LAZOR variant property for lazor
    https://git.kernel.org/qcom/c/42f9a4a21ecb
  - [v2,10/13] arm64: dts: qcom: sc7180: Set up lazor r3+ as sc7180-lite SKUs
    https://git.kernel.org/qcom/c/ad40a8b8ebb2
  - [v2,11/13] arm64: dts: qcom: Add sc7180-lazor-limozeen skus
    https://git.kernel.org/qcom/c/08f08ce1932b
  - [v2,12/13] arm64: dts: qcom: Add sc7180-trogdor-pompom skus
    https://git.kernel.org/qcom/c/e218fbeb63e2
  - [v2,13/13] arm64: dts: qcom: Add sc7180-trogdor-coachz skus
    https://git.kernel.org/qcom/c/5cc369178b3a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


