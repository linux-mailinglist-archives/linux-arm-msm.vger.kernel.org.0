Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4512E73A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgL2USD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C98D922C9F;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=iTPJ2PUKf0vk+IXyEz8ku2nUdNQp5QKhI7aesbHf49U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cKBNm9wD0USz+73PtYRQufnHsoi3M6L4OiZGkG2iiIEP3ftqUo0oS2DkeeESV/+o4
         tUjhok6x52AzAeoWZxST06eJ3ybzTWTRQsX+W27hjvqUDfNI0GfdPYp84LgakZ/+l2
         YWa4s0fj/DKeVKAuWwOKlnrGOAPL5PTVWCbZgPAsoSL52JOYIjjCi618raKuNjQ0Uy
         3Z0BNDd28JwhNrIj5bImUiAlAxt77WgiXdRvcYLC4U/B6mwUaHEIi4punFSIH41vE8
         wZr7NfQplgCFbrxVhJ88Kt0VvyCDJJlTTfSYvQHcAS81a8MWvk5DZ9P/r0lmGPiAlg
         i4jImEKXmOsqw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C433A600D9;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: venc: Fix default capture format
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293379.13751.12297859848158865299.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201024163509.22246-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201024163509.22246-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 24 Oct 2020 19:35:09 +0300 you wrote:
> The default codec after driver open is set to be H264 but the
> instance format for capture is wrongly set to H263. Correct this
> to H264.
> 
> For regular applications this is not a big issue because they set
> the format through S_FMT but for example v4l2-complience does not.
> 
> [...]

Here is the summary with links:
  - venus: venc: Fix default capture format
    https://git.kernel.org/qcom/c/4568ea3fa95d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


