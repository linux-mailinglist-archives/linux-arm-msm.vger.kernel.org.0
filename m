Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2C0392025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhEZTF1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235785AbhEZTFE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EEF8461463;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=0K9+pNqMxaUrfEre/EsXYlQZofNXCxQpGXuGyPXge74=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Zu6k5WhwF4kvFeadcnHuoPmb9463D4RDxVIm3eKdisyZQlTcIE8EktHaZrrUWOHKI
         nyHObGTnGQrX6RC8X5666h8iohm97f5GSZJM9prtT3rM3uzlTmFw2J1mb+HaK5gzVb
         hnfyRLy8NgHJ6WyCriDUHEA2acIB0Dy4VAsitLTpe5nbSB2Nc5V3CVOsRxLvU2XeWh
         SfKBBdUXF3gHFNS5TcCMWQOUG22SZiuuYuZSpbnP125DLGgKVgEu28yF0yUn8mflvO
         ybMQOMoxu0PaU6oQcocP7vTKQ3u8hmScjFLKIEtgfi0jAJa4iRIM/2IgXKRTIPTa6o
         G6gwP3qfpkfuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EAAB760C29;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drm/msm/a6xx: Fix perfcounter oob timeout
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580595.26840.2059509079646890447.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1617630433-36506-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1617630433-36506-1-git-send-email-akhilpo@codeaurora.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  5 Apr 2021 19:17:12 +0530 you wrote:
> We were not programing the correct bit while clearing the perfcounter oob.
> So, clear it correctly using the new 'clear' bit. This fixes the below
> error:
> 
> [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set PERFCOUNTER: 0x80000000
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm/a6xx: Fix perfcounter oob timeout
    https://git.kernel.org/qcom/c/2fc8a92e0a22
  - [2/2] drm/msm: Select CONFIG_NVMEM
    https://git.kernel.org/qcom/c/f5b1a8784350

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


