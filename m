Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9686C430046
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 06:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240909AbhJPEmR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 00:42:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:42760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239415AbhJPEmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 00:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2519460C4B;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634359209;
        bh=jUFZESKVN1XHUCj+bpT+O5sAJenKLPZablX6XolM8VI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XN23NDcq7YyrSuS+93vyW00KgBIDs/YKiRzeCGlBhZmiYm1lgdxcfADl/TxMVq7SS
         zDaOdhAH4lLt2T3iXYI9tAqtB1GC6O4ssboGlcaiAkWZzKbePsPXb8Uhvd5Iej6ntD
         H1DLewTYbVRQWxHwgaKEsg8zjoRrsLpf3CfRfL7Se/rtKxec40xmEHhU3ZxuVxdZMc
         aOag7gANcxLuV9d8SyQbtCxJgsPbeVGnqlauZ/qcFhDuAmPlzPd16EO0PIa09igMFU
         B/tnw6ARn51RdlQVbPNtJjwyoVi+EaTnveFKoCZXNH5mRSUDkPi1kOhh81el7R5tGC
         cYfFELW0iZBhA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0D076609D3;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Disable firmware sysfs fallback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163435920904.10607.17977705611055726519.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Oct 2021 04:40:09 +0000
References: <20210930215300.60290-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210930215300.60290-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 30 Sep 2021 14:53:00 -0700 you wrote:
> Part of the enablement of SDMA on the IMX platforms, '7f4e4afa140c
> ("arm64: defconfig: Enable SDMA on i.mx8mq/8mm")' also enabled
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK, to allow "firmware loaded by
> udev".
> 
> Unfortunately having the fallback enabled does, due to the 60 second
> timeout, essentially requiring userspace to provide a firmware loader.
> But systemd dropped the support for this interface back in 2014 and
> because arm64 is the only architecture that has this enabled, there
> doesn't seem to be any standard solution available.
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Disable firmware sysfs fallback
    https://git.kernel.org/qcom/c/5c1c3e2a7693

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


