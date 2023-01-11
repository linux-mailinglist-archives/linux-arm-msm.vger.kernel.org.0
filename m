Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92E9665349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235829AbjAKFTH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjAKFSA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:18:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12D313D66;
        Tue, 10 Jan 2023 21:09:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8BEA161A34;
        Wed, 11 Jan 2023 05:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312F3C433D2;
        Wed, 11 Jan 2023 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413788;
        bh=kHAW7mxeVAQoI9/rn841+psqYw9s0pIqxCzVXQp2AvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pgkFnFPMoYCNNhWZwSy+MMWTr3XBrdIeLcYoso6ChB6das0YQ4Km58l+t7s/PF2dQ
         urr8kae7aYaHUAbTaK4YXp9Kdl8JjUesLxELAucY//EgDHSuycSzj5yQDO3FFiOviT
         SN8Ezf2RRFz6hYdvKRRiyiuPOipVYvoqiOpa/VpvI8VFN2968MNGDZV/ckdDLnQb1m
         xP4vjQu+6j2BxQEDtuvr3X0mjfTPsdoU/SeDQphVfLxpBqBexvqmhPhUemSI9cgcJB
         MaPAEERO92+wEDzlbLEvdPMXSIyQPif8Qag4eALs4S9D4g8zDPewhttbx9mj0diT+S
         t2KorFtU4ymtQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, dmitry.baryshkov@linaro.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 00/16] clk: qcom: get rid of core_bi_pll_test_se
Date:   Tue, 10 Jan 2023 23:09:12 -0600
Message-Id: <167341377731.2246479.1608061507340814832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
References: <20221228185237.3111988-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Dec 2022 20:52:21 +0200, Dmitry Baryshkov wrote:
> Drop core_bi_pll_test_se from all Qualcomm clock controller's bindings
> and drivers. The clock is not used by anyone.
> 
> Changes since v1:
> - Fixed error in the qcom,gcc-msm8998 example.
> 
> Dmitry Baryshkov (16):
>   dt-bindings: clock: qcom,gcc-msm8998: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sdx55: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sdx65: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,gcc-sm8350: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom,mmcc-msm8998: drop core_bi_pll_test_se
>   dt-bindings: clock: qcom: gcc-sm8350: drop test clock
>   dt-bindings: clock: qcom: gcc-sm8450: drop test clock
>   clk: qcom: dispcc-qcm2290: get rid of test clock
>   clk: qcom: gcc-msm8998: get rid of test clock
>   clk: qcom: gcc-sc7180: get rid of test clock
>   clk: qcom: gcc-sdx55: use ARRAY_SIZE instead of specifying num_parents
>   clk: qcom: gcc-sdx55: get rid of test clock
>   clk: qcom: gcc-sm8150: get rid of test clock
>   clk: qcom: gcc-sm8350: get rid of test clock
>   clk: qcom: mmcc-msm8998: get rid of test clock
>   arm64: dts: qcom: msm8998: get rid of test clock
> 
> [...]

Applied, thanks!

[16/16] arm64: dts: qcom: msm8998: get rid of test clock
        commit: ef6868a2d69d18273ebda3b3bc304242532aa76c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
