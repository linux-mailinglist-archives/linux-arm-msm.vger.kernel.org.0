Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5655B32F736
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 01:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhCFAUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 19:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhCFAUJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 19:20:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B6AC65081;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614990008;
        bh=KfBkYpkNXzKptoJJNxnZ+58prdXTEa3oUa0QAc/YvL4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fJFGdIrAc/fa/n65ri9OyzV4e40QMUvt2lMF3VdZ187Wdz6Bs3rIf4HQnTrHco4eK
         VgEKDGuBeMQrbnWL0uRZgU79VJBR0dfrcPI97nnmD8V6dIgm4m7SV1azlPCqbLuxIf
         20kHJqk7hzRxFAQLouuEg/shne9+u5Vf6f+xrok9l7/FL48StLczVMBcXg3dGe0ac/
         eDdFR6ExuzxULrRCiGHxR7whdRDXwh8j8k08asGYt4gxCOmInywiPaXFiZMJBFwK9t
         n/QlD7T/Kj3zcWB2rkXUfctoA/6u8ku//4ahLBPHnUarkC0zfFKEO/kVbAMmzK9wuC
         2GkoAcZ5is5ng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8F79560A3E;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] arm64: dts: qcom: Rename the qmp node to power-controller 
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161499000858.12377.4221410524567521996.git-patchwork-notify@kernel.org>
Date:   Sat, 06 Mar 2021 00:20:08 +0000
References: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Mar 2021 12:58:00 +0530 you wrote:
> This short series converts the qmp DT node name to generic "power-controller"
> for AOSS message ram instead of the protocol name QMP(Qualcomm Messaging Protocol)
> since it is used for power management requests.
> 
> Sai Prakash Ranjan (4):
>   arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
>   arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
>   arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
>   arm64: dts: qcom: sm8350: Rename the qmp node to power-controller
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: dts: qcom: sc7180: Rename the qmp node to power-controller
    https://git.kernel.org/qcom/c/c0e93b029bee
  - [2/4] arm64: dts: qcom: sdm845: Rename the qmp node to power-controller
    https://git.kernel.org/qcom/c/0cc147305586
  - [3/4] arm64: dts: qcom: sm8250: Rename the qmp node to power-controller
    https://git.kernel.org/qcom/c/067a8db27ddc
  - [4/4] arm64: dts: qcom: sm8350: Rename the qmp node to power-controller
    https://git.kernel.org/qcom/c/2808211cc9a7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


