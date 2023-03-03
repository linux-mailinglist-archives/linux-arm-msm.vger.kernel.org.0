Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E37496AA4AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 23:41:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbjCCWlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 17:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233395AbjCCWk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 17:40:57 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 613FA12F2B
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 14:40:10 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n2so5456789lfb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 14:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677883135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kByKMAiyThWhQddTcnHkd5we2tSElWbVAhY9mxsVtno=;
        b=OMCTtRvIvI50GnVEcXxiWt1Uj3jRgwIS2PrcmFPmyREtwWPzTYcIfaOgmt0JVub5M9
         wplNceox+SnEu6Hwr0ZEtNAcZ4L2sXf8UrwTQI7Kcqu+pjPxTwzZPz4I5CCWy6zfII5+
         oRQ71IoK+jB/8Y5vuhrHa9aT+5DfPq9KGGKI5W4wTiRIa31+d2MZVuGYd7OoOitpsCG6
         VUGwwEMtp0p+4MIo1yFFtSADl0y7r0pgc/nlct5IH/mS5FAqHQKd8GKUQKhBVfXA0BRF
         R8HIX0MzigihQ5K8txRSoIDyfJOTrb7Fq2UqQxevkaiXCpaBzjwi+tUoNqbbOj1v6r34
         23CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677883135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kByKMAiyThWhQddTcnHkd5we2tSElWbVAhY9mxsVtno=;
        b=XJucBjxeSFdx8QnIlYVBA2OlN25C5SBL580btr28iFDcQXg6O1Q7VhP0r7fij9XO/k
         oZDRZQpptzVox1l0sA15YHG0Mqp2pS8KUkOCMFxGAthjz3G3IP0U4+O7aHzMh3go14zn
         kuOziS65BAyorztJXvp1g8B4PmhR5eF6J0RuhS7lgOvuhhfhCZItgh0tpRBDkKVYKMUD
         sL5X8l/IxyOcq0uJyUGrQfB6sv36PPpH+24C7KkDdbdSj3HBvtYe+5WAW1VY3S/rjPic
         ce50JFAejf62rVfo0SxwN/MlzI9fPN4Eoa56psA5uSMSQ1pIRt8D781hjjpAA9kRIKbh
         J4VA==
X-Gm-Message-State: AO0yUKVz6vvyxtCWZ409u6UfPfmbIo80QsJ/Ahjyy6nu4Sj7NpLcp6Ev
        2EvAA405jgv0cGOkZTY1mV36y7smTQGjynhxl4U=
X-Google-Smtp-Source: AK7set/GCprVfnv+hPF1Rzfmz6l0SL8mWmBDIe6hyGF2LRIdlIONxmT5k8eDdZCZA4AF4K+IijZHHA==
X-Received: by 2002:a19:ae13:0:b0:4e1:13fa:bf07 with SMTP id f19-20020a19ae13000000b004e113fabf07mr985985lfc.43.1677880692932;
        Fri, 03 Mar 2023 13:58:12 -0800 (PST)
Received: from [192.168.1.101] (abym99.neoplus.adsl.tpnet.pl. [83.9.32.99])
        by smtp.gmail.com with ESMTPSA id e27-20020ac2547b000000b004cafa01ebbfsm552670lfn.101.2023.03.03.13.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 13:58:12 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 03 Mar 2023 22:58:01 +0100
Subject: [PATCH 01/15] dt-bindings: thermal: qcom-tsens: Add compatible for
 SM6375
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v1-1-8c8d94fba6f0@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v1-0-8c8d94fba6f0@linaro.org>
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
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677880689; l=880;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Xo5r61pKkn5u58scrvwnGxQSvCjXA8+p8ZYAEW/PB+Q=;
 b=7vSyzRro3M1PoiwzyP06k27hDzGfo3oDBQ8Z57zbfmtIIprHmAUCZ2Zdngs2nh9i9s8lrND9j7ZB
 IZhHCq+RAQmdNO0kARatFng3E2coXlwNbizIM1M6h2sKwXxeobOr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SM6375 platform has two instances of the tsens v2.8.0 block,
add a compatible for these instances.

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

