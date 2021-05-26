Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DB939201F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbhEZTFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235772AbhEZTFB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A748B6144D;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=pg3OrqO7AsmnrXAw0uBzENC5iLXgEj0AQ0bqMHArFZU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TQvPsoRGSp2PuvNYBSQOrsdMZYgH7ngXkPefhkk+w17IaYmTA0ADSGn+zYlEBjAdG
         y9Kv2DpObQ+Uljkl+M72bjmz1dxlSq9ueAcXS1mKhIuSOSgvgvKqJ2c/1kh8PbYMZn
         UDXHSlQhL+DZHp62iAY4DcRK2ySu02yfu7vjS8+Sdw/bci6KekOeKJzUxcrUsP8xXl
         lyoYLKqBLdcrVHo3nm5wE9LJmUaUVEMVSUGVJpK7i0mYbmur/+5BqtvATXULkjMp7j
         b9uS38TKQceIvbpIV9GSQhRKbcdmbS57Eo9gpifiGldRblGggzrPGaTWg9BGNfifaa
         pWuuIE8BY5UHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A259D60C29;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] cpufreq: qcom-hw: Fix return value check in
 qcom_cpufreq_hw_cpu_init()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580566.26840.10936332327318175481.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210304100423.3856265-1-weiyongjun1@huawei.com>
In-Reply-To: <20210304100423.3856265-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 4 Mar 2021 10:04:23 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: 67fc209b527d ("cpufreq: qcom-hw: drop devm_xxx() calls from init/exit hooks")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] cpufreq: qcom-hw: Fix return value check in qcom_cpufreq_hw_cpu_init()
    https://git.kernel.org/qcom/c/536eb97abeba

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


