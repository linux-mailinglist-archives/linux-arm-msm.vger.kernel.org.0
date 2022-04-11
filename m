Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F79F4FC644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbiDKVCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349968AbiDKVCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B852A73E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B39FCB818C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D55CC385AC;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=XV7g5EtP8ukrdatUSRH3AlZFu1Wfos6/nkFQUe4qd8g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gTrJPOdCDAGZLvuwzzGLLZQgP3o7KeoCJh38qNL5CC1k5+xRl1D9UXCX5m8rfN/hu
         7wZ8Xyc5HSkc3q8SqBWIwaA+PGJICKnasvyjGG/P1fc4KeMZogaYOqENJiIGOY0k97
         3GPi++kwyOsXDcldQHFREHKBWSO6RzvfbJfZJqOfxLCL6koO8BAUJCSo/BWQzMUnUt
         DpbVHBGGi/OFXSTeUfj+72ZqXIqnB3raiIvn43w0Jxp++RKkKBCZJmHqxegMcqam9j
         aCkAtEHaOhTiy35N6n1iyPq3anCatS35zzh7W+zaX5DLX/a7vqnTotSF+92qGyVMzj
         wZ0AKrrjn/AWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3C20AE8DD63;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: sc7280: Rename crd to crd-r3
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081523.4542.8030668303599043941.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
In-Reply-To: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
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

On Wed, 16 Mar 2022 17:28:17 -0700 you wrote:
> There are multiple revisions of CRD boards. The current sc7280-crd.dts
> describes revision 3 and 4 (aka CRD 1.0 and 2.0). Support for a newer
> version will be added by another patch. Add the revision number to
> distinguish it from the versionn. Also add the revision numbers to
> the compatible string.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v1,1/4] arm64: dts: qcom: sc7280: Rename crd to crd-r3
    https://git.kernel.org/qcom/c/737f9ea6cee7
  - [v1,2/4] arm64: dts: qcom: sc7280: Add 'piglin' to the crd-r3 compatible strings
    https://git.kernel.org/qcom/c/f226c6605334
  - [v1,3/4] arm64: dts: qcom: sc7280: herobrine: disable some regulators by default
    https://git.kernel.org/qcom/c/533ca1c3c199
  - [v1,4/4] arm64: dts: qcom: sc7280: Add CRD rev5
    https://git.kernel.org/qcom/c/6675ac9d0046

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


