Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D852446515B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 16:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350713AbhLAPXd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 10:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244050AbhLAPXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 10:23:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90133C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 07:20:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5693DB8200F
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 15:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14A23C53FCF;
        Wed,  1 Dec 2021 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638372010;
        bh=ra1VlSepCqLKcFrNBTMTLKO6nZx0IyLI1cl94JorC84=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZZ406Q5ff/z4SkDBztuHKuXIITLAwzsGPKmewZTdkriWVWJz/MLX9kQQWomJxn/fq
         phF+xK56IWw25vn80tb22AQRt2fFL5uforQL0JyoF0glowG2gwsD4cjaMwcnu5IVMy
         y97zOY8/iS174gpbyQs3UnpATBJQgGGV0SV+mwkyCmSqlJJCI2YLu0BHvPHeMguTME
         C7jxEExCjFBJSaLg0OG9GRLRO7Kn2owlWCDhr61OmJPWT9QFi9Q5pnSQuqDxM0XNFe
         ygUJaLFfnt4O/Ki5a/YjOXPiH+5VxNrZWp6jeS13FkvRz0dzex1JuHWUW9ynq9Vl+q
         b/e5PX2aphGMQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 01F8D60A88;
        Wed,  1 Dec 2021 15:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: fix MMC controller aliases
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163837201000.24619.11186014497079344264.git-patchwork-notify@kernel.org>
Date:   Wed, 01 Dec 2021 15:20:10 +0000
References: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211201020559.1611890-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed,  1 Dec 2021 05:05:59 +0300 you wrote:
> Change sdhcN aliases to mmcN to make them actually work. Currently the
> board uses non-standard aliases sdhcN, which do not work, resulting in
> mmc0 and mmc1 hosts randomly changing indices between boots.
> 
> Fixes: c4da5a561627 ("arm64: dts: qcom: Add msm8916 sdhci configuration nodes")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916: fix MMC controller aliases
    https://git.kernel.org/qcom/c/b0293c19d42f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


