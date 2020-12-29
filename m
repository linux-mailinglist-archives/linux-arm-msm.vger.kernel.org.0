Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C218F2E73A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726487AbgL2URx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6925B22BEF;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=eu4pDXHxt0VQwoVpVuQlZgyqyQbHjtPZlpuZF4+w8eI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Tp/awl4at23QmSMp+7nleUuHYq12fU0kZEzUEWIJM2WGVUIqcUZLjMr/1Ohnp16sT
         uaml+YuEyoq7bx1S69DTiLPzn1ouvL79cidKgqCeL1rpoArw8UQ4UfeVjC0yerPjqL
         ThAkfkeTKOQG0JnzoiIdTcofcLq18uuQ97bcgurpoDYXZDXKMxS6ZnQIXUnlkk29N9
         Ug8LZoBl5+VgSm/9dYgaJkZQ2o4UEDoTXnfDRO8tGO5DHn6Atb34ciDfzNaZ8zaBSp
         myBmGGoDmTUbD6d3SgLrxv+9AYfmH7eizU3mQnZCKnVc950Nk5K0Hn+f/bOr63oiut
         rV8G9L/PPHXQA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 64FF160626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [Resend v1] Bluetooth: hci_qca: Wait for timeout during suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293340.13751.3811817825273808086.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1605071734-5282-1-git-send-email-bgodavar@codeaurora.org>
In-Reply-To: <1605071734-5282-1-git-send-email-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 11 Nov 2020 10:45:34 +0530 you wrote:
> From: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> 
> Currently qca_suspend() is relied on IBS mechanism. During
> FW download and memory dump collections, IBS will be disabled.
> In those cases, driver will allow suspend and still uses the
> serdev port, which results to errors. Now added a wait timeout
> if suspend is triggered during FW download and memory collections.
> 
> [...]

Here is the summary with links:
  - [Resend,v1] Bluetooth: hci_qca: Wait for timeout during suspend
    https://git.kernel.org/qcom/c/2be43abac5a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


