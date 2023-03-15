Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9B66BC153
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 00:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjCOXe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 19:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbjCOXdr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 19:33:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C83773011
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 16:32:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A04A6B81E8A
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05311C433A4;
        Wed, 15 Mar 2023 23:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678923152;
        bh=dQA3L2x5d6f+0oyaZdKn7yuYX+Ln5OB+Fdi3TueCFYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XPyFrHwoMlgI57InLbvSWVJQyZRy5M/yE/4hp/NGUVyrB2ix9kWkVQu4plc6vGYdk
         PEj/4fi5ybfLxTYK/O8/0WuRxgaUFtHzceaLDc4y2gaWLaNS/K85GfZpbXkj4hBAh5
         vEiL5JguNZdQ4eyzXc6qsPiJb7/3pJ4odQKgEXySiVpxYAzvBkQhkABfadyDwvXeYv
         HFoy0UAy7L5KtSk6OF9Dnl77xuWhiehoJDYQl9o5/CcTKLghulCPucLPPk2kfc/kTo
         NwpZnpEW8pBm3EoUPmA1UTZt0xBEO2Goq8dk0kv16KAmkqgyrO5HizeoyXs1RBIPn7
         O0Xhy38vzo0Kw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
Subject: Re: (subset) [PATCH v6 00/10] SM6(11|12|37)5 GPUCC
Date:   Wed, 15 Mar 2023 16:35:03 -0700
Message-Id: <167892332564.4030021.17599934919901695198.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230208091340.124641-1-konrad.dybcio@linaro.org>
References: <20230208091340.124641-1-konrad.dybcio@linaro.org>
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

On Wed, 8 Feb 2023 10:13:30 +0100, Konrad Dybcio wrote:
> This series brings GPUCC support and the correlated bindings for
> three midrange SoCs, all of which host a GMU-less A6xx GPU.
> 
> v6 includes bitfield.h for arm32 builds and fixes the kconfig display name (6115 != 6125, heh) in [10/10]
> 
> v5: https://lore.kernel.org/linux-arm-msm/20230201183626.351211-1-konrad.dybcio@linaro.org/
> 
> [...]

Applied, thanks!

[01/10] clk: qcom: branch: Add helper functions for setting retain bits
        commit: b594e6f6605311785171b8d4600fe96e35625530
[02/10] clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
        commit: 0932e565ba7c828d5ec59f872cb3ad6b070dc003
[03/10] clk: qcom: branch: Move CBCR bits definitions to the header file
        commit: 5ab6561da990375b0a3cd54e12996498f6398a0f
[04/10] clk: qcom: branch: Clean up branch enable registers
        commit: b96fbb03fbc1686449e28e2edb54df5c3584ad43
[06/10] clk: qcom: Add GPU clock controller driver for SM6125
        commit: a6b18286810cc64419a36e3a6b5d7191f1f9b167
[08/10] clk: qcom: Add GPU clock controller driver for SM6375
        commit: 8397e24278b3690b830e5dad79169a79f63b0b43
[10/10] clk: qcom: Add GPU clock controller driver for SM6115
        commit: 092209f199b8fe3e7862aff2d6e45ffb388fc42a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
