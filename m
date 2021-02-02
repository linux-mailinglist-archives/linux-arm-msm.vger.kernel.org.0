Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5933F30CFB8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 00:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbhBBXKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 18:10:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236020AbhBBXKw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B47F564F86;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612307411;
        bh=X6OcZYGOq0Nxy+DAW9hOMZZxFZFsAOP3Mqr7TZCJATQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rX/tsIcGY7LeHalqxilHc7IfTLntK/3ZRdvcq124bthYLhDVXm/lxZKOEG6FlAjKM
         UvYYJ3WTkz3C/Gf2G9B/ty0L09EEd2RLw+7wGGK4hAcroh2TtEmrlAwEh8NjIv0COE
         dI31Sjm4a/tRxRS8JnfwHzLNXWLRwnu0IECpeJ3Gbc9pXDDCMRmBkEykMFRUODloBF
         OOQAKP8RtI7X4c/T2dfcI6gSbU1IhfNozqpfk4M1NZzPWmkoLI00t9jeVecuk7xLjp
         FY6jOAuLOVavSWXdc+scukBaoOvT9epEWb5erbKDKaltbaugYC+aCb9ymAA28iNd4j
         5XMdsncASGmHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A94E7609E5;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: ocmem: don't return NULL in of_get_ocmem
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161230741168.30835.12032154781739260784.git-patchwork-notify@kernel.org>
Date:   Tue, 02 Feb 2021 23:10:11 +0000
References: <20210130142349.53335-1-luca@z3ntu.xyz>
In-Reply-To: <20210130142349.53335-1-luca@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 30 Jan 2021 15:23:49 +0100 you wrote:
> If ocmem probe fails for whatever reason, of_get_ocmem returned NULL.
> Without this, users must check for both NULL and IS_ERR on the returned
> pointer - which didn't happen in drivers/gpu/drm/msm/adreno/adreno_gpu.c
> leading to a NULL pointer dereference.
> 
> Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> 
> [...]

Here is the summary with links:
  - soc: qcom: ocmem: don't return NULL in of_get_ocmem
    https://git.kernel.org/qcom/c/01f937ffc468

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


