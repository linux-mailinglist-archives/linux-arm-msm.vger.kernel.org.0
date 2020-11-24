Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B161F2C1C83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 05:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728673AbgKXEKJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 23:10:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:46854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728664AbgKXEKI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 23:10:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191008;
        bh=uBWCUD4tkfcXjHjmi+4VwxfPma9DGv6jhaZPgQK+PHM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WatyKKcFAEeMD+k0I0QkrzBzR6yb3Yck4tSGdB1DjtyLZ1aYOPZLhvXebMIpoO88a
         M6jXgOoaOhjzAbuhO2EM7AZ2q2VUG+gk8ZRsjvmMaRSSZDom4C+gZc/FAcHb6EZvIj
         f2a+NYuFXdVrXBaYSlBr5Zzb4yeDX7cCeT4bgDrY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/6] arm64: dts: qcom: msm8916-longcheer-l8150: Enable PM8916
 vibrator
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160619100838.17117.16271754047874519724.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:10:08 +0000
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
To:     None <nikitos.tr@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 13 Nov 2020 22:59:12 +0500 you wrote:
> From: Nikita Travkin <nikitos.tr@gmail.com>
> 
> L8150 has a vibrator connected to PM8916. Add it to the device tree.
> 
> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - [1/6] arm64: dts: qcom: msm8916-longcheer-l8150: Enable PM8916 vibrator
    https://git.kernel.org/qcom/c/0af8bbdb6bb8
  - [2/6] arm64: dts: msm8916-longcheer-l8150: Add touchscreen
    https://git.kernel.org/qcom/c/6eb815289a37
  - [3/6] arm64: dts: msm8916-longcheer-l8150: Add position sensors
    https://git.kernel.org/qcom/c/6bd2cae7ddd6
  - [4/6] arm64: dts: qcom: msm8916-longcheer-l8150: Add flash LED
    https://git.kernel.org/qcom/c/6b4ad4be6469
  - [5/6] arm64: dts: qcom: msm8916-longcheer-l8150: Add notification LED
    https://git.kernel.org/qcom/c/38260b9e6310
  - [6/6] arm64: dts: qcom: msm8916-samsung-a2015: Disable muic i2c pin bias
    https://git.kernel.org/qcom/c/4e8692c2ee3d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


