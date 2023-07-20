Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F21EF75A9CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjGTI5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbjGTIfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:35:47 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8849F1A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:46 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31454996e06so409343f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842145; x=1692434145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6wuvyxSk60K8F2hV0c6qQoMoIZ53/ofOSWmjRVPRV0=;
        b=r+hH/4xSutSv988DIYFRN99d/alj0PAlqtItVTAB/xOby9IilhJGWCYA6vMDTpis17
         h3EYyJhBGeEyOM4MRpbIN7CGKNscKmjWn6laozkicJOACKZr6YXQAYCN2p18rbI+XzBX
         oPjEITP6XSxs4W37hBNCo9P1wvqqAY+LnT+vwFBt7ZzQDXliSo65ymGkzfghXEL4/15f
         wlWh/zUfR/SMKY5vuIcB/j2OjpVjDyhoyQKjxgsrCA/XrT2KxkroLs4PICYO2pws5lOX
         U6/6bkAJi2q/E775UxiE/0cf5G7WGp8ATgNBNAXFVWymrDgmahDEBkK9VvFILJ2jn5Cv
         V7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842145; x=1692434145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6wuvyxSk60K8F2hV0c6qQoMoIZ53/ofOSWmjRVPRV0=;
        b=O8GT7Q2WrOrrKB9OYuPpnlklDpBFt94Is2BQyGNosp/7arktzKb3WWgrcjsKhfJ+8H
         UPrgRks3iM+rMJ3ek4VfipXrrFRKXc5+CPdCQzajaZTouWId2TNOBD4if24si80WOvwX
         0qDo8sPNVRu6cptOxgXS2Z8dXk9JBSHxBMwWe5AYtxR6wQPO3yCsxynts1UgWYIhRieU
         tlGLveFwRGhX6At5t7s6BpSYZn1m49eReFhKtbKmIAXcmS/PH2/hg4DP/njPVFxaxgHB
         k+l2yY85I9aHYt96XgEcqsphwT8S2bfpMc2vb+6PUoG/dgKUey0N5LqXV/3TsBzOssfG
         SFCA==
X-Gm-Message-State: ABy/qLbR9DFN1wC5Un8w1KEoeBrtAoK8zi7VrvL7pU45hnQxKxq0RqFH
        saevdRp36jSpESPwjBICVrxdaQ==
X-Google-Smtp-Source: APBJJlF/SdVIcWksWVGHT0dpGIqgo/k1Sr3/oisHos1dUerTU0/YGuDdIL5xpFVXYS/l3JvF5hbj3Q==
X-Received: by 2002:a5d:5148:0:b0:313:f86f:2858 with SMTP id u8-20020a5d5148000000b00313f86f2858mr1334486wrt.2.1689842145022;
        Thu, 20 Jul 2023 01:35:45 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h3-20020a056000000300b00316f9abf073sm612482wrx.82.2023.07.20.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:35:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: document PMC8180 and PMC8180C
Date:   Thu, 20 Jul 2023 10:35:39 +0200
Message-Id: <20230720083539.73675-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document qcom,pmc8180-gpio and qcom,pmc8180c-gpio compatibles already
used in DTS and in the same binding in allOf:if:then section for
narrowing available GPIOs:

  sc8180x-primus.dtb: pmic@4: gpio@c000:compatible:0: 'qcom,pmc8180c-gpio' is not one of ...

Fixes: 04bed6407ee6 ("dt-bindings: pinctrl: qcom,pmic-gpio: describe gpio-line-names")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 52b3d78645b3..3f8ad07c7cfd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -54,6 +54,8 @@ properties:
           - qcom,pm8994-gpio
           - qcom,pm8998-gpio
           - qcom,pma8084-gpio
+          - qcom,pmc8180-gpio
+          - qcom,pmc8180c-gpio
           - qcom,pmi632-gpio
           - qcom,pmi8950-gpio
           - qcom,pmi8994-gpio
-- 
2.34.1

