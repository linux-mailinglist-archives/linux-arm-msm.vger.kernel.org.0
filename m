Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1880C2E73CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgL2US1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C34422D71;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=eCDXGCDTR2v8CZptL3iphyzg+WQfN7hXUpO0vD35Xi4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iHLGY0wsrPZSagiyZi9tSCUwe4lg6gRMvut8ePVf4kpx5mTY5c7WquWwaedV2lnOr
         W9NNlNGrxwqhd9cgS+Tj8T6ZsiITanMSZE0xvJ9OC9tixvn1UukT8Hg63E4w/p8Klf
         UwLOinzonc4anQBf31D6PLE6S3cH3vhaar4qMsFg3MIKpzTxy7pac4rlatQ4Eq9knb
         RjDKRmeBfxHNTErtZiqq9lLXLmaWBtS5rknDXYCwWrJHdgcduM4kpx1wrlfmHaLjOd
         X+QKedfGObUCi/LDDVU8yUwHBPA0V/lbzlVzinb0l9oeij6hbT7GbMwN3TBdpofOvR
         NWuSnYUypa9nw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 77D9E604D7;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293548.13751.3624236312769125982.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201215020004.731239-1-swboyd@chromium.org>
In-Reply-To: <20201215020004.731239-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 14 Dec 2020 18:00:04 -0800 you wrote:
> We shouldn't put any pinconf here in case someone decides to invert this
> HPD signal or remove an external pull-down. It's better to leave that to
> the board pinconf nodes, so drop it here.
> 
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Fixes: 681a607ad21a ("arm64: dts: qcom: sc7180: Add DisplayPort HPD pin dt node")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Drop pinconf on dp_hot_plug_det
    https://git.kernel.org/qcom/c/8d079bf20410

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


