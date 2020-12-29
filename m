Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13492E7359
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgL2UQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbgL2UQK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8022622225;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=h7XmFvt7I71ZYq097Vfu3oo5qTjw9RAlmVFEi22xrUs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Zv1rgFwgrzpCWtEG5WvMKe4qXZV1Tf9MAhH4FdvuHhK04dW1qjsmkZ12Ob1uZ+4KY
         sjPJM8p6JU3j0XXdPfi3aaCSEL/V6XtnMYL0BCEMXkifaMWtBwUMdMqmFPEwb7RbcL
         F5WB/RWsyow7HkIZ95zQnTzx3N4uQOZ2XJQKE6T/Oc/Z1PLLpOQcmNnBJC8VoAncMn
         pwbTki/gICjRsh3KHmMNj/uPyrwZAjrdIQ5umaFTeu0zM61fjzycc8TkB25TrZGfwq
         BNLiKmtJpHIj72sOpi+pIZoZUwlBujDm5M71ZfhUIChLdzHNa1Q1bMINvGbmTKwawP
         qu0WjnF8ikSKw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7848C60642;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] drm/msm/dpu: implement merge3D support for new platforms
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293048.13751.17823161934202737063.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 22 Oct 2020 16:16:53 +0300 you wrote:
> Compared to SDM8450 DPU devices with active CTL support (SC7180, SM8x50)
> have merge support implemented in a separate hardware block, which is
> not supported at this point. Add support for dualpipe configuration on
> these platforms. Tested on Qualcomm RB5 (SM8250) platform.

Here is the summary with links:
  - [1/5] drm/msm/dpu: simplify interface flush handling
    https://git.kernel.org/qcom/c/d8199c85f3e4
  - [2/5] drm/msm/dpu: initial support for merge3D hardware block
    https://git.kernel.org/qcom/c/4369c93cf36b
  - [3/5] drm/msm/dpu: handle merge_3d configuration in hw_ctl block
    https://git.kernel.org/qcom/c/c40e6c6733a0
  - [4/5] drm/msm/dpu: setup merge modes in merge_3d block
    https://git.kernel.org/qcom/c/9ffd0e856993
  - [5/5] drm/msm/dpu: enable merge_3d support on sm8150/sm8250
    https://git.kernel.org/qcom/c/3e79527a33a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


