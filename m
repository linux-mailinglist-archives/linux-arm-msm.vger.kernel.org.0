Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07BF02E736B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgL2URI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A76C4224F4;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=ADAbCt+6fPPXJvnRs7Sk1fNh/cLwpFVPrDJtqPiSul8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MUq/eziMIpWmCy+eRVpvik3f1u/9gKtMYQDJM34e68r8UiAuWElCOed0g4WyTg6Pj
         QKWtS6UBso+BPU7Gc8hvv4rPsh3sW7j9m7udj3gdfjmcJ5/Im0AEZxyVvBXnzTU3ko
         1R8uPxOCMMRURRO9HQxX0qqd+KcH5o3brE1L02FRwlAGEIY0cPTVq47v72TS6Vkf6H
         rGtM1WxqE0JBK20HldSHmXp3Uol4UjQVj1CXGp588IW2c23egtW0KdKx0kf84etxms
         LpqlLOUOzl1KtnfdR3cE7rxGM2laMH0K22v62/XOhmgZEyRb+xHx0ux5HJ2pzTF2vT
         AaGWC5350JDMA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A1FC6604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] Add LLCC support for SM8250 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293165.13751.3802463155038594977.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 15:09:20 +0530 you wrote:
> Hello,
> 
> This series adds Last Level Cache Controller (LLCC) support for SM8250
> SoC from Qualcomm.
> 
> All 4 patches in this series are expected to go through arm-soc tree.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: msm: Add LLCC for SM8250
    https://git.kernel.org/qcom/c/f426c3b1d66f
  - [v2,2/4] arm64: dts: qcom: sm8250: Add support for LLCC block
    https://git.kernel.org/qcom/c/0085a33a25cc
  - [v2,3/4] soc: qcom: llcc-qcom: Extract major hardware version
    https://git.kernel.org/qcom/c/916c0c05521a
  - [v2,4/4] soc: qcom: llcc-qcom: Add support for SM8250 SoC
    https://git.kernel.org/qcom/c/c4df37fe186d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


