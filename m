Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12D675EB8AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 05:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbiI0DYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 23:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbiI0DX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 23:23:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE0746225;
        Mon, 26 Sep 2022 20:23:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2534061595;
        Tue, 27 Sep 2022 03:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5273C4347C;
        Tue, 27 Sep 2022 03:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664248989;
        bh=7Jou6n5y0mKpBXvA3sndzVkCRVrnapOjPsW5ZL+vmmQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGONiHh8/FgmUxq/70cvzR2OxKfuAdCCkdcW3quM8HyvQSguG7rSFZvX5puor+oFy
         3VNjuX4Lso1I2VWecEIx92FAd8mnKfO+iU8mTQqIZBqCUQfL0AXhOGBt1+4bz+oebB
         Lbebkz7kyjva7h/zJIdFoA66IW9wF48t3iPoYidWC8yBBquAixqp6iy7NFBfW8ycr0
         LpgSIERpnJW2osiYHK65fLVT97OBMYwKeYXmWhuAeg/iqHX8/wco6k40Gj//t6V5wW
         iGogEzejflt9zKUWD1ARV/yUBtd/Xr3zejaPu9ws0ROim//wkQ4aEAswEcco7icDB8
         t06Exybmb3c0A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        mturquette@baylibre.com, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, quic_tdas@quicinc.com,
        agross@kernel.org, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Mon, 26 Sep 2022 22:23:00 -0500
Message-Id: <166424897976.1766486.7928034838653422228.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Sep 2022 01:28:46 +0300, Dmitry Baryshkov wrote:
> Add support for the Display clock controller found on SM8450 platform.
> 
> Changes since v2:
>  - bindings: added missing gcc-sm8450.h include
> 
> Changes since v1:
>  - Rebased on top of 6.0-rc
>  - Dropped clk-names in favour of using parent indices (Bjorn)
>  - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
>  - Changed bindings licence to dual GPL+BSD (Bjorn)
>  - Removed zero clocks in dt bindings
>  - Fixed syntax issues
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: qcom: add bindings for dispcc on SM8450
      commit: a7edd291636ac0bddf6c5a5aef6a94c2a9794830
[2/4] clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
      commit: 9d062edd561f594b71130c4846c9032bfec8d97f
[3/4] clk: qcom: Add support for Display Clock Controller on SM8450
      commit: 16fb89f92ec4412ac49ddca64944d5f72e063f69
[4/4] arm64: dts: qcom: sm8450: add display clock controller
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
