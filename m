Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6896530CFB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 00:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhBBXKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:47844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235664AbhBBXKw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B007D64F7C;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612307411;
        bh=IESkDhS4ZSbUxT1xP1spr9GGegUy3w9N8MN+rnqt6Po=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S/04ZSwYCqa3RfRQzcH1c/ugeVpULACkSZ5LuPmsykInHQjoINHNAi5cvlOMiRQK9
         WdpN0MccPyge44tFnXmuwE0OADEAT/XKvnxsTFxnvuQdPEyeKoM5E+wbi0Ge368y1H
         KixHgJgTRJsDrlZ4qklotMjeLbiuPAgu/gqmOohrcnPq6e4odUKSA26B1CoVObryli
         KN7as9yYBy8AUQ2utLsDZn5Vuz4kcyZgbKvFQ2qqNih7NwsAX/M1uoFhYZk5/KpGTn
         8nD/D83cqrqCI4Wlb3Nv8osjd19WLNt8eDmvbog+e/6zHQzBYDvGw4oN9hhXy20hbN
         QyBoSkFjxdP7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A11D5609D9;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: msm8998: Use rpmpd definitions for opp table
 levels
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161230741165.30835.9604889364976503040.git-patchwork-notify@kernel.org>
Date:   Tue, 02 Feb 2021 23:10:11 +0000
References: <20210109160759.186990-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109160759.186990-1-angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 17:07:59 +0100 you wrote:
> The dt-bindings/power/qcom-rpmpd.h header is being included in this
> DT but the RPMPD OPP table declarations were using open-coded values:
> use the definitions found in the aforementioned header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Here is the summary with links:
  - arm64: dts: msm8998: Use rpmpd definitions for opp table levels
    https://git.kernel.org/qcom/c/7790114893c5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


