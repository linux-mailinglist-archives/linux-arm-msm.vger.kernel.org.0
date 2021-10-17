Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14C3430A45
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238043AbhJQPmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:58556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233058AbhJQPmS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:42:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9EA5A60FDA;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634485208;
        bh=bGO94aVrXp0vXLo6Kdo1nJ0ODzyCjIb3F/8nrTh5Emk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bDk4avdyg4vdqe1vAjD9T2yXw5so39PYphZLXNn/aokY3S8eLi5u1VBSvjII20v7o
         f7k8x1VtfL/5ba8sTr27NCL2DmN/mF5eQ/FCOQvi0cGjMZI73R0BmRbJuUvWHusDpl
         iUwkhfGSd+pMgR6SizITaAwvk7wzoj8ukJeQo3ykrdKvOqb0SYTjPfrkqYYZcnSbOh
         A9oUHuZ5XD/HJXzNnefDdAgGK5cKy9aDWRW4ebqT4KH6NYo6A5cJyy9FBRJyHUuKUk
         fMg0DRj0PYOVPZBC2GfcGAk13fyz0MZNryotUmOAVuVrMVNIKtYqo4zFXPtQs9wye9
         iIB8SASencgHQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 910BA60A27;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/2] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163448520858.5048.698920068255052806.git-patchwork-notify@kernel.org>
Date:   Sun, 17 Oct 2021 15:40:08 +0000
References: <20211008113839.v3.1.Ibada67e75d2982157e64164f1d11715d46cdc42c@changeid>
In-Reply-To: <20211008113839.v3.1.Ibada67e75d2982157e64164f1d11715d46cdc42c@changeid>
To:     Philip Chen <philipchen@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Fri,  8 Oct 2021 11:39:34 -0700 you wrote:
> Factor out ti-sn65dsi86 edp bridge as a separate dts fragment.
> This helps us introduce the second source edp bridge later.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v3,1/2] arm64: dts: sc7180: Factor out ti-sn65dsi86 support
    https://git.kernel.org/qcom/c/4537977a50e6
  - [v3,2/2] arm64: dts: sc7180: Support Parade ps8640 edp bridge
    https://git.kernel.org/qcom/c/0faf297c4273

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


