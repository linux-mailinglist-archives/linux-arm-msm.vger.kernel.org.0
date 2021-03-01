Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F1563292C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243786AbhCAUwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:55336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236684AbhCAUst (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 56B7564EF4;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=Wt1MQFg13fEz38MCgUBS5ff2SfXS94L5szzNM23zktQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vJm7nyHDS4TfIa0arQsMsZdI/07D0OXW9Y/eWvW/qRjlIEjlLyjyyDFZLUWuIqRMd
         h/zh/nQOx1gAJIMvsEAXgci0/AMvt0f3Yzk3TJR0b1+pU+iCrR++1+lhX5IRvroP5b
         8KUIKsubFpy/VXasBWgc8UVijF+KU+Y4eesYeQ/b86ftoAfkFrqG5KaeW8rgtgTVl1
         BsPU7ZvPQBSepPk/RvzNNv5lm7lsvJwrazlbXQYTdwQCcbc+QxfHIGLt+n7sJFCuHH
         ZivmEAB6bsPDeck/SKgUBF1CLEjZ9kMbY4ug2fK/zj2auDKmpsDCHNG5eGWnin7ZXT
         j2Pl2tGJoiRtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5353E60997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] venus: pm_helpers: Control core power domain manually
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878433.6187.11736808287233776122.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210113095716.15802-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210113095716.15802-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 13 Jan 2021 11:57:16 +0200 you wrote:
> Presently we use device_link to control core power domain. But this
> leads to issues because the genpd doesn't guarantee synchronous on/off
> for supplier devices. Switch to manually control by pmruntime calls.
> 
> Tested-by: Fritz Koenig <frkoenig@chromium.org>
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] venus: pm_helpers: Control core power domain manually
    https://git.kernel.org/qcom/c/a76f43a49054

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


