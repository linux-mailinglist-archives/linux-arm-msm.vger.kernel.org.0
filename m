Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089B02FE112
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 05:51:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbhAUEu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 23:50:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:44342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbhAUEuw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 23:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 300CB238E8;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611204609;
        bh=D+jZCAhqt+J0NuJpnDyukTuVpQ8RpKXIsnSMjnuRXoE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IyaviWpb2H0cMXQaTNYWFUCee8pXhwNIJbnBTblR/RNLdVE1wNqgoztniNY13Sqrk
         h3+l8PbJ4WQhZkb12lpDUWp+0Uu/yHGMNdFy7W2XxHfv6rSsezY7JDeoYquZa/p6lD
         KDsUh0a7O4zc9PcpD2EUHXmGzzDoRk9+ScLZfr/Wa/GeYgcqygnTBW200afiClNcif
         xocEiwZWPLHBH0Jhx30clKnxk5rMQCUna3IsQLATeZixsSv0Pum/rH0M63ZiD7INa9
         MUdXyf2c5pr4TLUiNDfHthUrnrzNiGtwmEg3h3HjhSxDEDLLRqiF5zftwJzYsbVBv+
         joKojIXZN2uqg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 22F1660591;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: Fix off-by-one array index bounds check
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161120460913.18989.7614863389850473292.git-patchwork-notify@kernel.org>
Date:   Thu, 21 Jan 2021 04:50:09 +0000
References: <20210118113651.71955-1-colin.king@canonical.com>
In-Reply-To: <20210118113651.71955-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 11:36:51 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is an off-by-one array index bounds check on array
> pmic_models. Fix this by checking using < rather than <= on
> the array size.
> 
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: 734c78e7febf ("soc: qcom: socinfo: add info from PMIC models array")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - soc: qcom: socinfo: Fix off-by-one array index bounds check
    https://git.kernel.org/qcom/c/e6393818c8d1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


