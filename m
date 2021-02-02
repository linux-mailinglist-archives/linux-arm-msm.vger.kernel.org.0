Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCB830CFB7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 00:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236080AbhBBXKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 18:10:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236083AbhBBXKw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 18:10:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B8D3F64F7E;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612307411;
        bh=7ID+NXvrqRMiLRF/zfoDdzan+W2EoErOOb4FK8eH7M8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S+u2JPtURrV0p2gEO+W+5DWtsnlJpCunh4jUpP6sSJorDob8cv1l2WX+pogh86Qhc
         Xz3p5vEanWcYoyH97vf9lBtOyMVvKXPKv4jhKVebW1l/RTXymmcvBRQ9NjuBjO3VRP
         a7IRzXWGDN8ogyfQ0wYve40GUKNV6ywqdRJdAY7Ph2jn3mNSqPZvrfPl/Ez5SVU9rB
         4cPs2bWyKSsgFjYKz1ODvoa11m2rylglX/C7olSnz0eydXKbZ9Io5haPJT9CdUGv8U
         O1DWpCNPJqaGnGmuJBfW1i3oFxkUgD+PM1bTr/Z1EA7W+YIDe/yoI4JSi/jLbUzxs4
         FFdIu2WPojxOA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B13A7609E3;
        Tue,  2 Feb 2021 23:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: msm8916: Fix reserved and rfsa nodes unit address
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161230741172.30835.4820347407809901503.git-patchwork-notify@kernel.org>
Date:   Tue, 02 Feb 2021 23:10:11 +0000
References: <20210123104417.518105-1-vincent.knecht@mailoo.org>
In-Reply-To: <20210123104417.518105-1-vincent.knecht@mailoo.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 23 Jan 2021 11:44:16 +0100 you wrote:
> Fix `reserved` and `rfsa` unit address according to their reg address
> 
> Fixes: 7258e10e6a0b ("ARM: dts: msm8916: Update reserved-memory")
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - arm64: dts: msm8916: Fix reserved and rfsa nodes unit address
    https://git.kernel.org/qcom/c/d5ae2528b0b5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


