Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C1C416A05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 04:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243895AbhIXCbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 22:31:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:51252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243813AbhIXCbj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 22:31:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F4E66103D;
        Fri, 24 Sep 2021 02:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632450607;
        bh=rnAQHlvLByUWBo8gpsNOqbJbtok7DxjndmWiO3M/cv4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MPW8tlBPLXU42/44ONYwulZ1PzYu65CYdbwdIkSTVLv+Tie24M0SacQI7aG2Poby/
         J3erYWmrA9TFMOcMxG3SGYHtBqbaMEqm5y+teF5eZfhhcdRLq6xkj6i8jeTCZaWzXR
         5cK7DieHc+tUZ61bJPs0aGJ6VcdwTs1Fj3M7qcwfmaGhPZkQM1BB2jvc7Hu9KGzso9
         az/+nchCRt5EhccwUueGaLJhdyjmzjonL4hxjSUzw1Xw6Fx6S95OpbatL9mrLFdPDg
         fx2TvqeMxymwWOPT+53r6ehpslrMyYiG+1YNryzIoilOKYp3DJPpQPrItZHnVtfqdM
         hdWKP1R3uNzfg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1407160A88;
        Fri, 24 Sep 2021 02:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: sm6125: Remove leading zeroes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163245060707.24034.4772120079580127536.git-patchwork-notify@kernel.org>
Date:   Fri, 24 Sep 2021 02:30:07 +0000
References: <20210922195208.1734936-1-festevam@gmail.com>
In-Reply-To: <20210922195208.1734936-1-festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 22 Sep 2021 16:52:08 -0300 you wrote:
> dtc complains about the leading zeroes:
> 
> arch/arm64/boot/dts/qcom/sm6125.dtsi:497.19-503.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f121000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:505.19-510.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f123000: unit name should not have leading 0s
> arch/arm64/boot/dts/qcom/sm6125.dtsi:512.19-517.6: Warning (unit_address_format): /soc/timer@f120000/frame@0f124000: unit name should not have leading 0
> 
> Remove them.
> 
> [...]

Here is the summary with links:
  - arm64: dts: sm6125: Remove leading zeroes
    https://git.kernel.org/qcom/c/07b2fb604672

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


