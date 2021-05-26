Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA1B392056
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbhEZTFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235827AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A9E6F61476;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=UxR5pArT0RQ82h4C8On7DdWC9Cj29REHFdXDpjgIfEk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BY1qhefNa/B6NSsqAlIRKbeGoDnsSUEIpo2x1oGq26sOhGXi28jndDSd5ER16gQua
         pOaFVurV3kBpVIQJ525KyDjmIxXm9AgS6gDiQxXeiJXVAIyxaJUr/Y3forFm0eZaL/
         6Y0npnrzMQev+NREEIlbqlx8hMCrBgvW283L1uxZwJYik8Yai11/3l5ZqDVTJVSTNj
         a+N7c4kGJQiY3Ff/R24qFi7X+nXZuHTk9cpr56WDUXxWvEkUMLavrt2RtN1jfy07sL
         eo8a6O9zkGRZzRr0KCszJPSilPAN0eXS/oaeOtR0bOl1MRdypHg4s2bJsQ+jFMp4I4
         Azye8EeQvNBkg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A641660C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] thermal/drivers/tsens: fix missing put_device error
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580767.26840.4347400201447469254.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210404125431.12208-1-zhuguangqing83@gmail.com>
In-Reply-To: <20210404125431.12208-1-zhuguangqing83@gmail.com>
To:     guangqing zhu <zhuguangqing83@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  4 Apr 2021 20:54:31 +0800 you wrote:
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
> 
> Fixes coccicheck error:
> 
> drivers/thermal/qcom/tsens.c:759:4-10: ERROR: missing put_device; call
> of_find_device_by_node on line 715, but without a corresponding object
> release within this function.
> 
> [...]

Here is the summary with links:
  - [v2] thermal/drivers/tsens: fix missing put_device error
    https://git.kernel.org/qcom/c/f4136863e889

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


