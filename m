Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01AF2E73BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgL2USW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DDF5022D0A;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=PjJaiaGz/YKQgwAJste0Pvwcnc0/dAN+8If5lQgDqE4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OVUGpPxBh8MTgaNu3bwCcyAIyH5Jty1k5EOt+VWQ/sDPplUF6yJ0lZbeRFJ9V8/zw
         H++ySmTrBvahajOX1akzVowbHQ+uy8RSTAxlkmdzUWOxitsqwPa6Bsjix8MR+Ru+mu
         x67W6htre764f66UO15s6MTcvJRUr45ZDRSMI8tYOB7pHmHqVGzXY6asPAwDsMo9k7
         WFJrt9I6bvimnD+Uyvd3rZC5q8XYmyKJR7DRz/HxSlFTkv876NBVrjcdhjTtnJ2Q3a
         Qlg0cqx6ch3phLVv1HfNRV3FKgAVz9qIpNIMabh2dyoAjMKs0iY46p1C+dGpjGQ1hk
         fYil2FpR0NRtA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id DA82B600D9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: sm8250-mtp: enable USB host nodes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293489.13751.595786803040528014.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201127092646.122663-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201127092646.122663-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 27 Nov 2020 12:26:46 +0300 you wrote:
> Enable both USB host controller, hsphy and qmpphy nodes on sm8250. Add
> missing pm8150 ldo18 definition (used by USB qmp phys). Both controllers
> are locked to host mode: dual role on first controller is not enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 53 +++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)

Here is the summary with links:
  - arm64: dts: sm8250-mtp: enable USB host nodes
    https://git.kernel.org/qcom/c/221f0ef37f55

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


