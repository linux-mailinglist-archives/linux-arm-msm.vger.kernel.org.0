Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859F23A8D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhFPAMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:12:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230331AbhFPAMJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:12:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2012061246;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623802204;
        bh=trR7G2e+MH8MPLRWaESePDWcDxs2qdJBFjEdLEA4pK8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YAPCOISFSWrcZiS4gUcUd5IWor4bM3eZBqi0WicibAysgK+NFcHXQywHu3KQeN1yr
         a7LekJM7ddSxWfb3TqnRb7JdePHwJGP7aUwNT5vsg610Pe+lWYEUrEaAk2oHYqSpmW
         oHct+f+Ov5X7goMmE3IKTieJBRjXMf/UQznOS8QSnG3m1cHlwYlDt9ePaFxfwL6Uez
         CWUnrBfF+tAz1jrWZcj1mYaXsbO8ep4Vy5K+OUBEgrePC7h1LGyixBJiYQBMoUWb10
         fOlkWQyUjdkPTE96T7BXpFg5KjL/eEV3ky6+jiM2l1393mjr2FhJYzc3TS/x7emF8a
         6POt4NLkaUurQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E41460A23;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix pcie2_lane unit address
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162380220405.6033.4521514252224542204.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 00:10:04 +0000
References: <20210613185334.306225-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210613185334.306225-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 13 Jun 2021 20:53:34 +0200 you wrote:
> The previous one was likely a mistaken copy from pcie1_lane.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sm8250: Fix pcie2_lane unit address
    https://git.kernel.org/qcom/c/dc2f86369b15

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


