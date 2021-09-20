Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3247A410E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Sep 2021 02:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhITAbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Sep 2021 20:31:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhITAbc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Sep 2021 20:31:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EE4A66104F;
        Mon, 20 Sep 2021 00:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632097807;
        bh=eHU3sgo6pFgvSNnebC2EHcKs9FFrt+cnkMicA23ffvE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=CqvcE6ND0UtxKkkFflNu18nEBUwm0ZOnz8yrDoAQsqXFXHk/F5zBTLqi1nTKgIJYV
         grmHVfVBX0vO0L0EOa+Is5gYZGrMoj8rG6g7GFdiNlGJDbwBKpjswyjKBd3hJOnxjk
         qaqXqJfZtEdbsVSnyNzUks6lS8Tmfbubx4tylvK/lYyg9xZGkjSn7CFe5XCCexvRRD
         Icf/wSpEqkPX3IK0Fio3QoAlEWVppDy6jKZTLk3rQ4fEiXJdkyvnZEBImwm1BBEmWe
         tzYKC5+FVIKdp2nULo/DLjboGHV1JhixaDglcULXdDwSkIwtvJLZL0fZVIdzbkyOqy
         5feSNSSO1M2bw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DCA5D60A3A;
        Mon, 20 Sep 2021 00:30:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-yoga: Reshuffle IPA memory mappings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163209780689.29025.67095141175837924.git-patchwork-notify@kernel.org>
Date:   Mon, 20 Sep 2021 00:30:06 +0000
References: <20210916200554.2434439-1-amit.pundir@linaro.org>
In-Reply-To: <20210916200554.2434439-1-amit.pundir@linaro.org>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 17 Sep 2021 01:35:54 +0530 you wrote:
> Upstream commit 2e01e0c21459 ("arm64: dts: qcom: sdm850-yoga:
> Enable IPA") shuffled reserved memory regions in sdm845.dtsi
> to make firmware loading succeed and enable the ipa device on
> sdm845-yoga but it broke the other common users of those
> memory regions like Xiaomi Pocophone F1.
> 
> So this patch effectively revert those upstream commit changes
> and move all the relevant changes to sdm850-lenovo-yoga-c630.dts
> instead.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sdm850-yoga: Reshuffle IPA memory mappings
    https://git.kernel.org/qcom/c/4420a0dec794

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


