Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC131391FF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbhEZTFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235404AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FAE961432;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=mxLT5ui3pD2XVNu002PIYLel6XmPfouT8Y2NjKGQrsA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SpyS4an2SMCRLFiKJgythnYWPE9cYaia7L/PboKvnvU0NRp8MSVWsIx4yu4WyYcA4
         D9Z70TXuVmHuIaWbQi0Hx+gF3/oTk610ZKmyxDf924TJt3pBdL0E8XcGKGWtVA1Yt5
         aEuAX3GOwgxhA10ZsPBkNQqRdhQ4mNVoYqXJ+bBzSPYnkIjrLCJNYhN+nHxHBMXbSx
         KYgICDxPgrieD6Cirh3YXpVM2A4MzAcnX6FYRqfGIAHXcrUev4+n+CoiVxaeYH9uLK
         Giq866XAEXSU5afm41HnGon3XUtPDd2DI/mm7G5PPoh+yK9Gl8dj/tCLoYjqtGpQDO
         m/dVW3dxH8KHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B2F460C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v11 0/4] Add support for secure regions in NAND
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580430.26840.10054380490082785910.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210402150128.29128-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  2 Apr 2021 20:31:24 +0530 you wrote:
> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So this series adds a property for declaring such secure regions in DT
> so that the driver can skip touching them. While at it, the Qcom NANDc
> DT binding is also converted to YAML format.
> 
> [...]

Here is the summary with links:
  - [v11,1/4] dt-bindings: mtd: Convert Qcom NANDc binding to YAML
    https://git.kernel.org/qcom/c/da386f7f2333
  - [v11,2/4] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
    https://git.kernel.org/qcom/c/ee590106c331
  - [v11,3/4] mtd: rawnand: Add support for secure regions in NAND memory
    https://git.kernel.org/qcom/c/13b89768275d
  - [v11,4/4] mtd: rawnand: qcom: Add missing nand_cleanup() in error path
    https://git.kernel.org/qcom/c/ab2c8d3ef9b8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


