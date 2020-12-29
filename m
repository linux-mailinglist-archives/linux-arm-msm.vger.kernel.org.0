Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58A2F2E73DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgL2USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726573AbgL2USk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 10EB22247F;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=BhRRSrQLnsiYB2Os4TF5xwq9g7+rhK1EcGTjZ0l9Yi0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iDb3SJnXLe9pkrxZxGFsdx+3bJHz7DWCyUdHlviaivVVfq9+iV+YRPsX8Mbf9v+vG
         2rHQ8kim6rn+C60J5y/QlTNyXPLLj1fYWQ67eUskFHuVdfQtz4PXI3KSKX/NVxkv5a
         WqMMw63VQv0yeDrB7VV7lFr5+0BX2E4WCOPm9ZgFbvFoiT+pbLSu8FcTrPCX5HYcD6
         OuCH+ftzmDSGpzyPnyAYc4GQltajGwnl3MAhWHET9AgAV9pyzXR/zrY2b6XpEJME4+
         DgFd1RWnwnkziL9C1Abj8A+FQQFqPq9YesMKOzkIwOd8JdnvCQpaoR1vj6XR3fYr0Y
         pn4BVpFVbavuw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 0BF0B60591;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Add missing stub definition
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293604.13751.18370874320845912852.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
In-Reply-To: <b9117317819c8b63d558231e6b88410ea717065e.1603716447.git.robin.murphy@arm.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 26 Oct 2020 12:48:37 +0000 you wrote:
> DRM_MSM fails to build with DRM_MSM_DP=n; add the missing stub.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 5 +++++
>  1 file changed, 5 insertions(+)

Here is the summary with links:
  - drm/msm: Add missing stub definition
    https://git.kernel.org/qcom/c/a0b21e0ad294

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


