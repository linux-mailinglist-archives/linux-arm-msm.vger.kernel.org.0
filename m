Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27123292B2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243607AbhCAUtr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243624AbhCAUqp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A08364EE4;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=DdJBme8mXr1Mcgpi4F50SirR042ehBDzCujKNycXm8Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X7Nmv7nvpcANI9uEJZe5QnmwK/nn3tI+jwL5B4YToiGpQlA9ovBN6JTBMeAqy/qOA
         n4nzx+0tqi1k/tOPWvyNss7u6C7kMzbu9M+ucFXFknX8oEn6Gf4VmQe6oIRXGka0Ja
         FYpDTr0YH70KpiM/YHTljrpLtOK7sMPBWBBThKXWCjgB+o06dkQIpFEDiuYJkzTueo
         6Q9wvXhM6FVMEon89XTcRxCTAr5Uv6NAO/2kHccR5ASfgOFl047RujinwFZumrLLEZ
         kSXb5m1wlTLbvFl6DUV93emxF66W2tpOo9aZRil84+p/qQRKYC8mbrCrseXtsxKUlv
         uW/0F095eqLRg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 951AB60C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] [REPOST] dt-bindings: qcom,pdc: Add compatible for SM8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878360.6187.2247423788355381184.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210115090941.2289416-1-vkoul@kernel.org>
In-Reply-To: <20210115090941.2289416-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 14:39:40 +0530 you wrote:
> Add the compatible string for SM8250 SoC from Qualcomm. This compatible
> is used already in DTS files but not documented yet
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - [1/2,REPOST] dt-bindings: qcom,pdc: Add compatible for SM8250
    https://git.kernel.org/qcom/c/e6f93c0115cb
  - [2/2] dt-bindings: qcom,pdc: Add compatible for SM8350
    https://git.kernel.org/qcom/c/9eaad15e5a40

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


