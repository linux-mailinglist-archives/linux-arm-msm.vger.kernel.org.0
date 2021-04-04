Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FDA353955
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbhDDSKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:37276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229861AbhDDSKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CAEB961245;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559811;
        bh=ayHSWNa54iIaBVaXpPaDh4RGcRdnm9ht1pysBjy37o0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BHwI0OqBR+REDnjdlFxJe17vrjkyAnQJQO0bDLhBFdKUFaU+2OEY+rxwZpORrdJHL
         KEF1HqRQ/yw7Ficp4pBheUb37IoNed7lNoXKOY6FTf4sXzEBzakz1zjWRQQx8AnFgU
         Vf4cO96Fe63J+P7Umvkk31fYjcVb4Fze9+a4tPEcu3Mi81F0oysm2w6NfZ9hPyl6CL
         KtebSNhn9smN0icZ3A7uGYvDFi0h+KEgcNY1E5Ke/WPkd4BtTM74efz06ge/vPyTcc
         T+gcjiJO4RR+uy7bQtQc1WrVxzKThI98PeJp2bln+c9nSK/6Pdt/lrq0P+BWTGhFHH
         aRL+yJQTgNzqQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BAA0760A00;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/2] Qualcomm's lpass device tree changes for I2s dai
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981175.6823.11500180412486711378.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210314061054.19451-1-srivasam@codeaurora.org>
In-Reply-To: <20210314061054.19451-1-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 14 Mar 2021 11:40:52 +0530 you wrote:
> These patches are device tree changes to support audio over I2S.
> Changes Since v6:
>   -- Changed mi2s node names
> Changes Since v5:
>   -- Removed lpass macro in codec dai cell
>   -- Renamed multimedia dai codec alias name
> Changes Since v4:
>   -- Removed duplication of dai-link in sound node.
>   -- Replaced reg values with common dt-bindings macros in coachz dtsi
>   -- Included sc7180-lpass.h instead of qcom,lpass.h
>   -- Sound node placement change in coachz dtsi.
> Changes Since v3:
>   -- Compatible name changed as per trogdor
> Changes Since v2:
>   -- Sound node variable is added in sc7180-trogdor-coachz.dtsi.
>   -- Audio-jack property is removed, as it may create conflicts with the boards
>      having different codecs.
>   -- Replaced reg values with common dt-bindings macros
> Changes Since v1:
>   -- Ajith's Certification is added.
>   -- Alias name added for sound dai link node
> 
> [...]

Here is the summary with links:
  - [v7,1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver
    https://git.kernel.org/qcom/c/29bd62ee951b
  - [v7,2/2] arm64: dts: qcom: Add sound node for sc7180-trogdor-coachz
    https://git.kernel.org/qcom/c/f158e7a378f2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


