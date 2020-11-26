Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F592C4BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 01:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgKZAKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 19:10:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:41680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726315AbgKZAKG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 19:10:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606349405;
        bh=0Gjzgv+CZq/YY893DmEjL41R8zWbJ5ugeA7vMATT1CE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lKReSnFx5iT5HWr1g1E19w5jVG0938Q3Q9FDt23Py+eq8u0E+utpon1veSP7Is1uD
         8gg96yN80rmR9zf7TOsecUoIfGNbCGCM0Y2fK+zLVtXlxRPaTS5ztLtk89oBBqfunj
         vLyMa/W0UPUinVc8NcAwoqGG25Xy/qkOHrDQWZoY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm PON driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160634940560.7812.14153621760843542710.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 00:10:05 +0000
References: <20201125023831.99774-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201125023831.99774-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 20:38:31 -0600 you wrote:
> The PON block in the PMIC provides, among other things, support for
> "reboot reason", power key and reset "key" handling. Let's enable the
> driver for this block.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: Enable Qualcomm PON driver
    https://git.kernel.org/qcom/c/cc563f8f769b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


