Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2C83A8D3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFPAMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:12:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231243AbhFPAMJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:12:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3156C613B9;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623802204;
        bh=koxELa25/ElUvRXVMdAuKWoZ/NJfkjZMMglSOABxpDE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DYbaT5IkWxPNxQ4BEW9FCn/wViSQzi4jqSYahOA944nv4QAC6NZDQynFe0H5U+ccp
         XPNZEuhJD6yDUReHrx7OEnqE4vTcXtqji+ZDsiIbu9z7D+kPfuF2vCvWe8H7LtPehG
         Z2muSqmLkgvBsdytAskgGVaF9N9Q77r923wt+aQBUAzW1IkzuEqMzQ0/JIWi22bmCA
         AKygPS8dZOdgLDSFDOiOpytLtpIbP4SnCuIhzD4Sc75FdqoK4CrV5rbOEecVGICKjl
         6sT/arOkzo+2rcS853sx4DB8sT/JYBsroui/Sagxj4ESvx1q4TvqmhtUHJGTgtlE7B
         UQoSRnB/Ise7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 286E360BCF;
        Wed, 16 Jun 2021 00:10:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Don't disable MDP explicitly
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162380220416.6033.3692505979160300452.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 00:10:04 +0000
References: <20210613110635.46537-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210613110635.46537-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 13 Jun 2021 13:06:35 +0200 you wrote:
> DPU/MDSS is borderline useless without MDP, so disabling
> both of them makes little sense. With this change, enabling
> mdss will be enough.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: sm8250: Don't disable MDP explicitly
    https://git.kernel.org/qcom/c/0c25dad9f2a7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


