Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CF2329248
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243579AbhCAUmo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:53312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243735AbhCAUjZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:39:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B797E64DF1;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=63AJcxqpFC1d2/S+L+ESMRN33qY+D+NCGGZ/nz6Rl8g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MNeD6FEpix5BL4aqTQkH2jAmN24u/Hkunz296xxNVANPNnd4PAijjNu+q9Tczeamq
         qSWsp273aVTr5vRBJuyvaWGzCyMk6PcbqWOq10QHE7pXRFr72OW3d7LeEPmTInNi1/
         Mag9w7tE9gnsVIuW2SPWYKLLgiI9EbdOBGQJBJ9Yc2aZF/bmQLZLrwM5Ht7S4Dvokl
         cn14U/mCxo7vALfE34qQXcJVT7c7CLh2oRkAwIT5tf4mf/i+HxlCnid/2AVZWFg4k+
         wefEKEz8ZJD8ZjOicMXr4pCzXsAUPjdH3krUxpxvGMyLHyM3U31NY9LciU8Zyx9SMf
         8DhcU+j7OE/Tg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A9E5E60C26;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] cpufreq: Remove CPUFREQ_STICKY flag
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878169.6187.18423897637050989539.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org>
In-Reply-To: <a59bb322b22c247d570b70a8e94067804287623b.1612241683.git.viresh.kumar@linaro.org>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Feb 2021 10:25:11 +0530 you wrote:
> During cpufreq driver's registration, if the ->init() callback for all
> the CPUs fail then there is not much point in keeping the driver around
> as it will only account for more of unnecessary noise, for example
> cpufreq core will try to suspend/resume the driver which never got
> registered properly.
> 
> The removal of such a driver is avoided if the driver carries the
> CPUFREQ_STICKY flag. This was added way back [1] in 2004 and perhaps no
> one should ever need it now. A lot of drivers do set this flag, probably
> because they just copied it from other drivers.
> 
> [...]

Here is the summary with links:
  - [V2] cpufreq: Remove CPUFREQ_STICKY flag
    https://git.kernel.org/qcom/c/5ae4a4b45d43

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


