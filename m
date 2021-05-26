Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F5F39201D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235766AbhEZTFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235769AbhEZTE7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D77761402;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=rrOptbL3xPNgx4OJChTytE8+jMsou1789etC89GRNuE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=okSi2HiSGGmLc0EIQf2ph5HubC+v4ap4oVXOCpjmKjn9bUV6865mwY8oIbpcUu2+N
         3L5HdJcZaCeqvnVGNrQ7XFV+Lzxj3v0ja/SbELgMLz9XLgqgpO8lM4xRmAxX8uKiIk
         BP+vcnQPdLi5YYT4Oyw+DvgmFUVTeEvGCLMpUgn5ESYBW9Vd96izaNxUoa/ODgJVkd
         elq2jJ3I/KyrcmmuaZOvbvkP4gMBirkSriFooFw8XtTqObnrqooxaBGmsF2kbKsrVO
         BjcztyY6q7/Gx2ZPZjTmIZJ/GMHAJTi7tv76QNncU9xE8gPWnKtq/izYsHkPK+N43x
         YyHiVgrew5chw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8946B609B2;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: rcg2: Rectify clk_gfx3d rate rounding without mux
 division
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580555.26840.3940630273504143661.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210302234106.3418665-1-marijn.suijten@somainline.org>
In-Reply-To: <20210302234106.3418665-1-marijn.suijten@somainline.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Mar 2021 00:41:06 +0100 you wrote:
> In case the mux is not divided parent_req was mistakenly not assigned to
> leading __clk_determine_rate to determine the best frequency setting for
> a requested rate of 0, resulting in the msm8996 platform not booting.
> Rectify this by refactoring the logic to unconditionally assign to
> parent_req.rate with the clock rate the caller is expecting.
> 
> Fixes: 7cbb78a99db6 ("clk: qcom: rcg2: Stop hardcoding gfx3d pingpong parent numbers")
> Reported-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Tested-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> [...]

Here is the summary with links:
  - clk: qcom: rcg2: Rectify clk_gfx3d rate rounding without mux division
    https://git.kernel.org/qcom/c/0ae67123eafd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


