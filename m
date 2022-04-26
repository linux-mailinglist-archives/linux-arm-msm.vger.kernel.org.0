Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61746510CAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 01:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356120AbiDZXgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 19:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356108AbiDZXgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 19:36:22 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3208C32EDD
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:13 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id i3-20020a056830010300b00605468119c3so4974otp.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccHpfjKvoYsLiN02b0zGlFTRc8MFHHJZhCSYDZSrEEQ=;
        b=lj/6ts4BRlKuC0/uEuX3u3t560IJg632JClZpIPFMZFQgaKDYrRiDDroMO/lzORUH0
         GJRHOOk6KNcUArQytWA9UbOTPQAdOW2k4VLEHSqO8IGMskDWx44S16zN4hMTY0ee4nVj
         u3JDcMVWqXtnEcztMZf6/fUzqKqBfIjRn318VAuLO4iRjNUtG/cfMW8cJHLn0Ub8hPY1
         hu6W3U4Aph8/Sasc+cbiflC8DkhphJDyZslPT85ehQfTDoudYCKP5R+N4sziCknDaKig
         H5GDPHOxAo48b6w3RUFId1LGq46ceWv6fnbj7bf8UIjKJQauEB7MEQVqHZ/tdkpUW7Jt
         sbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccHpfjKvoYsLiN02b0zGlFTRc8MFHHJZhCSYDZSrEEQ=;
        b=tAIpSuxxa6J9eQUztBcygOcgdHGXr3Eg9FP4PqYwve66Zc+UJ0fuLnwfvUx25Xrbrb
         uf2QyTacGV8pf3RA/tP6ubXf3nyXzRiljDQi0zKAL83TGYKOYGwuXTwfH36DT/BzWBji
         b+5G09QcjH2ZcRmuqRbEqbWpFTlQGjUCBKAMx1ntk8TpGziGIIj3Ivnpy64NvxxSOuos
         mHID3eZEuCkufXK4s0GgTKuFiJyrae/S+dHvFf2+WHe11zSI0C3HoRd3s+4nZpi5D4zG
         vwRXZsRw6LOgUi3Vm3VZ4X/PUPrw2KMB4sGUkg/euFK0CBouh0GZbJevRGyJZ7uIoLKY
         EfsQ==
X-Gm-Message-State: AOAM530RlX0UQz5FhZN+hCfTdXfwN+l0Br5SrwzsP3jCjQBk4QqqM8fj
        P2pXqYSRhdqoT28B5eL89I/n2w==
X-Google-Smtp-Source: ABdhPJz0++1dtaAhm5LlWPwSNAOOQfegDPdLRIQM9uH5pO+2yUAAJt0Oz1MEBMP7/W5HrF5vieDpfg==
X-Received: by 2002:a9d:9:0:b0:605:a536:c500 with SMTP id 9-20020a9d0009000000b00605a536c500mr5508638ota.384.1651015992545;
        Tue, 26 Apr 2022 16:33:12 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k2-20020a4adfa2000000b0033a3381a7f1sm6151658ook.44.2022.04.26.16.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:33:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: power: rpmpd: Add sc8280xp RPMh power-domains
Date:   Tue, 26 Apr 2022 16:35:06 -0700
Message-Id: <20220426233508.1762345-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426233508.1762345-1-bjorn.andersson@linaro.org>
References: <20220426233508.1762345-1-bjorn.andersson@linaro.org>
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

The sc8280xp has 13 power-domains controlled through the RPMh, document
the compatible and provide definitions for the power-domains - and their
active-only variants where applicable.

The SA8540p differs slightly in the power domains exposed, so add a
separate compatible for this, but reuse the constants to allow sharing
the DeviceTree source.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Added sa8540p compatible

 .../devicetree/bindings/power/qcom,rpmpd.yaml  |  2 ++
 include/dt-bindings/power/qcom-rpmpd.h         | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index b90c4427beec..ad77a6380f38 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -27,10 +27,12 @@ properties:
       - qcom,msm8998-rpmpd
       - qcom,qcm2290-rpmpd
       - qcom,qcs404-rpmpd
+      - qcom,sa8540p-rpmhpd
       - qcom,sdm660-rpmpd
       - qcom,sc7180-rpmhpd
       - qcom,sc7280-rpmhpd
       - qcom,sc8180x-rpmhpd
+      - qcom,sc8280xp-rpmhpd
       - qcom,sdm845-rpmhpd
       - qcom,sdx55-rpmhpd
       - qcom,sdx65-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 0a8978d0c78c..6cce5b7aa940 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -125,6 +125,24 @@
 #define SC8180X_MX	9
 #define SC8180X_MX_AO	10
 
+/* SC8280XP Power Domain Indexes */
+#define SC8280XP_CX		0
+#define SC8280XP_CX_AO		1
+#define SC8280XP_DDR		2
+#define SC8280XP_EBI		3
+#define SC8280XP_GFX		4
+#define SC8280XP_LCX		5
+#define SC8280XP_LMX		6
+#define SC8280XP_MMCX		7
+#define SC8280XP_MMCX_AO	8
+#define SC8280XP_MSS		9
+#define SC8280XP_MX		10
+#define SC8280XP_MXC		12
+#define SC8280XP_MX_AO		11
+#define SC8280XP_NSP		13
+#define SC8280XP_QPHY		14
+#define SC8280XP_XO		15
+
 /* SDM845 Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION	16
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
-- 
2.35.1

