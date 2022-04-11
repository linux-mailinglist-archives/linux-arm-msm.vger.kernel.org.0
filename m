Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC6D4FC63F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349974AbiDKVCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349968AbiDKVCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5189F2AC42
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E494361676
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47C1CC385A6;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=bfIjxMYLrL0jCve0vz35njes8PrPiKmPkdL0IEQ1hnM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NqpUGWI5y4V0jzLBKXZ3puwdkSdJKVX7bI5MBSiP/h/+O1g8qgIWmMKryJfL7f/P3
         t/Ly6yVTM3TcBtbjmvxR7thwb2g5vhjcNGSh+PEH+NMzHm8zgwzumf0S44QQuAdcdv
         v3DOenviM8d+d2kciDNquJyQZPIky9W6Ezm0THm6dKQEan9b8R7935cAbvBg0VFl3Y
         Sp/Cm9Nl1YNksTonCA/Fi9TxTkEmWzQDkgG+eSl5BMGYRGqNHwnCvJ3krH+oiQZBUs
         u80oyFqOaq8fwxA9ZJ2M0HNx3ib8CBS6TaLrZY5RLNwp4B650FfTD7vKUbS30q8nqf
         M0qLHol/43CQw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 29002E85B76;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7280-herobrine: Fix PCIe regulator glitch
 at bootup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081516.4542.15125748317923151261.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220310130429.1.Id41fda1d7f5d9230bc45c1b85b06b0fb0ddd29af@changeid>
In-Reply-To: <20220310130429.1.Id41fda1d7f5d9230bc45c1b85b06b0fb0ddd29af@changeid>
To:     Doug Anderson <dianders@chromium.org>
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

On Thu, 10 Mar 2022 13:04:34 -0800 you wrote:
> While scoping signals, we found that the PCIe signals weren't
> compliant at bootup. Specifically, the bootloader was setting up PCIe
> and leaving it configured, then jumping to the kernel. The kernel was
> turning off the regulator while leaving the PCIe clock running, which
> was a violation.
> 
> In the regulator bindings (and the Linux kernel driver that uses
> them), there's currently no way to specify that a GPIO-controlled
> regulator should keep its state at bootup. You've got to pick either
> "on" or "off". Let's switch it so that the PCIe regulator defaults to
> "on" instead of "off". This should be a much safer way to go and
> avoids the timing violation. The regulator will still be turned off
> later if there are no users.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7280-herobrine: Fix PCIe regulator glitch at bootup
    https://git.kernel.org/qcom/c/0d40497d0541

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


