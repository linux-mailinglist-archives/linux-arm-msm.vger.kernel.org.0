Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7E72C2B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 16:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389629AbgKXPkG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 10:40:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:42994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389369AbgKXPkG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 10:40:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232405;
        bh=+eKLFa8rz1tE6AopN7yAG/tydHxdeXdYrr3pyYficHQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dhWqgOBFB+7ZluVVGUmmcnkBqwjxi2pRyyrTlBdmSy7PFt272u7Lnr2F+hs4jhWC4
         tCDbBgtIymuiuO1wQJBWa3wuU+bTSLBrpqAD/jIZSx6xjMMqIktsLWtJXtTNjvCFwX
         hxjo6Ljj4dEumNcdAVcJcAT346nTsKSAYW/wTpIg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8150: Add wifi node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160623240558.17796.1087491653978972308.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 15:40:05 +0000
References: <20201121055808.582401-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201121055808.582401-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 20 Nov 2020 21:58:07 -0800 you wrote:
> From: Jonathan Marek <jonathan@marek.ca>
> 
> Add a node for the WCN3990 WiFi module.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> [bjorn: Extracted patch from larger "misc" patch, added qdss clock]
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: sm8150: Add wifi node
    https://git.kernel.org/qcom/c/05090bb9e53d
  - [2/2] arm64: dts: qcom: sm8150-mtp: Enable WiFi node
    https://git.kernel.org/qcom/c/c5a0609b064c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


