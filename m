Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C330329273
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243551AbhCAUpw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:54430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243650AbhCAUnE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 898BE64E55;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=tSUWyveOekUxJsk6rLlw+aq0tw5enGILjJNCplEPYvI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YU7SY7Pci4QQMoFtKedjPXB0TfUTH4g8nhoYqOh4fHEBGrb8qKxdJpPdPWc6sWIlN
         YHbCxSbd8x7zUTAGTm9Yf08QZBoGbKIg+EOL0A6deAHEeAE3WD4tE/xsAV1PFhyof/
         GtC63flmZEnuo4bRtZ7BPFpwkTQeIlJEj2koFGPfSk/zQnscgD6lonTmARijJZDmU0
         iWtJCnmIQ5zCv49LCpzweLB82V43KY5C1MVRQmyOEFILkT7ecuROf55ZrvKM6Qn0sl
         Cq+dDLnIZGAtyrbfnxNe9+vi0aaj56ZGwtyExwqtsDyMwYFtPs+vX3t4SdWmIX149Z
         dqDBM2B0gYJvA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 862C160997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btqcomsmd: Fix a resource leak in error handling
 paths in the probe function
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878254.6187.945374265511311276.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212094658.83861-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 12 Dec 2020 10:46:58 +0100 you wrote:
> Some resource should be released in the error handling path of the probe
> function, as already done in the remove function.
> 
> The remove function was fixed in commit 5052de8deff5 ("soc: qcom: smd:
> Transition client drivers from smd to rpmsg")
> 
> Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - Bluetooth: btqcomsmd: Fix a resource leak in error handling paths in the probe function
    https://git.kernel.org/qcom/c/9a39a927be01

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


