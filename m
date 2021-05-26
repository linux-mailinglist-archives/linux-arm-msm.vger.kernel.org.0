Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1E5392014
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbhEZTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235764AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6707061448;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=93Y+i2m9v9XbGmWZimkOFT1pMJsbXz3JtCgjX0rg1xs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eIjGF/aMb1d7VQ+L621gyNWY7thYzOnK90rUaPW1l6Cugaz2RNVMDoPy5yUTQ0Adg
         8RqmYqSlmoCdY9iKMlHbVduk5723hNXmQjVYRynDKP6+AWUGMSVrP55/zQ5LUw5cXX
         U/57VzXlID9VnhntizRaNBuCxl9zzsZEbGPkUeu+Vq3hoOHN0w5SpjbgC4qaPVvT6r
         Bx/hYhWy7pwUg0lG/Wrf3t9WJ/3g9NQxAGAJqXYtlHTLsc7irp9eaj/E5RAMJpiwx7
         0BcMp+LFVElKqmU1pQq7cV9XKvgjw333ktCl3+nCRQKrRXslIHSknkrNy7utt2bLdC
         uv7e3TdqWpUyA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5DEA260CE1;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/msm: a6xx: Make sure the SQE microcode is safe
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580538.26840.6210639856219936882.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210210005205.783377-1-jcrouse@codeaurora.org>
In-Reply-To: <20210210005205.783377-1-jcrouse@codeaurora.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Feb 2021 17:52:05 -0700 you wrote:
> Most a6xx targets have security issues that were fixed with new versions
> of the microcode(s). Make sure that we are booting with a safe version of
> the microcode for the target and print a message and error if not.
> 
> v2: Add more informative error messages and fix typos
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] drm/msm: a6xx: Make sure the SQE microcode is safe
    https://git.kernel.org/qcom/c/8490f02a3ca4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


