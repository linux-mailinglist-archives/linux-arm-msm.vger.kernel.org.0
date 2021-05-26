Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F811392022
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbhEZTFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235778AbhEZTFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C240A613CC;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=ndhLNacHzGeFR+WfVlC7+O/G0u+CKiMx9b3EayooCxk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P3A1XhOJpXnP2SPocwbQVrf9DQ38Hg0ft+dttWoP9XAm5fgLAiv/ygmHrhC0SsMzI
         lrxZ/mT+h2ePyyIqgk2oaKaLaJfs9oMJfSO/db2eWZ4lemUeZ84HIlnUjrwn5qT1Le
         yPtxIAstv8jrg0DjZM2rgK9ff0Gx5hvMGR/NANDSelXPcdhGwfKnaBTU+arhflPGM3
         6DB17oQQHbqkhAGUJO49Z+6Ssgr7AWUSRSdLy+jGc5Rr4ughoo0W93jSjgf6WtBtfo
         khBt3UPjr9nr74zxRaNk+1DOHjLFM5yXGNUpN6QlyoIPlx1vXo6QXQK1IesSp79poH
         oIVgZnz0hkwmg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B480A60CE1;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dpu: Delete bonkers code
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580573.26840.2433300980878490152.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210430171744.1721408-1-robdclark@gmail.com>
In-Reply-To: <20210430171744.1721408-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 30 Apr 2021 10:17:39 -0700 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> dpu_crtc_atomic_flush() was directly poking it's attached planes in a
> code path that ended up in dpu_plane_atomic_update(), even if the plane
> was not involved in the current atomic update.  While a bit dubious,
> this worked before because plane->state would always point to something
> valid.  But now using drm_atomic_get_new_plane_state() we could get a
> NULL state pointer instead, leading to:
> 
> [...]

Here is the summary with links:
  - drm/msm/dpu: Delete bonkers code
    https://git.kernel.org/qcom/c/a712b307cfde

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


