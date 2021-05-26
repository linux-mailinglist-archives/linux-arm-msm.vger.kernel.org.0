Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A3139202A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbhEZTF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233697AbhEZTFH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 169DC61454;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=JA4FzS5i8tiH217fq8V5nY7Ygyx4Pxk22F1UwecX8eE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NnAbChGemqMfrB9oyVhwLPW2At0GP2X5xqe2vDuGaSrleuSI/GcJjX1UfK+sC9PcP
         m8hY1rUmb/UTE3QunXVG+1ipjkEMC9hDgNphaViBQxhbLHhDDWGHDFfFBn5XzshTu8
         dkuWdVGiW324Cb5k737GRkouWGYHAu0JOSPU9thg9LazuYWRDy0OqWujGDhZ2uhWzB
         a3Fgl9TPas5pX6RXFoZCsoIO21T63YLd8VuooAhVgNY9OizJ3a5kXVIIqBltgI4Ydd
         VNpLncD4vfluHD/phWz9IsQ1xk7PMgJlA2Zhbvu7+bzH4J9lsdmEzPF8GzePgWSDHK
         CEJci+j4/j5bA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1277A60CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] scsi: ufs-qcom: Remove redundant dev_err call in
 ufs_qcom_init()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580607.26840.15868496537027898033.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210409075522.2111083-1-yebin10@huawei.com>
In-Reply-To: <20210409075522.2111083-1-yebin10@huawei.com>
To:     yebin <yebin10@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 9 Apr 2021 15:55:22 +0800 you wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] scsi: ufs-qcom: Remove redundant dev_err call in ufs_qcom_init()
    https://git.kernel.org/qcom/c/790f9a48abd0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


