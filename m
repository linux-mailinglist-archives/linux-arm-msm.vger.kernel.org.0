Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B0239207B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbhEZTGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235857AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 176BC616ED;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=4TlMAVJU+7NB/1HOeM5TvWdP2Ng6jgIQZYjPJ2RhPEQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QI7+MT6pBaKvIjpDUSyx7ZfgMzI3Gu8CNIJgK2b9naDkvTd3wFIxZOLo+tyPLCo8u
         e2UPq68YWqZwvXlQy8VIqJ4iNkMVt/vY86KKXzJJRLEA1jF7aKP2TeCq/j2Q+JFc29
         Hkll0DNrMtcqqHRkbTsb4xqm62w/XtWUndp8pySYRlipJv3w9K8L2gmxREpRBinnI/
         s5o+o3Tvr/W5qauuaj2vFxQr1hjr/tRxWpI+7NaHM9002B6qW1EpAGhHLtzMqvjLNW
         HCv+vKsRAbWw2p57unh1Tkaj9D1s0J7rtM4EuzuhfREJmPk2sqaqO1v3ZskmuLItKn
         1YwoD0I+EPsMw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 13AF560CE1;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: pci_generic: Constify mhi_controller_config struct
 definitions
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580907.26840.6933674062385763313.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <20210408134946.16942-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210408134946.16942-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  8 Apr 2021 19:19:46 +0530 you wrote:
> "mhi_controller_config" struct is not modified inside "mhi_pci_dev_info"
> struct. So constify the instances.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Here is the summary with links:
  - bus: mhi: pci_generic: Constify mhi_controller_config struct definitions
    https://git.kernel.org/qcom/c/5630c1009bd9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


