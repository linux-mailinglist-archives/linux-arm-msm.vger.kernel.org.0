Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9735B293C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 00:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiIHW24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 18:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbiIHW2y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 18:28:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A79F340E
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 15:28:52 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bq23so30164861lfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 15:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=YvAdGykEq7nSKOvPWAG7qubexjgftEKGvB66ejdN5V4=;
        b=jhxpROZ204WKs3eV40WldY4SIqufY/J0PvqLrckl3pJWXVsol/v7jljgDLdDIawyQj
         yMmOYsKl8D7x0iF2ZdBJbMbn7aTB1mXo0OAWkWRLXvsy6b9ZAP+MGQKRtAwlmWyd+k2g
         40rJ2IG2rg5C3a5F1zRWKt3HWfSj2cI10qjyHFGsbcKBaawLniX7la3N5Raw8RNNqy1j
         Ysf0oioUugtE7+kW+vwy66Ikp1iKwj9k/go93bnVrIlA4FW0j+IdGacFhm9+/xv6z881
         z5WPcqfEmPciWA33miuq/HWCXhaiDp53esrki0eJ+93g2tcgbZeVkdjXrveyu7z3zRL7
         6KGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YvAdGykEq7nSKOvPWAG7qubexjgftEKGvB66ejdN5V4=;
        b=tIXlaWtKe17zDb7DXSS7CBDxIuaRIT1jcxZZNC+WFrnh3uVMWwadIcLGTge1xVXVM+
         BTX86nsDbZRXaCppowFt6DgnHQaT7wwx4VekjDrXxRG2D1x83/ov5/tGal57Jk2+aUr6
         lsF+JakinSHK6Fgt+bKA1YqfEuAUNjlTJlAaY8GnYt4ppD8BSx8dsDZrD4Iv+LT2Ouz0
         9YR3KN0RHRPSgP3XDxx5Tsnulzki45qhJJ8Wn3amT9rxrAMimhqZScD3qmEugkI7nGD0
         R3Mx+NB9t4bDhoH0hLRwnxnEd4SlNdmUDBLeEu96V/gwOOR61cRMq7+dSnr6O+RG3psB
         Sg1Q==
X-Gm-Message-State: ACgBeo3g7+p5pkYw/Jaz3Muwa1LWDdKiyng9VgGw7ZULQrxe5L3qsC+X
        AuF98Wl74iJa/sgR3CNSEWcuXQ==
X-Google-Smtp-Source: AA6agR5gFZd9K+TjJzxW4w/9epOoQAtaBZFTY7CxP7psTafUfRrLOjEvwG3ZK5976Wm4Q9kkzMIjUw==
X-Received: by 2002:a05:6512:68c:b0:492:2f73:6135 with SMTP id t12-20020a056512068c00b004922f736135mr3638882lfe.480.1662676131159;
        Thu, 08 Sep 2022 15:28:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a25-20020ac25e79000000b00497a3e11608sm1389078lfr.303.2022.09.08.15.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:28:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] clk: qcom: add SM8450 Display clock controller support
Date:   Fri,  9 Sep 2022 01:28:46 +0300
Message-Id: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Display clock controller found on SM8450 platform.

Changes since v2:
 - bindings: added missing gcc-sm8450.h include

Changes since v1:
 - Rebased on top of 6.0-rc
 - Dropped clk-names in favour of using parent indices (Bjorn)
 - Added GCC_DISP_AHB_CLK to dispcc node (Bjorn)
 - Changed bindings licence to dual GPL+BSD (Bjorn)
 - Removed zero clocks in dt bindings
 - Fixed syntax issues

Dmitry Baryshkov (4):
  dt-bindings: clock: qcom: add bindings for dispcc on SM8450
  clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
  clk: qcom: Add support for Display Clock Controller on SM8450
  arm64: dts: qcom: sm8450: add display clock controller

 .../bindings/clock/qcom,sm8450-dispcc.yaml    |   98 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |   28 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/clk-alpha-pll.c              |   40 +-
 drivers/clk/qcom/clk-alpha-pll.h              |    1 +
 drivers/clk/qcom/dispcc-sm8450.c              | 1829 +++++++++++++++++
 .../dt-bindings/clock/qcom,sm8450-dispcc.h    |  103 +
 8 files changed, 2106 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8450.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h

-- 
2.35.1

