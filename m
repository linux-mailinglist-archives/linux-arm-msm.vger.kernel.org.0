Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5DB6BD1E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 15:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbjCPONG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 10:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjCPONE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 10:13:04 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F2B5ADD1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:13:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b10so1872122ljr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678975981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BpBLhF7aJ8XDaNEo3pgNtZLZiLgPvI+GpJaOKLbCqg=;
        b=YltE/VzWOhFVV9rC/25tW+AT2zTFZ/y6DSwBqhXQyEBAE/Y6OMFKBZZ5Q33bBe6qcP
         PE8YvHVXCTku0Kmz187ciG7Czwtj1HWxZ0TMMc3fG35wKA9FseDL2r3gXvwALVcF7vB3
         /GiqH6S6u/pqAj6H4CWgxJDCxuYQ8kVqHQAo18hON1uvyICjFmOcZ/qIawArKHJHvBCg
         0MZfJ5JJGtJYRGU6S4CzuOKW0acEtxKvY2bR4iEo4GLkr28qiFFVpGbhorzfnU48nC5p
         MUb/cBZDeC9QJ3KYUI73YoBgTDXzEOGdPcyC0ZQJPuqqDTnICnPLUIJiCU90vUbsyqoi
         wNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678975981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BpBLhF7aJ8XDaNEo3pgNtZLZiLgPvI+GpJaOKLbCqg=;
        b=Gn+Q+s6JpWKnM1BfypSxtRZ7wOP9NJNI5sGq4z+owTlu+2RHg25+Hia+uJjBxhw55e
         tPMg+UG422Hkw4jtSvB70tGihisw1QQvxxkOpu8zrzU9/LHnd7IMW3qRJqdD/ZLkrBTY
         DR2c+cVVXPKL9k2mdghcWlKrf/u+tHTRVXkZH0Dd9RHnv1Quv7SvPq4VEDulQaSe+Lki
         TAiJLpcPVzJMghh2XqjlVyiqzMrMDru4A3gPH9SRswnhZGgBt+L3ViGGc5gY/QEgO3z7
         lXFHYyH6Xv70SUuzmR8rvqZvdSJPlNtnjNW4lNj7/aG0se9ERdh3IoKfMDccTK9mW8hO
         TMWA==
X-Gm-Message-State: AO0yUKVJkiPXlq9SiL5xYXIzbO+qODVexavJlEsu/YJ3ohd/4mQMeMb9
        Qeagc6eGHmF6dhN7Jw+MkvUCDA==
X-Google-Smtp-Source: AK7set+B56+wMoBVdhJEio81s8i+HfKpgPcCBQPkW7htmyvgIRoRIWpgCi017xTSXgxRXJMBy4LaUA==
X-Received: by 2002:a2e:9281:0:b0:294:669a:6adc with SMTP id d1-20020a2e9281000000b00294669a6adcmr2024061ljh.3.1678975981240;
        Thu, 16 Mar 2023 07:13:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a9-20020a2eb549000000b00295735991edsm1261639ljn.38.2023.03.16.07.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 07:13:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 15:12:50 +0100
Subject: [PATCH v2 01/14] dt-bindings: thermal: qcom-tsens: Add compatible
 for SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v2-1-708b8191f7eb@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v2-0-708b8191f7eb@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v2-0-708b8191f7eb@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678975978; l=944;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7yZwhGENX7kryEzh3vUpHmBmqtqu0DXIXAX7kaP5Nx0=;
 b=oemx7n8vVMQxmhebPZ66HcpC4qxeCouJUTM+2mDAsIFu7O+gMMlMiJ8qxeOr6iriomV1T9AVlMgR
 IrHeimFhCem38YQhwOHlNgM5ACQ1S+oDyKrnon/rpDdafYPuVwvi
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM6375 platform has two instances of the tsens v2.8.0 block,
add a compatible for these instances.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 926e9c51c93c..d73b72dafcbc 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -56,6 +56,7 @@ properties:
               - qcom,sdm845-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
+              - qcom,sm6375-tsens
               - qcom,sm8150-tsens
               - qcom,sm8250-tsens
               - qcom,sm8350-tsens

-- 
2.39.2

