Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA5C39696C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbhEaVvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231629AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E96561008;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=MCDyFGNZDCzXhInzpBK5aS6+jvBmmJXTB7DLdS6DRrU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=m9FquWSV0PrjIgdLqf9AdZCpHD9h5wz5tP4VcqTpIwwkzXHKJVLT1bWJFriTCQkIP
         b/343ufsiKGxEVjLmDxLdxHlTMorkkTMX2Iw6KYKR5fbZm6M8vKHKsRORy6/p1J4Fh
         8ZKFQsqh3Fw5AfrYKRS/WJEO/93ydYnvsyPq1LwD1OyncxVOUE5qs1Bcj/T9bv4vaV
         t4gSAg2mNwQ8s/XFAL1rQUuZnZ19RU+NnzI7FgJbDuK8st1NHqjcT18rhWvHPuq0zn
         +efxnjLPzBKYc1zugbXEldLMiuxAb/OW5l3U8I+W5VxSzamGXiPnjXm07DSut0LvmO
         ZPpqCnyvKX2AA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 279DA609CD;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg
 sizes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780615.3521.5394871727384533839.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
In-Reply-To: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 15 Mar 2021 10:38:54 -0700 you wrote:
> As per Dmitry Baryshkov [1]:
> a) The 2nd "reg" should be 0x3c because "Offset 0x38 is
>    USB3_DP_COM_REVISION_ID3 (not used by the current driver though)."
> b) The 3rd "reg" "is a serdes region and qmp_v3_dp_serdes_tbl contains
>    registers 0x148 and 0x154."
> 
> I think because the 3rd "reg" is a serdes region we should just use
> the same size as the 1st "reg"?
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg sizes
    https://git.kernel.org/qcom/c/c1124180eb98

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


