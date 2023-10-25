Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA087D6372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjJYHhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjJYHgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:36:46 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73249133
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:34:34 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32caaa1c493so3705179f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698219272; x=1698824072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVlwiJkgEOptZyxgmNkYyImFRkPkiQTz9Ix32yztC1Q=;
        b=z8ix1Ck2fa8YzN2xhqPKqa+BUKyJIXVyd1DPRZMSfqaGgVWBNHyEDjIdokUUwKEnZD
         MYmuSDdGb/t9yyMgTZK0Y5y0UJzs+KhZhvSiDsoG+asoNA+F1JkJY6P30CTkSDE0R7+C
         j6nBStyGJEgEyRCtmKgz9XpP/7r9oXprsFV7x60Re9OvQdS72kRAsWhksu0ssc+NiOaD
         4QbdlTQJzOFNbcGBRVSnI3KlPvhfaClh34sIc/Vv27m0IeyAEiGuOdKft+X8ymDS1OFw
         ZGcuWlr1/sFfUcDF0uJxbqPioK99VbDh2gk1V7SUxNvnNSB/ceQxu936oFUezFYhRXnb
         b1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698219272; x=1698824072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVlwiJkgEOptZyxgmNkYyImFRkPkiQTz9Ix32yztC1Q=;
        b=c4tEoTGayQxKzVmt1we8UpZp7Aeza43VGxLCbfJNvFoFBMokq8ImtvzZTGRvLtYBJT
         LT/n+TX2vDTFXXovsN+bihHGL09fjMCtSfmVCbwO1JMUfAuZQOUSR+HCVEesrI4geDZT
         ec9ou6bUHgcmbsfGqaImHld65wmrCjoN92kXxS95U3DNNQJ51v7EpfnGLilaRxlz3vpL
         tt2eUpoBo5wbinz2sUolRjkjtjcrHL46Uyt2ke40LA5crmm9xAj42p/3oLXpk7VddZf6
         Q7P3MLnIt7Fjw6GdkJ8viVgodxrA6pl6JLmj0zgBAMeONsKH9GfqTc8/efvyKsSDa8k9
         gjRQ==
X-Gm-Message-State: AOJu0Yy7MTyOHsfG+cEZEz3AlXbVwJ/5qJLyK1tLjOSkAEXCRwXKgG1I
        KvUnSBOPqv0VS3RJyfzvs0EBtQ==
X-Google-Smtp-Source: AGHT+IHAGjKxePRM19PhYeF3oCHG3b9njF0cJVMtL4PGOHKkoPvn68B6+gWqFkZVzVFHyq/HzEnKkQ==
X-Received: by 2002:a5d:4e06:0:b0:32d:a686:dedf with SMTP id p6-20020a5d4e06000000b0032da686dedfmr9812039wrt.57.1698219271597;
        Wed, 25 Oct 2023 00:34:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d4ac7000000b0032dde679398sm11431392wrs.8.2023.10.25.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:34:31 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:34:24 +0200
Subject: [PATCH 2/7] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: document
 the SM8650 QMP PCIe PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-phy-v1-2-6137101520c4@linaro.org>
References: <20231025-topic-sm8650-upstream-phy-v1-0-6137101520c4@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-phy-v1-0-6137101520c4@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Yg0TVyiYsosBLzL1a2yrBPOz0lVUOibz3FSYURBPVy8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUCUf8sE0aibMiV0kIEPpnQdLNqym/SMs4a7+z3
 YBq+aDaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFAgAKCRB33NvayMhJ0dorD/
 4ge+60cPByERIZrdK4nSqpOR2twsY54BM1cNi25fPEnXeQ1WZ48honBLxai5rHSee554jueYW5JoUq
 pLIrM8s36DszEGrAc7S60rQ1yHLiuCYqHPN9Ctdz39xLourEQx7rxtvaGcvZh85rnQm/n0/fhTYox4
 ea4YoTlsV5tUYKEiAh8pkN1/ZDBirFWFKOO+UTUhDDnum0+yxZyvsRGYmzkH5TyFV+sK+hjJWGRKwM
 Z3oyrcHMuoVME4Wr0LQw3gRWv2XBiuYy4vScNd2OpZx4pIRJriM7LHuZRAAlAPAWQl7WOb5l1hTkl4
 BkcTbH0K95N9uQ7QoY9vyEFb/cM4pUfDNU+WRbZW3DVtlMI1tjTHW9waNKGKPClmAHkIPeMUefND1r
 VYZ5eB8eMb5RQufIECd5EoDRS1fsdx+9SLwVLQ5DdiyO3MOuu5U1dm1sakb1RZ8QGPlV5HZCpYaI+1
 UZ8sXCyaa3UDaRWk7P4ecZzkXEuIojHzrWxgdjdhVvBPkyqexJXjD/jsVCX/absJmtcij54THx7WgT
 UMkw/22VomDx7hl2h6OaGnFqN2s5JH++RpeaKOK4q7v2HOgMNU76wPZjOIOSMBq5OZj8cRoHh0+Q/i
 FjKnCAZLpcsrnefQvYx5EuS4L9qO4BXNd6CQyMlA7hOMuVKz6Qk9xy6NXWLA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the QMP PCIe PHYs on the SM8650 Platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 2c3d6553a7ba..6c03f2d5fca3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -36,6 +36,8 @@ properties:
       - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
+      - qcom,sm8650-qmp-gen3x2-pcie-phy
+      - qcom,sm8650-qmp-gen4x2-pcie-phy
 
   reg:
     minItems: 1
@@ -147,6 +149,8 @@ allOf:
               - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,sm8650-qmp-gen3x2-pcie-phy
+              - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
         clocks:
@@ -189,6 +193,7 @@ allOf:
           contains:
             enum:
               - qcom,sm8550-qmp-gen4x2-pcie-phy
+              - qcom,sm8650-qmp-gen4x2-pcie-phy
     then:
       properties:
         resets:

-- 
2.34.1

