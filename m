Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DB46E9D95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 23:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232602AbjDTVAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 17:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbjDTVAf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 17:00:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E235B6587;
        Thu, 20 Apr 2023 14:00:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 687C564BF7;
        Thu, 20 Apr 2023 21:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2959C4339B;
        Thu, 20 Apr 2023 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682024420;
        bh=9500C6nsCuJeKJCsscSUezvmRahzY6kCskdfG+bk1Ys=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lVKJqfjvLt6+R1pXd/nj/vnOCRthDFlJxhiSxo8G0jXEycpZq1Q4OXuKEjxGbaebp
         f+6Np6lAlovYJNvvuCWFtiEbDuxk3sri8Qr4ZFtacsfvpTVr4Kx30dyx9V6/ItDOmW
         W0kBgVNoZv8MlTi7gTW2CoeD7Jp4PkNMwvFTZsgxL9d9Mu5l+yUxKY1ykz+aKdhgwF
         qMH4EFunktnmdGPqi4sWYes+YNEqfoTNqt0bUQvWzFyy/hp/ejOqoX937ZYriU4EIO
         frhIS+WPwmz+rF3c/HalaLAj+Z4BHLCfV0MKd1kixvtPWo4wmG/SymmPiOcW5Al8In
         w/a/SBi8Xr7gg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A414FE501E7;
        Thu, 20 Apr 2023 21:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] Bluetooth: btusb: Add WCN6855 devcoredump support
From:   patchwork-bot+bluetooth@kernel.org
Message-Id: <168202442066.11865.5106451617006072120.git-patchwork-notify@kernel.org>
Date:   Thu, 20 Apr 2023 21:00:20 +0000
References: <20230419033805.27356-1-quic_tjiang@quicinc.com>
In-Reply-To: <20230419033805.27356-1-quic_tjiang@quicinc.com>
To:     Tim Jiang (QUIC) <quic_tjiang@quicinc.com>
Cc:     marcel@holtmann.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_bgodavar@quicinc.com, quic_hemantg@quicinc.com,
        mka@chromium.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 19 Apr 2023 11:38:05 +0800 you wrote:
> WCN6855 will report memdump via ACL data or HCI event when
> it get crashed, so we collect memdump to debug firmware.
> 
> Signed-off-by: Tim Jiang <quic_tjiang@quicinc.com>
> ---
>  drivers/bluetooth/btusb.c | 222 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 222 insertions(+)

Here is the summary with links:
  - [v3] Bluetooth: btusb: Add WCN6855 devcoredump support
    https://git.kernel.org/bluetooth/bluetooth-next/c/8c70acc21f68

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


