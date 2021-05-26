Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0633C39204C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235536AbhEZTFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235661AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 547EE61493;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=xF+Q+Gx+72I0qkk2HaLBVIkdrD4Cfpw3IRFpoKb+XYg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=msbiKR42Hz+PtfCr3sHwVDx34mzdNrIKQ6i1rfGmzNvrxra3/ZR2AMX2AGEXBF5cX
         O860vG1vbwPif/bIA7b0zwKQfwiyA3GsIhBZ1mGVmNw91dobVcBO48mosf28C6ETs7
         CP/XFFaFFg1bQf/sj2s5LImJ+x5H5KOQutZ18Y2k/kQ4OyieDGbMXeuaqwhDPelpAn
         4CP2w91C3Kp21/eUeD16VkxbhFopUAD+/RFTGM5c7ba6Od/TfAWP6EQ6TYAIoZeszd
         gAk3AQExbWbWizQ0UvPamcdjEhzfm8SK0HnsXxzkgx/zYSnzNSOM9QtfEhtrim4WR9
         V/g9X4tO1gmEQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5035460CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mtd: rawnand: qcom: Use dma_mapping_error() for error check
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580729.26840.8725031532464161122.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210405050912.115591-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210405050912.115591-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  5 Apr 2021 10:39:12 +0530 you wrote:
> dma_mapping_error() should be used for checking the error value of
> dma_map_resource() API.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - mtd: rawnand: qcom: Use dma_mapping_error() for error check
    https://git.kernel.org/qcom/c/32cbc7cb70b0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


