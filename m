Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C63D30286A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 18:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729214AbhAYRFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 12:05:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:57406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729874AbhAYRB3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 12:01:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B8EAE22511;
        Mon, 25 Jan 2021 17:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611594009;
        bh=O6XEwpJ9TtxKuxHH2d+40WQjgJl5AbHu6XfRaPmQnPA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OdOgTbYin8Gm8xfQnVGhX1NN47dRCjtO9UV5XZdjsvKYXcifF3IsLnQqJqMbTeEdW
         INdimoDeDKUhTIxY242PPiz0S08B0fhmy+ipjczm5Ku6wSuyBM3dcq9SwQ8jlvVRHn
         KdqkAeWVxoj63tVCCLcDn3SwR4czWDZ+T3v7OszFqg/GoNvrQNgtnfyINQH3dcbFL/
         puklPGl1M+d9BuTtrAvv4pZ3FSk8Em/xFNVefyc2Sv3AFUvuw6uQDFmwTMZQi4QOOg
         vcKR9QsMlBcdyXOIgDyLXqZcWXaPgHUAFZEWwYYAisnTFSvUkROmDnE7i1Q9Cfdai9
         7o/UNDlLpsnAQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AA88261E38;
        Mon, 25 Jan 2021 17:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm: dts: IPQ4019: add SDHCI VQMMC LDO node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161159400969.21904.17801821956857516154.git-patchwork-notify@kernel.org>
Date:   Mon, 25 Jan 2021 17:00:09 +0000
References: <20200907101937.10155-1-robert.marko@sartura.hr>
In-Reply-To: <20200907101937.10155-1-robert.marko@sartura.hr>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  7 Sep 2020 12:19:37 +0200 you wrote:
> Since we now have driver for the SDHCI VQMMC LDO needed
> for I/0 voltage levels lets introduce the necessary node for it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>
> ---
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Here is the summary with links:
  - arm: dts: IPQ4019: add SDHCI VQMMC LDO node
    https://git.kernel.org/qcom/c/e14775aa2fea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


