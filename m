Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18152E73AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgL2USF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:60244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgL2USE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1799622CAF;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=X/CQWSBQ8yivkvKPzMOs4Hvl2uppIr1rHHZW468Wv/8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nngmrC+RFQyEa9N4DChzHz1Yn702G/FZDpIrkxoa6LnwmIvC8Benff3JwYJ6cxAbf
         D4j76CGVQ7k2r/4K6jbD5Y3tuV4EOZwa4jic4oiwKKaO4VTQitraB8x9Tv3IYeT+V5
         g6M+Y/OEVGSaIQlVuJ3atxLHGDvEcyR+UJIKsAZsgwpszaPNXor0FGZq8xozW350HR
         dBNkKhbwPmZPRb96mK38LjtZolStfXO/TpPID5ggQ/meiWrh8acovGNbdWRRJH8Gly
         1Nl395n6aieGsviRcBeuqnax5X0Y9Xeg115PXQaBYcYC1D/Rd6HIjUGeJdycFzI2gp
         8NaPTr89fd+Pg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 12C8460591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] slimbus: qcom: fix potential NULL dereference in
 qcom_slim_prg_slew()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293407.13751.11227212306181437990.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1607392473-20610-1-git-send-email-zhangchangzhong@huawei.com>
In-Reply-To: <1607392473-20610-1-git-send-email-zhangchangzhong@huawei.com>
To:     Zhang Changzhong <zhangchangzhong@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 8 Dec 2020 09:54:32 +0800 you wrote:
> platform_get_resource_byname() may fail and in this case a NULL
> dereference will occur.
> 
> Fix it to use devm_platform_ioremap_resource_byname() instead of calling
> platform_get_resource_byname() and devm_ioremap().
> 
> This is detected by Coccinelle semantic patch.
> 
> [...]

Here is the summary with links:
  - slimbus: qcom: fix potential NULL dereference in qcom_slim_prg_slew()
    https://git.kernel.org/qcom/c/428bb001143c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


