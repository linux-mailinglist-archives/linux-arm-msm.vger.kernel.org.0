Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78EB433169B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 19:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhCHSuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 13:50:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:58910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230488AbhCHSuW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 13:50:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F28196527E;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615229422;
        bh=rDfo0Ni3BglBmYRDPILd2kPV8XrkwJ/KRFEVZ/8FPo0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ajmdFn/wvFzsiibnrUH+6xmzdGiY9r4PnpjKtn4QQLjowUrhpWGVnSnbBqZzJ0Gdl
         dxEC6sI+Zwz3q/cuWTTxgmrTwQCEudvZM9iMnLLYL0FscT3RdwRtXfTCzYY4Gi7/J9
         NFwbiQAE/nR/7xFee1SvosgRlRV7T4j/Djib7dmrJXy0H1BxmdDXoL9OAZa5Oxjw04
         c+/qsMVOCahPy33SHULzDXivAMHxzrF8/XUjVucVb5BwABHCnAjBac6zrJaED98zLs
         BjwtHWUtzsMAnJSU6+CFUvcHG7QnSAnLP9E0VFZnikxOZhoSFbmA99T1/pAsyCmkc6
         JNAhnLLD0FEyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E252E609DB;
        Mon,  8 Mar 2021 18:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161522942192.22364.13581254632551429257.git-patchwork-notify@kernel.org>
Date:   Mon, 08 Mar 2021 18:50:21 +0000
References: <20210306021021.1173860-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210306021021.1173860-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Mar 2021 18:10:21 -0800 you wrote:
> Enable the Qualcomm SM8350 TLMM pinctrl and GCC clock drivers. They need
> to be builtin to ensure that the UART is allowed to probe before user
> space needs a console.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - arm64: defconfig: Enable Qualcomm SM8350 TLMM and GCC
    https://git.kernel.org/qcom/c/1a0252abb6ff

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


