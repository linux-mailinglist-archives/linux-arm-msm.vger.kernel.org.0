Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE33391FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbhEZTFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235378AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2AE07613F9;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=IexQUsBHJKbH5pQk3eMTQBmasHokFIr/xvdBA8vKgNQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y8Xjqg9TFUu4d1UyxKH7QbkRGjjLPs/JrqNgulPBOh1NkuL24X9Vwbc9o/58qUc/N
         S2cL0MzhquBFfHy3gfiNkXbE7xriFwUeVlPhhqdsWKgkVufL0qVqsj6LZqBvkuP1rn
         QUgAJUu7kktL1ox3vsDjGjdNw/KJpnMoJyyycpI7ieo48yqcygzrm+sjbBLvWEm2O3
         p/6t7pqis/wf7FRlC+cERzvHElrmBdTdtQzdOXPkQqZi4xu8I8UC1W1eIXKQL+JsyQ
         ReinvBufRazprRpg+OdlvKXJF7CL+7D3b/gCH6PFtPO1BQ5n5wUlDn6Z4D1Sfni8bu
         64rWQ93Xpomcg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 26559609ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/2] net: ipa: allow different firmware names
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580415.26840.4619358802494393673.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210416130850.1970247-1-elder@linaro.org>
In-Reply-To: <20210416130850.1970247-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Apr 2021 08:08:48 -0500 you wrote:
> Add the ability to define a "firmware-name" property in the IPA DT
> node, specifying an alternate name to use for the firmware file.
> Used only if the AP (Trust Zone) does early IPA initialization.
> 
> 					-Alex
> 
> Alex Elder (2):
>   dt-bindings: net: qcom,ipa: add firmware-name property
>   net: ipa: optionally define firmware name via DT
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] dt-bindings: net: qcom,ipa: add firmware-name property
    https://git.kernel.org/qcom/c/d8604b209e9b
  - [net-next,2/2] net: ipa: optionally define firmware name via DT
    https://git.kernel.org/qcom/c/9ce062ba6a8d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


