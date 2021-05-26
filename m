Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF39392020
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbhEZTFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235773AbhEZTFB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B1A506145D;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=TREwvhSujDJc9TzJn3bgTMprIukSWjBbvi7dVLCdIpE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rArNGIaZXXyYykH0bqYHvsYXkFr7Cj8lmGlJsGrw6CdVqtzbXLU0KwExVuxURc5ub
         HOpA+4fpEgZELJXAvM56Cypi/z4HYaoItR2kRtd2HFjKyiJGOO77kNZ4NXPWlfNkaM
         IUOUWFViYLs6j4+HWaP5P+ep6iETPYIQ+TWOr7aipoemQmjxGd+iR4VOsy9kyWOmll
         ntCQw8OxSxQ6sBx+29osjZKn9eZlEdGakcmBMFETKSGj82Rgc4hUjrgueeaxePRXU9
         MH2PoRAYegUlzWuSajlsGOCejcjpTxefH8WorVbozA89McKS+eqSF460GG96pPGMzq
         izGdPebaPFr8Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AB897609B2;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mhi: Rename debugfs directory name
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580569.26840.1031679786188830363.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1613403753-1457-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1613403753-1457-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 15 Feb 2021 16:42:33 +0100 you wrote:
> Use MHI controller device name instead of the 'bus' device name as
> debugfs dir name (e.g. /sys/kernel/debug/mhi0). That aligns with
> sysfs device name.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - mhi: Rename debugfs directory name
    https://git.kernel.org/qcom/c/e5b53b5be677

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


