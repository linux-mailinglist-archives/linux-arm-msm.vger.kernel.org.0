Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9DB32929F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241649AbhCAUtE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:54540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238861AbhCAUqI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8818364EE0;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=0QgcD4KhSGeSxcA4MTKzgxFmaiy5Mhm1KiJyshvHwJQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bM85dJqDnlsAn8G/dn5D/M+VHBjegO9NGPpTxP/4zSRCR4jiwW8fgLEgRauJwjJ4E
         Kb9XoNTi1tkMWFo1pKtFPVSRMtEK7tW6uhQCOM3D6cx5Q6K7wlqWAyLzxpk4hppjk/
         8Fej7jpYePDx2HlELh1Pcfyhet1hCbg9iD1GcSHOuZgkWcpr19qLcoSt6NSH0/kqx6
         bo/pGTkmCgMzNYlqzlJSEozOXlA7xkgdvs9FC7Gp/z7Jhdt1Zt7XmEYSYMBcKht0kM
         EUv+izgLNZFza4Y66F+PGz6X7R/RFZ/7xuUgWmcETCnycYk20apI3jjueNclxzLP9g
         MRqqkZfGbXV+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8463B60C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add SC8180x GCC binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878353.6187.11090103671136012298.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210120223556.1610214-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210120223556.1610214-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 14:35:55 -0800 you wrote:
> Add devicetree binding for the global clock controller found in the
> Qualcomm SC8180x platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-sc8180x.yaml      |  76 +++++
>  include/dt-bindings/clock/qcom,gcc-sc8180x.h  | 309 ++++++++++++++++++
>  2 files changed, 385 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8180x.h

Here is the summary with links:
  - [1/2] dt-bindings: clock: Add SC8180x GCC binding
    https://git.kernel.org/qcom/c/0fadcdfdcf57
  - [2/2] clk: qcom: rpmhcc: Add sc8180x rpmh clocks
    https://git.kernel.org/qcom/c/8a1f7fb17569

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


