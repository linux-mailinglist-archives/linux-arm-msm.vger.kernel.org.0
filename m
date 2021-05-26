Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35BB392029
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233646AbhEZTF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235792AbhEZTFF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0DD8761453;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=wbAV+bU/duSNb1nZgdHGkbveFMmZtedzSl3FHd8V0L4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VAfSeE7y7JVJZoXpe1QH4Wf8I2tkPmeECEXx8WTdVZ8/eaN++AtO/z3E1vBe/cKBm
         BhQAd2zY6YXFAS8A2OOF6ASYvSn5xKmyxnU6/8/BMH3+Jq7kN7AwO7jdiIwcp2QH6k
         WR/704b3tyNj/wrdWveCRNxcw/VhKbey+wb1Teo/QiPf9w8sXC9aYdVs/0vUmA0HQs
         T76x1yxsPwB/GIDS1U8fnrbqbt/mkDtZNjIM53YsK/4Bcuq4RnO6+VowIvkRwGLRMq
         kkQ+YqaLI93cmCOjIbzMG9kPR7qAbcCRWH2CPfJKaEFqbrlmjw6Mg7k9GOq1LoSJvU
         GQIXiYh22Sp0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 09A6B609ED;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580603.26840.17125902597884309771.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 12 Feb 2021 10:29:34 +0530 you wrote:
> From: Maulik Shah <mkshah@codeaurora.org>
> 
> GPIOs that can be configured as wakeup sources, have their
> interrupt lines routed to PDC interrupt controller.
> 
> Provide the interrupt map of the GPIO to its wakeup capable
> interrupt parent.
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map
    https://git.kernel.org/qcom/c/35b25fd32b5f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


