Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572E34FC645
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349986AbiDKVCh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349990AbiDKVCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0B02A734
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C709AB818C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A01CAC385B4;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=BiidwxOKvqieABPU5HlxEm0ArhT5zs1iBTLdDXamfBA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cstYtg6t4C0QkOd6KwneqC6joojuu91hIBt8fRoBnk2O5bnVL22H9R6MRVQu/+Qe+
         GFtf/bM2aFyL8FUZ1AXRORjreibzqYVYPha6s9NDdy31w8E8PkEBkyRSQC3Dq2TKmO
         QNjT2L+2b5ApLnFUaqUAMGrV1Tw2Z5PacPExPgo+dAgL/Apk/8sReFh53I9n53xjAS
         M3PTE+lYO62w5MHMyDkMrdX3euvmMyc4hnz3IVoxaizEDtuBYoWG3ykr9LE1VeKOXd
         5dO9rVsU7MmP3WpH9VjpdHvlM8+VieVn3HBhrhcwiQMitqnUB67lNOpPPfoTFzl8Sc
         xe+Kn0RLU1fvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 86350E8DD68;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dt-bindings: arm: qcom: Document sa8540p,
 sc8180x and sc8280xp
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081554.4542.14180103928679946084.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220225035415.2294821-1-bjorn.andersson@linaro.org>
In-Reply-To: <20220225035415.2294821-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 24 Feb 2022 19:54:15 -0800 you wrote:
> Add compatibles for the sa8540p automotive, as well as sc8180x and
> sc8280xp compute platforms. Also add compatibles for the ADP devboard,
> the Lenovo Flex 5G, Microsoft Surface Pro X and the sc8280xp QRD.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] dt-bindings: arm: qcom: Document sa8540p, sc8180x and sc8280xp
    https://git.kernel.org/qcom/c/a1793920b664

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


