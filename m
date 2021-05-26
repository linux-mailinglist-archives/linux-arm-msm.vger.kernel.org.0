Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B398392000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235805AbhEZTFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235276AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 92928613EC;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=/3D5maVe5ES+bA/Jk/FeVDA6FOgw28p8tsfBolxsrqA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hhraZs0pxVeP0znNKEIo3EwGYDsDqK9iLvX6DMzhDjOANdTK+J/iMCXmGJ+qTrQxX
         TaWrCRSRiIbIJnZGvToT9obmYbctVnDVWqGPul/KheO9ENJagTpK1VEWFLzg+/rnQL
         7vGonZ0lYDgqtG2xbNRfa2UG4I4xVuwiqoEgCFjddMIr3SjkZ3xWBjbcG9JHLpQ5M8
         pFz2ncSZC918Vp97MxIWYMUXcZ+0boshkWwMU/8AEfgTePgV2WdRrljbF1NV68yzEp
         FLZ9hHGXXVIkuaklD6kYeGVnoJcrh/WV2pcDVPzExdiOVACwkv4F2+VXeSH+Ma/8FI
         nrZjgftAynhxw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8E12C60C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 01/20] iommu: remove the unused domain_window_disable method
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580457.26840.5669745281348188311.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210401155256.298656-2-hch@lst.de>
In-Reply-To: <20210401155256.298656-2-hch@lst.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 17:52:37 +0200 you wrote:
> domain_window_disable is wired up by fsl_pamu, but never actually called.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Will Deacon <will@kernel.org>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 48 ---------------------------------
>  include/linux/iommu.h           |  2 --
>  2 files changed, 50 deletions(-)

Here is the summary with links:
  - [01/20] iommu: remove the unused domain_window_disable method
    https://git.kernel.org/qcom/c/47685cb202d1
  - [02/20] iommu/fsl_pamu: remove fsl_pamu_get_domain_attr
    https://git.kernel.org/qcom/c/392825e0c76c
  - [03/20] iommu/fsl_pamu: remove support for setting DOMAIN_ATTR_GEOMETRY
    https://git.kernel.org/qcom/c/f7641bb71d26
  - [04/20] iommu/fsl_pamu: merge iommu_alloc_dma_domain into fsl_pamu_domain_alloc
    https://git.kernel.org/qcom/c/c8224508074e
  - [05/20] iommu/fsl_pamu: remove support for multiple windows
    https://git.kernel.org/qcom/c/ba58d1216e2b
  - [06/20] iommu/fsl_pamu: remove ->domain_window_enable
    https://git.kernel.org/qcom/c/376dfd2a2ff4
  - [07/20] iommu/fsl_pamu: replace DOMAIN_ATTR_FSL_PAMU_STASH with a direct call
    https://git.kernel.org/qcom/c/4eeb96f6efac
  - [08/20] iommu/fsl_pamu: merge pamu_set_liodn and map_liodn
    https://git.kernel.org/qcom/c/dae7747ae41c
  - [09/20] iommu/fsl_pamu: merge handle_attach_device into fsl_pamu_attach_device
    https://git.kernel.org/qcom/c/85e362ca4625
  - [10/20] iommu/fsl_pamu: enable the liodn when attaching a device
    https://git.kernel.org/qcom/c/7d61cb6ff012
  - [11/20] iommu/fsl_pamu: remove the snoop_id field
    https://git.kernel.org/qcom/c/fd78696ece54
  - [12/20] iommu/fsl_pamu: remove the rpn and snoop_id arguments to pamu_config_ppaac
    https://git.kernel.org/qcom/c/151f9414b88b
  - [13/20] iommu/fsl_pamu: hardcode the window address and size in pamu_config_ppaace
    https://git.kernel.org/qcom/c/57fa44be7fdb
  - [14/20] iommu: remove DOMAIN_ATTR_PAGING
    https://git.kernel.org/qcom/c/9fb5fad562fa
  - [15/20] iommu: remove DOMAIN_ATTR_GEOMETRY
    https://git.kernel.org/qcom/c/bc9a05eef113
  - [16/20] iommu: remove DOMAIN_ATTR_NESTING
    https://git.kernel.org/qcom/c/7e147547783a
  - [17/20] iommu: remove iommu_set_cmd_line_dma_api and iommu_cmd_line_dma_api
    https://git.kernel.org/qcom/c/3189713a1b84
  - [18/20] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
    https://git.kernel.org/qcom/c/a250c23f15c2
  - [19/20] iommu: remove DOMAIN_ATTR_IO_PGTABLE_CFG
    https://git.kernel.org/qcom/c/4fc52b81e87b
  - [20/20] iommu: remove iommu_domain_{get,set}_attr
    https://git.kernel.org/qcom/c/7876a83ffe8c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


