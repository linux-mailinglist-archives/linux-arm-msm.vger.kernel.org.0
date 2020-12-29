Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728042E73DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgL2USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgL2USk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 25710230F9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=U3JL2DH864yqVKbqVey62dyltBEsBj0jOwxzNAOpoNM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EM9PC6NIu6kEJmNyBPmmlVUtZDjfEnIc3fX+55FB8oVjzC56FlrCsJlfHKP8rFeUD
         oorTFPaBZNJbAPUULIpEdAf75JSdxPtksAnZGc2B7FOYKQS6LRc4FPkCmn4Tui78KS
         MCrsly9nCauTXGo5RfYm4IylBizTzoBVtSUyQtZNnrocotdvDlJWgoLohFGuyOXbv3
         lsUvqWIHLzWTzzeTH4ikG0pKTuCAzxAw6ynp9mOTfH8fSMQKJpqlGQ4T+AQNS2/mUZ
         a+dLX9wB9whzb3fpTezVikiQepDEY0jmI6V3CzvYW29JFdJWy5hKkX/rO7O3DvnPml
         uENd+LpEXdYXg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 20DB3600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: add IOMMU_SUPPORT dependency
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293613.13751.11878904392352557887.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201203231346.1483460-1-arnd@kernel.org>
In-Reply-To: <20201203231346.1483460-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 00:13:38 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The iommu pgtable support is only available when IOMMU support
> is built into the kernel:
> 
> WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE
>   Depends on [n]: IOMMU_SUPPORT [=n]
>   Selected by [y]:
>   - DRM_MSM [=y] && HAS_IOMEM [=y] && DRM [=y] && (ARCH_QCOM [=y] || SOC_IMX5 || ARM && COMPILE_TEST [=y]) && OF [=y] && COMMON_CLK [=y] && MMU [=y] && (QCOM_OCMEM [=y] || QCOM_OCMEM [=y]=n)
> 
> [...]

Here is the summary with links:
  - drm/msm: add IOMMU_SUPPORT dependency
    https://git.kernel.org/qcom/c/e319a1b956f7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


