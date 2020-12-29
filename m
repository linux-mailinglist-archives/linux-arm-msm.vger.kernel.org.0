Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C44D2E73C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgL2USY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726548AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 02B4D22D03;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=tbuO1nsTe07AaTmhQk3RMO3fnm5Mmt+GwveJfzrXT5s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lwC8WvPzbJKw/wB/H3okjOtEDhxRApw32oA/OHJa6gLDg35vNdmQtr4gSsPwxUNGO
         1YLy4gXH09bmqdfq4QiivsK2ptqVjAOLiUPNyTV1VtLwDpgPJGEjBA9rYa/RTSiKxh
         FxJuMYzSmngSoB6fbw+fVVqcb9YhIc3CDlEAGLQngSAKGCVZyOMdO6x3Kn/p9VCT9z
         DxEt2Za45HvydUwfM9f/KDiug7gZ0gbhduBm1csiG12C+FTZBiAvJQYb6Lt2kOIq/E
         LY3nsU9Qh6rBmfyyTYDmDUfBkRiuK7trEEIGexx1NO/UC1tzMVUjc86KNFXLqYhWfP
         Alm1CY7wD1Grw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id F2DCE60591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Add 32 bit format support for
 capture
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293499.13751.3521963795853171566.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1605512955-7017-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Nov 2020 13:19:15 +0530 you wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Add 32 bit format support for capture in lpass-sc7180
> snd_soc_dai_driver capabilities. Need to add contstraints
> in machine driver so that only specific format allowed.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Manidadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - Asoc: qcom: lpass-sc7180: Add 32 bit format support for capture
    https://git.kernel.org/qcom/c/313ebec48ded

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


