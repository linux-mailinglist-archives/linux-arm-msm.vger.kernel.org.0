Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 358883A331B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 20:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFJScA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 14:32:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229823AbhFJScA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 14:32:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E04B9613FE;
        Thu, 10 Jun 2021 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623349803;
        bh=PdS+yVTUoazWMm3DBWmo1V9e6MnHG8TjpLUNy714mIY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OeuZVBFs5ryhQ/NN7JlLUMIyzQD+KvRim71KsoFZNQ2ZWr2AnW2O1B+BZYRIZM5hi
         UIb8h+s8oRNCKEbHcPQQAtJAeNqSdz1p+ZEuOKTtrauaBsfqMsi8pKfsFWDjLwpSOo
         9+dLBO58T1M4/lfGuw7oXjVygN99692epE6tfYbCjFCnvtbS7dPT4GxLvVj7L6Lo+q
         bZl155uORmxOE0/Oi0WiE4v1Mon3eKiKF2+A3TfIMQ/sZLFicJUR0RvUBdv6Yg7HCF
         BqZrMcKaH+rQbUi96xbtcDKLoJC2O0dUp0Uy+985UgdmpWKhni1EqgZjhyogQ7/ONU
         1Jp7XoeGnA9hg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D3C0060952;
        Thu, 10 Jun 2021 18:30:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162334980386.1903.15283763357827562528.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 18:30:03 +0000
References: <20210131013233.54666-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210131013233.54666-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 31 Jan 2021 02:32:32 +0100 you wrote:
> This SoC while being from 8916 era, makes use of the
> newer-style, floor-level management, instead of the older
> floor-corner.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  .../devicetree/bindings/power/qcom,rpmpd.yaml |  1 +
>  drivers/soc/qcom/rpmpd.c                      | 22 +++++++++++++++++++
>  include/dt-bindings/power/qcom-rpmpd.h        |  8 +++++++
>  3 files changed, 31 insertions(+)

Here is the summary with links:
  - soc: qcom: rpmpd: Add MDM9607 RPM Power Domains
    https://git.kernel.org/qcom/c/af32011f76b7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


