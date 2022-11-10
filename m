Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5E0623E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 10:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbiKJJZk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 04:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiKJJZj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 04:25:39 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B056A683
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:25:38 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ft34so3336646ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 01:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TV5gdfYWnEisZZMHW4dZHM4G0ZstNDnVsb4LHKYOk9U=;
        b=SMdFYaKzv0qYRLGwfTPJKkdHmqdX77uwjGzYJJgjLxNcvBu4CjuRo9rMFm6RwH62BO
         XrkJ1bUTnnH2GiuGeCkme+Ua2LoW+pK3/8Ay2aBCyOEWoRcPJNCEqO7/KMdrp/ApE8SF
         8QlAg8UM0kY/2NPlNincdKMa3X2n7ZLE2mLyKyIeZ2pp0JeNGHsWSAFCqVxDEJZ20CxV
         UMzJXhUreKqxS9tZzU9OAPtnYGBYu/H3sILj3Zer5lA5FFjlwnzCbPRwQMzpANyBnFTi
         A/QQb8Jmw2m+j7kNjgjEAY0tkEf0AYXXScBkFb5GvwZffoQY5i4RokzJZn9jCR3b51fQ
         6DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV5gdfYWnEisZZMHW4dZHM4G0ZstNDnVsb4LHKYOk9U=;
        b=cl+wQXWjP39uirPYo2mTeeq2WC2oY6iGZ9/xPWIKnyLicnfOJCDJkVVBWLULKImr2E
         D80Vn9bBbvTn+GNeXU9tXMF7ZJORseB73TkWGsEK3BGUAv3o0+ec65pc5swri3psuqJp
         A69aWmrYuxrgNFnUHbg2kBy0V3LEOK9hm3aTwT+YlucHRuYw1noVZRuVN5Q9utGmy4k+
         CDXowP+VByFFRZkE7McHvQzqsCB094WMqmv6cUW1SstaVnO2/MlR57Lsk3r3dTTBm0Ox
         o/uB+lJyWFboJYdGF2dgnCOaIufL4TOMlg5gcdZzShpjlR4jrATaj/nZ4JsirUyz8wwz
         a1Ng==
X-Gm-Message-State: ACrzQf26GK37/iwTykLYL56AvklCTivP+/um4VveCQ5dr6BsX98ZfF16
        /KmHZjgxKqly7zFBRN4u9nI77kr48SwhHczt
X-Google-Smtp-Source: AMsMyM4qu8lUTRYrpkUOL2GiMBEKO2rbjQyNC/lMqj0wBoKTpOV5gUqq53v1maHtaH4tCcLEFpl0yg==
X-Received: by 2002:a05:6512:10d0:b0:4a2:ad92:2990 with SMTP id k16-20020a05651210d000b004a2ad922990mr23523363lfg.276.1668071863689;
        Thu, 10 Nov 2022 01:17:43 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id r18-20020a2e8e32000000b00278d3123a16sm101219ljk.50.2022.11.10.01.17.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Nov 2022 01:17:42 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: regulator: qcom,smd: Document PMR735a
Date:   Thu, 10 Nov 2022 10:17:35 +0100
Message-Id: <20221110091736.3344-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PMR735a also appears to be bundled with some SMD RPM SoCs.
Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- pick up rb

 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index 961eed51912c..8c45f53212b1 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -71,6 +71,8 @@ description:
 
   For pmi8998, bob
 
+  For pmr735a, s1, s2, s3, l1, l2, l3, l4, l5, l6, l7
+
   For pms405, s1, s2, s3, s4, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11,
   l12, l13
 
@@ -98,6 +100,7 @@ properties:
       - qcom,rpm-pma8084-regulators
       - qcom,rpm-pmi8994-regulators
       - qcom,rpm-pmi8998-regulators
+      - qcom,rpm-pmr735a-regulators
       - qcom,rpm-pms405-regulators
 
 patternProperties:
-- 
2.38.1

