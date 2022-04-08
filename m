Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714354F96FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 15:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbiDHNjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 09:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbiDHNjj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 09:39:39 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925B52C2EFA
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 06:37:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E8F56CE2B5A
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 13:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6167C385B6;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649425049;
        bh=LhwGQtJw81zmr+aFYa/98jk0e/bG3qr36Yzsbn+9yw8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ObpZpFW8BHJNWmQtw2jqhbxh+4pOqyoxWJILj5YGy4mzMkjUdTIuzhVWtSgN3FAui
         hALJJFp+YyFt/YAt/ll+gkB6l+aA4pj6tsQBL/OrY89cAozHHJdZumCZtWNXfp/klx
         wf/mindYwix3p3o1+RtXI9xxBvS4AvHtDZNmDYuwxoSF+I+7ccmIo+JwjLklJ7rHXZ
         8bBvjlOOkvKMSyfcs5au4OYMRHLSFsn2VTBUdANKadMA234+TY0MU2BQC/3DG2uMwz
         /d5vF6ZhHGzhcDUbrcmo2yuxYigngUtAZNh6/Y4pT0guEoD307lqaJx8o67zV6dxZE
         xrw0fUORclC9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEDD0E8DD5F;
        Fri,  8 Apr 2022 13:37:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v2 1/2] clk: qcom: gdsc: Add support to update GDSC transition delay
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164942504971.26125.7158383360196834147.git-patchwork-notify@kernel.org>
Date:   Fri, 08 Apr 2022 13:37:29 +0000
References: <20220223185606.3941-1-tdas@codeaurora.org>
In-Reply-To: <20220223185606.3941-1-tdas@codeaurora.org>
To:     Taniya Das <tdas@codeaurora.org>
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
by Stephen Boyd <sboyd@kernel.org>:

On Thu, 24 Feb 2022 00:26:05 +0530 you wrote:
> GDSCs have multiple transition delays which are used for the GDSC FSM
> states. Older targets/designs required these values to be updated from
> gdsc code to certain default values for the FSM state to work as
> expected. But on the newer targets/designs the values updated from the
> GDSC driver can hamper the FSM state to not work as expected.
> 
> On SC7180 we observe black screens because the gdsc is being
> enabled/disabled very rapidly and the GDSC FSM state does not work as
> expected. This is due to the fact that the GDSC reset value is being
> updated from SW.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] clk: qcom: gdsc: Add support to update GDSC transition delay
    https://git.kernel.org/qcom/c/4e7c4d3652f9
  - [v2,2/2] clk: qcom: dispcc: Update the transition delay for MDSS GDSC
    https://git.kernel.org/qcom/c/6e6fec3f961c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


