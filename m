Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E36D329291
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243294AbhCAUrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243527AbhCAUp3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 34C2464EC4;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=G+tvxWyL85OIL6t+TTfCJIkPP2WNgy0KMheFTEpf3J8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EWLzkzP2F+pjNBena4HJe0f9gXsmspoo/mgXauYbn3bxqv99FmCopFbaLyFrGfhPV
         PyDeCNQJwGSWOVG7cPiboj9dWTCR1mn0IQ1XxZdejw5YjR1YzBnTiqr75WYw/wkugk
         RdGMlqqc/uAJhw0xjkaQ2IMqx9S0UGXVv5iGWOWy1nidom0RDXS9T+I+zhW0ekt/Es
         eSf3cbEyfcLP0a2E2+2MVXEaYOBcx2HbyCY06Ha90aeWjZ+fgOJXMMQMBbBpDBFSzS
         5yY9Hky86UwUwONhlrFcc40x/IlUfb8tZfTpaDGvY6VXxAr/ldA3ZphGX5eyN2HOwa
         3FmhraYg2+rVA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3155B60A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878319.6187.4582269044153127312.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 22 Jan 2021 02:33:00 +0300 you wrote:
> These three patches provide fixes for HPD handling and EDID readout for
> Lontium lt9611uxc DSI-to-HDMI bridge driver.
> 
> Changes since v3:
>  - Protect hdmi_connected using ocm_mutex
>  - Remove !! conversion from int to boolean
>  - Add missing Reviewed-by tags.
> 
> [...]

Here is the summary with links:
  - [v4,1/3] drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
    https://git.kernel.org/qcom/c/053b1b287ccf
  - [v4,2/3] drm/bridge/lontium-lt9611uxc: fix get_edid return code
    https://git.kernel.org/qcom/c/1bb7ab402da4
  - [v4,3/3] drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler
    https://git.kernel.org/qcom/c/bc6fa8676ebb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


