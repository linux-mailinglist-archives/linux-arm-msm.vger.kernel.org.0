Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889A2392032
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235374AbhEZTFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234987AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F3E7613CD;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=jx22dqf+3sVw3s/ltKDeSFW0CUq3QlIpK8imw+YPR9k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uwonnlW3gxoAltEDESvx2rIk6RtZuncHQnF3AaHsP74SkxhpnR+Q0t/4DaMFEqCOf
         hTHgkznpq9RYXGkObwi8VBmuZhhig8lTLL/5h2ctMAQCrMaro6XKZse8bZdAwfutKv
         ysMntQQXrDBTWrK6cE1oTfZ/bp2aPoxp3a6PZkhzCdI5pixheicXP6A2mTTydmNMgy
         Xqmdsd3yfmCCtomWdYyRyc7ZoAVR0sNhJCesj7uk/9qasoYV3GdkPL5Q2ar43moWyB
         KcLriIbweEvc581yw1OS1BzHpNv4W7hhJObkc4Z8vh7Kn2XxhMUzsKCclXECDzznsK
         r/rW+bNykvQZQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6B46060CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH v4 1/2] dt-bindings: tsens: qcom: Document MDM9607
 compatible
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580643.26840.16683778741815897978.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210319220802.198215-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210319220802.198215-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 19 Mar 2021 23:08:01 +0100 you wrote:
> Add the compatible for MDM9607.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> v4: separate from the main patch
> 
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - [RESEND,v4,1/2] dt-bindings: tsens: qcom: Document MDM9607 compatible
    https://git.kernel.org/qcom/c/957781612e44
  - [RESEND,v4,2/2] thermal: qcom: tsens-v0_1: Add support for MDM9607
    https://git.kernel.org/qcom/c/a2149ab815fc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


