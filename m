Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4F574F96EF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236440AbiDHNjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbiDHNjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579B32BC546
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 742096155A
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D279DC385B5;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=Ox6leUjLpmaddSP1FmDKuYjRGO0dLMU4PrCx91frfzY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mxcgoARkTtR+aY2mJKE0hj5RP5fbr/LYQGXesbT1mU8MMVYvD3yw/YWN8kKU1/X4g
         GmLM7DIyO/BM/Yf/CEEhFI860hbdQMBqLldzamAch80lMhOzsYKE7Ultjz2xCedcE1
         /4Y8tSaE79D7wxjrBVpreQE+ifSYlOGeMpGFec9klBC+Y6KTHSX/+RbC+vgKGyxUfZ
         JUk8pcrRI5HR29MgpzN4G1VHrkGAGI+RBWMm4oYZLg0XOhK8O9+5s/dyib+LRK6CBP
         p0inUzJTlU45LGHcnNWlTI62F/bo1NlzxTsM5TaOR29DZqKAi8dCWeYPkgsDUuunRz
         RjKpIXqvzhRIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A5335E8DD18;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: clock: qcom: prevent interpret of See also: as
 keyword
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504966.26125.10447673143018597051.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <20220324143935.1117426-1-clabbe@baylibre.com>
In-Reply-To: <20220324143935.1117426-1-clabbe@baylibre.com>
To:     LABBE Corentin <clabbe@baylibre.com>
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
by Stephen Boyd <sboyd@kernel.org>:

On Thu, 24 Mar 2022 14:39:35 +0000 you wrote:
> The "See also:" in description generates a DT check error since it is
> interpreted as a field. Setting description as formatted description fix
> that.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - dt-bindings: clock: qcom: prevent interpret of See also: as keyword
    https://git.kernel.org/qcom/c/adbf85aaf7da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


