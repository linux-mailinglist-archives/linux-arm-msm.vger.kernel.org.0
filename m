Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA3C329281
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239882AbhCAUqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239812AbhCAUn7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1589864EBE;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=geOxr52a+RRXIBA0MqkH/4GNrPXq0VopPZ4iGc5UKOQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EZOdY0eCx06g4xPdzVqxI6990jkm+AOULeRFx6ltJt8aVJcB7eLCyNdaT3/+E+4vK
         mZKf5yb79WyisXsEDlUCa7MKiWcBgajfgVP5fW/AElFBAic8XBlGCnq9eUpzScOAB+
         uSFVZny4r4OOGH5uVamfO1U2rHVNxgIONPK1k/DbwqAF1fqhrHub0LDBYZZLT90dJv
         aypo2GORK1pk4jzEWgQIElGeAhhB5MtpYCaDFadniquMeJgXwMIiYK1kRYj6iBndTg
         x5PLQu3SNetinlcw2Wznwyd0J6+opJCehCcHDvZqdJOaCRlN6/0NywxFHeKxjaxWZm
         XA/HTFAio9DDA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1225260A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] Platform driver update to support playback recover
 after resume
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878307.6187.8991698056133795742.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 17 Dec 2020 13:38:32 +0530 you wrote:
> This patch set is to add support for playback recover after hard suspend and resume.
> It includes:
> 1. Reverting part of previous commit, which is for handling registers invalid state
> after hard suspend.
> 2. Adding pm ops in component driver and do regcache sync.
> Changes Since v1 and v2:
>   -- Subject lines changed
> Changes Since v3:
>   -- Patch is splitted into 2 patches
> Changes Since v4:
>   -- Subject lines changed
> Changes Since v5:
>   -- Removed redundant initialization of map variable in lpass-platform.c
> 
> [...]

Here is the summary with links:
  - [v6,1/2] ASoC: qcom: Fix incorrect volatile registers
    https://git.kernel.org/qcom/c/315fbe4cef98
  - [v6,2/2] ASoC: qcom: Add support for playback recover after resume
    https://git.kernel.org/qcom/c/8d1bfc04c974

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


