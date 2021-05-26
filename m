Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B81392057
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhEZTFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234076AbhEZTFQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B2A1961584;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=sCFcLAr76q+wij4adskBOUG6DgoKaJGKsTM/0whirX0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UMgruQSsM3O+B7dSYR2svNMkPmIWluPKuOlOuxZ20TRZ56ITTfb6ouiu61G+z8zy8
         0TrVE4wNaJrDZmcVWnWrb6wfJMS0h45A2fisurZIcu5feVF05zWGqne24JfNYEZL0y
         2bL8Ng460+HdGyzyLIstHzEFAx5kFkorRQhO/CaKyK/eFxA2vRDmgRb2dtcNrruIPy
         A6eO7DefIPTvPwTrT4az+m3q8u4StMSruJGzsdGusndgoCf8I2kGDDHovq1KsXPcwL
         nlc/uNPPstRiMDSUrFt2aQEtBomuEO3tG7EmewMwp7XX9/i6EAgRexLEN5V3YGMoBc
         wXkP5/38gLhMA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AF117609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio
 support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580771.26840.10130887802810387153.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <BN6PR2001MB17966ED1D787FA3F4B90A1A7D95B9@BN6PR2001MB1796.namprd20.prod.outlook.com>
In-Reply-To: <BN6PR2001MB17966ED1D787FA3F4B90A1A7D95B9@BN6PR2001MB1796.namprd20.prod.outlook.com>
To:     Joel Selvaraj <jo@jsfamily.in>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  3 May 2021 07:47:31 +0530 you wrote:
> This patch adds audio support for Xiaomi Poco F1 phone. Phone's primary
> Mic and 3.5mm Headphone jack are handled through the SDM845 sound card
> and WCD9340 codec.
> 
> Tested-by: Amit Pundir <amit.pundir@linaro.org>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add audio support
    https://git.kernel.org/qcom/c/ab7f9be0e4f0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


