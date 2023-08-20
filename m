Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABD8F781E1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Aug 2023 16:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbjHTOZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Aug 2023 10:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjHTOZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Aug 2023 10:25:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21852D56
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:40 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2882038e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Aug 2023 07:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692541239; x=1693146039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4488m6ufnvtM6zRq68XhiwvCa3j4jdkHB6b+QarVIdU=;
        b=py+8OFRfNn+Ad+h3h6owoGpJSDcn4RvSVa4NG0LkY8I5UY5/ZNz5ZT+AmuZrLsT2xq
         DJcuyqmIkMSaat8prbWCpTCVIezIcXPCD477tW8jO+ms0IaaNmjwSQfazMdY2R0uobY8
         gwOJ8HpbxHz6LnDDiHInxo2b34HqFdpuQT6b0jlyf4Nb+JHB5Y1HTkAFcSPxjKblHdp1
         ERPcu0VWOCbaLMMu9b+LtdcGb0N6JM8GPOmgwnutawFIdvYU+kN6dR+0r7pAl1rfP61Y
         qKHhza7XqpSO57PF0KuvdNTDOc06NIpMua8VxMOrGhkO0DhwmStB6BQvPaMC55cAArrK
         9JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692541239; x=1693146039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4488m6ufnvtM6zRq68XhiwvCa3j4jdkHB6b+QarVIdU=;
        b=MH76f687qCfqzMBX2KQz98/GpG1gz8+618CZRkctyhKJHDY8CIMCcV0wGexEmgj6Fk
         vs+JG6qD02f/ZYCW6jpR1VEQW/XMmlOAFy4jLfhX8nxgObzFH3WMxUAELIFdsMK9Hoxu
         Gs+PWLAw1Oko/AnmlPn/vBZ9oUZj5WvcraXLc/mncbkee2vyzkWi/2lOrFhaN+1aZngO
         x+X1lQx8KB8529BsA2Q4y8evJf6J8jvHk28C9s3SfKhi22nbSL5VhYfQGE4P+ATpVocy
         v1YQLXMcWcfVDVJecoWx8MK/sMVdTVpyd4HEMfqXXt2Gj8bhH7AE2pOAh5Gr1180mEe9
         pRrw==
X-Gm-Message-State: AOJu0Yywu8UVZoltHOt6EVz5NmltVMwmylbsD9o0bkbFd6WD6p86xGha
        bh+q7lMAEZmyMN5O+ZW1cozg1A==
X-Google-Smtp-Source: AGHT+IEx6VzILDtjRdmPOG+verwboLyFzC4EI4/m0ODbpxUdRrKZKtHDg3l4yHhmoqB63xPrWHO0Yg==
X-Received: by 2002:a05:6512:3ba4:b0:4fd:f0b7:d1f8 with SMTP id g36-20020a0565123ba400b004fdf0b7d1f8mr1437444lfv.23.1692541239176;
        Sun, 20 Aug 2023 07:20:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n9-20020a2e7209000000b002b9e501a6acsm1706222ljc.3.2023.08.20.07.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 07:20:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 02/18] dt-bindings: phy: qcom,qmp-pcie: describe SM8150 PCIe PHYs
Date:   Sun, 20 Aug 2023 17:20:19 +0300
Message-Id: <20230820142035.89903-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
References: <20230820142035.89903-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Descrbie two PCIe PHYs found on the Qualcomm SM8150 platform, single
lane and two lanes Gen3 PHYs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 82e30e75a2ee..2c3d6553a7ba 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -26,6 +26,8 @@ properties:
       - qcom,sdm845-qmp-pcie-phy
       - qcom,sdx55-qmp-pcie-phy
       - qcom,sdx65-qmp-gen4x2-pcie-phy
+      - qcom,sm8150-qmp-gen3x1-pcie-phy
+      - qcom,sm8150-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-gen3x1-pcie-phy
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
@@ -135,6 +137,8 @@ allOf:
               - qcom,sdm845-qhp-pcie-phy
               - qcom,sdm845-qmp-pcie-phy
               - qcom,sdx55-qmp-pcie-phy
+              - qcom,sm8150-qmp-gen3x1-pcie-phy
+              - qcom,sm8150-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-gen3x1-pcie-phy
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
-- 
2.39.2

