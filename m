Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D4E6F6FBE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 18:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbjEDQSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 12:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjEDQSC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 12:18:02 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1514230E9
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 09:18:01 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f18dacd392so5453145e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683217079; x=1685809079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MweiIBWJQm7m5FMhKLIF4YwfT07xOnndyfZNi/Z26Uc=;
        b=geV7e9bxPy9HCRgRv9+8znyVHC6GhjelxXqPPT/QPuTWea2CK4qERIkXx5l5HdRYzM
         O5M3jC8fnjtqg5Ghc5wxpHkIPpih5SBV9j/Q2C0hAc7moCLPLceWseECAS/W9PyvshrM
         7J3v71IURzIHtu656ypvqtPOY8NndaJ7B6k9J31kkVXehr2vco2ZiX2mf43dapfXlz0/
         vkrp7YNZF6QLY9Jeyg+Y/pxAfBCZFg4q5vcT44qlO6I8x/3s4xBjMITY7aSOkvxaPTr7
         IQUsshNw4eu/BCFqKkFPEtaKRYtdgYNQOKUwc9RIgrBDsGwy+9q35It/w8lu/FItzEUy
         qUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683217079; x=1685809079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MweiIBWJQm7m5FMhKLIF4YwfT07xOnndyfZNi/Z26Uc=;
        b=kqSK2Sbz4AiIGW2k/k00hN7G3/Cti5PQ94kDwbqPAvheQYDnCfRs8+MJaRdFg5SDvO
         EZULgh570DLK9qsud/ZAuR8tE1Fso0SIdBOGdDSOkHKCLpsYFOHWFwKWDpX5o/sx8YUu
         ofGqChDYwRVEzjd5lhPsoDlpNXS/wP4BCmuppcnncAzFDS1MG0H/rWwXsGvPEn20+Ozt
         NO/BOFAnbDnYE2zmWIdC29tR9j7K/17v9G+oQRD+3OfPrA88dfpWrvRgZsyRSQ9bV2lQ
         ZWBy/LhKtdpM6/YVAZbBTsgFimr+EyKiKAQKQqknrMoF4ZrfT4LtjxYddepoeQc2hnzS
         UvMg==
X-Gm-Message-State: AC+VfDzAHqoUd00tAvkeLwx1HdSZo3kIZan/9jjMmplr4WUuCINJb0Fp
        iQnHZN9GE6Y77jk4PlX3jcaulg==
X-Google-Smtp-Source: ACHHUZ4/KZ0p0Mz8iiTYD0sTn+cvsDm/0L96N4J41veiC/xud3xWyRcjyL75FvsX6Opdf1Otj7y7mA==
X-Received: by 2002:a7b:cd87:0:b0:3f0:5519:9049 with SMTP id y7-20020a7bcd87000000b003f055199049mr185767wmj.8.1683217079584;
        Thu, 04 May 2023 09:17:59 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:14d4:bf3e:d1a3:623])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm5336293wmc.2.2023.05.04.09.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 09:17:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: soc: qcom: aoss-qmp: add compatible for sa8775p
Date:   Thu,  4 May 2023 18:17:54 +0200
Message-Id: <20230504161755.197417-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Document the AOSS QMP compatible for SA8775P.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 798f15588ee2..9dc8e48c8af4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -26,6 +26,7 @@ properties:
     items:
       - enum:
           - qcom,qdu1000-aoss-qmp
+          - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp
           - qcom,sc7280-aoss-qmp
           - qcom,sc8180x-aoss-qmp
-- 
2.39.2

