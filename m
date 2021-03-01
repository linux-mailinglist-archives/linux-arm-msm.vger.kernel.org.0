Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEA83292A2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243091AbhCAUtT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:55300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241032AbhCAUqe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7FF9F64EDF;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=hO8Dd83pLbkL/aGe2KUFKVi+BGypSLU4XWvIrdNIGmU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PcqdUoyaeWLU3wwIka4ZOj4V3WjlJROYFS6+HiaSvVjcFTYRLDSw7zTNZLyGbWu48
         1ThZrs1xhhS9AEGDXoWhuPcETxlLKNMp2WlbeXQFZAtyVlDjLVnAZIwk0iYKBI7hfL
         +rK4SbGB9+oUSHMfNSWAvIFuquB7hz5SzN5QRDv0jZYrrEK55kVYbyZBtnc5Q8XxE9
         1T4sndaP1SUvm58zOMUpV3fE4SysKdX6CfCs4QGtDEQCjXxUlCqnj50hF2gyqmUfcG
         h9EmB3aEJI06W31lFmOEtlrHV1GJA+zt3iDESEgtdW4/pR/+wbBxk7uRejzaGJjiYa
         OOqyosyvgbJjw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C7B260A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dma/qcom/gpi: Fixes a format mismatch
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878350.6187.31131978443400450.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20201218104137.59200-1-nixiaoming@huawei.com>
In-Reply-To: <20201218104137.59200-1-nixiaoming@huawei.com>
To:     Xiaoming Ni <nixiaoming@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 18 Dec 2020 18:41:37 +0800 you wrote:
> drivers/dma/qcom/gpi.c:1419:3: warning: format '%lu' expects argument of
>  type 'long unsigned int', but argument 8 has type 'size_t {aka unsigned
>  int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1427:31: warning: format '%lu' expects argument of
>  type 'long unsigned int', but argument 3 has type 'size_t {aka unsigned
>  int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1447:3: warning: format '%llx' expects argument of
>  type 'long long unsigned int', but argument 4 has type 'dma_addr_t {aka
>  unsigned int}' [-Wformat=]
> drivers/dma/qcom/gpi.c:1447:3: warning: format '%llx' expects argument of
>  type 'long long unsigned int', but argument 5 has type 'phys_addr_t {aka
>  unsigned int}' [-Wformat=]
> 
> [...]

Here is the summary with links:
  - dma/qcom/gpi: Fixes a format mismatch
    https://git.kernel.org/qcom/c/8fb28795fb64

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


