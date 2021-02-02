Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F8930CFB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 00:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236020AbhBBXKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 18:10:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236080AbhBBXKw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A1C7E64F78;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612307411;
        bh=FD70kd0geqsVWEiwpp5NGGWECyCgMZGAj2FBqvKdICU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lxdHVtxhs5pxm2tR+qwunNcqwVEz74qbwLnRB12m9PM7B4UzShDe3keQqni2qYNUP
         fy/le+oLSNcxEoZazzXt4VHv9A2E7pVb3H/2sXf/8tOTm/IAioxmgrO7JFhTGVC/JQ
         vKnTE7djmXSUxr8bLLAkWkXfBjnUolzjLxqeaQmWAxrEDBtraAdQOwLNS/Tl1dB1qy
         Ih/SHXacRZZZezEloRmiMvhw0zAMBbLq8AQSNXn/LEcJVE4f8zajU8fd9xEoOGvTBH
         9sNsrBKtQvmv6SxVaDvbq8BBtoA3Xj6RkeU0kQQSWgcnGXEtlHoPk6WdypVc3Rj8BC
         wW/y/eCfjqLVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 903BD609D7;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] MSM8998 DTS updates
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161230741158.30835.12023063011729906617.git-patchwork-notify@kernel.org>
Date:   Tue, 02 Feb 2021 23:10:11 +0000
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 17:29:54 +0100 you wrote:
> This patch series brings some minor, but important fixes to the MSM8998
> DTSI, including renaming I2C hosts to match the correct scheme, adding DMA
> to them, merging the -pins.dtsi into the main one and adding capacity-dmips-mhz
> to CPU cores. Some components were also disabled by default (with no functional
> difference for already existing boards, they were re-enabled over there) to account
> for less liberal firmware configurations present on some, if not most mobile phones.
> 
> [...]

Here is the summary with links:
  - [1/5] arm64: dts: qcom: msm8998: Merge in msm8998-pins.dtsi to msm8998.dtsi
    https://git.kernel.org/qcom/c/03e6cb3d8af7
  - [2/5] arm64: dts: qcom: msm8998: Add DMA to I2C hosts
    https://git.kernel.org/qcom/c/6845359eea47
  - [3/5] arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming
    https://git.kernel.org/qcom/c/0fee55fc0de7
  - [4/5] arm64: dts: qcom: msm8998: Add capacity-dmips-mhz to CPU cores
    https://git.kernel.org/qcom/c/c43cfc549fdb
  - [5/5] arm64: dts: qcom: msm8998: Disable some components by default
    https://git.kernel.org/qcom/c/a72848e8a4d7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


