Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 175A0340820
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 15:51:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbhCROu2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Mar 2021 10:50:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:45154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230367AbhCROuI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Mar 2021 10:50:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 16FFE64F24;
        Thu, 18 Mar 2021 14:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616079008;
        bh=yxClQGI5LEzKBGJpO1jO/8qAi1X/sbiS6hTR/yb3Ti0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oYq2WkLNts8tySUsB9sHsdJfTrjTtTfYqvpZHT3ZZI1tQmh6lAc5Jogl1U7B5UfWJ
         DHTj6H+pSmY4YS0W/ZjpslABfhL9yVb2MT+tTSg6Ftjp1LJp4RfiMcdntGNaSZVSo6
         p0/e5HPo2eUreho4O9+3FWH1AmP+lx8rxVvQwbTBzMRkUvzRg+bzMtSApucrpTCR+7
         BPsf8J95tAvth8qYroVfg4kFvFz2Q27PjTdjNSQfh2d8vljpVmW/4NohWAey3JeRaV
         coyU8Z33GRc9TLdIbtsFAKItqXUuuw4nAR1953QNkgdIIxdXm1FcgIM8gsmuPA9bbs
         uQY3acdJfcFmA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0730C60951;
        Thu, 18 Mar 2021 14:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] arm64: dts: qcom: qrb5165-rb5: use GPIO as SPI0 CS
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161607900802.10697.3780903674815456676.git-patchwork-notify@kernel.org>
Date:   Thu, 18 Mar 2021 14:50:08 +0000
References: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210210133458.1201066-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Feb 2021 16:34:54 +0300 you wrote:
> GENI SPI controller shows several issues if it manages the CS on its own
> (see 37dd4b777942 ("arm64: dts: qcom: sc7180: Provide pinconf for SPI to
> use GPIO for CS") for the details). Configure SPI0 CS pin as a GPIO.
> 
> Changes since v3:
>  - Rephrase qrb5165-rb5 commit
>  - Remove leftover  pinctrl-name entries for spi0
>  - Group pinctrl entries at the end of qrb5165-rb5.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] arm64: dts: qcom: sm8250: split spi pinctrl config
    https://git.kernel.org/qcom/c/d3769729dbad
  - [v4,2/4] arm64: dts: qcom: sm8250: further split of spi pinctrl config
    https://git.kernel.org/qcom/c/c88f9ecc0ef3
  - [v4,3/4] arm64: dts: qcom: sm8250: add pinctrl for SPI using GPIO as a CS
    https://git.kernel.org/qcom/c/eb97ccbba0fe
  - [v4,4/4] arm64: dts: qcom: qrb5165-rb5: switch into using GPIO for SPI0 CS
    https://git.kernel.org/qcom/c/e9269650db2f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


