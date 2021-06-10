Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812A53A331C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 20:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFJScA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 14:32:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:35768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229935AbhFJScA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 14:32:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F3819613FF;
        Thu, 10 Jun 2021 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623349804;
        bh=HNAFL61W9fgyRLK7OPFpzAUkRgjBskhyAWyQTjcfMvU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QdDoRBPZvnMz9snkh6Z1LjqidRpeiSVJN9hAaOrhnqAy29LCuX4J5v/QGKKekxYK1
         08Wpoq7AHSSO3ARcjsfmAxBrSNxKF6Dl3BMTkwxf0qz5m1zZgK3lEabUz8pRYyw+NX
         4EvgD0qAgIabJKjo+nKuD9FDCZWRDX0ORJ4wYWed2XU/gGzOUHkVxkDEmT+28yovto
         uO8sELc5ONvD12te7i8Jn1eBx9I0Q6oVnwI/McPN+ibdLDgAhbxc6frc3Tbrn5VKS2
         nxdUEEsb97OPpanMlOsS//LKVnG8kWUG+XrZ1SQLyhmPo39nFozjk26LadtRIkK/QU
         83pXlCkTA166w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EBE5B60A6C;
        Thu, 10 Jun 2021 18:30:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: qcom_scm: Add MDM9607 compatible
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162334980396.1903.6097212384082572202.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 18:30:03 +0000
References: <20210131013058.54299-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210131013058.54299-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 31 Jan 2021 02:30:57 +0100 you wrote:
> Add a compatible for MDM9607. It uses the "legacy" calling
> convention.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +
>  drivers/firmware/qcom_scm.c                             | 3 +++
>  2 files changed, 4 insertions(+)

Here is the summary with links:
  - firmware: qcom_scm: Add MDM9607 compatible
    https://git.kernel.org/qcom/c/82a6cbf00764

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


