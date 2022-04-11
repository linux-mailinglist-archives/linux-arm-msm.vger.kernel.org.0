Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43F704FC63C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349975AbiDKVCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349969AbiDKVCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381EF2A734
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5DAA616A9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98A11C385B3;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=RBhWoD+cPbkr+POXAzmt6AlShdewn8Ultm70IaJSCEI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bEk1F6vRXN4py0zUaiP9+nHuHB6k1oocAxIEfQXv6UkCXXulRITx+XA8hx+jHDkHN
         Qoc7MtU2wgrNFEnTCnjApGcddqQnROlGyQFZ8GWuT6rvRJoj2g3g6ATjP1Ql0+xK2x
         dEzZHPLty8suq9bOqRnwZAXJYqBrH4ozscUzVTcE2jakwAsbqanwM5M1/NEMzY3n2U
         PEn1xC2l4tJF56/DPPdZ796beVDvFXcDY5Gbyil2Jl2CALjP2LJ2D5gCHIxoEUNU1a
         GC4E7SuEwej6RvWv7itIGjBcWt4vLcxdk6nAlhEiGzpvDs+fwo9AuSe08n4+ucI/dZ
         2Cmafo8M2K8yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7D48EE8DD63;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] arm64: dts: Add PCIe support for SM8150 SoC
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081550.4542.12078626253822191784.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220326055754.1796146-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20220326055754.1796146-1-bhupesh.sharma@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
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

On Sat, 26 Mar 2022 11:27:52 +0530 you wrote:
> Changes since v3:
> -----------------
> - v3 can be found here: https://lore.kernel.org/linux-arm-msm/20220302203045.184500-1-bhupesh.sharma@linaro.org/
> - Broke down the patchset into 3 separate patchsets for each tree,
>   so that the patch(es) can be easily reviewed and merged by respective
>   maintainers.
> - This patchset adds the 'linux-arm-msm' related dts support for SM8150 SoC.
> 
> [...]

Here is the summary with links:
  - [v4,1/2] arm64: dts: qcom: sm8150: Add PCIe nodes
    https://git.kernel.org/qcom/c/a1c86c680533
  - [v4,2/2] arm64: dts: qcom: sa8155: Enable PCIe nodes
    https://git.kernel.org/qcom/c/03d470ce2b70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


