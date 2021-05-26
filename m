Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08146392069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234367AbhEZTFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235843AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 639A4610A5;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=JQAA6gWCXnTkTNU8d4V/mqANd9bL0qBZjDIhsRWah+U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DH301y+tAQI7lVMZjXpwHurFgLB1ZyU9F3McMd0+0JS0d0JY3dVbS8FmGw8w1Bh4v
         YkbxY61J2dzhVd+UalNf7z1QDavT8NI36B3OzEKLGqlQSKzP+PvhoyY5qXTn64ZAkA
         /1T8P68aF50dnOz2ySHGoabYbP5LRxKcrKzw/ANr3bgtZA2d7eFkcV9/QsFkIo9oE7
         P4HKiw3k1l0lcQTdhSsbzhv/PyUkYtIp8w0YyDDko+XccsdxOLgq3ia5JU3/HyEmyO
         oENUFULyH+Td4xoDg6CH9o1Sy3OMaZEBAcKYHaTcrhsgOBhGkiTIlu2W4pk9+Gfbsy
         78IKjgCW42X8A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F13D609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580838.26840.15265701118854178753.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312232002.3466791-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 12 Mar 2021 15:20:02 -0800 you wrote:
> Analog to the issue in the common mdt_loader code the MSS ELF loader
> does not validate that p_filesz bytes will fit in the memory region and
> that the loaded segments are not truncated. Fix this in the same way
> as proposed for the mdt_loader.
> 
> Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
    https://git.kernel.org/qcom/c/3d2ee78906af

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


