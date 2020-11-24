Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D036F2C1C8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgKXEKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728668AbgKXEKJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:09 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=/OJz07KAXWZdkJkWjaHi/xXLfYk6s7I+0r7R70LCGHY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XfvLRvW2Pq7Qlrlnb1iveynoWD4q4LxZ50jQtu7Cd+GLtJoxUdy925q1IeLxN7sw1
         bAIyWxUueVBnH5ZkCF0QkCpq6q0yzmlCRKxO1pdHKtYfTgMIA84/9U334LrHn1MXN7
         5jFSr8Bl4bQbX2QHKmht0dZtojcAWwVHllGESotk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for
 thermal zones back to 250 ms
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100846.17117.2204771861372990266.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid>
In-Reply-To: <20201111120334.1.Ifc04ea235c3c370e3b21ec3b4d5dead83cc403b4@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 11 Nov 2020 12:03:43 -0800 you wrote:
> Commit 22337b91022d ("arm64: dts: qcom: sc7180: Changed polling mode
> in Thermal-zones node") sets both 'polling-delay' and
> 'polling-delay-passive' to zero with the rationale that TSENS interrupts
> are enabled. A TSENS interrupt fires when the temperature of a thermal
> zone reaches a trip point, which makes regular polling below the passive
> trip point temperature unnecessary. However the situation is different
> when passive cooling is active, regular polling is still needed to
> trigger a periodic evaluation of the thermal zone by the thermal governor.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Set 'polling-delay-passive' for thermal zones back to 250 ms
    https://git.kernel.org/qcom/c/26664c593adc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


