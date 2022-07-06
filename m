Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558585689C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 15:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbiGFNmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 09:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233364AbiGFNmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 09:42:12 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E70424F3C;
        Wed,  6 Jul 2022 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pRB9ZxssVkEPMCaLQoK1ttK9PaFD+rsL8YmmMSc58UA=; b=LMQuGDgYeUKs+8nUJBuAxNNd98
        Q35OYNJNuygpQ9/OtQzSKvk64oqGQ1izm62F2bT0DlgugfsA/Ngc2B0LyIqF7gxNMbcDuV11+1Ejr
        bAAZHUoQpGm62fYDyXN+Pd+hL0GpVvaekZh+oqLN3r5+vhKFne8eK9nk74kVWx/tP9XSC3NOgXA0f
        NlPnzzLFFsNHeTxgAmSLHHQK2LkM6HfiqaGhMEO6ahrGdv8FQIEBA4CQEO2Cc/VEnExUmlvHPC5i/
        ElWlsWJYSnEtIhbNUzHIYigd6qcmo1QfclGdVVwuVleGmDJuKQGKSSuS1gpi3zvlRsnnBptmnJ0kt
        SBGp7X9w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o95Hy-007M5K-Qn; Wed, 06 Jul 2022 15:41:58 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH v2 0/6] clk: qcom: Add clocks for MSM8909
Date:   Wed,  6 Jul 2022 15:41:26 +0200
Message-Id: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a driver for the Global Clock Controller (GCC) that provides clocks,
resets and power domains for the various hardware blocks in the MSM8909
SoC. Make it possible to have longer delay between assertion/deassertion
of particular reset signals (this is needed for the USB PHY on MSM8909).
Finally, add the necessary definitions for the clocks controlled by the
RPM firmware on MSM8909.

The patch set is fairly large but most of it is just boring clock
definitions in the GCC driver. And compared to newer SoCs like SC8280XP
with 7k+ lines in the GCC driver this is still fairly small. :-)

---
Changes in v2:
  - Make "clocks" and "clock-names" required in DT schema
  - Add review tags from Konrad and Krzysztof

Stephan Gerhold (6):
  dt-bindings: clock: Add schema for MSM8909 GCC
  clk: qcom: Add driver for MSM8909 GCC
  clk: qcom: reset: Allow specifying custom reset delay
  clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
  dt-bindings: clock: qcom,rpmcc: Add MSM8909
  clk: qcom: smd-rpm: Add clocks for MSM8909

 .../bindings/clock/qcom,gcc-msm8909.yaml      |   58 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                |   37 +-
 drivers/clk/qcom/gcc-msm8909.c                | 2731 +++++++++++++++++
 drivers/clk/qcom/reset.c                      |    4 +-
 drivers/clk/qcom/reset.h                      |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8909.h  |  218 ++
 9 files changed, 3057 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
 create mode 100644 drivers/clk/qcom/gcc-msm8909.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8909.h

-- 
2.30.2

