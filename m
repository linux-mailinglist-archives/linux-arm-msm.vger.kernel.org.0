Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1EA24F96EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbiDHNjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbiDHNjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56AE91D2070
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EA8F4B82A8E
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B35FEC385B2;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=9H+iGijboVkFgKhKCQWkDHreqexB+yXtj33jimoe+n0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QJ+Qxlm1o6+aUQWOsxYshhEucgF08Y2PZ07RkjPscsqg5OXn96OjDjoYUphnM8joK
         VtXygkLTPR2fDh51PzGGBTSqX/qRSq2M1M86+w752xVWMr6UP6WBq1r3P1x83SUsm9
         excXimIQ6IC3eni0TJydgRVlViFZqGn3ytSN4zCMcIkhwUa3HVgBYaCRCG0JCR/yyx
         cdAstn+MHsBylPcyBx5rj975Akx6b1nfhDy+HQxJ/RMOjZAUXmO9OWN7ZPrqTLdIbW
         WGk5t08LpERt4v1she0Ukx7y7y26twsN7CsKjY3xpXQyA+TUHCVoBeMwK02FfUkFQN
         5yo78H5IJu0Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AB9DE8DCCE;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/12] misc: fastrpc: Add missing DSP FastRPC features
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504956.26125.13800171930432796392.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20220126135304.16340-1-srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
by Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

On Wed, 26 Jan 2022 13:52:52 +0000 you wrote:
> This patchset adds below DSP FastRPC features that have been missing in
> upstream fastrpc driver and also cleans up channel context structure with kref.
> 
> - Add ablity to reflect if the DSP domain is secure/unsecure by creating
>  seperate device nodes for secured domain, this would used by SE policy
>  to restrict applications loading process on the DSP.
> - Add new IOCTL to get DSP capabilites
> - Add IOCTL to support mapping memory on the DSP.
> - Add support for allocating secure memory for DSP
> - Handle fdlist in put args
> - Handle dma fds in invoke request.
> 
> [...]

Here is the summary with links:
  - [v3,01/12] misc: fastrpc: separate fastrpc device from channel context
    (no matching commit)
  - [v3,02/12] misc: fastrpc: add support for FASTRPC_IOCTL_MEM_MAP/UNMAP
    (no matching commit)
  - [v3,03/12] misc: fastrpc: Add support to get DSP capabilities
    (no matching commit)
  - [v3,04/12] dt-bindings: misc: add property to support non-secure DSP
    (no matching commit)
  - [v3,05/12] misc: fastrpc: add secure domain support
    (no matching commit)
  - [v3,06/12] misc: fastrpc: check before loading process to the DSP
    (no matching commit)
  - [v3,07/12] dt-bindings: misc: add fastrpc domain vmid property
    (no matching commit)
  - [v3,08/12] misc: fastrpc: Add support to secure memory map
    (no matching commit)
  - [v3,09/12] misc: fastrpc: Add helper function to get list and page
    (no matching commit)
  - [v3,10/12] misc: fastrpc: Add fdlist implementation
    (no matching commit)
  - [v3,11/12] misc: fastrpc: Add dma handle implementation
    (no matching commit)
  - [v3,12/12] arm64: dts: qcom: add non-secure domain property to fastrpc nodes
    https://git.kernel.org/qcom/c/8c8ce95b6f1b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


