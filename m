Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91AE2E73B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgL2USK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CB5A22CF6;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=u4HSvvh4ghQK4/tMYnIWKWxtNQG2jmefdBRbaByq97Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hi8ZB9IXa6hUXcYYe3JVGFxiTzS6vMwf2JCAPhPc1HlCjcWrgS5gDwmlK2hKY968R
         fIDkYBcJz4DnX4Ej7l1dGLkONu+GcbVlDkYfsgUpa43/VhqM+acOsn50x9GWparpFX
         d8A10c/H7rGlO/X2nYX7HR6SUjNjnb7SDkzKLleE6EkwyyBbvfJTy7f2wKiVC0p7zk
         O/aLgNAqqnO1rUWFeHXIEhedGJhp8Gz7zf1wUajmm8QXxPewy1627qpe+pvg+RLs9V
         E2qPWpjk+8bOFYdRcKBYhN0YlfT7b2UVw/tzqMQktyNTtO5tV8AieHceha9rebuVxG
         uwmnEMlCBAakQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4726460626;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/atomic: Drop per-CRTC locks in reverse order
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293428.13751.7139194623617110289.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201020222600.264876-1-robdclark@gmail.com>
In-Reply-To: <20201020222600.264876-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 20 Oct 2020 15:26:00 -0700 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> lockdep dislikes seeing locks unwound in a non-nested fashion.
> 
> Fixes: 37c2016e3608 ("drm/msm: Fix race condition in msm driver with async layer updates")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/atomic: Drop per-CRTC locks in reverse order
    https://git.kernel.org/qcom/c/cb21f3f882ad

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


