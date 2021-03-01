Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF832929C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbhCAUst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:48:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:54488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243412AbhCAUpl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5AD9D64ED6;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=GNIkWZVe6nwGuj9cAYlnC758tyqrasL7S4YmHgAOCVs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AnupsptSvDMrY6xvYKvMMxGqnltfmw2BPX5NIH8hj2V/N6wR4IkDY/nL7KHhonIhn
         7Ykvxenl0QZFgffhGpgGVATZ/lcdJ1KWTicIQjTa0C5EtynjKaVackO4eO7ROvHblU
         8nTBR5HgBOYPIQvbF72LT1Jvy6rUCwAVIE7ag9B3Nz50YuekJlJJHS9Lvj73JgJZwF
         R6rJs4kdaMUrsJRrFAnaVPdvSDDjNzuQ33jsC8dKDkGBYATFfq7xtE5i9SKIaCO0SO
         avzQ2thT8slXtyIZwLoU4fgjW1RH0gdAp/XTFYOB/1nEtff4+ZLet/rKZyy1BTNh+9
         T80Ede70QpkhA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 571B660C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] rpmsg: glink: add a header file
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878335.6187.8909459146550789179.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210105235528.32538-1-elder@linaro.org>
In-Reply-To: <20210105235528.32538-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 17:55:28 -0600 you wrote:
> With an x86_64 architecture W=1 build, qcom_glink_ssr_notify() is
> reported as having no previous prototype.  The prototype is found in
> "qcom_glink.h", so we just need "qcom_glink_ssr.c" to include that
> file.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> 
> [...]

Here is the summary with links:
  - rpmsg: glink: add a header file
    https://git.kernel.org/qcom/c/3e35772bc1e4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


