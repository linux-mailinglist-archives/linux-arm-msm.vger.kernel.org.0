Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD8233AD15A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 19:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbhFRRmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 13:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:41102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233921AbhFRRmN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 13:42:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D1C8961261;
        Fri, 18 Jun 2021 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624038003;
        bh=0Xz6eKCzuLJCjgMOz9sChO/Met8dm3yEiBRj1WKg4Ek=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sZyKxBRvYC8IuAhSu8pZg+qg+jiH+SsekbnutyXjB/F+XgxgW8co8pyK9VR/y4dTe
         lzeGmX9oCDpkn0ZvSRxTgojIbhG+BYx2gnzgBaS/xSjbHX3dowjVZPoNFl389lQ8Ku
         VI4+FEWVIbsNxBRC8q+MZaZnE4L4TZMNWvx5pB9FOji00b8gKXHYhAFKh1n8wXpWBH
         gsStgCq7hXAe2iaURAynrmjbeZ5feY2WjbCPoZPj459ggyCNeGW9IcJXXh2NF+4mjM
         BKJDNfwGWIe9D0HtapAocF/m66oQRZqe5kL0wTFK9vFuYSTRTHt76bPbLT0uVmm2vb
         uNq0KVqQJk0GQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C20CD60CDF;
        Fri, 18 Jun 2021 17:40:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8[12]50-pm8150: Move RESIN to pm8150 dtsi
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162403800379.25613.12667983163740208902.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Jun 2021 17:40:03 +0000
References: <20210613124822.124039-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210613124822.124039-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 13 Jun 2021 14:48:22 +0200 you wrote:
> It's not worth duplicating the same node over and over and over and over again,
> so let's keep the common bits in the pm8150 DTSI, making only changing the
> status and keycode necessary.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi    |  9 +++++++++
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 18 +++++++-----------
>  arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 18 +++++++-----------
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 20 ++++++++------------
>  4 files changed, 31 insertions(+), 34 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: sm8[12]50-pm8150: Move RESIN to pm8150 dtsi
    https://git.kernel.org/qcom/c/b135d097eb1a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


