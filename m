Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 170A02F7ED1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732925AbhAOPAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:38450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731334AbhAOPAu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 36387233CF;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=eKCPYcjb9/VJNtp6TX4ZZ9MdSULw5aw5o3ElqLrfWj4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pbMMvz3zS9ULQCAhF0oIfFbeTJPLmrkvi2s8NsLyNnXHfvm+3VnQkS22bw14mUGCx
         R3TMqMOXVDt8AjXzY+Kxjq9D/oUJ+Pbih4Em1jKp39DTt5u0ACYMdGPdwPPBqrPekl
         txGiFJkz8/v/00ZWxQVkmK25lw6fTQ/9qCcf90DNQ3NMG/R487Xvn3OTYUKA/Cav9m
         wWWCpYKQ9q/m1U3KrB67pwqVr/AF+xxQm8zQRMy/4TD+PlAGNxEVnKaXV4cp8E1pdp
         6XjGdDR821Bs2wOOUtrPw5oOsQvjA6TQ8nvB9Mic+cFkVqzGq5OzCjJEJuk3Z2Np5m
         p0H0DYjlrjc/A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 27BEC60649;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: fix uSD pins drive strength
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281015.19141.16567497769154867436.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20201217183341.3186402-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201217183341.3186402-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 17 Dec 2020 21:33:41 +0300 you wrote:
> Lower drive strength for microSD data and CMD pins from 16 to 10. This
> fixes spurious card removal issues observed on some boards. Also this
> change allows us to re-enable 1.8V support, which seems to work with
> lowered drive strength.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Fixes: 53a8ccf1c7e5 ("arm64: dts: qcom: rb5: Add support for uSD card")
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: qrb5165-rb5: fix uSD pins drive strength
    https://git.kernel.org/qcom/c/abf2c58aaa77

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


