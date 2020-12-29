Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D690F2E738B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgL2URi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A66622A83;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=+tWsJ60ab9ylkuW7sPBFSDfAp1HGnVQsWNYZb+Lrrms=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bB24KBm+7bA2v42PP5Nk2qCr0ZAFK/Tk4jM9sBvVBMG96UdqqWHKjofwKFF1Zf64C
         gkle9LnYjRh4NoTd2UtIUfyIDqeNDngTbHo1HzCDzuinzh3g05ASioSISZAP4IeY9j
         hsh8fZfLNxZ/R9seyaJMEOeTRSgn0e2wIQ5n63w4lsSZXMvpuueCGzW+a8Q6wX8UEB
         vLOUdjC5xqj1roFiRFhVG5tZ0I3cibeFxLSs47xkFE4cLQrNiTfdBnrH4rGE2+yscC
         F7Liwf+0HSDqmhrSNnlqKEEtYl2vfsAPZNtSw1GXvME/4BjKjFtiuvvNGWKluj6JTi
         +GghArG427RDw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6544760591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: core: fix potential operator-precedence with BHI
 macros
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293240.13751.2774417764045355856.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1603225785-21368-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 20 Oct 2020 14:29:45 -0600 you wrote:
> The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
> a BHI register index. If 'n' is an expression rather than a simple
> value, there can be an operator precedence issue which can result
> in the incorrect calculation of the register offset. Adding
> parentheses around the macro parameter can prevent such issues.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - bus: mhi: core: fix potential operator-precedence with BHI macros
    https://git.kernel.org/qcom/c/8ff3f7bdde45

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


