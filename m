Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6242C8D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgK3TBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:01:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:42538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729474AbgK3TBb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:01:31 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=OAjDvPyQrlqLUjHayaARkhtBg9G5vw4DSN4XWRGjqFM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Hc2myP/A/bA6bFCL3qzU+Cl81OLMFuSzKfvSCptRkjwTRL27dwr+VRpXTqdKpYEkj
         CzTwawnKljuws5Yu1+AytI0/8wrNJnlZCx1o+jd4LSb4GxcHoZWGciIUUbJ1SkGTt5
         tgi4S3iKIJdOL7n8qFqNn1BqL0D/whwx+PWypx5Y=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: c630: Re-enable apps_smmu
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280719.32741.956737485153721096.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:07 +0000
References: <20201124184414.380796-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201124184414.380796-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 12:44:14 -0600 you wrote:
> Re-enable the apps_smmu now that the arm-smmu driver supports stream
> mapping handoff from firmware.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 -----
>  1 file changed, 5 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: c630: Re-enable apps_smmu
    https://git.kernel.org/qcom/c/683227e5a34e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


