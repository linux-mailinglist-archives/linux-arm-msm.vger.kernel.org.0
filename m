Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A203539205D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhEZTFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235830AbhEZTFR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF0CB61580;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=WCJ/r9BDavYRAtx1KkNwyWMs258+8pcMM82Wol8nJug=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GPDPWDWzvQUWbo9mWev9vHfRBRfrAtI00Nw1RgcA9Th+xtJA3SKlkthvlC9LRd8P3
         q6BMuyMsaH5Db5AwZqH4R8Qgz0c4+JmaIqm6X5UqxvqXrsx9AqP3ddFA1us7CnOq49
         PxKKfy2QmyJH6kK0VAp2Bf/MF06cHuOM4+RPwrINFeZPKlFWyIPn9beBwVi84tOomm
         SkelxqzUuiaxsQY1l5+pfUgEyrvbmq2UH2EWw7zoSwrff+Fj+CVpUG3n4OFsxFoxMh
         NaBNtnaLQXPc7EvMIRXy4zv1wXkChc/lyIzrcWKOdPg0OSEIHr5x8wt08OTWdtxhav
         w9saLFvdhFJoA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DAE2B609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] media: camss: ispif: Remove redundant dev_err call in
 msm_ispif_subdev_init()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580789.26840.2641254598135295701.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210409050633.671223-1-yangyingliang@huawei.com>
In-Reply-To: <20210409050633.671223-1-yangyingliang@huawei.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 9 Apr 2021 13:06:33 +0800 you wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] media: camss: ispif: Remove redundant dev_err call in msm_ispif_subdev_init()
    https://git.kernel.org/qcom/c/a24bbbf24d9c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


