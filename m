Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76A2396969
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhEaVvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:39194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231436AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1F4976128A;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=yNAMnN1gt+488L38RcG8KdiOG9ZWR0GC5YVAyW4GiC0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=F1ivwnREtPTEkKV+gw6mUJ+oMV619lTe5WE7BjVX4ScCWdcKJyxXQ1ojF+tim99Kr
         TI+vPXWONgbO16HcCTq4FR/irl4SO4kA/X7TOdGhh/mcm2RfjCFyNvC/jOpbUoJspG
         YoM6u9z/6TrvKPJHEUnoDVgz5kQDVOz3U4OvPwNExjLDiGMF6/zJqqXH1r3tQqwrWB
         OsSDYO7RpSVtV1eL2xybrclb2hkBtKn9suXAjEjbLXQesSgzkbpchF+BWgmNPYjIuE
         c2ByviGmJv6nzP7KOMA6SiE6r5ysVS7/+iP5L3+zAaz7uWaeVKZkts56y7NIOArrBq
         T8n90BH/sDXHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1587560A13;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Fix
 gpio-reserved-ranges 85-88
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780608.3521.11798267180228326049.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210415193913.1836153-1-petr.vorel@gmail.com>
In-Reply-To: <20210415193913.1836153-1-petr.vorel@gmail.com>
To:     Petr Vorel <petr.vorel@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 15 Apr 2021 21:39:13 +0200 you wrote:
> Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
> application CPUs (causes reboot). Yet another fix similar to
> 9134586715e3, 5f8d3ab136d0, which is needed to allow angler to boot after
> 3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").
> 
> Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")
> 
> [...]

Here is the summary with links:
  - [v4,1/1] arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88
    https://git.kernel.org/qcom/c/f890f89d9a80

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


