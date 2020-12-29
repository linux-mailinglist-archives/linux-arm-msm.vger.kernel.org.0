Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0AA2E73A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgL2URy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 721AC22BF3;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=W+JA1Kybg80Xuw+VXccEm08eIdBtNQm8iV873JsIbHE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TOGz+OC6efEVFL8UMjKF76dzTKBhYltaeSarl4xAFM4ziczpI4n4148jElT1b3Ie2
         bhkxYEXlYYxPOka2ykzJgCFKyeZ29BEVo3+rsGnrtcy16TWuytC3Y/iq4wMrKP8BGk
         v+8Q5idLjSq1YaQ2O5uxh0qRVoexB43iJBZC9sGEbbPqlQgctrvINXTL5DgQpjKy+K
         O7RA/Nk/w8Bl1NMvdSbfj48VE7wdX6ICh9AnZ3kOhxBnf0OmambF+oeEsDhbg8Xqma
         eYO54s9MCvvMvMhPHHRriGIF0Lecky/BWJ939jr8N7zC1wTChEJdknvQ1KcpiP5jMY
         JapOmW2ppx0yA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 6E957604D7;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Support SC7180 sound card variation without headset
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293344.13751.11493096625716812294.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
In-Reply-To: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 12 Nov 2020 09:43:26 +0800 you wrote:
> Use compatible string to let machine driver handle the case
> where ALC5682 headset codec is replaced with ADAU7002 dmic codec
> 
> xuyuqing (2):
>   ASoC: google: dt-bindings: add new compatible for sc7180-coachz
>   ASoC: qcom: sc7180: Add machine driver for sound card
> 
> [...]

Here is the summary with links:
  - [v2,1/2] ASoC: google: dt-bindings: add new compatible for sc7180-coachz
    https://git.kernel.org/qcom/c/80e2b1208d87
  - [v2,2/2] ASoC: qcom: sc7180: Modify machine driver for sound card
    https://git.kernel.org/qcom/c/e936619b7ce7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


