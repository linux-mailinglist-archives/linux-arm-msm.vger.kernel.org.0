Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065C1392044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbhEZTFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235790AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 07E1A61480;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=el23qZsUFx+ZH+hFyOD3axfDBZqw4Em8qj/sRDXacCA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tGiLNt7LvZW+pj3HhRamp5IYthpogEhHUBp9namw3xvQ99EAOoTutxRuUNRhms+6D
         vIC6d4MaMFZ+vuabAZA0Nc56a5DiVoMUJrtaX8cw3baVSyXgAbq/C8qaU7btMQMg9v
         SUF1Q7sqXQjOwY0n2MM70lCSvsxg0Qs42CwHFz82oNweKMXxmceFd8+xz6dVg5SHVr
         era8IdwP6WNN2atkcfXU9b4YGff0q3JZOVroSqFTZKRjiDrhMWy2Zvap/EEfk9vo54
         BqupCnJ5r54mZ1e6bAJPwydAAm7zMrGA2icwSz4yXVcr6Eh5kdVBYq5AcyxASZy5xd
         IWPtKsU2SFTJQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 03483609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] scsi: dt-bindings: ufs: Add sm8250,
 sm8350 compatible strings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580700.26840.13435411018173183671.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210204165234.61939-1-vkoul@kernel.org>
In-Reply-To: <20210204165234.61939-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 22:22:34 +0530 you wrote:
> Document "qcom,sm8250-ufshc" and "qcom,sm8350-ufshc" compatible string.
> Use of "qcom,sm8250-ufshc" is already present upstream, so add misiing
> documentation. "qcom,sm8350-ufshc" is for UFS HC found in SM8350 SoC.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> 
> [...]

Here is the summary with links:
  - [v2] scsi: dt-bindings: ufs: Add sm8250, sm8350 compatible strings
    https://git.kernel.org/qcom/c/4517e77eb83d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


