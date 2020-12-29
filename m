Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057052E73D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgL2USj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9C60922D74;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=01H43AY5XOkd0AjkCLEHICSSFMP6t0gPmuQT0S3bWXE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mh0BuuDiUmIcDetiB3UO9Piz5dSYQ8b9Glpyl6oFrjX7QmHHa6F/k6yO7xiQtprmA
         i2+To5RGzf523ZRy7UmZpRnLVbfuAs0RAzABno/VdN7TFn1aoXu/YOaqxsrVKAlPDf
         gJ+SjTiX3MTPc9ywknjRF/NaY5lYZF8xri+qk8+QzhKa4pNWSFCHHaveRaLQo7IAW1
         nYRUDr+FBm6okB02ODoXxY1vNrwsM/hKIUQgruVMHUW+KRD8DnDbYrBcVAAxf6PRJ4
         epQVp/rywELcr1Jz8nqb5XgtU2cdyDl12Fwbmm/eDSEBb8TEFZJbg2gMS1xukr5Tu8
         PPuvswR0VaDKw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 98A55600D9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid
 state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293562.13751.8232417541177087745.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 23 Nov 2020 21:47:53 +0530 you wrote:
> Fix enabling BCLK and LRCLK only when LPAIF is invalid state and
> bit clock in enable state.
> In device suspend/resume scenario LPAIF is going to reset state.
> which is causing LRCLK disable and BCLK enable.
> Avoid such inconsitency by removing unnecessary cpu dai prepare API,
> which is doing LRCLK enable, and by maintaining BLCK  state information.
> 
> [...]

Here is the summary with links:
  - Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state
    https://git.kernel.org/qcom/c/b1824968221c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


