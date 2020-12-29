Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F7822E73E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgL2USx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbgL2USw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 861D823102;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=wkMeG3RL+xu3lyTHjilPZp9/LjPx/lfVy4rFEtsf9ao=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YWe2gEKj/TceVsB/V5965AWIB0y620JChpU0OfXHbyJPkd7BPF39ucY34YOQ0bzaF
         kegfK+wq2V4BU19DxU6m0K20AygtBZ7ouF2CtzNnM1OnrwySrNxZee8u2kca09vmYU
         q5/7rM9rTLRDPmAsnq1wQaljbMc0RtTnC+yGgwUrpcCK7gbNGqVo1O7hr5dnpkciM0
         nzEUL/I4tQnAXqxnqqq6ofOH+ZK2s9hZrdhU6M2MlKadPXIuX0jlc4XtDB7qf/iP30
         OiSH8djhZ0p5drH2ABTgVqhM1Z36F4rA+xYuf01UHeU2MazwXbgVH7NpKJGUGkkeEQ
         vXxnFNq5l84uQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 822C3600D9;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] scsi: ufs-qcom: only select QCOM_SCM if SCSI_UFS_CRYPTO
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293652.13751.17024751566507947874.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201114004754.235378-1-ebiggers@kernel.org>
In-Reply-To: <20201114004754.235378-1-ebiggers@kernel.org>
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 13 Nov 2020 16:47:54 -0800 you wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> QCOM_SCM is only needed to make the qcom_scm_*() calls in
> ufs-qcom-ice.c, which is only compiled when SCSI_UFS_CRYPTO=y.  So don't
> unnecessarily enable QCOM_SCM when SCSI_UFS_CRYPTO=n.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> [...]

Here is the summary with links:
  - scsi: ufs-qcom: only select QCOM_SCM if SCSI_UFS_CRYPTO
    https://git.kernel.org/qcom/c/6ac63216a7af

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


