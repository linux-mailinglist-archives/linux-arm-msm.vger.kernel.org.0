Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBABC339539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 18:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhCLRkh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 12:40:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:58830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232892AbhCLRkJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 12:40:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EABE464F0F;
        Fri, 12 Mar 2021 17:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615570809;
        bh=QxX+WwCyF/dZoD3NsRoxxmpah0EksGOe/7DB0jMELK0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Hz8BnC6WN02F87cC1RwYE5jSZidDlo9cEolg5m73epsFIJSvojkrE5jvsP/i0d1ND
         TWcPLloUHnkwt3+MMsPp6UZPfT3FRWg4VGrXxp7w7RH5Vuuy10IXDgxyD6+Wxq85gy
         S0z29C6pZTRKRvZ5ZZgMPxTjl6ijOYrviTbnVwhaJrH8h6oVYyPEc9+A2k5bT9a8BE
         Gq6pmPL5YKiNnmJCO3ZB4xWOsekAPqq/JEQUzujaax62ZAmhAWTuTGTH13sCD2Don7
         S2OznVRIw1NjL3+rx3r+3j9inDPRKGDFKjzahVWTBx3D6iA4Xp1zL25JCbn/hyXAGe
         SdoUkAvVSNnow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E2816609E7;
        Fri, 12 Mar 2021 17:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: db845c: fix correct powerdown pin for
 WSA881x
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161557080892.14658.12764375097763468669.git-patchwork-notify@kernel.org>
Date:   Fri, 12 Mar 2021 17:40:08 +0000
References: <20210309102025.28405-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210309102025.28405-1-srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Mar 2021 10:20:25 +0000 you wrote:
> WSA881x powerdown pin is connected to GPIO1 not gpio2, so correct this.
> This was working so far due to a shift bug in gpio driver, however
> once that is fixed this will stop working, so fix this!
> 
> Fixes: 89a32a4e769cc ("arm64: dts: qcom: db845c: add analog audio support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: db845c: fix correct powerdown pin for WSA881x
    https://git.kernel.org/qcom/c/c561740e7cfe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


