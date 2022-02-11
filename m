Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9AE54B2B69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351842AbiBKRK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:10:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiBKRKY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:10:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2313E3B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:10:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 59A73B82B1D
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 17:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AC68C340FA;
        Fri, 11 Feb 2022 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644599419;
        bh=mfNH4P6/612p9AOdxgIYHwRo98Qnc8gByys27RgRly0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=F55UHfXFZF9pWiVz6Rd/fgT2FcMwbMTcIpbnowEYkxoFMJmxBNfebNmZr8U2dSrR+
         8om7zz0iKijFvOCR5Yc9p3yBqihpM03AlbMlMFEhMKQDrm40kFa/lvXtjhMXG9F/2K
         sLaW1j9z7vFvQJIWJaIQO6NNogVNtaipWe6YAeY+oBtIn5AB+UcNDEzw4EbSyyNG9X
         R/KX0K+9QVGr1lc/0785WPPIaMPMXSTPT7RYhN3E07yWir6gPX3QN+2Pu1le8FTwep
         9omLGRNSe9yacAK42fgjl5D9N9v3/lH75mj21GenWU93X1Cva4w1wV+gzByo9Tpyv2
         lnUt/bl1WikEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECF03E5CF96;
        Fri, 11 Feb 2022 17:10:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: qcom: sdx55: Fix the address used for PCIe EP local
 addr space
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164459941896.13057.14974944272153491002.git-patchwork-notify@kernel.org>
Date:   Fri, 11 Feb 2022 17:10:18 +0000
References: <20220208175222.415762-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20220208175222.415762-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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

On Tue,  8 Feb 2022 23:22:21 +0530 you wrote:
> Fix the address range used for mapping the PCIe host memory in the DDR.
> 
> Fixes: ac0e2878cbb0 ("ARM: dts: qcom: sdx55: Add support for PCIe EP")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - ARM: dts: qcom: sdx55: Fix the address used for PCIe EP local addr space
    https://git.kernel.org/qcom/c/c8a8f7551707

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


