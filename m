Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E77839206C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235668AbhEZTFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235190AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 77E6461628;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=rih1tD7che41KWewV83nyyMZMI1B546wGQef9HliyG4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y8WODrmc9OCfjdliA/ZRzTvpZbo1WtGc8cqxs3HtHx4lVm1feZUs1FstTLWP3fpIS
         RKizfE/0udfKs/JNRlH3rSKRmjMW4qugfzZw+hQBdRChi3UMvHb2gMeaDjQpNhnCwQ
         ErE/yNU8t9WgIOabblByYTuK0SFDMPZV3xtpBZpPS2WRjXeHniugbfqYZY1vU1BDoo
         AvHkYfdkHUgOGNg1JAELGNqmhIrlGRspq3RrMxIIBN1NKaj3hqPbBRLDiPks3ukEt+
         LXKbtqUNf+nC/r9jbvlzeB853hVikNqcJSj0gFtDzTVqLUaIBYKAqeBKezytWeaAqQ
         8pnUFgX/gVJlQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6FAEF60CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-04-02 for v5.12-rc6
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580845.26840.7051424078953795785.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <CAF6AEGsMj7Nv3vVaVWMxPy8Y=Z_SnZmVKhKgKDxDYTr9rGN_+w@mail.gmail.com>
In-Reply-To: <CAF6AEGsMj7Nv3vVaVWMxPy8Y=Z_SnZmVKhKgKDxDYTr9rGN_+w@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 2 Apr 2021 09:28:42 -0700 you wrote:
> Hi Dave & Daniel,
> 
> A couple more small fixes for v5.12
> 
> The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:
> 
>   drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
> resume (2021-03-22 18:52:34 -0700)
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: drm-msm-fixes-2021-04-02 for v5.12-rc6
    https://git.kernel.org/qcom/c/2e99cd7a313a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


