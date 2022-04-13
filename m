Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333944FF8F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 16:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbiDMOcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235964AbiDMOcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 10:32:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD3E40A27
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 07:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CB4161BF4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A67C385A9;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649860220;
        bh=V75yZDRJ720Ns99VAjDz704B7sclmUWgBnHn2xFVeB4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=oWfeNLkTYU2UMLGBL5t4Jiifp0ApYQGTViz4B+zBysjYTLjpv3G9H3MkVPZ0/mZV0
         8O19KL1WO5bUTDUnOQvJ7kH0Op09o4m91fDmkPew1PD074Dr/PXmXnxGo4CnHdCyLk
         4MHtlLbQ5M3Xxm/HSApgJvoZxNsqT2M3wveVKgfI/UloDgXnhM74aVLtZT71hTCA7v
         5l+hy2C0dM/hMDh0RiDhTqpCu71w4ZpNMm4pYHLySycKEB6rSLtIDrV7c2KGTwmNwP
         xaP+JqExOSbuCkCw3lf7n6mC/QCtWipzaEA7zLAwFkbriyUjbW7/AAfFVXc7+A9RYo
         C+5hZYX1z8HsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9511AE7399B;
        Wed, 13 Apr 2022 14:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] *** Add SCM and mailbox support on MSM8976  ***
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164986022060.5431.2961075832670463813.git-patchwork-notify@kernel.org>
Date:   Wed, 13 Apr 2022 14:30:20 +0000
References: <20220305164906.16853-1-a39.skl@gmail.com>
In-Reply-To: <20220305164906.16853-1-a39.skl@gmail.com>
To:     Adam Skladowski <a39.skl@gmail.com>
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

On Sat,  5 Mar 2022 17:49:01 +0100 you wrote:
> This patch series adds support for SCM and mailbox as found on the QCOM
> MSM8976 platform.
> 
> 
> Adam Skladowski (4):
>   dt-bindings: mailbox: Add compatible for the MSM8976
>   mailbox: qcom-apcs-ipc: Add compatible for MSM8976 SoC
>   dt-bindings: firmware: qcom-scm: Document msm8976 bindings
>   firmware: qcom_scm: Add compatible for MSM8976 SoC
> 
> [...]

Here is the summary with links:
  - [1/4] dt-bindings: mailbox: Add compatible for the MSM8976
    (no matching commit)
  - [2/4] mailbox: qcom-apcs-ipc: Add compatible for MSM8976 SoC
    (no matching commit)
  - [3/4] dt-bindings: firmware: qcom-scm: Document msm8976 bindings
    https://git.kernel.org/qcom/c/a175c6faaa36
  - [4/4] firmware: qcom_scm: Add compatible for MSM8976 SoC
    https://git.kernel.org/qcom/c/34128350b838

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


