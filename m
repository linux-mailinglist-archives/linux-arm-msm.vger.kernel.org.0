Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37672E73C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgL2US0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726555AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4695322D57;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=oKHp9hEEeSzJiRX22h/NWxjMrk6CLSIMj+rBG5NgT4w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UH7wNsp7JoN0O/CIW1Sx7PYRCRnJ7vBnTTBHcBKLp5sucnvATvaw4Bqh+uNfy+JIs
         N+61W3zbDk/DyWcgFYNHuxC/2do4cbnlzz55CGbKwJwxUtXjVwcZPwo+9+idkPgRcg
         Sj9Q9cl9ZMd8U/r6nHP2zT6+ajK+WWaxWXTNeRVG4sodSAPqKdYKgNCbniqj2/pcE6
         8u2p43V1N5+UizcelOmh0ySPHbxtCXikVuoM8103DzckQUP24VdE4EL3GFN3qRfx44
         oZoDGEFU3mbWYHFho++zKpLJiz+tuNw0OdmOJTLIRDGpKnLB6n9eDTt5SODaCIao/l
         ttzMZFzB/9LiQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 42DCC604D7;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] i2c: qup: Fix error return code in
 qup_i2c_bam_schedule_desc()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293526.13751.11340343078869610108.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201116141058.2365043-1-chengzhihao1@huawei.com>
In-Reply-To: <20201116141058.2365043-1-chengzhihao1@huawei.com>
To:     Zhihao Cheng <chengzhihao1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Nov 2020 22:10:58 +0800 you wrote:
> Fix to return the error code from qup_i2c_change_state()
> instaed of 0 in qup_i2c_bam_schedule_desc().
> 
> Fixes: fbf9921f8b35d9b2 ("i2c: qup: Fix error handling")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> [...]

Here is the summary with links:
  - i2c: qup: Fix error return code in qup_i2c_bam_schedule_desc()
    https://git.kernel.org/qcom/c/e9acf0298c66

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


