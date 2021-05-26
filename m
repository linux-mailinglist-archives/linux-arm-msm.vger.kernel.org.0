Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8FB392013
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbhEZTFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235756AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3ED926144B;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=i236h5dEgOJP+hf3sUHcyy1N0wkCuh/n2sMsNoix4Jo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d8OCRgHze+TFkpxPZNPkXfJW49vdOWLs1H5NfP22r7FwS/E8zH9xk04eYqACtsd0z
         X6pi71kWXNHlLfbudUY4v7NuT42PbOWjhuStX3aQi22OjdvPC4oM4GLNySb/I2s1m7
         kKIUo3HKmLwhZrnPLFNR/5sKr9GIcdz3xArTAqH7M5IPEXeA9EMjnWFde5XGDTHOaz
         5NJZH9HvkwtUu49X4E/EAzLXamFfMBsGPmqR9i1mU3xsoZarmLZSPrSOd2RnY3K17J
         FYUUDGtYadKQ5qyZjev984y1YAUsY7sBask4p88rp/1fpGL/2omLXTJGJ27D8ICVzA
         4J0jM6LEXw8eg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3A1A2609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/1] i2c: drivers: Use generic definitions for bus
 frequencies (part 2)
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580523.26840.8983397952617714168.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210331104622.84657-1-andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 13:46:22 +0300 you wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
> v2: added tag (Khalil), converted one missed place in DesignWare driver
>  drivers/i2c/busses/i2c-designware-master.c |  2 +-
>  drivers/i2c/busses/i2c-mlxbf.c             | 14 ++++----------
>  drivers/i2c/busses/i2c-qcom-cci.c          |  4 ++--
>  3 files changed, 7 insertions(+), 13 deletions(-)

Here is the summary with links:
  - [v2,1/1] i2c: drivers: Use generic definitions for bus frequencies (part 2)
    https://git.kernel.org/qcom/c/fd6ddaa0f50a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


