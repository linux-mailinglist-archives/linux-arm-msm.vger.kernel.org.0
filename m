Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B97D2E736C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgL2UQx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B448F22242;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=mgOkzaJPQPb8txc4TAORh3df3B5F+8Jz6g8fzmf05MU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eH4d5D3dkjMqWhdTcY8BGU329jCiFixBIWUXIXwooEjOv6JeQMUVeBXGtt80gGt1e
         rKbAFTatRuEaNWPuKrzE9HFW7MTda5sd9gY0xDwIGDXQ2SVDx65Arg8fTpK3fdXv2K
         DWQxvzrip1rYzK7/DxcTIEJOvfkwksGoc6qL6E3rwhSAUvjtzbpFgFIRLeWGuHI4q5
         opvBAgntTBOHqvJ6iaYVCyqBWjBKoHR1+lb7DIoFAPoOQB2Y/Ow8L/qeAEYZfIWOX6
         ns8yN2mA4EYRydYQ9Gbga1q4zjSPAj1KCl7vw34bvaqn8vEQo0XdebpMe6U1DqjAwd
         h5ieqOmjCkmmQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A916F60626;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/12] Bug fixes and improvements for MHI power operations
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293068.13751.9269471783859375573.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  9 Nov 2020 12:47:19 -0800 you wrote:
> Bug fixes and improvements for MHI powerup and shutdown handling.
> Firmware load function names are updated to accurately reflect their purpose.
> Closed certain design gaps where the host (MHI bus) would allow clients to
> operate after a power down or error detection.
> Move to an error state sooner based on different scenarios.
> 
> These patches were tested on arm64 and X86_64 architectures.
> 
> [...]

Here is the summary with links:
  - [v4,01/12] bus: mhi: core: Use appropriate names for firmware load functions
    https://git.kernel.org/qcom/c/1b55c16a5e47
  - [v4,02/12] bus: mhi: core: Move to using high priority workqueue
    https://git.kernel.org/qcom/c/8f7039787687
  - [v4,03/12] bus: mhi: core: Skip device wake in error or shutdown states
    https://git.kernel.org/qcom/c/8e0559921f9a
  - [v4,04/12] bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
    https://git.kernel.org/qcom/c/3fb81a4d5f2f
  - [v4,05/12] bus: mhi: core: Prevent sending multiple RDDM entry callbacks
    https://git.kernel.org/qcom/c/0c76b3fa580d
  - [v4,06/12] bus: mhi: core: Move to an error state on any firmware load failure
    https://git.kernel.org/qcom/c/12e050c77be0
  - [v4,07/12] bus: mhi: core: Use appropriate label in firmware load handler API
    https://git.kernel.org/qcom/c/faa257075bcc
  - [v4,08/12] bus: mhi: core: Move to an error state on mission mode failure
    https://git.kernel.org/qcom/c/dc53d862eab8
  - [v4,09/12] bus: mhi: core: Check for IRQ availability during registration
    https://git.kernel.org/qcom/c/40c3127187cb
  - [v4,10/12] bus: mhi: core: Separate system error and power down handling
    https://git.kernel.org/qcom/c/556bbb442bbb
  - [v4,11/12] bus: mhi: core: Mark and maintain device states early on after power down
    https://git.kernel.org/qcom/c/a03c7a86e127
  - [v4,12/12] bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
    https://git.kernel.org/qcom/c/6cc1716102b5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


