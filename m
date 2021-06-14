Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4F93A71C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 00:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhFNWMH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 18:12:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhFNWMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 18:12:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FFD761185;
        Mon, 14 Jun 2021 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623708603;
        bh=DMVbftagxBLSQKDRJDcPoZ9yaY9TGsR5gK3yQNpj64g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=M5Oc7TjoVKoSARbkHQwBcc84bUAICtA0QAgApiqw3IBGEvZjsi9ngrYVj8a1sAXUr
         Aue3AdsPQ2Q0juJ3O/+7W5gDvtVSy0tKNnt5f+eGDTgMTkY4IeCpgmRFPsDiWKNF9w
         9GcR79Y60XtuGrH4S0azXPTv6+OQm+tgTmsOFIg/8zK6O8AmZuPOY2bz4qOseiR+OD
         9c4R1sV3+RdrLpbrjWNzrqWOM1szCDYc2ILyEeEo+paIDPn8OjT0kATVrLuobZ17sW
         Cv1KN/g31xVfnPH6cczmdap4HRJbPGJuqNxg+u6tgTOvo89vuAUBM26qKHqhgBbg8G
         b4OZoquQ06utQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2E91A609D8;
        Mon, 14 Jun 2021 22:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: add drivers needed for DragonBoard410c
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162370860318.14727.13097958978027602445.git-patchwork-notify@kernel.org>
Date:   Mon, 14 Jun 2021 22:10:03 +0000
References: <20210528140625.6972-1-m.szyprowski@samsung.com>
In-Reply-To: <20210528140625.6972-1-m.szyprowski@samsung.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 28 May 2021 16:06:25 +0200 you wrote:
> Add modules with drivers needed for DragonBoard410c board
> (arch/arm64/boot/dts/qcom/apq8016-sbc.dts).
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - arm64: defconfig: add drivers needed for DragonBoard410c
    https://git.kernel.org/qcom/c/e9cd414c1136

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


