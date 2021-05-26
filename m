Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C8F39204A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234529AbhEZTFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233995AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4571361481;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=hdYo18iTv03NpGs0uQt4FNl3UP5NeL22RXyIThCnxRo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qFMZitZR26ef73kWxI8Rfc/Q4ITObDeVF/bDAxIEWyujY4gZat3+V6twfEnpeANRr
         Y8GoYj6QLvUFQ7A8gydoSIb8k+EdK+qWlhZidZO80jaXUij3YZUAkYhJ3YkfsVL+bd
         qJv6B6MumRUeuHFrfRJZdYAaM8t8NPWKBGJWf587Qb2qcLq0k0HK0gnwnk/28wGSA9
         PgXMEYF5EZXXfqbguuelYItt6jTrvuAYxpkdTaG4csce70xB/H4eQ4K0ICrGncNlhT
         phwU5XlYbsFomS1UfZa29gkLpWYTkq0WaIpHbMCvGl/YR+u30ZhDg25YcFDcLWqP2E
         2+zPbsC/Pq+mw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4158B609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] usb: dwc3: qcom: add ACPI device id for sc8180x
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580726.26840.14222162706655749903.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210301075745.20544-1-shawn.guo@linaro.org>
In-Reply-To: <20210301075745.20544-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  1 Mar 2021 15:57:45 +0800 you wrote:
> It enables USB Host support for sc8180x ACPI boot, both the standalone
> one and the one behind URS (USB Role Switch).  And they share the
> the same dwc3_acpi_pdata with sdm845.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - usb: dwc3: qcom: add ACPI device id for sc8180x
    https://git.kernel.org/qcom/c/1edbff9c80ed

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


