Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CC92F8E6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jan 2021 18:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbhAPRpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Jan 2021 12:45:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:36040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbhAPRpF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Jan 2021 12:45:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 49667229C4;
        Sat, 16 Jan 2021 15:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610812208;
        bh=grg8ayiVRmUz/32WJyq5jr2aCHXxERLvYWNEjQ8CPsU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fyoTBtw96QE9+Z94Qy+j4AELySGrnqdj+An9OV2OZbeb27oc58FiWJ4DML+ptFVg3
         ZnsyJjQI5Lf+OKvxh/dXionKp6tk9bOkXLSX/iUqXZDY3+1A4pG/X0+QZ0kf6Csv3Q
         LDQ0X3Jfn8jrhCY7fQX6QUbdplSd6hwKil4TLum/gMqG333mvSxY6y9toOEuGGrLM6
         SgyfJn26B5qiPysXGP8udDZuuplgAsnV09QBgK1pQslnDoa2Y2ZuRXGzRzTUl6RGlN
         iOJZ2TIkjeODl1fgocRZAsurUdHChrTLAkqT2J8cMBGqVgGz8ER06XQvZmxtMbN98+
         HlOjcI+fjToyw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 3EDA960593;
        Sat, 16 Jan 2021 15:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: sort nodes alphabetically
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161081220825.10852.2427635591741732178.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Jan 2021 15:50:08 +0000
References: <20210116002346.422479-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210116002346.422479-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 16 Jan 2021 03:23:46 +0300 you wrote:
> Move swr0 device node to keep alphabetical sorting order of device tree
> nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 40 ++++++++++++------------
>  1 file changed, 20 insertions(+), 20 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: qrb5165-rb5: sort nodes alphabetically
    https://git.kernel.org/qcom/c/0fb56bf95c76

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


