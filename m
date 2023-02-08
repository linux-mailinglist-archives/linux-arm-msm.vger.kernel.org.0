Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0113868F7A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 20:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbjBHTCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 14:02:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbjBHTCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 14:02:09 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D0551C6C
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 11:02:08 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id z13so6569844wmp.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 11:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thW52RtRlGncxJVAXaAffrOQRfnK09M5G6J/HHLJxeo=;
        b=IJPQzDtDJMNd14JAQMKLtLY0kTY8n5Is09xQPcIVEtMbkHyV9QqiYVqGqzyEMjttkR
         OV254jWle7m64ztlPT3PLDLNKjeVus/L1jr8TwaQ9mekCou0BdxzVJZk3CIIFeXHLWJP
         f1S8AgBtpLmTUIzhgNIHDbUuIGr1sYzQ6H45SHwGxtiEfVti6MA4b9lCnW/IXCJQmY++
         +I89ebBBTD9wkKeozRNmT8HPeoUmdZ4/2Lox6mkFoxm4K+xOSCe3ECFtMXL90+1DagmG
         OBEIyUpgy9+qjfvU9wejt9VZ73EAzSfxKGZ9H2f3c4zaz8bpQ9lgF/DhynpHSxNUbGRD
         rgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thW52RtRlGncxJVAXaAffrOQRfnK09M5G6J/HHLJxeo=;
        b=31+TfjlbXpuQzzqzVwdUCwlg3ndPQAQpiTEC/rF3dlr5cFcoE/oIrvxn3+GREXxYL4
         vwmghW4c/VrVhzwS5967iePDlRgTNClwC7ZAjAu5xtOjKZoLF3ct9SCV+E/GHUd+loUn
         2rbHWSeAZ1rBayYtgRzNx9SbHlzaN65owNBiSvEMI6lcw/6QCQHrsYZsqL7egR/8xZqq
         OzrU99IEFmIxfg2VGjgJWiybf5xIZjNKXzDrvevnKXLede16k/Jfltmyaw6mbpiTG155
         LSHjbKLczYhVtlcsuEbvzOGsDA+9WU1rSu+vq9FlQmMdUmULhx4iMnOHHYqM/JSxdsl5
         Tz2A==
X-Gm-Message-State: AO0yUKVvoYSMD8QTsXYxlMTQS3RqW5bYgeUZ9QIWWRNOCVApUkHCOYSd
        xVVJ/9HeQgDPut5gYwinAPmM5A==
X-Google-Smtp-Source: AK7set++X4dMzU1+TglBhBaz5aGpsMTEVRAyv1rwdkeuctCDcJF350WikbhtaW9nWta1HACpDwG+ng==
X-Received: by 2002:a05:600c:991:b0:3dc:489e:1867 with SMTP id w17-20020a05600c099100b003dc489e1867mr2320129wmp.36.1675882927171;
        Wed, 08 Feb 2023 11:02:07 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003dc1d668866sm2650327wmc.10.2023.02.08.11.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:02:06 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 2/7] dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
Date:   Wed,  8 Feb 2023 21:01:55 +0200
Message-Id: <20230208190200.2966723-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208190200.2966723-1-abel.vesa@linaro.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The phy pattern property will be used for providing eUSB2 repeater
functionality. This will be modelled as a Qualcomm PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v4 is here:
https://lore.kernel.org/all/20230207135551.1418637-3-abel.vesa@linaro.org/

Changes since v4:
 * none

Changes since v3:
 * made this the second patch rather than the first in the series

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index adf88245c409..1e6fadec1301 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -135,6 +135,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#
+
   "pon@[0-9a-f]+$":
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
-- 
2.34.1

