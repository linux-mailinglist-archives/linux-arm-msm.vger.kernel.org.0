Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5019F669B3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 16:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjAMPA2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 10:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbjAMO7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 09:59:40 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D060D7EA71
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:49:54 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id v30so31476742edb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QcDYSwpxN84t5AantCdrrt1gSgLuFeIhm0uoKE/AHTc=;
        b=xnwwndU/KDlZ2Xjb+KOBbby8mLfoVIsB40zEzt6rkrx6BZy2pbBqNDNsGRhDHOzppu
         7GO0RoQV2l2gZwRn5WNf7oToaPKJlDRwrcvplQfrFWDY5l8dm/tefGnejrPPfAhwZXbx
         9Un/DMVF/pPuZU7s7yNgIgGuTJFU8MnH1wretRnuUiJDeiEc85oWoPcV7Y3OaywgDVnH
         7xL7Jtopm9G9r7m5e91XcBhWAhqVPiAJyoy/HWNOGXOtYS0shvPNM7Mn7LyZDy4SFFo1
         QTSXCVKl06W2q3I/kDO3YByD9zwsZdJGiPiCx15I6NqtxuowcuHnJ3GvvnR77dTrmmaf
         YkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcDYSwpxN84t5AantCdrrt1gSgLuFeIhm0uoKE/AHTc=;
        b=I2DLp4UTFJ5PqP2C4JZxIkOGZ5sJkoQvyLQJAPjQhDb/ggpXhtmdyqEzLytTsiUUKX
         rNyiCTFnLe2WfiAdrwpD6zH8xeQeECcbMu9NLqRsNNdDmCRc/WoAmI9eocbmKqF30VRb
         xBMBAc8YaUJ9BX4vTftNkNRP72QwV7amjMXDuzWPxQmK3JtIB2IppGv+WcUHDQ40T8Zh
         a7/sD+6NtLZK/GHbUSuZXUYGiguqbFEtipP7mt/+voScMKC/xB3fFdt5dhNj/B+FaRBP
         6WJU4itrYAfI4I+FPQGy+Cw9UCWH5TWiKCbRFJGJkk4RSWe+PGgTKqEVwgVQJOjoVIkS
         nmSw==
X-Gm-Message-State: AFqh2koI2HeUIMWt/po2oOIiqnmaevU9SXUrHnWNcbIEfm+BMq0D4M1B
        kV/sz/VgFWS8tOF7Wbdv6SHl8g==
X-Google-Smtp-Source: AMrXdXu4pqcGbN7MrIWNbzOcrwjUGOlSIHBUfxxrafuK/J2Pr50QR1fY2ckC8Lri2czGVf+MxQ8BYQ==
X-Received: by 2002:aa7:d653:0:b0:47e:15ec:155e with SMTP id v19-20020aa7d653000000b0047e15ec155emr65639330edr.26.1673621393297;
        Fri, 13 Jan 2023 06:49:53 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bt16-20020a0564020a5000b00482e0c55e2bsm8213918edb.93.2023.01.13.06.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:49:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindindgs: i2c: qcom,i2c-geni: document operating-points-v2
Date:   Fri, 13 Jan 2023 15:49:50 +0100
Message-Id: <20230113144950.78246-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Just like other Geni serial interfaces (qcom,geni-spi and
qcom,geni-uart), the Geni I2C Controller comes with OPP table:

  sdm845-sony-xperia-tama-apollo.dtb: i2c@894000: Unevaluated properties are not allowed ('operating-points-v2' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
index f5f7dc8f325c..0e88c85985b5 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
@@ -46,6 +46,8 @@ properties:
   interrupts:
     maxItems: 1
 
+  operating-points-v2: true
+
   pinctrl-0: true
   pinctrl-1: true
 
-- 
2.34.1

