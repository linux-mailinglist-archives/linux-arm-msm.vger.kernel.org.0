Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DDE6B32B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbjCJAUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:20:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbjCJAUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:20:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D53CAF4D93;
        Thu,  9 Mar 2023 16:20:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7ED7BB8214D;
        Fri, 10 Mar 2023 00:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E7A8C4339E;
        Fri, 10 Mar 2023 00:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678407618;
        bh=29AmesE7AXdHqjf2NOMeUWHAZIhTTbKWYLKdnfX/+Lc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LBwsAx2GKM9dh9Nd0UNGal5z7ZdmpvkCMdCWwHCrIA3ILNiI/DbtsjAWEC7uu2nJy
         rkhsDlCToQVvW3RqCO90nudzSEPQK0QRKRgaHXKA9Mv243j0AF1UOo/D9TQ/Owk4uM
         czZrnM3yqpwZeq21KX7LYWpal/cSGybemVZNddSKUoUgUqmI3+GNNAnAt03becoJ7B
         sqqGYZ26uKIDMtUp8WP8wBrbDPSJMwIolyj207Ti2tVBf84tmpcmlsbctx6IaCUzqL
         /961u1oplueRzELsqntOGtBC14xm2WA8tqLIA2M7TZXU276k07MAEIuen79wkS7oz6
         KoAvWtvSb8yIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7C84E55F00;
        Fri, 10 Mar 2023 00:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 RESEND] Bluetooth: btqcomsmd: Fix command timeout after
 setting BD address
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <167840761794.25154.15476663413483482390.git-patchwork-notify@kernel.org>
Date:   Fri, 10 Mar 2023 00:20:17 +0000
References: <20230308133155.165537-1-stephan.gerhold@kernkonzept.com>
In-Reply-To: <20230308133155.165537-1-stephan.gerhold@kernkonzept.com>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     luiz.dentz@gmail.com, marcel@holtmann.org, johan.hedberg@gmail.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        stephan@gerhold.net, pmenzel@molgen.mpg.de
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed,  8 Mar 2023 14:31:55 +0100 you wrote:
> On most devices using the btqcomsmd driver (e.g. the DragonBoard 410c
> and other devices based on the Qualcomm MSM8916/MSM8909/... SoCs)
> the Bluetooth firmware seems to become unresponsive for a while after
> setting the BD address. On recent kernel versions (at least 5.17+)
> this often causes timeouts for subsequent commands, e.g. the HCI reset
> sent by the Bluetooth core during initialization:
> 
> [...]

Here is the summary with links:
  - [v2,RESEND] Bluetooth: btqcomsmd: Fix command timeout after setting BD address
    https://git.kernel.org/bluetooth/bluetooth-next/c/048379740637

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


