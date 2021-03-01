Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F289E329304
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243756AbhCAU45 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:56480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243851AbhCAUxE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7082B64F20;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=KE/31qFA5VSZ/aMBjJ22wiKAo+RUuo38+WmdwnNQF4M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ughciS03mMBB1wrQJ4Th1b4R2ljCh4SM6Wa0gr3tdDATTc7/wQoe1zmGYMRJVTiIH
         B/HcFEYowkT1ucEnIPd8o9EyliO/SRomZTuNFZtLlQFqAXR72niM2Rvoi5v/sAqmi4
         YRsRNisOnu0ZmLrVjCBY70+HG/qJYR/JOehmqEjv312h4uyezOFMVPntbBLlLzXCgK
         1CcWYd8IfD8cyODavGj8cYNwcklgnO72Zd1wJhFbGmrouKojxcdO72SbXPQBTFwqUw
         E9hOxV5HuU0ZZGSC3OexwW8gcYmjgCnT6cY//SIz05CCj77cFh23+RXFtg+Gw+VKCe
         hdwW4pPDOocgA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6CC4560A1B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] phy: qcom-qmp: make a const array static,
 makes object smaller
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878544.6187.18387891783679205589.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210204180313.108876-1-colin.king@canonical.com>
In-Reply-To: <20210204180313.108876-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 18:03:13 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array cfg1_settings on the stack but instead make
> it static. Makes the object code smaller by 24 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   73585	  20240	     64	  93889	  16ec1	drivers/phy/qualcomm/phy-qcom-qmp.o
> 
> [...]

Here is the summary with links:
  - phy: qcom-qmp: make a const array static, makes object smaller
    https://git.kernel.org/qcom/c/43851904cbd7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


