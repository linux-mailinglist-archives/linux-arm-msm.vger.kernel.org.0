Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 222FF69E6AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 19:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbjBUSAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 13:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbjBUSAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 13:00:33 -0500
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3732CFE0;
        Tue, 21 Feb 2023 10:00:29 -0800 (PST)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id BAD8C1C0048;
        Tue, 21 Feb 2023 18:50:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-092-072-008-248.092.072.pools.vodafone-ip.de [92.72.8.248])
        by srv01.abscue.de (Postfix) with ESMTPSA id 4D4131C0046;
        Tue, 21 Feb 2023 18:50:22 +0100 (CET)
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
Subject: [PATCH 0/4] clk: qcom: Add clocks for MSM8917 and QM215
Date:   Tue, 21 Feb 2023 18:49:05 +0100
Message-Id: <20230221174909.164029-1-otto.pflueger@abscue.de>
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

Otto Pflüger (4):
  dt-bindings: clock: Add MSM8917 global clock controller
  clk: qcom: Add global clock controller driver for MSM8917
  dt-bindings: clock: qcom,rpmcc: Add MSM8917
  clk: qcom: smd-rpm: Add clocks for MSM8917

 .../bindings/clock/qcom,gcc-msm8909.yaml      |   13 +-
 .../devicetree/bindings/clock/qcom,rpmcc.yaml |    2 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                |   35 +
 drivers/clk/qcom/gcc-msm8917.c                | 3283 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-msm8917.h  |  190 +
 7 files changed, 3528 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/qcom/gcc-msm8917.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h

-- 
2.39.1
