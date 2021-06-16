Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C8D43A8D3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhFPAMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:12:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:55052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231186AbhFPAMJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:12:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2DBE461369;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623802204;
        bh=ylWmR5zrRBIBbF/VYpDccJczwFGsUnRV6lWUuogcWlE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kvvTCVcWRVaz0F6KF7qIOkuwSS71qm5JyV0lLc4ENbIbPCg+QbCiPK70BHm3pLJBk
         I0HvAU6Jp4mlh7c2Mvs2uzZwkVR9O7rE8fDaKlBzPu1IY5jL3qcof7m2vghBLQqiHg
         Z8R8B7az47CyzYcGQW0MtPpQC0sUgMhwVaPySVWrwNoBK1j3cTE5UZfAIoW/Q+e0NH
         He8kcwMAXcuSok9ofyimZrWrZ4aBvUsmACnPF8rEKjzDHs9tYdqLeGdoyonnE3fvR8
         G4/BVdkCDZOfTTR/kjjPr4q+JTIyee380ol80pPaeQFvs1lktlEJBH0U0moJF3qN+7
         sGaLRLxDAVzvQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1FBC060986;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add size/address-cells to dsi[01]
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162380220412.6033.5527504820201119990.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 00:10:04 +0000
References: <20210613114356.82358-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210613114356.82358-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 13 Jun 2021 13:43:56 +0200 you wrote:
> Add the aforementioned properties in the SoC DTSI so that everybody doesn't
> have to copy that into their device DTs, effectively reducing code
> duplication.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: sm8250: Add size/address-cells to dsi[01]
    https://git.kernel.org/qcom/c/40f7d36db8fd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


