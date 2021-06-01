Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCE439778B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 18:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFAQLp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 12:11:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43720 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233768AbhFAQLo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 12:11:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 847B460FDB;
        Tue,  1 Jun 2021 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622563803;
        bh=FqDyhuyexAJbFlkDJjUijytFpIQnW4TA6Jkb8t2EF7M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ISqDJbd/TQKD5QbM+8ILu1RpQkL1lY4DVrUFnspFBleBXzcJjtWdrygzBXW5VErVQ
         usNWnlqN8AFX9cX2wFZZe1QBTOnH0NmKAfdzrrKN1OjSAKypsAwYonffdP2lpS5QAK
         12tANzj2I6eA69tNDuwPa6TdHe6AhFE/NvSwGR502B5hRbCVwDNeOuf6PomzxuK1cw
         IdW3I40GiQ8G1frTJcd7L65XWs6o+P6JpF5Ee9GYRTU0OtQsYDVhdOWamSGHgdVFyQ
         y0tbai18GcLYh5nqXo99uKKprgJugAOmjm1TlRORBGGyavNMPj73T/O/x3l8odYzZl
         HD3RXRCRGszhw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 73641609F8;
        Tue,  1 Jun 2021 16:10:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add label for secondary mi2s
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162256380346.7899.3390626307805047193.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Jun 2021 16:10:03 +0000
References: <20210601022117.4071117-1-judyhsiao@chromium.org>
In-Reply-To: <20210601022117.4071117-1-judyhsiao@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  1 Jun 2021 10:21:17 +0800 you wrote:
> Adds label for MI2S secondary block to allow follower projects to override
> for the four speaker support which uses I2S SD1 line on gpio52 pin.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sc7180: add label for secondary mi2s
    https://git.kernel.org/qcom/c/ad7395c7482d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


