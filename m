Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1891B592C45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Aug 2022 12:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242350AbiHOKkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Aug 2022 06:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242325AbiHOKkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Aug 2022 06:40:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B03228D;
        Mon, 15 Aug 2022 03:40:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ABACEB80DF3;
        Mon, 15 Aug 2022 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A4A9C433B5;
        Mon, 15 Aug 2022 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660560014;
        bh=/S1s5Joa2MJE4uCDPeI+q9u9HWy+/rdE8qcKfmiJLW0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WToDy7SflgmqWl8xzG7MQOwtlZpmADVuE2/4jmnzIEs7QyIOcGWxWMeLw/MDQ2MtS
         cHs6t3d1xrcYFMpEVhJoRPNX1X7b6KkiHZCjBMfVg8rKXIdEW4gO9kYXwh9QeKvkFG
         VmWheMQTkMeW65YeM9qOzMTUD1Hw3xwXyvipso2G2T8VG6fSx4tnNoVkv4W/t9LAJ+
         j+Lw6mpbj/QmuOX1upJVhawP+qvPdWriWcl0xCqLvGPEBLFG1DWesjMaQIXEZ1u6MF
         C5QmBbP5D2Ew98h3iCn92s646XPRmZZDMI1o822eM3YXmpXbCCJBVXbbWnz5dX7iII
         ut+aGZF+DsFLQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37308E2A051;
        Mon, 15 Aug 2022 10:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/1] net: qrtr: start MHI channel after endpoit creation
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166056001422.15339.153619356123129360.git-patchwork-notify@kernel.org>
Date:   Mon, 15 Aug 2022 10:40:14 +0000
References: <20220811094840.1654088-1-fido_max@inbox.ru>
In-Reply-To: <20220811094840.1654088-1-fido_max@inbox.ru>
To:     Maxim Kochetkov <fido_max@inbox.ru>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
        quic_hemantk@quicinc.com, mani@kernel.org
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

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 11 Aug 2022 12:48:40 +0300 you wrote:
> MHI channel may generates event/interrupt right after enabling.
> It may leads to 2 race conditions issues.
> 
> 1)
> Such event may be dropped by qcom_mhi_qrtr_dl_callback() at check:
> 
> 	if (!qdev || mhi_res->transaction_status)
> 		return;
> 
> [...]

Here is the summary with links:
  - [v2,1/1] net: qrtr: start MHI channel after endpoit creation
    https://git.kernel.org/netdev/net/c/68a838b84eff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


