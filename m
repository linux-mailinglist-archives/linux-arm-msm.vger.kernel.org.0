Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB05E56576D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 15:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234949AbiGDNc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 09:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiGDNcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 09:32:25 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B611B21B1;
        Mon,  4 Jul 2022 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=uqUUaspXH3RMocrdO1iFs5HpcwQHE4q0i01WtWKBpNI=; b=LWnbMCwvXuVJqrMdNPM1Gbeqku
        +5H7N91U0LsgpicmZV+ikaqgRuX3+NHLW4/x0OLcJbvDFx+I65PEm9VdAMmLqVJiXnih6/dByGJRp
        DdrG5PTShNY3QEGOClSvvsrPAcdHOVQRwwGlf3/AGRNEhqWLccMoe928SM4bWJkyqsg2uKZDTsX8b
        6vdM9+GVSbO0X07eT7Pp+cw12IvTd3S408od1PQvqNPqnzoxT+gSV6UNaf1lj/R2YVRkpnnQEBTKZ
        sLIuY9RmEYWbX6ROHyekDntdEp68yxl5eM/HdOvd6rQYOdygxyjjGaN9Y678rnxhcl9c4+lQCkkhX
        IAyg6uLg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1o8M9a-0074oF-HI; Mon, 04 Jul 2022 15:30:18 +0200
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
Subject: [PATCH 0/6] clk: qcom: Add clocks for MSM8909
Date:   Mon,  4 Jul 2022 15:29:54 +0200
Message-Id: <20220704133000.2768380-1-stephan.gerhold@kernkonzept.com>
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

Stephan Gerhold (6):
  dt-bindings: clock: Add schema for MSM8909 GCC
  clk: qcom: Add driver for MSM8909 GCC
  clk: qcom: reset: Allow specifying custom reset delay
  clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
  dt-bindings: clock: qcom,rpmcc: Add MSM8909
  clk: qcom: smd-rpm: Add clocks for MSM8909

 .../bindings/clock/qcom,gcc-msm8909.yaml      |   56 +
 .../devicetree/bindings/clock/qcom,rpmcc.yaml |    1 +
 drivers/clk/qcom/Kconfig                      |    8 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-smd-rpm.c                |   37 +-
 drivers/clk/qcom/gcc-msm8909.c                | 2731 +++++++++++++++++
 drivers/clk/qcom/reset.c                      |    4 +-
 drivers/clk/qcom/reset.h                      |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8909.h  |  218 ++
 9 files changed, 3055 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8909.yaml
 create mode 100644 drivers/clk/qcom/gcc-msm8909.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8909.h

-- 
2.30.2

