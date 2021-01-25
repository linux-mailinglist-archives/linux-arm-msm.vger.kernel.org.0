Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1620430345F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 06:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbhAZFXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 00:23:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:36206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731083AbhAYSu1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 13:50:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B6A9230FC;
        Mon, 25 Jan 2021 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611600610;
        bh=RU4Hy23V2yowEKboEdGanykKMKVBYFtosXNA3EhMfJs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jctOgTCWzhsCA1UwD432EIAsdgVQ5dfY8Iivhl+z0mHxus8bB/h2tPMbY9LeB9Xo1
         vDFh3G3Wek4nVpDM+x0sq+Qft2p0F3odbkWImxWM3vok/zachkwgWHRYx398vcY6jX
         ogkZfY4jrx9i+7wL1n1kP8VcxirQU0+7qinxKgnhwfRY+aprEwM/MGk74vOr5CkMaE
         gc1FDzP6QCr9IWb2ep6j+D/6vCMW1bMbdMdzUqxQDBzr9hdiVO+tQA+jR+8gAJiXIW
         nyOZGi0aMXjqOIQIHRhNkfnhfKqdeNGk2xmHkgShXPsG4N+L6G+7xDonqm6HAjSr2b
         nGJ1/KLYyks+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9244761E45;
        Mon, 25 Jan 2021 18:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 01/11] arm64: dts: qcom: Add support for remaining Sony
 Kitakami boards
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161160061059.4014.8765859437325861788.git-patchwork-notify@kernel.org>
Date:   Mon, 25 Jan 2021 18:50:10 +0000
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 17:24:21 +0100 you wrote:
> This patch adds support for the following Xperias:
> 
> * Z3+ [aka Z4 in some regions] (Ivy)
> * Z4 Tablet (Karin)
> * Z4 Tablet Wi-Fi (Karin_windy) [APQ8094]
> * Z5 Compact (Suzuran)
> * Z5 Premium (Satsuki)
> 
> [...]

Here is the summary with links:
  - [01/11] arm64: dts: qcom: Add support for remaining Sony Kitakami boards
    https://git.kernel.org/qcom/c/72b312411de7
  - [02/11] arm64: dts: qcom: msm8992-bullhead: Update regulator config
    https://git.kernel.org/qcom/c/1628dfe5f67e
  - [03/11] arm64: dts: qcom: msm8992-libra: Update regulator config
    https://git.kernel.org/qcom/c/31d9dbd2ae36
  - [04/11] arm64: dts: qcom: msm8992/4: Rename vreg_vph_pwr to vph_pwr
    https://git.kernel.org/qcom/c/53364cfcaa7d
  - [05/11] arm64: dts: qcom: msm/apq8994-kitakami: Add regulator config
    https://git.kernel.org/qcom/c/676b61b4790a
  - [06/11] arm64: dts: qcom: msm8994-kitakami: Add Synaptics RMI touchscreen
    https://git.kernel.org/qcom/c/e8528157b7f0
  - [07/11] arm64: dts: qcom: msm8994-kitakami: Add uSD card support
    https://git.kernel.org/qcom/c/ab8e4a853731
  - [08/11] arm64: dts: qcom: msm8994-kitakami: Add VDD_GFX regulator
    https://git.kernel.org/qcom/c/e9783584c9b7
  - [09/11] arm64: dts: qcom: msm8994: Fix BLSP2_UART2 node
    https://git.kernel.org/qcom/c/a046032c37c0
  - [10/11] arm64: dts: qcom: msm8994/8994-kitakami: Fix up the memory map
    https://git.kernel.org/qcom/c/74d6d0a14583
  - [11/11] arm64: dts: qcom: msm8994-kitakami: Add missing email in the copyright
    https://git.kernel.org/qcom/c/54b1511e4f31

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


