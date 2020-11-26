Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204212C5CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 20:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgKZTuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 14:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:38230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728682AbgKZTuG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 14:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606420206;
        bh=ro/VAUFhxgdoW8DfpOeUSvsHOn+6xA4HWygmBmSovvY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sSFbY4jLuwHoAPLlYIb/mL4BdV5B/hW9bu5VWmjeFHhXoSdmcNosEWs6nBYJgTbyv
         0GJ3bKYHHiy5kOKrV/tl0cfEmzP7RNxW4rqu3aieLEAtoAsJX0Uykv9uRkf9tax6+2
         t6KL4ond8P+3N06mJc9CVVDF19qLer1+OnG3n8zM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160642020620.4652.7970166183201614158.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 19:50:06 +0000
References: <1592486051-22256-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1592486051-22256-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Jun 2020 18:44:11 +0530 you wrote:
> Use __fill_rpmh_msg API during rpmh_write(). This allows to
> remove duplication of code in error checking, copying commands
> and setting message state.
> 
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmh.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)

Here is the summary with links:
  - soc: qcom: rpmh: Use __fill_rpmh_msg API during rpmh_write()
    https://git.kernel.org/qcom/c/0924dad5d458

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


