Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63BA392060
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234686AbhEZTFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235834AbhEZTFR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 08D2A61601;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=3ZZUrMqPDie+ubzGeKQ5L8ZpBaWIPNCeLz91HItDn/c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WtPXgqCUtjCuwFs1Dawy++xOiKNwOs8bZCj+dQE9Luh6atKIY0x4k0PKNzMWao6Vc
         xJwqAU8f/HfAXYnDT0ppRn/y4bYZXK5wmqMORtH64Fq12ctjkOq2KbQaZSZwpS1xN2
         PFT8GsOK19Woj2FjMuL1jDJaKV4Yh3V+FdYXHJP1yaK8uBTNdbrwDhl0CUmBOyqJxi
         Kv3uMEdb49155dPFXWruHjsD1tzpFJ+VsXLPCP6HwlWkguX/Tx8hTKW3qpLkydkk2/
         8KVs0czghGCopzO831E/wMOKvuU26J3yMlihBFA4+aaDR3HN4keAQcKKWATUQdIvpF
         L+YNhtd+l/MZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0415B609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mhi: Fix invalid error returning in mhi_queue
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580801.26840.10038244818481666620.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1614336782-5809-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 26 Feb 2021 11:53:02 +0100 you wrote:
> mhi_queue returns an error when the doorbell is not accessible in
> the current state. This can happen when the device is in non M0
> state, like M3, and needs to be waken-up prior ringing the DB. This
> case is managed earlier by triggering an asynchronous M3 exit via
> controller resume/suspend callbacks, that in turn will cause M0
> transition and DB update.
> 
> [...]

Here is the summary with links:
  - [v2] mhi: Fix invalid error returning in mhi_queue
    https://git.kernel.org/qcom/c/0ecc1c70dcd3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


