Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D922392068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbhEZTFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235840AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4952061626;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=lV+60pzashdVc/P6CrXw3fDQ2wWXb7SPX/QQVOsWYH8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FlA5H/J+K4PFrMuC8XHsf0xUAJRB0YzYCAO/kSea65G6SxblXB8sR197FOftmESAi
         NioaAWPRxApoiJnTW3YMXQNx2zbrBi3mBmnKH0NSO7MIrYgisYUCeUHx52YYHRUT5r
         j2D6NI3ZhVSc+w5WSk7i4NwHN/12vQNtwTfn5/CtU8HqYtXBF9Qa5td14GcQXyhx3g
         87ESGfldm3l6imS7IOGairMpcxu9ATrfBY/A/SJ1vPUau/8hHZ+jpjUGfeI38RB//H
         IWLEFQVi1iVVPdxKDT+qwUOUtSrZxdrrXzb2uFY1vIKg+Cn4gtqBso5CJRrrGXch+0
         kF0hDyBpPkWyw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 44EE4609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580827.26840.3848624883437651004.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210305005049.24726-1-jonathan@marek.ca>
In-Reply-To: <20210305005049.24726-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Mar 2021 19:50:48 -0500 you wrote:
> Attempting to use the RX MIX path at 48kHz plays at 96kHz, because these
> controls are incorrectly toggling the first bit of the register, which
> is part of the FS_RATE field.
> 
> Fix the problem by using the same method used by the "WSA RX_MIX EC0_MUX"
> control, which is to use SND_SOC_NOPM as the register and use an enum in
> the shift field instead.
> 
> [...]

Here is the summary with links:
  - ASoC: codecs: lpass-wsa-macro: fix RX MIX input controls
    https://git.kernel.org/qcom/c/e4b8b7c91603

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


