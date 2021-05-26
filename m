Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB75E392008
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235844AbhEZTFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235668AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9E7406143E;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=zgjixyJ8uUYuuO4FQaSMBIVEM3rsUKaUoyRoYDMEmUE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=s86jGfesL4DnpW15JImihTqxMolU9fEE/QW5nB2GxK8aB0ltYvvYPeJsSQA78BnCH
         bLm9yjSF6nX7nL8vnTaqZVgo0WDsAvMCwvoY52q8Dtz6fT409ZUnl0Y2ksHbmIphhe
         Xj3AlfZoXCpD+9NnG3eEkRaa9kDEd1PAPYRdOa/Jr4C1s738b6TKpeS4IservfzQMa
         kZm/YqTrzs/K+nu9sffwLwtKE0Vu40wd6qKKqg/VjKsY74cWRpsvDhW6hJ0lDnkwIY
         xNSl6SUQH/g6XB2ZYkVH9EG9npr2h0ctW+iai3pkPP4FlpWIujxHA0o7DzM/w7AfCA
         A5SZ0QM+1WX4A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A20360CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/7] MHI Emergency download and flash programmer support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580462.26840.5500910719590425640.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 29 Mar 2021 18:28:17 -0700 you wrote:
> Allow handling EDL mode after SYS_ERROR occurs by reading the execution
> environment post handling and move to power on reset state to accommodate the
> scenario.
> Handle EDL mode properly and wait for ready instead of just exiting from the
> firmware load.
> Allow use of the Flash Programmer execution environment as a mission mode
> use case for a blank NAND power up scenario.
> Always attempt a wait for MHI ready state as device could be waiting for the
> host to do so after pass through execution environment is seen.
> Introduce patch to improve state awareness and aid in debugging.
> 
> [...]

Here is the summary with links:
  - [v1,1/7] bus: mhi: core: Rely on accurate method to determine EDL mode
    https://git.kernel.org/qcom/c/418bec695696
  - [v1,2/7] bus: mhi: core: Wait for ready after an EDL firmware download
    https://git.kernel.org/qcom/c/4f214496ac74
  - [v1,3/7] bus: mhi: core: Handle EDL mode entry appropriately
    https://git.kernel.org/qcom/c/ad416db9fabe
  - [v1,4/7] bus: mhi: core: Add support for Flash Programmer execution environment
    https://git.kernel.org/qcom/c/66ac7985b2af
  - [v1,5/7] bus: mhi: core: Identify Flash Programmer as a mission mode use case
    https://git.kernel.org/qcom/c/d20e82d4d016
  - [v1,6/7] bus: mhi: core: Wait for MHI READY state in most scenarios
    https://git.kernel.org/qcom/c/e72919cebd19
  - [v1,7/7] bus: mhi: core: Improve state strings for debug messages
    https://git.kernel.org/qcom/c/19e60d6e88a6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


