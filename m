Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55C474FE3D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 16:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343860AbiDLOck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 10:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356572AbiDLOcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 10:32:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735A04A3DD
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 07:30:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1986760DDB
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 14:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79F12C385A5;
        Tue, 12 Apr 2022 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649773817;
        bh=rfsPMyxaUAUpaW8r1hrQ7XVCf5/N+P/xJEWy+1QILTI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eLDjp+LTk4bRnHYhr2ma78LH+oCfBSULzD/hC2iTY8ILR7iG810I5cF1htnzlx4uO
         4/sRc8gdIvY17ZKQZSplKcj50Xotj8ZmDHi1gofZTboHWGPWkz/seSyh8R+liYfN2O
         evDGb4U8OjIDqIoCZbx+6gNVoQujJMxLTH2d51HagP7jwVe8KmRNz1UfNt7ie49Iu0
         ZmUhTAt4D0O6Ps5IGgPPKt+GRBQmi0LCliPAAuLMaULZ18vQBauNbydEcqjH2oLurH
         t0qoO0RwEHPR6LecXAOXavTlr9JLO0kjHygrcN+CMDmyz7CtDH9Sej4eKxwJGaUjHi
         SIc7SEXSgfedA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5C3F2E85D15;
        Tue, 12 Apr 2022 14:30:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 00/12] dt-bindings: ufs: add common platform bindings +
 fixes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164977381737.2321.10689796858446260719.git-patchwork-notify@kernel.org>
Date:   Tue, 12 Apr 2022 14:30:17 +0000
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

On Sun,  6 Mar 2022 12:11:13 +0100 you wrote:
> Hi,
> 
> Not tested on hardware, so please kindly test.
> Bindings maintainers might need checking - taken from git log.
> 
> Changes since v2
> ================
> 1. Do not deprecate freq-table-hz, but instead update dtschema to accept
>    uint32-matrix. See:
>    https://github.com/devicetree-org/dt-schema/pull/69
> 2. Drop patches and changes related to freq-table-hz -> freq-table conversion.
> 3. Add tags.
> 4. Change maintainer of qcom,ufs.
> 
> [...]

Here is the summary with links:
  - [v3,01/12] dt-bindings: ufs: add common platform bindings
    (no matching commit)
  - [v3,02/12] dt-bindings: ufs: samsung,exynos-ufs: use common bindings
    (no matching commit)
  - [v3,03/12] dt-bindings: ufs: cdns,ufshc: convert to dtschema
    (no matching commit)
  - [v3,04/12] dt-bindings: ufs: drop unused/old ufs-qcom PHY bindings
    (no matching commit)
  - [v3,05/12] dt-bindings: ufs: qcom,ufs: convert to dtschema
    (no matching commit)
  - [v3,06/12] dt-bindings: ufs: hisilicon,ufs: convert to dtschema
    (no matching commit)
  - [v3,07/12] dt-bindings: ufs: mediatek,ufs: convert to dtschema
    (no matching commit)
  - [v3,08/12] dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
    (no matching commit)
  - [v3,09/12] arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
    (no matching commit)
  - [v3,10/12] arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
    https://git.kernel.org/qcom/c/b32846a38fc2
  - [v3,11/12] arm64: dts: qcom: msm8996: correct UFS compatible
    https://git.kernel.org/qcom/c/64ff69842443
  - [v3,12/12] arm64: dts: qcom: sm8350: drop duplicated ref_clk in UFS
    https://git.kernel.org/qcom/c/7ba57d11e5bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


