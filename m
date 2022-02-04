Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25BF54A9F52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236191AbiBDSkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:40:17 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:39650 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237689AbiBDSkQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:40:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E73E1CE22A5
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 18:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C87EC340E9;
        Fri,  4 Feb 2022 18:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644000013;
        bh=s0BReo44MRBzshhBFubW6Ka/h/U8ammrRefD7hvZi3Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hsrOSOkNzhvFippCwiAEUfuXF3KIW60vi5TGogiALnJluV4wDK1tZFdr3uAgzl8dR
         H2I+2Ki+WMsHeLyVuAL50ICmJR/k/jR3p+011xcJ9xnHe15zB9BRkaqg/ps3gc7Bms
         6WvdNXbTU4gZe8N8IlbXi4y/Mq0RBCYDHw7018XvdDWxrFh+tQnwCoCgnUBi6hdxqu
         pZ4/9sYv0Dwpk7Fl64EKm0s0GIEIOMirT7uuEfFEViXb6Z///ArVYN53ehM9wx3pMD
         oCRpgosxeUkANEnaF4WeCpOsgayuTBUVOTUrhkLjoavvfteFraE59AhAlTFP7KKJyq
         T7TEESkVTElTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EA192E6D445;
        Fri,  4 Feb 2022 18:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: add IPA qcom,qmp property
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164400001295.8570.5009320766832642337.git-patchwork-notify@kernel.org>
Date:   Fri, 04 Feb 2022 18:40:12 +0000
References: <20220201150738.468684-1-elder@linaro.org>
In-Reply-To: <20220201150738.468684-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue,  1 Feb 2022 09:07:38 -0600 you wrote:
> At least three platforms require the "qcom,qmp" property to be
> specified, so the IPA driver can request register retention across
> power collapse.  Update DTS files accordingly.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
> v2:  Add devicetree@vger.kernel.org to addressee list.
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: add IPA qcom,qmp property
    https://git.kernel.org/qcom/c/73419e4d2fd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


