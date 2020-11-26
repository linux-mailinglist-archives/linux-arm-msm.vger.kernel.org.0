Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D8662C4BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 01:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgKZAKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 19:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:41678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgKZAKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 19:10:05 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606349405;
        bh=YcIz6IGQjn47RykIgJ1JlXJSZIXqkeT5Uj+4iFQOlzM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q7I1OloofKG4d1Hl8fpY8VPLLuSk15B/zYU49Bw3KNkHmJx797GBAYKYUz+6SSRie
         5EtZN7PDF5j4qK9hcbSTx05iry+Kyg+wKiXa/DBa95kI7uYvJK52jFj1DDjtevUveH
         ykM2eSDhUEmvcqnuE9ZNAiodK9zP2NDUxWM3wT84=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the
 default supply for pp3300_hub
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160634940555.7812.18314481479856105191.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 00:10:05 +0000
References: <20201124164714.v4.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
In-Reply-To: <20201124164714.v4.1.I0ed4abdd2b2916fbedf76be254bc3457fb8b9655@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 16:48:13 -0800 you wrote:
> The trogdor design has two options for supplying the 'pp3300_hub' power
> rail, it can be supplied by 'pp3300_l7c' or 'pp3300_a'. The 'pp3300_a'
> path includes a load switch that can be controlled through GPIO84.
> Initially trogdor boards used 'pp3300_l7c' to power the USB hub, newer
> revisions (will) use 'pp3300_a' as supply for 'pp3300_hub'.
> 
> Add a DT node for the 'pp3300_a' path and a pinctrl entry for the GPIO.
> Make this path the default and keep trogdor rev1, lazor rev0 and rev1
> on 'pp3300_l7c'. These earlier revisions also allocated the GPIO to the
> purpose of controlling the power switch, so there is no need to limit
> the pinctrl config to newer revisions. Remove the platform-wide
> 'always/boot-on' properties from 'pp3300_l7c' and add them to the
> boards that use this supply. Also delete the 'always/boot-on'
> properties of 'pp3300_hub' for these boards.
> 
> [...]

Here is the summary with links:
  - [v4] arm64: dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub
    https://git.kernel.org/qcom/c/066c2a944868

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


