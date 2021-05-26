Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5F5391FEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235727AbhEZTE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235292AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CB9AC613D4;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=yeHjNIDEFX6OnBgElQbyICfbXOk1R/G3aFelMc8O2TY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cwazIoKXZkH/ghVmRFvnKTMgqmkfmQiLN1eW9BQRS5q48MWLW3Un0D7ZuOq6Sgyxm
         ceDUtGWbi/gQZBMdB84XeO4qyXJPRBmCltzzAWuAh7G40opVcAlrYuOx3ZYdlFx8tF
         G4gkHvY6etRK+6joelLDXs6yCqm/LB0WBGLuT39udF9Zm20K6BOCX4O3nrpyfifnma
         o2of5SvZ9UrrhNw5B1OLq7GCwpWaa4aT1KzLypli9YFx60e33UtrQXMP0DMkMEM4zq
         iaL4lce0Ld7efXQe2qNpO077vWjruQ5s62gi04Ss3lzHlCv0XQH+ULRuk/fUEuapGu
         oLQcp88qg5J0A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C144B60D08;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/4] Serialize execution environment changes for MHI
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580378.26840.11010304260428458764.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Feb 2021 15:23:01 -0800 you wrote:
> v6:
> -Add patch to improve debug message
> -Fix switch-case fall through warning for EE serialization patch
> -Address review comments and update commit text
> 
> v5:
> -Update commit text for "clear devices when moving execution environments" patch
> -Added test platform details that were missed out in the cover letter
> -Merged two if checks in to a single one for EE serialization patch
> 
> [...]

Here is the summary with links:
  - [v6,1/4] bus: mhi: core: Destroy SBL devices when moving to mission mode
    https://git.kernel.org/qcom/c/925089c1900f
  - [v6,2/4] bus: mhi: core: Download AMSS image from appropriate function
    https://git.kernel.org/qcom/c/4884362f6977
  - [v6,3/4] bus: mhi: core: Process execution environment changes serially
    https://git.kernel.org/qcom/c/ef2126c4e2ea
  - [v6,4/4] bus: mhi: core: Update debug prints to include local device state
    https://git.kernel.org/qcom/c/aaca4233ea03

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


