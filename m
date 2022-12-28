Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF5E65862D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 20:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbiL1TEd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 14:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiL1TEd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 14:04:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 741DE14094;
        Wed, 28 Dec 2022 11:04:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CB5D615DD;
        Wed, 28 Dec 2022 19:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F611C433D2;
        Wed, 28 Dec 2022 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672254271;
        bh=sqruEkE4F2QM0NINkjfS1wW8Hl9HNKj0we3qc99lrbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mNydtTJUyw6PS1N9r5q0bUMa34ng1vbCrPTpwtK6/++HOVgZcrLj4xI5QEB0HBUc6
         r2nW294sQw9cGPdNbY2FYomnwy7NMbIdMPkE4INU+VC+LCjZjOSZcKyqakfbqgoJXH
         wu+0mAdfB84u4HRjWOAqwVZlVUSl12tjRcwpovEXlNOeC+oGJ40vHFPbnwThPxxr5e
         c3rz0pHHQfgZltJWF3j1jIhx8UGjKw+FjqwMT+oMJpbDbomyqZJlZZU8hVVRdXNsM/
         y4vlvAvlQ+g+YAeM8Mb2sARAm5OTWvUVJ/5CsSFn9pF1vlVJkZbV/OZ33GpvKQOor4
         wH4QmMfXQ9Y8Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, dmitry.baryshkov@linaro.org,
        agross@kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, sboyd@kernel.org
Cc:     elder@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 00/19] clk: qcom: smd-rpm: drop platform names
Date:   Wed, 28 Dec 2022 13:04:26 -0600
Message-Id: <167225426551.971585.17288369782635545264.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

On Fri, 9 Dec 2022 18:48:36 +0200, Dmitry Baryshkov wrote:
> This series concludes the previous work on Qualcomm RPM and RPMH clock
> drivers. It reworks the clk-smd-rpm driver to drop the SoC name from the
> clock symbol name, as the clock definitions are shared between different
> SoCs (platforms). Having an SoC name in the clock definition can lead to
> all sources of confusion and/or errors.
> 
> Changes since v2:
>  - Split bindings into a separate patch
> 
> [...]

Applied, thanks!

[01/19] dt-bindings: clocks: qcom: rpmcc: add LN_BB_CLK_PIN clocks
        commit: ba796801d2474a4773a6a0ebb94c53c96a294426
[02/19] clk: qcom: smd-rpm: enable pin-controlled ln_bb_clk clocks on qcs404
        commit: 76318d779c83dcc9e74de6fc428366c0dae2803a
[03/19] clk: qcom: smd-rpm: remove duplication between MMXI and MMAXI defines
        commit: c941b98781b348bd63fb8f8b5307b10fde2af0c1
[04/19] clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290 clocks
        commit: 1bf68a5d6802f4d9a20a9427779f52497f0285c2
[05/19] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
        commit: 63793efbe6fa0927758b2600ee439e1774321771
[06/19] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
        commit: cf202f811892d415291e605dc79db54a44f9e222
[07/19] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
        commit: e5ca1b251dc3e6375ca96e8b135fb685420ef97c
[08/19] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
        commit: b1c6f902c0e1c355a7b328237df98c4636c6bb20
[09/19] clk: qcom: smd-rpm: add XO_BUFFER clock for each XO_BUFFER_PINCTRL clock
        commit: 3ab58304f59e216949e18b002bd568b0daee9ae1
[10/19] clk: qcom: smd-rpm: drop the rpm_status_id field
        commit: 406f0577b04ff99b8dafaa110a961cf00daab418
[11/19] clk: qcom: smd-rpm: fix alignment of line breaking backslashes
        commit: 262caca770f579f13bc04b49e296e6060c4ccce5
[12/19] clk: qcom: smd-rpm: move clock definitions together
        commit: 57d44ccecc15e27679499f889c51031f9ffe328e
[13/19] clk: qcom: smd-rpm: rename some msm8974 active-only clocks
        commit: 786f8d18a8d91d98bd03c6ec41213cb52bcfc2cd
[14/19] clk: qcom: smd-rpm: simplify XO_BUFFER clocks definitions
        commit: ff2cd7401d24ab2d2f031cd9d275412cd669f33b
[15/19] clk: qcom: smd-rpm: simplify SMD_RPM/_BRANCH/_QDSS clock definitions
        commit: e3c88f236e8567f3f47412438a957c22594caed7
[16/19] clk: qcom: smd-rpm: rename SMD_RPM_BRANCH clock symbols
        commit: 74419b8869b02e00890a2bba96469533b6d93bf5
[17/19] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
        commit: 2b8ddf6b820080649176c5695422548114b03f91
[18/19] clk: qcom: smd-rpm: rename SMD_RPM_BUS clocks
        commit: 598261294658873559b6d37ac3e6a91eb48e2c17
[19/19] clk: qcom: smd-rpm: remove usage of platform name
        commit: e3306941368ae58acf5ba74f6d26653e109e7ef2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
