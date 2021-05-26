Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2EB339202C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbhEZTF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233790AbhEZTFJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1DAA361458;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=0cMf1hDuvRUN4vyBMv4vTFKbXjqFHVfXLMG/otBm+Po=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UT282FB+jqseiLNyjRY7Vcfih/IYYl40fIY68FlIteuj6Qp0tOrjeKYoRzUDNdfdk
         LOds79oCC94+gKK+xOc9miDblZ30JiplRT83tkROEofhVA0ZDxaQXFHN4Yzv4miiTE
         GZ/K3fLM5h6LZLdLuVenFA0tnwFUEAqBzzYLw8lrSfc8vtlVT9qyTmMSIjz+mvyid4
         obn2FvDaypML6VjG4bYnPOypUDN8P6uZ/o5BvqnZpJ76WTUEHuYVx6SRm5dZEpk2Jp
         64pjVU7vyqyPxU7BgCsIUsL2jICpUcyhsrolQGlOGjMp1439GsM9v70fqSOhlF9vng
         aB9AqwLpUwxvQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 19CF460CFD;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: ipa: add support for the SM8350 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580610.26840.15360712733349505085.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210413163826.1770386-1-elder@linaro.org>
In-Reply-To: <20210413163826.1770386-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 13 Apr 2021 11:38:24 -0500 you wrote:
> This small series adds IPA driver support for the Qualcomm SM8350
> SoC, which implements IPA v4.9.
> 
> The first patch updates the DT binding, and depends on a previous
> patch that has already been accepted into net-next.
> 
> The second just defines the IPA v4.9 configuration data file.
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] dt-bindings: net: qcom,ipa: add support for SM8350
    https://git.kernel.org/qcom/c/15c88e185eb9
  - [net-next,2/2] net: ipa: add IPA v4.9 configuration data
    https://git.kernel.org/qcom/c/e557dc82418d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


