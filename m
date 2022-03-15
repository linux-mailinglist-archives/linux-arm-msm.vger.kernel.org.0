Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7B14D9739
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 10:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbiCOJMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Mar 2022 05:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346412AbiCOJMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Mar 2022 05:12:21 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869404DF6D
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 02:11:09 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bn33so25518419ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Mar 2022 02:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lk6U/+kdSwHOiKBRnGMc9pM7ic307xb3l3S/1lYHgbk=;
        b=HgA7bGMM2xe6/RgTPvCsAg+OJqmMEd+/9E5PtLGjVXvbVjN8Ig3IqT0OFl49IFBkJs
         NzRl6oy0XTt82JxWDcu5OWPUzrfJB77fwx2O34fJUV2en9TNd8WYVjeQ/ktwa1sVTM94
         SqRq0SDIpODgIdQk+i5XIjuqm37R3ly6B2UQczNvDV2gEop703/Z/6ChtlHcF763Qq3T
         bGm5vmq3Mxl5UAp17+Wod1YWTSvZ8kyPrCuJ9quepWy5RQD7kZcWbJ4yWpvhKzFxfOE4
         f/W044t2lZ5WXC++Qe8oFBXNrdeTbBfDVLOq0U+x1s6bgY/WkKw6ctywqT/uVvhxIZOc
         FW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lk6U/+kdSwHOiKBRnGMc9pM7ic307xb3l3S/1lYHgbk=;
        b=HddcewZprs2BaFZCpV+Y4Ki/5tFbEqKU2+wRLV+tWajzWFWdwbKS2IR7aAR7+CKK+e
         ISrxTci3Zta+uC2a8K0dVy6wPBoKdgNOwSXKfChJskFkqBgX09AwVCoAJKPcuM4f5dUs
         snj3vES2WTjz+BxkooPrXAV3mzfL2CImaLo0Y7wTcc7Qvhc0EnCbFNNO1yTbYlMYNm66
         zCGazPfEDXTdmbo869d/p1cgq1ssnjqwn9j1RK2+Ib4QwhV7dbxfMY5Rhgy0xXnXrgMx
         KSHoIVHlzLzi0f88/LiU1YozRcqGrI2njl91kXsVARhDlsr2eFaM8VGgDyNxHMj6zEC9
         ZCcg==
X-Gm-Message-State: AOAM533AwQo0rDR+dfF70Mso/okd5Yj77t+KawjM69CyCYq6Cd5zV3qr
        41xMBLoPQCn6/cYEgDY97AJUbg==
X-Google-Smtp-Source: ABdhPJwwPmzWCUOdsCyCpG4VT+IKr5U4nhJPLYcpo5RcCZ7MKFUcvUOPnV4GB/Tb5XUOOJ/v2XXwyg==
X-Received: by 2002:a2e:9882:0:b0:246:2caf:1c85 with SMTP id b2-20020a2e9882000000b002462caf1c85mr16798341ljj.25.1647335467627;
        Tue, 15 Mar 2022 02:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h10-20020a19700a000000b004481fbdf17fsm3604248lfc.28.2022.03.15.02.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 02:11:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom-pmic-gpio: Add support for pm8450
Date:   Tue, 15 Mar 2022 12:11:06 +0300
Message-Id: <20220315091106.613153-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8450 provides 4 GPIOs. Add a compatible entry for this GPIO block.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added dt-bindings entry to the pinctrl/qcom,pmic-gpio.yaml
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 9400b665a46f..fe2bcf0694d9 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,pm8350-gpio
           - qcom,pm8350b-gpio
           - qcom,pm8350c-gpio
+          - qcom,pm8450-gpio
           - qcom,pm8916-gpio
           - qcom,pm8917-gpio
           - qcom,pm8921-gpio
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f2eac3b05d67..4fbf8d3938ef 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1164,6 +1164,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
 	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
+	{ .compatible = "qcom,pm8450-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
-- 
2.35.1

