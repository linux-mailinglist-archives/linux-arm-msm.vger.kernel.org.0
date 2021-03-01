Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02B5329289
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240338AbhCAUrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242592AbhCAUo0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:44:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 25A5C64EBC;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=RgUGmuXDQfxMOLiHCZcwm7lC+1feaVasiWMMwRVsfZk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=c91UPpZJZRMIuQSj0oIsA9dfuNoO4C3LT/lTACqWfVHKeTX68P4k9RGDDoy4cw1s6
         EgynPpjaLmKz6QP5vAqIQR8VuMFZmZfQSOWC5vuIqk/6nXcphYCF6phGghnqufHgfu
         uZlxHETzXObbp5N/CMtnq1Dyf5PFvhLkdvrXkRhcz7j9KMQ3Z7ScOzuELsL91i0kMw
         q03DKgt6dPr6RK1hPoqsTTJRVMLMomRqBI06tVUwI6sqR9fC2zIuxsGn5ruJRMY7Ff
         kfXo4C1nVACS42lk3LrQ2L1YXRWBiexubnrpLntLvUC/lHTU9iH8u/iSjQ5/Bpaoit
         4v65GXadzeOsg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2227160C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: venc: set IDR period to FW only for H264 & HEVC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878313.6187.1411179754867731712.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
In-Reply-To: <1608102410-23390-1-git-send-email-dikshita@codeaurora.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 16 Dec 2020 12:36:50 +0530 you wrote:
> HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD is supported for only
> H264 & HEVC codec. There is no need to set it for VP8 since
> all key frames are treated as IDR frames for VP8.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/venc.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)

Here is the summary with links:
  - venus: venc: set IDR period to FW only for H264 & HEVC
    https://git.kernel.org/qcom/c/f0ddb4e99116

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


