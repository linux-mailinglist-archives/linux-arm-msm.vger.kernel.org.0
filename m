Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFB8A2C5CBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 20:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgKZTuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 14:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:38232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgKZTuG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 14:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606420206;
        bh=yg4TjmyD+myEmJ191BFL9/rTlz28i9uIPTYRcpeuiGc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Oi0mJSZD5W1zaYAzAYlbwR0jIpk8scOECTaQ7l1Rea7DzEkN5KOVoh/Q+6II3uJsD
         1FTZEWmXvoHEAaVZg7jQ41QHMcII2uT14OIVzBYS0a29bONKnpb5x60ihgR0VzWrxj
         yB4Fj/hiGRYcPgCFl2lIuB6DI1x8eluXC1/KY8wc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND] soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160642020625.4652.11444970058921050173.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 19:50:06 +0000
References: <1606379490-4052-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1606379490-4052-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 14:01:30 +0530 you wrote:
> Use __fill_rpmh_msg API during rpmh_write(). This allows to
> remove duplication of code in error checking, copying commands
> and setting message state.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Here is the summary with links:
  - [RESEND] soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
    https://git.kernel.org/qcom/c/0924dad5d458

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


