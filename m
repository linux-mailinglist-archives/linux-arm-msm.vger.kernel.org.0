Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F544391FF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235793AbhEZTFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235374AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3EAE261413;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=cqjalPGuQRevnhJ9GVm/Yd1ZBhSopo5y2jwhwbVL+tM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PVYfx6PLXZPRSR8RW1b1ehKMOM+5PRhAHv0z3T3SUlSd93XKnCcDqDWLMoc3fyaaS
         BpQsVHQUcl9dv8tACl3RJ8yffh5RRtgebpr1n/5+OZ2rqQ08reg9ygfYQONWx++bnL
         2FJ07AFRQd0/p1NDzjjIw5xi7or1qfeJqaK2NjpxNqwcZLypZAcDqHVc1zNajBGq4m
         qg4FlUwuVXf6hBDLl7UWBLzVDQZWQk1sR/HU23244Le8cRHewOlWcG1QOS5fjQEi5V
         6ylpLoXy9KZPxtC06arbCnQ5+prY3Y5W7EkP1Zc1lwmWHTvZlQu8GwuOpT1yc2hIUi
         cznrRkeLn5ZAQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 39679609B2;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: drm-msm-next for 5.13
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580423.26840.4908518072103353074.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <CAF6AEGvL=4aw15qoY8fbKG9FCgnx8Y-dCtf7xiFwTQSHopwSQg@mail.gmail.com>
In-Reply-To: <CAF6AEGvL=4aw15qoY8fbKG9FCgnx8Y-dCtf7xiFwTQSHopwSQg@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 11 Apr 2021 17:53:32 -0700 you wrote:
> Hi Dave&Daniel,
> 
> This time around a bit larger than usual, but a large part of that is
> Dmitry's dsi phy/pll refactor (which is itself a pretty large negative
> diffstat).  The dsi phy/pll refactor includes a couple clk patches a-b
> the maintainer.  (For folks actually trying to boot msm-next, there is
> one clk fix required, which should hopefully land in 5.12 but not in
> msm-next.. https://patchwork.freedesktop.org/patch/427412/)
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: drm-msm-next for 5.13
    https://git.kernel.org/qcom/c/af8352f1ff54

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


