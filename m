Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FABA4B2B68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350931AbiBKRK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345343AbiBKRKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AC3521F
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A86F2B82B21
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDD37C340F3;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599418;
        bh=vs7558Z/gK3LCmPxfAbE0YbIbQDGw/EtrAt5YXWAQNc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pdPCoXvsJUBCN8Mvylpqqsh59yM/QmkitUwhQfGR1U/57XlwmibsT0OrXYyPL8dDY
         pi7YGJY7wKufvZVBQaovuafQDMY57QTZ0tGR3ElYxBLMSGCDDv2fmqMWJWhIiDmk6J
         ojhbMnsh3uTOi9/UDAzxEuCHJUtzWjnELLsV0FsIqB4X06C7WFNNJKRSu+EfQJmat6
         WRPa1cgJJF4/2VyYiP/lGI0G6nMbGdqLFwqnxZM57+nz0sSBXw8whGTwNye9yQKVdb
         zM+YEa4eRiIYGCTzYGFJDgWE+U2D34hQL8XD91M0dRJTMu6TMAi7M1fPEzKSTIiIrv
         O7q+sxVBqRT8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBD91E6D447;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/2] Drop the clock-frequency property from the MMIO timer
 node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941875.13057.7345188944922728405.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <1643819709-5410-1-git-send-email-quic_kathirav@quicinc.com>
In-Reply-To: <1643819709-5410-1-git-send-email-quic_kathirav@quicinc.com>
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

On Wed, 2 Feb 2022 22:05:07 +0530 you wrote:
> Drop the clock-frequency property from the MMIO timer node in both IPQ8074
> and IPQ6018 DTSI. There are couple of reasons for this change
> 
> 1) As per the DT binding, this property should be present only if the
> firmware is not configuring the clock frequency properly. In both IPQ8074
> and IPQ6018, bootloader is configuring it properly.
> 
> [...]

Here is the summary with links:
  - [1/2] arm64: dts: qcom: ipq8074: drop the clock-frequency property
    https://git.kernel.org/qcom/c/555ab09c7896
  - [2/2] arm64: dts: qcom: ipq6018: drop the clock-frequency property
    https://git.kernel.org/qcom/c/01b8c4aff332

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


