Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7DFC354B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 05:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhDFDkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 23:40:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:49660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232419AbhDFDkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 23:40:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1456261399;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617680410;
        bh=cf/mV6/zdP+kDW+aHQpc3Zlj43pGt+z/dszCut4Flec=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=l9Bbuv1Qlg3ipIgcUrYTu5pkBEzaBlmcZgrDa/+EOT7Vdwr753LzWCBtcGxG3i3FI
         an1Ma23HC+3PaGcvA+aB8AUtpSsNWjT67DgYVMPUb7hgxhDnBO940ghixV1F5wP1Nc
         epaSIzuwILij2DvNhYt3D6sNc+IfEAgV/FE8NZ3DisADA6UlGlVapQpzUtf2NzwjfL
         fYi8LjEfeb8pkHs4hVrgEAXahbVFJ0Kd2/fBt9SPHqFE1h20sM1gtImiIJF4hexd4P
         jdZ290Gqu2o37yEmRfzvpG0hEL9lzAE18AFTzrXgXTvTmV+ZjfiEUKru6h9oTxFqOm
         LDc4tysRqj6Jw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 047FC60A19;
        Tue,  6 Apr 2021 03:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2 0/4] Enable various hardware blocks on SC7280 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161768041001.22037.4820574424582485866.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Apr 2021 03:40:10 +0000
References: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1615832893.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Mar 2021 00:05:45 +0530 you wrote:
> This series enables various hardware blocks such as LLCC, IPCC, AOSS QMP
> and Coresight on SC7280 SoC.
> 
> Changes in v2:
>  * Rename qmp to power-controller (Stephen)
>  * Drop the ipcc mailbox dt-binding from this series and send it separately
>  * Collect review tags
> 
> [...]

Here is the summary with links:
  - [PATCHv2,1/4] arm64: dts: qcom: sc7280: Add device tree node for LLCC
    https://git.kernel.org/qcom/c/0392968dbe09
  - [PATCHv2,2/4] arm64: dts: qcom: sc7280: Add IPCC for SC7280 SoC
    https://git.kernel.org/qcom/c/2257fac94bc2
  - [PATCHv2,3/4] arm64: dts: qcom: sc7280: Add AOSS QMP node
    https://git.kernel.org/qcom/c/208979a8f9cb
  - [PATCHv2,4/4] arm64: dts: qcom: sc7280: Add Coresight support
    https://git.kernel.org/qcom/c/544cebe18956

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


