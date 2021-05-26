Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB60439205A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbhEZTFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235831AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CD6056161C;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=IuaOMzHwa84K2YzszBA+RK95dVQivK59QyvDSHZgWbQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DTqxsVxtxjkuD4FrsfEsbEq7i/kkY8ZqMp+9JjXNOIMuauDWMq+WBJtxivktk8MoN
         h/Lb61Y9Vb+RFjJEg5WrZzkut9Sbb178/FWIUrmSv6nYbhRWg5q7zL5e8dKevjzQZ0
         INup1tsyk5HrGxaF7uOhZ7hdEG7KFne5cLGby3aTXkYgVlPlgbu8LV2UJXKsDuiEU+
         xOCvEEjD4YjZ4aYA9Ldnh59LStTOxiiByJE7aqEg+G7vlCZqT4vgVxXltglVQ4LLGM
         OzVGgns8ouVueQFEq9LwWM5kfJlXi+CfSeiFC4g+Q6o9yf/Q9zm2jiW0/ghJlP8JLs
         9bj8/s/av4l9A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C9571609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580782.26840.15470669719800905983.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210224230528.1216677-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Feb 2021 02:05:28 +0300 you wrote:
> The PLL_LOCKDET_RATE_1 was being programmed with a hardcoded value
> directly, but the same value was also being specified in the
> dsi_pll_regs struct pll_lockdet_rate variable: let's use it!
> 
> Based on 362cadf34b9f ("drm/msm/dsi_pll_10nm: Fix variable usage for
> pll_lockdet_rate")
> 
> [...]

Here is the summary with links:
  - drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
    https://git.kernel.org/qcom/c/9daaf3130785

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


