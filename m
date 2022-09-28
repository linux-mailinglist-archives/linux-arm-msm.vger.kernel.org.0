Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0245F5ED896
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 11:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233478AbiI1JPB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 05:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233442AbiI1JO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 05:14:57 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7542D13F75
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:54 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso782717wma.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=023BWzFGoh6yNCJfCZj2tFT5RwOQmjQOUQ87lIya78E=;
        b=KN6CL/3XQQrEkDayOExfrxatRqUXR4MQTCpYTfywenj+NTZBFh4TEYx58E2y7wwNbC
         AT01DWwttdaMk6/aZtaDG+xTzPQ+qfJ0pgvPYjH5kwLIRbF7BAftjzI3raQ9DBg6IE4j
         CZUo7voao85owMvy0JUpNKPK0gKDUUMMLrOOChye3H+CImFUKJCLQ+kbP9TTdCwNyCKP
         zR8/jJhIsYnuWy50NCDq1a+PmeJr2N32JRSuhTsPwejgexkUPgv2UJ9df5+Ke8oy9HdI
         J4poyU7iVT7TTqnwgSIl5zKEtWKd5TB8CTyOrUtLosyDbgwPp3KDygDG7zxPLHxwZI1K
         iqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=023BWzFGoh6yNCJfCZj2tFT5RwOQmjQOUQ87lIya78E=;
        b=qa9nS0KjzPcNrDFNr4f4R0BbyzQ43SvfguQkeyyJroErymMrOjCHYtAUOOWUdO49+Z
         Aq2M7oT4qnsp0NsJTLnzZbmgGTHup5O9ob8gTfM5zamMSpaZnVdINFEUDyYk/gDeDT+b
         ntcwIeUJRUG0i7geoug5w250YQeNZRNDpFcxvLR6Ph0vOyCRX2ukdJbCkhaKN6LirT/V
         nnqRXN5IZIjbDNE9XsDzwfa/QmoKWdgWgCLYeag3HE/r8yJAzNeCLcdIcIVVEj6LVJ2l
         8GXVn3q1qAexznhB/VD17mq5qkmtGRbdP1VSvoFpsZgOtGZw5hJRg8eEOEaAVETRrfIA
         6+5g==
X-Gm-Message-State: ACrzQf2BvyNqIQdfzYxKT7M+F8rDlHEavijneyd6Kd8B4qgpNg+5D5J5
        zaRZuBwjpab9zq9d8x3nkXking==
X-Google-Smtp-Source: AMsMyM73GB6RfcW/rLUs6dfgK7MXMRZmPsdLUXgwgHohQVX6nq3I9Msp91UD2ZxCRM6IfZ6L9qoc4g==
X-Received: by 2002:a05:600c:35d2:b0:3b4:a897:d48 with SMTP id r18-20020a05600c35d200b003b4a8970d48mr6062610wmq.48.1664356493031;
        Wed, 28 Sep 2022 02:14:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id p2-20020a5d6382000000b0022a53fe201fsm2420016wru.68.2022.09.28.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 02:14:52 -0700 (PDT)
Subject: [PATCH v1 0/7] arm: qcom: mdm9615: first round of bindings and DT fixes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAIoQNGMC/w3LUQqDMAwA0KtIvheoxVXdbdokWwO2QrOJIN59/Xwf7wKTpmLwGi5ocqjpXjvGxw
 CUY/0IKneDd9671S9YuKxhfCJ/0ShLifjWUwxD4IkdUZpphr5TNMHUYqXcf/1t233/AciC2cVuAAAA
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 28 Sep 2022 09:14:50 +0000
Message-Id: <20220928-mdm9615-dt-schema-fixes-v1-0-b6e63a7df1e8@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is a first round of trivial bindings & DT fixes for the MDM9615 platform.

This first round focuses on trivial changes, the remaining work will
mainly be .txt to .yaml transition of old qcom pmic & co device bindings.

To: Andy Gross <agross@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Dependencies: None
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (7):
      dt-bindings: arm: qcom: document the swir,mangoh-green-wp8548 board
      arm: dts: qcom: mdm9615*: add SPDX-License-Identifier
      arm: dts: qcom: mdm9615: add missing reg in cpu@0 node
      arm: dts: qcom: mdm9615: remove invalid spi-max-frequency gsbi3_spi node
      arm: dts: qcom: mdm9615: remove invalid pmic subnodes compatibles
      arm: dts: qcom: mdm9615: remove invalid interrupt-names from pl18x mmc nodes
      arm: dts: qcom: mdm9615: remove useless amba subnode

 Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
 .../boot/dts/qcom-mdm9615-wp8548-mangoh-green.dts  |  39 +------
 arch/arm/boot/dts/qcom-mdm9615-wp8548.dtsi         |  39 +------
 arch/arm/boot/dts/qcom-mdm9615.dtsi                | 127 +++++++--------------
 4 files changed, 49 insertions(+), 162 deletions(-)
---
base-commit: f76349cf41451c5c42a99f18a9163377e4b364ff
change-id: 20220928-mdm9615-dt-schema-fixes-66d4d0ccb7c7

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
