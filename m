Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463BD5F4BAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 00:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbiJDWML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Oct 2022 18:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231280AbiJDWLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Oct 2022 18:11:46 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057E96C772;
        Tue,  4 Oct 2022 15:11:38 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id s16so607162ioa.6;
        Tue, 04 Oct 2022 15:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EOo8HdH8IP8ZOXIsePOyIBWhQpE8sortZBelaauv01Q=;
        b=kIvRqLeeh4qv0Q1WEy1e2bKVmV1GRD5ibYx3KsZwS/3oF4CHAOJVqCBSxEEnAOxcFT
         kXPvJ2GLlLb3E8c0WK0atVKmnAl/pffoT8mHgjhtqs0Mgc7K8UWE6S0ftG0155ejf+oG
         MeK3TbWi/OUJATS0ZNqovgKs3Ozd44G+Kz/4ps5Ba9H1/Y4OCieBbR4fWNf14N/PEYfC
         kGyklvaFItpL6tvYUJxzL4EqrZohtnapSutrw8YYo5jE1vg1M+hZ44ypZ7j2chNYO/j2
         U7LoWn8NcCraFohYkU4n41zTpJE0qkXAblMdPWcj8LQqC8F4jzTeGJMA1VTX0J1e0mPr
         H9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EOo8HdH8IP8ZOXIsePOyIBWhQpE8sortZBelaauv01Q=;
        b=txoRHhnjdFkX4r7zy8HcddEfWnr6is4FT3W55zRYzorG0Q8XQdkGuJuCEP5usRfW9c
         vcIWYnmOngrMHjZy9z9edhZ6cVyF/E/haNDEceYaVNdBqioFDqz7chLfyqVfrFB9tANj
         eLXmkcx7BU3DhzkFov1EZUYS90/hUjZa2nVzcjWdGY8Qx3zK1Yfo7P+LbZuvzNmqyUVC
         x8c7hPYPMXF001uO0/p/Nt8rGo2qGOhHhhRFygqeXDoHgyzRi/iqei9SOfZmFvSQ85ln
         JiLoNbwK/Mr7m6/k3bMxE/hFjl2w2AbVhBTo476foH/z3vk9935xMfnBegiR112Bo0z9
         qtEg==
X-Gm-Message-State: ACrzQf3O6ccSweeLLEreVVDW59Gu8kHpDCyKg7x4zRtxNePC3nXgLduD
        j5/NYqkT1I0f/Zv1eDKkhLZ+RFm/taCXtg==
X-Google-Smtp-Source: AMsMyM7Uphq6mn6GeURqrKfRHUh/0L+T5PiSgodcfY7gV2RERjAjQDfAZ5FtXEivDs12SFoJlPu2uQ==
X-Received: by 2002:a05:6638:3791:b0:35a:22c3:4cc9 with SMTP id w17-20020a056638379100b0035a22c34cc9mr14839549jal.114.1664921497068;
        Tue, 04 Oct 2022 15:11:37 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::1eda])
        by smtp.gmail.com with UTF8SMTPSA id w15-20020a056602034f00b0068a235db030sm6281855iou.27.2022.10.04.15.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 15:11:36 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: power: rpmpd: add sdm670 power domains
Date:   Tue,  4 Oct 2022 18:11:29 -0400
Message-Id: <20221004221130.14076-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221004221130.14076-1-mailingradian@gmail.com>
References: <20221004221130.14076-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the RPMh power domain IDs and compatible string for Snapdragon 670 to
make SDM670 power domains accessible to the device trees.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml          |  1 +
 include/dt-bindings/power/qcom-rpmpd.h                 | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 5b4eda919911..2ca98bad2d35 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,sc7280-rpmhpd
       - qcom,sc8180x-rpmhpd
       - qcom,sc8280xp-rpmhpd
+      - qcom,sdm670-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sdx65-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index f5f82dde7399..578e060890dd 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -4,6 +4,16 @@
 #ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
 #define _DT_BINDINGS_POWER_QCOM_RPMPD_H
 
+/* SDM670 Power Domain Indexes */
+#define SDM670_MX	0
+#define SDM670_MX_AO	1
+#define SDM670_CX	2
+#define SDM670_CX_AO	3
+#define SDM670_LMX	4
+#define SDM670_LCX	5
+#define SDM670_GFX	6
+#define SDM670_MSS	7
+
 /* SDM845 Power Domain Indexes */
 #define SDM845_EBI	0
 #define SDM845_MX	1
-- 
2.38.0

