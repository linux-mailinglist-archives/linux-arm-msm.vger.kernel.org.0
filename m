Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6442E738C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgL2URj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726412AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D41A2253D;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=tUPibouWpboS8x/FKMUmNKIrTEgwRk+VFEon+sCKQ78=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DHuAwYPdJQpGiZWrMeHa2Ne6++B67NQ5oBdHSicU+fdC4Yt8aALH8tfPmSLXFlYaB
         +y20ZS9b1zq6+PBX/JTiPXz4EQjeb+jV5WRzCZH/wCsQ5BL5Lci8M+i8beNKN8l5DL
         mg19HXpkV7urZL5bwVeEYwpIdPfmn5S5xu6DlFV3oT+480BOGvLieS86+h6dNTi8/h
         f8OnbzebDdd+MsBywRgLK+52Hs/NgpthJRLcGvaosTlNO3vJtF9P5eln5qeOaaXycN
         KpY8SY+Dr64tqd5HtbKUJWMcQlE5/w87QMK5pZ76eFeo2k4IEOGXhPf1q+Owvrbz7j
         qCV8gJeGAuIXw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 79B3C60626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] drm: Build fixes for msm and mediatek
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293249.13751.7545901236405411045.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201109103242.19544-1-tzimmermann@suse.de>
In-Reply-To: <20201109103242.19544-1-tzimmermann@suse.de>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  9 Nov 2020 11:32:40 +0100 you wrote:
> Commit 49a3f51dfeee ("drm/gem: Use struct dma_buf_map in GEM vmap ops and
> convert GEM backends") changed DRM's internal GEM vmap callbacks. Msm and
> mediatek were forgotten during the conversion.
> 
> Thomas Zimmermann (2):
>   drm/msm: Use struct dma_buf_map in GEM vmap ops
>   drm/mediatek: Use struct dma_buf_map in GEM vmap ops
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm: Use struct dma_buf_map in GEM vmap ops
    https://git.kernel.org/qcom/c/b47f9f92d6fe
  - [2/2] drm/mediatek: Use struct dma_buf_map in GEM vmap ops
    https://git.kernel.org/qcom/c/7e542ff8b463

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


