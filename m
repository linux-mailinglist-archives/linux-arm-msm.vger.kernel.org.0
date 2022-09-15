Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EAD5B932C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 05:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiIODhN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 23:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiIODhM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 23:37:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA50C90188;
        Wed, 14 Sep 2022 20:37:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 91CB9B81D75;
        Thu, 15 Sep 2022 03:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86DA7C43140;
        Thu, 15 Sep 2022 03:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663213028;
        bh=Gvyk/SWdp3y76yHv4Si3MDoRW3QEYPbCruPd8bBJkkA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o1zxrBI266Ktw+9MqdykBQZ7Tdx5QiCDK8cUwW/JBBYGqu5lEFacP6exwyh2drYID
         wgYnfhiQHhQqfQJRQ0uO2xLUm/J5CLQilP7SB2+I+986AbuWuHWrmp+cgBXsPSH97k
         BHC3svEDhN3pKYnq96mrxVtvloIOvIfB2mygr5MJFdACNKQgYmAQQgaJ6gWR0Cg4pc
         29G0OVyooYkbJCDfwJW5+CUtLyUZAdAGxebe5ovb0h/PKSWLcKb7aoWS2nPYMhFgE8
         yfJuZ5rD7eSoJGQivGhaJE7gXdM/13QPH18dIDPhR2odYqzrBtQ0E2rm02p3xXUYMB
         E6TOZuk8wBFog==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mturquette@baylibre.com, agross@kernel.org, quic_tdas@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        swboyd@chromium.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Date:   Wed, 14 Sep 2022 22:36:51 -0500
Message-Id: <166321302052.788007.14469840237160862340.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 23 Jun 2022 15:04:03 +0300, Dmitry Baryshkov wrote:
> This series converts the APQ8064/MSM8960 clock drivers, bindings and DTs
> to use parent_hws/_data and excplicit clock binding in DT.
> 
> Dependencies: [1] (whole series), [2], [3]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220521151437.1489111-1-dmitry.baryshkov@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-2-dmitry.baryshkov@linaro.org/
> [3] https://lore.kernel.org/linux-arm-msm/20220617122922.769562-3-dmitry.baryshkov@linaro.org/
> 
> [...]

Applied, thanks!

[10/15] ARM: dts: qcom: apq8064: add clocks to the LCC device node
        commit: 30f17249c171c9ac50e9f6d51c0bb5db1f5b2403
[11/15] ARM: dts: qcom: msm8960: add clocks to the LCC device node
        commit: 6e9b4595609adf4ee97970a84a6eaeb1610aacb3
[12/15] ARM: dts: qcom: apq8064: add clocks to the GCC device node
        commit: 85ddc865219b04ea7930a8107943fe3c2e3af886
[13/15] ARM: dts: qcom: msm8960: add clocks to the GCC device node
        commit: 80787e417f3058c6ea59af726e803ca307b67867
[14/15] ARM: dts: qcom: apq8064: add clocks to the MMCC device node
        commit: f79742da254e47d38ea934813fb44a91aa834ee9
[15/15] ARM: dts: qcom: msm8960: add clocks to the MMCC device node
        commit: 2e312b3429244eae1b105cb942550f2e5282f887

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
