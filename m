Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB062E73BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgL2USM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbgL2USK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DB8322CB2;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=fxT2UE2rC3+6A2lTgBFzHn/4E4mPn9Pzw+d9nh21tj4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EgG0vuvr11puVUUuUdHAhmwCoAuhuIsybP0LyvipsSUBqw63t8vbXXUU9pe57Ly87
         DergosU6+4wTbZOQ2i7rUkFojpFk1Rwf5y1PpJy1d101Y5p/EIB2MdYLB7Uffcu/rJ
         qFVOwTBoFc2fl3ftvNZJTmRly2e3f/TBFm2MS5DqhrP1vLhWj+0fdjTeZDBl7tPaSv
         VN27wisAvkA2fAnmmaEbkF6ewL6jlcfrBVWTqwQ1IgAyjR91vD8leWweTOASxdw7mh
         dHqiYurQZKFz43yFlMC+qJvMr6OcjPfCktvkVmU/Dlj7/S7+t1NYbnB6m0rix5TXDW
         TlBXfbSeT1rxQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 891FD604D7;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v10 1/2] bus: mhi: Add mhi_queue_is_full function
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293455.13751.5750637902513749785.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1604424234-24446-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  3 Nov 2020 18:23:53 +0100 you wrote:
> This function can be used by client driver to determine whether it's
> possible to queue new elements in a channel ring.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  v1->v5: not part of the series
>  v6: Add this commit, used for stopping TX queue
>  v7: no change
>  v8: remove static change (up to the compiler)
>  v9: no change + Mani reviewed-by tag
>  v10: no change
> 
> [...]

Here is the summary with links:
  - [v10,1/2] bus: mhi: Add mhi_queue_is_full function
    https://git.kernel.org/qcom/c/d8c4a2236385
  - [v10,2/2] net: Add mhi-net driver
    https://git.kernel.org/qcom/c/3ffec6a14f24

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


