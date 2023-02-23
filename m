Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65EEC6A0F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 19:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbjBWSKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 13:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbjBWSKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 13:10:36 -0500
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2943B5708C;
        Thu, 23 Feb 2023 10:10:19 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 93D6D1C0048;
        Thu, 23 Feb 2023 19:10:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-073-085-163.092.073.pools.vodafone-ip.de [92.73.85.163])
        by srv01.abscue.de (Postfix) with ESMTPSA id 1FE431C0046;
        Thu, 23 Feb 2023 19:10:17 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 0/4] clk: qcom: Add clocks for MSM8917 and QM215
Date:   Thu, 23 Feb 2023 19:09:31 +0100
Message-Id: <20230223180935.60546-1-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for clocks, resets and power domains provided by the global
clock controller (GCC) and clocks controlled by the RPM firmware on
MSM8917/QM215 SoCs.

The only clock configuration difference between QM215 and MSM8917
is the source mapping of the GPU clock, so a single driver is used
for both SoCs.

Changes in v2:
 - Added Krzysztof's Acked-by and Reviewed-by
 - Rebased onto linux-next-20230223
 - Fixed address in oxili_gx_gdsc
 - Mentioned QM215 in Kconfig
 - Switched to index-based device tree clock lookup
 - Switched to of_device_get_match_data for determining the SoC variant
 - Formatting fixes as suggested by Konrad
 - Added depends on ARM64 || COMPILE_TEST as suggested by Krzysztof

Otto Pflüger (4):
  dt-bindings: clock: Add MSM8917 global clock controller
  clk: qcom: Add global clock controller driver for MSM8917
  dt-bindings: clock: qcom,rpmcc: Add MSM8917
  clk: qcom: smd-rpm: Add clocks for MSM8917

 .../bindings/clock/qcom,gcc-msm8909.yaml      |   13 +-
 .../devicetree/bindings/clock/qcom,rpmcc.yaml |    2 +
 drivers/clk/qcom/Kconfig                      |   10 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                |   35 +
 drivers/clk/qcom/gcc-msm8917.c                | 3303 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h  |  190 +
 7 files changed, 3550 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-msm8917.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h

-- 
2.39.1
