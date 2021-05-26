Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9816039201C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbhEZTFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235771AbhEZTFB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E1FC61413;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=VXdHkIuKF5mhiEhkO5gYObBCfDbxMjyx1MlhD/IwdJ4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IJkcEN81UE7mvpNeMEvh5iDDTwJ9CdN/4T2ehG79UFg0LhMkLpn40yESslH4luWbO
         O6Mug/wOdk3jYjWYPazD/Mde+5nLjIwgkzdaLwZVqXIQlZUk6dLG2p6QCR4hifSM6o
         HGeddpTkQtX8LC2Ss18kbl8pTipXLmsvPCxw7ulZKecvqOAMQzmeZFgHSHUGpg+aWt
         vSnvXy2CkWbHUteFYBmdlEJf0quR1ZSwe0b1hFWBJtG2qKJqBumzLCxR9FTJ43ZMZj
         MPqKmC2K1yIi6sdhkuB+Ad9kG1ftkLqC1AM4WH3K0ZjALkexAwG/WMSv8CXUeJ6IAS
         hgPo8cmYm8pHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9986960CE1;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2] coresight: etm4x: Add ETM PID for Cortex-A78
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580562.26840.4993752424510756021.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210213112829.26834-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20210213112829.26834-1-saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 13 Feb 2021 16:58:29 +0530 you wrote:
> Add ETM PID for Cortex-A78 to the list of supported ETMs.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
> 
> Changes in v2:
>  * Rebased on top of coresight/next from kernel.org coresight repo.
> 
> [...]

Here is the summary with links:
  - [PATCHv2] coresight: etm4x: Add ETM PID for Cortex-A78
    https://git.kernel.org/qcom/c/ec5859497225

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


