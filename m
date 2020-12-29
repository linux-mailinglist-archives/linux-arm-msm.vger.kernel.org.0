Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0892E7399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgL2URt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726463AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id ED83F22B47;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=HTmgDEFjx3dHDmzHWUH70jP5u/X2Vni/t4l0JraU0/4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o+D5OLOWFbZC/VopFlNdHJ5ZIs1911TgqLQNp3rkKMARm505KNiGZYzXZZ7LOkJJ0
         609c8H3iAD+GYE5eeNvKRkLxbsFf3Xvfp1vnuG344llv3ey2qjvzNz1lC6fI2vzZ9s
         VfyVOy780TWJea8QqpUeT7u9lZdVQiKfwTAiFmn53lWTOIZ/u/zOrtbLrMdAi96GZA
         qAofxJnzKPtjv07KV17Zpd7FIw5gwfTTu3jwlkNP0GnHf92NJQpnG5SrYv9JkIy1Xy
         T5L3gCt/ec5SRorOj4qG5s3DFNjNv7rpPcnIkWecuLQYjiZwKGM8pc3BpeR2f61QNJ
         us0sg86Q1C7gw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E849B60626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293294.13751.7996122840449983534.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201126150157.25870-1-andrey.konovalov@linaro.org>
In-Reply-To: <20201126150157.25870-1-andrey.konovalov@linaro.org>
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 18:01:56 +0300 you wrote:
> This reverts commit c90f1178dcac30dee5ddd29ec0513e7589aa866e.
> 
> The assumption of "Each entry in formats[] table has unique mbus_code"
> is valid for the RDI entities, but not for the PIX ones.
> 
> Reverting this patch and creating a new one which handles the PIX entities
> correctly results in smaller and more straightforward patch than doing the
> changes on top of the current version.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] Revert "media: camss: Make use of V4L2_CAP_IO_MC"
    https://git.kernel.org/qcom/c/a3d412d4b9f3
  - [v2,2/2] media: camss: Make use of V4L2_CAP_IO_MC
    https://git.kernel.org/qcom/c/dfb5d3289716

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


