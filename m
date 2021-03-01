Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D03292A6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243529AbhCAUt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:55302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241779AbhCAUqe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7834B64EDE;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=IU2X/T4Znt8tWk/mZzMFsQ9IiJY/97Hlig6ye5PZ/00=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=t2OUmOdjTlkZjdWs3YWcFEa1fvwJFrOK5EonyUiY7xREKodM3ZfynaCB4LlgQd/9d
         oRIpRZOFWEv6JrxIaqOqmx9AITJh4jMt0MvaVHLX1r3rv9f+3S4oFqj8XsPqGN0zsA
         xug0fBd/iepR6PgXPbkd+NzqIiA34EJWdi2XkSpoYD/fRnq23QD9OHB6DDG4D2ca+d
         5VBjcGaZG9Q8ne/y6hkJLEJ8jeOrw6MeQbM2c90EQB11aC1I5ll2LpNGxo+OGtPqcX
         Xr2Kj5q1Hv1E3jSBrnQ4thimyW6TWdHfVnmC5KqFPkgcnEFwF047nHjm8IZo3sTN+Y
         HI/zSx+3UnvYQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 74E1D60997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v14 0/2] thermal: qcom: add support for adc-tm5 PMIC thermal
 monitor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878347.6187.8477583760563789077.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210205000118.493610-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210205000118.493610-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Feb 2021 03:01:16 +0300 you wrote:
> This patch serie adds support for thermal monitoring block on Qualcomm's
> PMIC5 chips. PM8150{,b,l}, qrb5165-rb5 board and sm8250-mtp board device
> trees are extended to support thermal zones provided by this thermal
> monitoring block.  Unlike the rest of PMIC thermal senses, these thermal
> zones describe particular thermistors, which differ between from board
> to board.
> 
> [...]

Here is the summary with links:
  - [v14,1/2] dt-bindings: thermal: qcom: add adc-thermal monitor bindings
    https://git.kernel.org/qcom/c/e8ffd6c0756b
  - [v14,2/2] thermal: qcom: add support for adc-tm5 PMIC thermal monitor
    https://git.kernel.org/qcom/c/ca66dca5eda6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


