Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BB52E7363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgL2UQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726256AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A34DE22227;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=alLjqClyJF97wOn0SFYrHfktJglfrMJWkYeY3Z/i6Hc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RTbm4t369mQ9lsflDUPJ9YyxU3uZntroyECzSOS0lE0hFErSnWXwo390MgOrQDDXq
         nO46Pxxwi3zp+l7m3BATENW5pHcyMFvgBclYozebUhVU95y49zK5aGekq5ubQBYm4M
         iMne+W7sYRmptc3LlKkhXuFYE1u1qpchVuLacj+si8kKdir9J0upYYCrd+7dbCxATB
         6ft5ILcRPH9++EdwueuEyU4W2LVQ4f5eh3sEwMQTRMdBG36KNbsfbRQQGUfeJI5Z6f
         VJkEdylPL6V+SiYDpyUom+FjjKYzzo/pXRJWH4BQ1AVsd3fsKmT01W/czmfTF4Edtr
         NqxtOXTnWcLuA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 93E12600D9;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] bus: mhi: core: Fix null pointer access when parsing MHI
 configuration
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293060.13751.3283185144981186265.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201102122710.23406-1-carl.yin@quectel.com>
In-Reply-To: <20201102122710.23406-1-carl.yin@quectel.com>
To:     =?utf-8?b?Q2FybCBZaW4o5q635byg5oiQKSA8Y2FybC55aW5AcXVlY3RlbC5jb20+?=@ci.codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  2 Nov 2020 20:27:10 +0800 you wrote:
> From: "carl.yin" <carl.yin@quectel.com>
> 
> Functions parse_ev_cfg() and parse_ch_cfg() access mhi_cntrl->mhi_dev
> before it is set in function mhi_register_controller(),
> use cntrl_dev instead of mhi_dev.
> 
> Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
> Signed-off-by: carl.yin <carl.yin@quectel.com>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v2] bus: mhi: core: Fix null pointer access when parsing MHI configuration
    https://git.kernel.org/qcom/c/f4d0b39c8425

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


