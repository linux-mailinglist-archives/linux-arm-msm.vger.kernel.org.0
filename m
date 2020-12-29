Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 996F82E73C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgL2USY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726530AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A423F22D02;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=YxyAuxtFLuGJ0qzxu6VAgky2/RgtlYkasd4FfmZo/DY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Al/XNMCkwIZQZR4C3MCYKSP5fOc89pqVhJ2IzjlKbzZv6mjL4/9slwdYYcowtCD7s
         gMMucnfOGE1vI8xdPA4No77ewFLE+BNxh1qvs5UPNP5DSoHnuslVOMxxIX2CvFnlNq
         koE5kLeJiPIYRjfXq41Lk48ElHL3QKIm3bpmHaqhE/oq4rUX29Pb91M3IJGTBwbgQ8
         u6ffIaaXfZ/j+VxykT1F2Af9p284K8QFiP3u51ulvOnIvx97nsmaSDw6NW+W58I+9Z
         A5HdrMT1IzhX5c/yHhL7EtOw/XlpbgZjY6vPvqPvITVJqpFE3EQyrdNoe4rdilAl9Y
         dpgca6E2MPH2Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9EDE360591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: qcom: sc7180: Add missing PM ops
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293464.13751.15269936594118468583.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201109103415.607495-1-cychiang@chromium.org>
In-Reply-To: <20201109103415.607495-1-cychiang@chromium.org>
To:     Cheng-Yi Chiang <cychiang@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  9 Nov 2020 18:34:15 +0800 you wrote:
> Use PM ops snd_soc_pm_ops to handle suspend/resume like other machine
> drivers.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>  sound/soc/qcom/sc7180.c | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - ASoC: qcom: sc7180: Add missing PM ops
    https://git.kernel.org/qcom/c/b2fc3029308d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


