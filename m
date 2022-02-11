Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C144B2B62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237598AbiBKRKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243619AbiBKRKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B60A2E8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 21AB1B82B1C
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B42D0C340F2;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=Ny1zcQi8Ihz8Fno1cSsNFRH5kKdp7Rw+HD4W2C8Nvcs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NKMZYx3qyFSE5hywbWTNmJmFxmfbEbr5FrCGaBBZyVmHDk56qUcZ+Z0Vfx/LdG9LC
         2zfiVbxzoR7bZNlNoGGCf8Mr+MR1hu3prpYWBANWwGWD9oPmLyJkamV9duQ/ODx+yv
         KnbOE7LcFUR6qsrlZGZxbcNM8JDPSEA0Uz9kCnvlE2Evz377Pjq6e+4Q0CX/h31Hgm
         Tetuy876S6YxF/lEXTz+UbulgHT/MUyeosFf89/9lZFPrrr1U7mGDtlR3Pm5bp+ZC+
         NNk1CLxNfDXqYbGODOIjsqk/f1sXluwtU2XtT1qDtfBfaJc/4+iuMnNQtZ3+2aimsK
         2kv1dgxvkqacw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E859E6BB38;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Enable the GICv2m extension support for IPQ8074/IPQ6018
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941864.13057.1750256785835656193.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <1644334525-11577-1-git-send-email-quic_kathirav@quicinc.com>
In-Reply-To: <1644334525-11577-1-git-send-email-quic_kathirav@quicinc.com>
To:     Kathiravan T <quic_kathirav@quicinc.com>
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

On Tue, 8 Feb 2022 21:05:23 +0530 you wrote:
> GIC used in the IPQ8074 and IPQ6018 family of SoCs has one instance of
> GICv2m extension, which supports upto 32 MSI interrupts. This series
> enables the support for the same.
> 
> Kathiravan T (2):
>   arm64: dts: qcom: ipq8074: enable the GICv2m support
>   arm64: dts: qcom: ipq6018: enable the GICv2m support
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: ipq8074: enable the GICv2m support
    https://git.kernel.org/qcom/c/59892de947f0
  - [2/2] arm64: dts: qcom: ipq6018: enable the GICv2m support
    https://git.kernel.org/qcom/c/3d44861d006b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


