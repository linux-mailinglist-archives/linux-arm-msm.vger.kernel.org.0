Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65801392017
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbhEZTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235291AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FC156144F;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=DzeJTV6beo7y58LFGzpFQA3uHTiQIB0LX8TxC5IZqRc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=i9E+AEO0j7VMGWqpNuqDLEVN7oqeuRZ0hlgJcSeIPQj3H30nK8W9AQ9QEWJNvI+TD
         NJKSqNOrUZc9FX7nt2ZiL+iGZ1kD8W1dJTjOAwAwu2mAg0PeU2j/U+n+0JZoD0qFQx
         HQoW8b0tXAZwS+UESW3wuF5LlhBgTTlZ4oK+zCBgjZz4l3LHccNqJ8fitNr3fI02Rn
         FWLM1rFEOx39lE8WFUGGksYtPziZpuU1+XEJpQjc6+BMi+PJnBILzdXJswipysgIfE
         MDlB/1CBnG8pzdlKn96WkNOgVQ7lqlI9qjfA9TnV9EvJ30ixZqNu14pgmnxpeXgKLO
         AqWawreu4jMIA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B9C560C29;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: pas: Add modem support for SDX55
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580530.26840.9796209474370960912.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210408171211.92141-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210408171211.92141-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  8 Apr 2021 22:42:11 +0530 you wrote:
> Add remoteproc support for Hexagon modem found on the Qualcomm SDX55
> platform.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Here is the summary with links:
  - remoteproc: qcom: pas: Add modem support for SDX55
    https://git.kernel.org/qcom/c/3fdba9d27cc6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


