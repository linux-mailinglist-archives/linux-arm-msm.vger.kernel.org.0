Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEDF9392005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbhEZTFQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235709AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CD687613D4;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=DviBs54OK7qaPaSTYeMDrpIi2SJ87W5HbC3K0vcuLLk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=A/wqc2u+EusKIx6ZpGVYBHQWHdWbq0IPUazQzJAew//XuLTnBAnzU0xmhH+gNI/xj
         +1iCPl2Wnxln6QSeAvk8x1hlN9Ar0eIMu2TiFnP7//NHdLNk3okTGR41iW+CM12Zi9
         DtpWuCvkvD2GJ1HErbv/wd3lfYKY696/vQMdoyePPMirqW9jqeulnkACLXKMBYQoUW
         ka6lhlvgWlDp/3D3NbvrmzOfqV3rUfbN6u4wDB9REu5FXuj7w06Xba9/4WC7PjMLdL
         jPGVA+VH/KHiFG+RBbP2AcKXMevRgmclc44vL9hN40KWdnmvC5SUX52k5vz8RULcyE
         VKvRDmldHceZQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C777F609ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/4] drm/msm: Remove unused freed llist node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580481.26840.1557609419893546235.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210401012722.527712-2-robdclark@gmail.com>
In-Reply-To: <20210401012722.527712-2-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 18:27:18 -0700 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Unused since commit c951a9b284b9 ("drm/msm: Remove msm_gem_free_work")
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] drm/msm: Remove unused freed llist node
    https://git.kernel.org/qcom/c/bc90dc33c46c
  - [v2,2/4] drm/msm: Avoid mutex in shrinker_count()
    https://git.kernel.org/qcom/c/cc8a4d5a1bd8
  - [v2,3/4] drm/msm: Fix debugfs deadlock
    https://git.kernel.org/qcom/c/6ed0897cd800
  - [v2,4/4] drm/msm: Improved debugfs gem stats
    https://git.kernel.org/qcom/c/528107c8e664

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


