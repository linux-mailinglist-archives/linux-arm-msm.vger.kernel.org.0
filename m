Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65EBC430049
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 06:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240675AbhJPEmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 00:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240873AbhJPEmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 00:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4E88B61222;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634359209;
        bh=nZyzca8s1KX+o5n1l+oZ3DWxmvSQVqr8YABsGn4PTbA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Dvgg+JcIRp4r+GqyLM/oFeK4QcdgpTPemXipo9Rlg52M1L1zlvVAN2oi9N3csx5xi
         hFlirhdNhVws1JOHYEVTKj71thZvSJ9GIMDiSV/tyNv3JboMU8a5cNsRBHvQjxpS2V
         bVj8RCMK2dvfPx6cLAZxDvEKRca7PL/D1Gpa7bF9Ca+aaCKE/Q8ORZaCAS5Yomsv/8
         LJuW1ceL/jOJ6B8p46l+62MyET44QnsJKQmVGOj6H11xnLgYee45Ch0bUFhor9NWOZ
         0k1dOMMzu/69BU7YG7ZsnYF4d/4yNz/2+OJxQph4rLmCQ+jHcRA7yZPwfiU4NkCNwk
         37dtGbNwh0ytQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3175460AA3;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] soc: qcom: rpmhpd: Make power_on actually enable the
 domain
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163435920919.10607.13376421537109409443.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Oct 2021 04:40:09 +0000
References: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Mon,  4 Oct 2021 20:37:32 -0700 you wrote:
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performance state
> is needed further requests has to be made.
> 
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
> 
> [...]

Here is the summary with links:
  - [v3] soc: qcom: rpmhpd: Make power_on actually enable the domain
    https://git.kernel.org/qcom/c/e3e56c050ab6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


