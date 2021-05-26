Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ACB391FEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbhEZTE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:40940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhEZTEz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BB06B610A5;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=E+5R5eRIEVbPs1qX7QabgmZldRLNeFtGLzvF2XOemu8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WA5rU7I1OcKcLtWtKfSMjH/ezK64d6n/7Cr8qCSoxfuQpb2UGQ+/GfjL3CVsbm5V+
         5MJ98Lb7WlU3IJQIyLD2GSfmKEp4i8OYO5GT3oV69B7zgtnKa3uEHyrUqCUDjCyObX
         d8Db1p0/KvkMKADwFsPeUi99vvDhGS4rmlGDZYRAeHlBuvwE6YDwyuIIaYGrtd4inq
         3flwMQLMRDemruZlVaeTqwB13fZOAMAP++2Fwd2jd6tOD40bJbhbkyOwBkrDY8+01w
         lgHRhXStxnX9729mV88t0mJw5kseEWTGoDfs4D1n1UajtcDkqugt2sb2TKwn+tehZb
         xVt6Pc/aMCG3A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A6DE260CFD;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and
 friends
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580367.26840.16108917029124746525.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <20210308164845.3210393-1-vkoul@kernel.org>
In-Reply-To: <20210308164845.3210393-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  8 Mar 2021 22:18:44 +0530 you wrote:
> Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
> PMR735B GPIO support to the Qualcomm PMIC GPIO binding.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Here is the summary with links:
  - [1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and friends
    https://git.kernel.org/qcom/c/975bad7cbd34
  - [2/2] pinctrl: qcom: spmi-gpio: Add support for PM8350 and friends
    https://git.kernel.org/qcom/c/57c0a4f0a071

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


