Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90B21641AE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 06:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiLDF7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 00:59:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiLDF7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 00:59:16 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28749140CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 21:59:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id c1so13728219lfi.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 21:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/sIj/1/GLeQerDRqjWxv94EFsOVZN7eE8H0z3e0Oq0=;
        b=ngL6BczJ9h2NGGkfT6IJ88aEQTDY+v1Gx7UxtLZvXEPaEBjJjYw8Bdk0zUpwV56Gjy
         SRJKjY4wiP+BXXUy3yG/D/FhypghNJmFdBBozNoeQNu4bVNI2+lHi0bXRw4voQACID4x
         4H6uz13eUDWivxurl5dIaLpxwjFPpmclGhscwNuzosKBkrdZRZVSmmscPMjDofWI5EGc
         eynWO8yC76/8EBe2qc0PEYTuvaQVzqhdUxA6rFqhcOcTMvNrkrwonINeVBU0zbR+eUsR
         xxquiPPPvPD4DMC/VnhCmEvNpqa8OcO5qY7lhRItlHo8SNRv/Egyr2PVJ/PLbZCkSBCu
         2BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/sIj/1/GLeQerDRqjWxv94EFsOVZN7eE8H0z3e0Oq0=;
        b=wM6KvOJ1P5HBBr/VrkaY+P3heNxdWyUefkqTLqHx9BPCL/hLKO/Ebts+/to0/xoRBp
         Ih9ckY/HNhsQnWn4QuDkcQ2Nv77GEL8bO2FfTm/y6qxRGqbbK/eqP8ufCq+a0IqqkTuj
         Pkv6naTcW6HGbqJL/tc/rU4N0ftax4On0bY4ujJ9OUDsvCOtmdjsFfZFz7mIlG94G7+7
         JWW6qakYVc0K+7Osda75afiU1o+/J28JsY2mWqtVa0l6vUjG+JT2a6Dh845uopQbe//8
         Y2hErcMlie+tSdTAqt3avZQYJj4mLMJ2wHsG8Vosd4m4lBjbe5j1/9TfTW1WtxQCiqWc
         xEuQ==
X-Gm-Message-State: ANoB5pm6UkU699KTUmyr8Oqj/JXQCUtHXLCqRRpyR86W4mQQ8xLB7yTV
        0C3fifqL4fYD6hQzRWgnhQBeJrtZbc1XDz3L
X-Google-Smtp-Source: AA0mqf6UxB09R+WJlPDW6vRSWlgHtjKX6qwtZqI7nYWTmUFSbsvE9Z0bRKbAocbtmqRmkap1T8b/LQ==
X-Received: by 2002:a05:6512:6d0:b0:4b5:330e:ed7c with SMTP id u16-20020a05651206d000b004b5330eed7cmr6948040lff.274.1670133553504;
        Sat, 03 Dec 2022 21:59:13 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004917a30c82bsm1650028lfo.153.2022.12.03.21.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 21:59:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 03/15] dt-bindings: thermal: tsens: add per-sensor cells for msm8974
Date:   Sun,  4 Dec 2022 07:58:57 +0200
Message-Id: <20221204055909.1351895-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
References: <20221204055909.1351895-1-dmitry.baryshkov@linaro.org>
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

The msm8974 platform uses two sets of calibration data, add a special
case to handle both of them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/thermal/qcom-tsens.yaml          | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index f14713fd3a99..213d8f2662ab 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -88,6 +88,11 @@ properties:
         description: |
           Reference to nvmem cells for the calibration mode, two calibration
           bases and two cells per each sensor
+        # special case for msm8974 / apq8084
+      - maxItems: 51
+        description: |
+          Reference to nvmem cells for the calibration mode, two calibration
+          bases and two cells per each sensor, main and backup copies, plus use_backup cell
 
   nvmem-cell-names:
     oneOf:
@@ -134,6 +139,59 @@ properties:
           - const: s14_p2
           - const: s15_p1
           - const: s15_p2
+        # special case for msm8974 / apq8084
+      - items:
+          - const: mode
+          - const: base1
+          - const: base2
+          - const: s0_p1
+          - const: s0_p2
+          - const: s1_p1
+          - const: s1_p2
+          - const: s2_p1
+          - const: s2_p2
+          - const: s3_p1
+          - const: s3_p2
+          - const: s4_p1
+          - const: s4_p2
+          - const: s5_p1
+          - const: s5_p2
+          - const: s6_p1
+          - const: s6_p2
+          - const: s7_p1
+          - const: s7_p2
+          - const: s8_p1
+          - const: s8_p2
+          - const: s9_p1
+          - const: s9_p2
+          - const: s10_p1
+          - const: s10_p2
+          - const: use_backup
+          - const: mode_backup
+          - const: base1_backup
+          - const: base2_backup
+          - const: s0_p1_backup
+          - const: s0_p2_backup
+          - const: s1_p1_backup
+          - const: s1_p2_backup
+          - const: s2_p1_backup
+          - const: s2_p2_backup
+          - const: s3_p1_backup
+          - const: s3_p2_backup
+          - const: s4_p1_backup
+          - const: s4_p2_backup
+          - const: s5_p1_backup
+          - const: s5_p2_backup
+          - const: s6_p1_backup
+          - const: s6_p2_backup
+          - const: s7_p1_backup
+          - const: s7_p2_backup
+          - const: s8_p1_backup
+          - const: s8_p2_backup
+          - const: s9_p1_backup
+          - const: s9_p2_backup
+          - const: s10_p1_backup
+          - const: s10_p2_backup
 
   "#qcom,sensors":
     description:
-- 
2.35.1

