Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F4592E8FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbhADEkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbhADEkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C74CE21D79;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609735206;
        bh=hcEgeijTgzpS5Q667V/cAF6GtgCcERZEu9kvB/PMu/E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dMCRTV4bLO9WKtHe+9v25JWDdYMhaWwNlsad3lMQIhzXDOl1Rr4cZE5glHMBAMANZ
         CIsTWZ7xXf7N0mPOfcT4i4d7f/kTazXQjcf0piwjOaK6y0btyA6KJ1+SW2P7N2z6XE
         vyy7b8Bbk63UQud9put0S/7k7ZZbZR83k/bY+aNc3VDJdtxMYguzg/jmJQF3Iuwyc7
         MUDln2pDgoAFOnCTpSP6665V+Xdl4AEdFyfTAmOiMQCKwuTOkLLRyEx+sn9EK2WSL6
         5pxmaE43Ayy+lHG4K1QqrD29wblpXMNNu/LgCwXiKwjMg4KS33ZSXh3IrIjnRyQ8m1
         7U57OYtaqm/UQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B9B37604FC;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] soc: qcom: smem: use %*ph to print small buffer
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160973520675.9031.3064017828869812877.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Jan 2021 04:40:06 +0000
References: <20200730153220.39466-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200730153220.39466-1-andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 30 Jul 2020 18:32:20 +0300 you wrote:
> Use %*ph format to print small buffer as hex string.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/soc/qcom/smem.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Here is the summary with links:
  - [v1] soc: qcom: smem: use %*ph to print small buffer
    https://git.kernel.org/qcom/c/1b3df368914b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


