Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C77A5B1673
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbiIHIJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbiIHIJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:09:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BEF927FC8
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:09:47 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z25so26470016lfr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EjOGOyFyhpfH4k4XbmutKBu4ymCpPs0z9gc9LUDufiQ=;
        b=ckJaHpkSh+Ux61C0pkbA29NMOnZ36sQKuq4JOWm2dt4/f368tIuEMDFh0HvPYsidK4
         6/K8R5hFjEaeDgIgVPQ/pZ3k3uUr4J9HxjDUml8JsT3FAr8Ogg3ObzoDGw9nsA3d4u19
         /1URfJcSkQloEEnCge9wp3gRFwvfix2X5wU00pmksGfAxJLRVQUcQ81ioMZ1Ax1aaafn
         mkRL/UjjeEVUqHyI5r5xDq8cHnxW3tMYy8/pgHsqkE2YO3Y0miNnuHVmQA/hOVRg/jvA
         DMuwZKl4kHns1Fquiv1/Zf8f9dr+5i6dzw7KQYcQeRgGx3bB7KBmXyT3Q4cLkhZqH6pZ
         dxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EjOGOyFyhpfH4k4XbmutKBu4ymCpPs0z9gc9LUDufiQ=;
        b=oA00m4QLS4A8pQzO/H9bPMTE0R/LVuO92Qbrzwf1CHHrowPW82WDFOrB+PKJkHlzr4
         h0sAzlb3XXAMbLojcuPZCGA/SSAUL/aOMXKDlDPBcAgosNCKvx5MQuKeBjDvQWjMRBad
         oR5iI6ko5lN0OUwN0BCUGYgw/N7QL23LkGHv3t32tlLHO8or0U2eGdsHt2Tou2gss7Ac
         NtKQllNju5Trs5RdlFF+h4BF1J54/3VmwrpcFdKNchnr+ZpM86Kq6Hcbf1PmMau0CRNr
         JkNcrl9/cZTmgGnXV+I18yk4Iy8C+1elvg+fj9sUSZuleIR53QgvAgYXaya0Nd3ia/JU
         oNJw==
X-Gm-Message-State: ACgBeo1DgLxSO0rKuXBce553nsVkXqrLuWTyuSdJsJ3lQ4vivm8sSTth
        7OSgXWo+FxRummVDMM7GAuWl/g==
X-Google-Smtp-Source: AA6agR7CWRGB1eutiFB3Q4GKqeg7A5UuMvSAjbpWjtBb5C9ugwmFEqw4ldYLZ230Q74jRAKrh/qEAQ==
X-Received: by 2002:a05:6512:b96:b0:497:9dac:cc22 with SMTP id b22-20020a0565120b9600b004979daccc22mr2162370lfv.687.1662624585896;
        Thu, 08 Sep 2022 01:09:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e2-20020ac25462000000b004946b7593fesm2930173lfn.198.2022.09.08.01.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:09:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: mfd: qcom,spmi-pmic: use generic node name "gpio"
Date:   Thu,  8 Sep 2022 10:09:38 +0200
Message-Id: <20220908080938.29199-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908080938.29199-1-krzysztof.kozlowski@linaro.org>
References: <20220908080938.29199-1-krzysztof.kozlowski@linaro.org>
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

GPIO controller nodes are named by convention just "gpio", not "gpios".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 9676a9e3d176..6afe8f03314d 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -117,7 +117,7 @@ patternProperties:
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
 
-  "gpio(s)?@[0-9a-f]+$":
+  "gpio@[0-9a-f]+$":
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
@@ -197,7 +197,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            pmi8998_gpio: gpios@c000 {
+            pmi8998_gpio: gpio@c000 {
                 compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
                 reg = <0xc000>;
                 gpio-controller;
@@ -282,7 +282,7 @@ examples:
             };
         };
 
-        pm6150_gpio: gpios@c000 {
+        pm6150_gpio: gpio@c000 {
             compatible = "qcom,pm6150-gpio", "qcom,spmi-gpio";
             reg = <0xc000>;
             gpio-controller;
-- 
2.34.1

