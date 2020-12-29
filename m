Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56722E7372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgL2URH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 54D1022473;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=31hL277AjHqIWxbxwvTGmY4YcAosdkdRJFBoItNw4Dc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kT5JAlZE76Dzh+1UgIKE+2CaN1MW/wCLGi1HH4b22LqhO1rOHlnAFB6nAZgOc1//h
         cz6XzLd1AVtNr0XRNsLUHeC3BO/FpBE45hctfjC+1TEhQFTIE2EiBAV/unSTAcy503
         qy0KJfO4dRnB/4J+DjuR6CBXTkLNxuvu6zeTWJD6bVlACj6L2zGWC4skauL9/MokT3
         hBPpNI6vEKC8jNlG3+GH/26BQaSEejQZ72FsUjzgqTVcMuh8N98ZJnX4CKcAJGK+t4
         6V3Gn0/0uoZxcfOtg3g+wOv3DSXkgwiAVuNwHWPW80oSKESVoA7KVxSBkAjPwSvTYl
         VuT8Qz1Qxs37w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4EB4A604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293131.13751.3142602682949729451.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1601360391.git.mchehab+huawei@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 29 Sep 2020 08:22:11 +0200 you wrote:
> Hi Stephen,
> 
> While double-checking against yesterday's linux-next, I noticed
> that those two patches weren't merge yet.
> 
> As you replied to both with your Reviewed-by:, are you expecting
> them to be merged via someone's tree, or are you intending
> to merge them via your tree?
> 
> [...]

Here is the summary with links:
  - [v2,1/2] spmi: get rid of a warning when built with W=1
    https://git.kernel.org/qcom/c/b1f0aeecd25a
  - [v2,2/2] spmi: fix some coding style issues at the spmi core
    https://git.kernel.org/qcom/c/0be0a733c9cd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


