Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC9E4B2B66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245027AbiBKRKZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245005AbiBKRKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62ED3B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3C2CB82B20
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFBDDC340F5;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=5FlOx99y4JPuvfJn0g3Z27LHSdDCxhlTvEt/rmFQrdo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vQ/rUhpopE1kIif8xjBgpqNuClasldCnC0ZTTurfWDh+qMktQbeF8TDwScnnZ1gDN
         wLvmnOu1MagwIjLqSbnFke5gKEzSDfno8SmeM5iE1xxXM7dyfzdHbyMjWGzrTK2L5z
         UNeVne45dtZZAMcjpKWizYJsz/3nrap+Vdgv9qAFLMfzZ8ncmZyPveC7brY2mE+FMj
         JvZNOlcy/usH7Z4X5cvQKIqE0JRSGD8A+gFNAutRuC6axUqSjIlpQYTf7wlYxhu99R
         8ILmEPtXnT5q7/qwSdDFyWayBd2CUGls8YuaCXBWuZHlt+QfS4geRewbitQhhDxr88
         NmkqUtuzGjsew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFC7AE5D09D;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC
 bindings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941884.13057.1869358263024795096.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <1644432308-21099-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1644432308-21099-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
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

On Wed,  9 Feb 2022 19:45:07 +0100 you wrote:
> Add device tree bindings for display clock controller on QCM2290 SoCs.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  v2: no change
>  v3: Include dt-bindings header (qcom,dispcc-qcm2290.h) in that commit
>  v4: Dual license for qcom dt related binding/header
>  v5: no change
> 
> [...]

Here is the summary with links:
  - [v5,1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings
    https://git.kernel.org/qcom/c/85cedb4e0c9d
  - [v5,2/2] clk: qcom: Add display clock controller driver for QCM2290
    https://git.kernel.org/qcom/c/cc517ea3333f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


