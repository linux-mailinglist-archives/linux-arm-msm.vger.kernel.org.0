Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 782C14F96FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235678AbiDHNjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236406AbiDHNjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12457AE70
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 691DC615BE
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4BBAC385A9;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=f6ONX+UZeWgKE0k43KKH53C8VZhhFiFxeR2+AyoWCWg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cB5i069+2ySMKkC45RQXGybk/ycqH6Epl6fn+phhUL3DvMv9U6NQDSfYCWr0CEB6M
         GQbhS1YLcxD98X3WGdK2IqQIuP8P018JqbcKpHr7lpWLcsKENXOilw8Wsopmyxy1hp
         pECE9SdnnHgDyHxLooB47M+5e1b4ArG30RDR5TUr7AfN4tDuFcmJcmL2oZnNs/qnKE
         EV+GBNe4zCQ+/fnnMCGv7GeuNVhGCkq5xLzM1jOqOu9CunaZkojN9kz3kk8n50sio3
         8r74jwq+ncgYGc54k1hHJeFql3voasyYr8LTCyRTjCsmX4+H5mJQSbyn2bZ78+B1AQ
         wpm3gz3wvF5xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A060E8DD5D;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] Add support for PDC interrupt controller for sm8150
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504962.26125.13524005176198289737.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220226184028.111566-1-bhupesh.sharma@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Sun, 27 Feb 2022 00:10:24 +0530 you wrote:
> Changes since v1:
> -----------------
> - v1 can be found here: https://lore.kernel.org/linux-arm-msm/20220119203133.467264-1-bhupesh.sharma@linaro.org/
> - Collect ACK from Rob on PATCH 1/4.
> - Address review comments from Maulik.
> 
> This patchset adds the support for PDC interrupt controller found
> on sm8150 SoCs from Qualcomm.
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: qcom,pdc: Add compatible for SM8150
    (no matching commit)
  - [v2,2/4] pinctrl: qcom: sm8150: Specify PDC map
    (no matching commit)
  - [v2,3/4] arm64: dts: qcom: sm8150: Add pdc interrupt controller node
    https://git.kernel.org/qcom/c/a88c86f831a7
  - [v2,4/4] arm64: dts: qcom: sm8150: Add PDC as the interrupt parent for tlmm
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


