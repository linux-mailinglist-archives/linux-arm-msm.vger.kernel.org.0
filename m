Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A013869517E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 21:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjBMUNo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 15:13:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjBMUNn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 15:13:43 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E542A211DB
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 12:13:41 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id bt8so8785058edb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 12:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MjkVhik+WAb3qRRzojzZY2lXz1Voe6DUEDylRx+4D4g=;
        b=gtAjqWUBcWV4xgjaQ6CAAHoh6HLPZGuo6WxOY1i/c0Cb8YBdgt4jHiRINMV0EOfSSV
         xhawLvVfeZzETlmlBND5n/h99oFVun41/16CVAjdgvLkgC3g6u/Tvd0+W2YcoE7p3omL
         MwJwF60PRCJdBanXtFHLYmoYrGV5N0u/QU8BFqMQVancxIV+1yR9WrjlawBpF1DaFL9/
         mhWSZVQwKl6X0bDmN7RrA6kAmpsRZGGYTK//4T5AJesVWua8Z5oYxZ/1//eszrxTAf9E
         ik8/drFLxn/XL/bu9O+11ATqoSnpjLRD6Odp7xMwBQyVBIQ9LzbG4vuZJIE7smRZWryl
         f3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjkVhik+WAb3qRRzojzZY2lXz1Voe6DUEDylRx+4D4g=;
        b=4FtGX5+hX3r7Y2WrpyXo8FUiXJdTuON7PoUBIrPzIemEt5r96+/H/e0TcjK46QUK0W
         fNJzmX1YyEgAmJPwp9nq4EiRTlKSFCoXsPsGmG1Vx3j0U75UJYS/mVUI9H7uEDyWeSFw
         9/FMvDJhXNwJYyItcURNDO9/bopG6Iyjyiopj60ijKvWMw2XQMaAmFESRRGpU9OvvgaQ
         pLau12ZplKhJlq37Un0d6uRoOTPsuTd7rx0zVtB929fv9Rd/GmLZhKGWtPzoqeZqUR/W
         e9K4NcsN7WawfWWtkmg4WqK1RWQpoDc41IrsEPv3e3zsEIhlTUbGAd7pxn+Vor42cd1T
         UzOg==
X-Gm-Message-State: AO0yUKXpbZMopW6usre1WyPIt3MLMhOPf1Idu+KNcEQXpIl5m7FqcMGe
        iSfsqLcxwWnn0r9vdIJ/xya9zB9gNe6wvYvb
X-Google-Smtp-Source: AK7set9YU/NO+OmXrRLklZNzwVxNdZpEKT2OWpwGXr5FiZTDGEzYKQ9G2j6wtaKeCPUKm4U5C9JYAA==
X-Received: by 2002:a50:c006:0:b0:4ac:d2b4:5e37 with SMTP id r6-20020a50c006000000b004acd2b45e37mr2423427edb.39.1676319220217;
        Mon, 13 Feb 2023 12:13:40 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id g20-20020a50d0d4000000b004acc1374849sm2810440edf.82.2023.02.13.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:13:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Allow RRADC as adc@ subnode
Date:   Mon, 13 Feb 2023 21:13:37 +0100
Message-Id: <20230213201337.2089970-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

This was omitted when adding the RRADC bindings.

Fixes: 7ea58c951ab3 ("dt-bindings: iio: adc: document qcom-spmi-rradc")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index adf88245c409..8f076bb622b1 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -115,6 +115,7 @@ patternProperties:
     type: object
     oneOf:
       - $ref: /schemas/iio/adc/qcom,spmi-iadc.yaml#
+      - $ref: /schemas/iio/adc/qcom,spmi-rradc.yaml#
       - $ref: /schemas/iio/adc/qcom,spmi-vadc.yaml#
 
   "^adc-tm@[0-9a-f]+$":
-- 
2.39.1

