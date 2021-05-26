Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882E639201B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhEZTFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235293AbhEZTFA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 967E36145C;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=h7Tvs+83VMKBDaJny1DJ1pgqhWghZhD1p7ibPZemgLY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=POogvHvxtlHAw84s8Zq2wVwGdUoQlCGKRiIni5MQdwjbJi+jC6BDe6h3+30oU2kp/
         etgPrfI4nKS8nk2U+rTtXxacmj4ykG7rLG944atjqQlyUeJuzN8kAk9HtSt2iuFP9A
         J2/gC47642cay3uwjTnjAJp6CLY4r3R6KUIA36Nve/0EfPiS7kpW+8jsd79tNCIIoy
         eUMyhaaJ3wY3xbQPjMQrJKqajCmHeGwXlhxAh5CSBNgKAdAwysEdKNP76PldNf/wuW
         MwnCuNAmxb5ne8crKl+cIwQpVI8II8937d0qveGe8xDwTMOKxWaS+IQH21WDoC955p
         l3/ft9yZ1D+bQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9091B60CFD;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: ipa: support two more platforms
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580558.26840.4831588370618753561.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210409204024.1255938-1-elder@linaro.org>
In-Reply-To: <20210409204024.1255938-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 15:40:20 -0500 you wrote:
> This series adds IPA support for two more Qualcomm SoCs.
> 
> The first patch updates the DT binding to add compatible strings.
> 
> The second temporarily disables checksum offload support for IPA
> version 4.5 and above.  Changes are required to the RMNet driver
> to support the "inline" checksum offload used for IPA v4.5+, and
> once those are present this capability will be enabled for IPA.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] dt-bindings: net: qcom,ipa: add some compatible strings
    https://git.kernel.org/qcom/c/c3264fee72e7
  - [net-next,2/4] net: ipa: disable checksum offload for IPA v4.5+
    https://git.kernel.org/qcom/c/c88c34fcf8f5
  - [net-next,3/4] net: ipa: add IPA v4.5 configuration data
    https://git.kernel.org/qcom/c/fbb763e7e736
  - [net-next,4/4] net: ipa: add IPA v4.11 configuration data
    https://git.kernel.org/qcom/c/927c5043459e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


