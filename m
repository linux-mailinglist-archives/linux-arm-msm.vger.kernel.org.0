Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B68D530345B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732452AbhAZFXq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:36954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731082AbhAYSu1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 13:50:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 935A7230FA;
        Mon, 25 Jan 2021 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611600610;
        bh=1bmb0YS1GaX1im/WJd3QWIpewHIVbMg3bvNujwnJHx4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a8rp/Iu/4WSyTFXOT8jzJA+KvaYkjyYjzqkeUUpsyAhRJY3692GlnYkwG4cQnCH3f
         tLBvn8AMEZxQkVWpwVwcl5BbXPNQuszwrg5u14sF3rgnzJEc9sZ4Q0VuZX9ERoF4S1
         ZSj08Gof6UrqfkN9hkSPQu7nrtbEiB24siAuwQKdjhAQXSNEvdEuGjvXQCgPZlP2RQ
         eR3kdDxVW54DBdkLXJZ5jurzPUH0eVrk9aH8VVNMKX7yKsiHaL00AwLFdgTa9IDUn/
         E5w1vawHHnBH2u5mz5LHgwhoDCWAcdmxLrSt5GdbPLkOr5J3tHUzvlkE6i9s+rxG5n
         yGkoOyNw9m07Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8927F61F2E;
        Mon, 25 Jan 2021 18:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161160061055.4014.17970521784154699335.git-patchwork-notify@kernel.org>
Date:   Mon, 25 Jan 2021 18:50:10 +0000
References: <20210118161943.105733-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210118161943.105733-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 17:19:41 +0100 you wrote:
> MSM8994 uses similar to MSM8996, legacy-style voltage
> control, but does not include a VDD_SC_CX line.
> 
> This setup is also correct for MSM8992.
> 
> Do note that there exist some boards that use a tertiary PMIC
> (most likely pm8004), where SMPB on VDDGFX becomes SMPC. I
> cannot test this configuration though.
> 
> [...]

Here is the summary with links:
  - [1/2] drivers: soc: qcom: rpmpd: Add msm8994 RPM Power Domains
    https://git.kernel.org/qcom/c/43eb76a2e56b
  - [2/2] arm64: dts: qcom: msm8992/4: Add RPM Power Domains
    https://git.kernel.org/qcom/c/0f7273c3daff

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


