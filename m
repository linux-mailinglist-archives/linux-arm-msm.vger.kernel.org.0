Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C06FF6FFDEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239628AbjELAcg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239521AbjELAcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 702C355B1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f13dafd5dcso10405868e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v6fMf66paZoXqIuo4BxC8AZa8OirHGIMmg66YBgwmro=;
        b=rewfLLJ7ucN3IaQLVDxRzSAp7Gvty+e3ZByWUoRGoLZ6s2Wv9IJXWThGngQ8Oj1Ahn
         zfXVXb+KuWiF9SStSuwjsgyfhF1pIwhB/0sv3tqizZfwhX1jECYlXUHK9buVUEHGPITU
         B3ZfpzitRhx+3WE3P8sDUcakZ0cQNgcWM7YI5bgxybgHunQ69W/Xy5RVDQfp0Yu8h+P9
         WuOmQDPS+6P+9AxUWMkEFvRJ2DwCK7wvaNv09gyWGNlkqtLmKQXbQ79IMLdzKLopBU/F
         zc714YCaq8rsooxmUbJeP6iwY41j39o5uV6nlF9b8v3fAc6voBXT6qdWKh9tc0J7AjQv
         P4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6fMf66paZoXqIuo4BxC8AZa8OirHGIMmg66YBgwmro=;
        b=ODvBOvOqRQ72HdqQQs2duu+GBZpzfF8v/SfrQj3bOZB4X4XYdh6WOH1mxWLDNB5XwH
         63cyIqFO615aBP/Knm8n2ShFZR0H4CW74vUj+bVMhQmWqlBpywoAAGoqG3gD1EZaQC1I
         VE0FlCKr1o593Jo04DXL/9z52VpSgoiZWfjVtss9fWEJA3diUy74g/zUxsBbhRnOE69K
         Mpm7mf8gfvnjt9nipGJI+xF6Sd6fWQEeh7H7/ZkOPlXctzXxBeP0tksUnXBJ99msrBBA
         wFMX+AN6XZ1/gRsEG7VVcOaPiEab1CYPJPN7A+nOaenbDU/PyMPXumkjFUAVdshwv1co
         n4+A==
X-Gm-Message-State: AC+VfDwiSMo7u6kNIfwAybHiYxT4wrC3BxW7MXVmWgph5lIIImgTEaY5
        rFO5RWqLTT07rJg6GBbghoENanyFWfQayUSNn2g=
X-Google-Smtp-Source: ACHHUZ6iLM+caXjJxEsjR9qcucutr+1Ohf5IEEpdRraIHNsOEMprWFQqckumeeYE5h3420wplBsbTw==
X-Received: by 2002:a05:6512:69:b0:4f2:520d:8314 with SMTP id i9-20020a056512006900b004f2520d8314mr2979074lfo.65.1683851551715;
        Thu, 11 May 2023 17:32:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 00/10] clk: qcom: convert mdm9615 to parent_hws/_data
Date:   Fri, 12 May 2023 03:32:20 +0300
Message-Id: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series concludes the conversion of Qualcomm clock controller
drivers to using the parent_hws/parent_data and declaring all the used
clocks in DT.

Changes since v1:
- Dropped clock-names property in favour of using the index parent data
- Fixed Taniya's email (Krzysztof)
- Added Cc:stable to the pll8 patch (Konrad)

Dmitry Baryshkov (10):
  dt-bindings: clock: qcom,lcc.yaml: describe clocks for
    lcc,qcom-mdm9615
  dt-bindings: clock: drop qcom,lcc-mdm9615 header file
  dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
  clk: qcom: gcc-mdm9615: use ARRAY_SIZE instead of specifying
    num_parents
  clk: qcom: drop lcc-mdm9615 in favour of lcc-msm8960
  clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
  clk: qcom: gcc-mdm9615: use parent_hws/_data instead of parent_names
  clk: qcom: gcc-mdm9615: drop the cxo clock
  ARM: dts: qcom-mdm9615: specify clocks for the lcc device
  ARM: dts: qcom-mdm9615: specify gcc clocks

 .../bindings/clock/qcom,gcc-mdm9615.yaml      |  48 ++
 .../bindings/clock/qcom,gcc-other.yaml        |   3 -
 .../devicetree/bindings/clock/qcom,lcc.yaml   |  34 ++
 arch/arm/boot/dts/qcom-mdm9615.dtsi           |  19 +-
 drivers/clk/qcom/Kconfig                      |  14 +-
 drivers/clk/qcom/Makefile                     |   1 -
 drivers/clk/qcom/gcc-mdm9615.c                | 261 ++++----
 drivers/clk/qcom/lcc-mdm9615.c                | 572 ------------------
 drivers/clk/qcom/lcc-msm8960.c                |  19 +-
 include/dt-bindings/clock/qcom,lcc-mdm9615.h  |  44 --
 10 files changed, 261 insertions(+), 754 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
 delete mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h

-- 
2.39.2

