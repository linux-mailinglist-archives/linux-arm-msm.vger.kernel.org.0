Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED324FC640
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbiDKVCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349974AbiDKVCb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C682AC46
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 88BDD616A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83B4EC385B1;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=vAHC3C6wR8FpT4b9lWEG8uXzTCW62SCBBMBw0sVpec8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=T02ySYVGTwPTV7muYjIlOW2OR9dISG/EuUqaeOIuEmSRL+juqj4NRib2bvEght+Ev
         lqt7m7igi3dwlHIgroOClybuY0r4FsUy5jVMVk37Aypk5npDaeZsD+yw8OjIgXomNm
         2jjNTEvKMrqzcs7JMSFpEbXmlzj+JjpMQFgbfAS2fzGb+KuBQ/piEsogrTLoUZSl0X
         e9YzfyBvf6/SEuHs8B9I1VM/nFZCvpZ+YT3IhXpxx57yR03M0qLLwNI9T7n2fx2n2k
         ypYCqvZNJRlwOTXO/gxYo8Ut8ECLf+g508ILocfTqb3zLktZUerEsRSDbxgFK1oVA3
         aeNJP3yjYn6YQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C4BDE7399B;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add SAR sensors for
 herobrine
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081543.4542.2708265985278814513.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220329105854.v3.1.Icedb2e3cd5e21f3a4ec535ddf756fa44d053b6ed@changeid>
In-Reply-To: <20220329105854.v3.1.Icedb2e3cd5e21f3a4ec535ddf756fa44d053b6ed@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
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

On Tue, 29 Mar 2022 10:59:33 -0700 you wrote:
> Add nodes for the two SX9324 SAR proximity sensors. Not all herobrine
> boards have these sensors, so leave them disabled by default.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Depends on 'arm64: dts: qcom: sc7280: Fix sar1_irq_odl node name' [1] for
> the second SAR sensor to be probed successfully.
> 
> [...]

Here is the summary with links:
  - [v3,1/2] arm64: dts: qcom: sc7280: Add SAR sensors for herobrine
    https://git.kernel.org/qcom/c/70137d1d8a63
  - [v3,2/2] arm64: dts: qcom: sc7280: Add device tree for herobrine villager
    https://git.kernel.org/qcom/c/ee2a62116015

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


