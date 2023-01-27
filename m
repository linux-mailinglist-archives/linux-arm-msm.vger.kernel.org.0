Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCA0967E5F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 14:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbjA0NBN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 08:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233995AbjA0NBM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 08:01:12 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B589B749
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 05:01:11 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so5438527wmq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 05:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq31ls9+mMXI35R6HMYUksQvzfPZ5izmOtregfCV1mg=;
        b=EdZTZID/4DNiZfW6uBvU44CaHjbaz0TaQQu3XBGUa+mYl5YHDW18hTPyYCTQEJPLMW
         yAZ1m1RyD6gxEcyXqgcI8xujDDxeLic42Ha6cP+gYamDdDp8yI1K2xAXY1dneX0aPFHm
         EDQxUj0gmp7lBywYZhLT7n9WcJx8ILvtBGAVgn57yy6D17piKWwOx+VDlw0w0hJ1qg1h
         AAMItja0MIfqsLPJACJ3L9w0q1MHbHerQIcWZQHC21vXWa10kO8MKNkYhY96Cjt2Vrix
         O6bsGdCF5TyHZ8LNWixK8nf9EyA/ycrEp3jSTTHuS2KxWg3Zk/PIib7Y2aTeAG0GdJAH
         B/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uq31ls9+mMXI35R6HMYUksQvzfPZ5izmOtregfCV1mg=;
        b=O4nGuUdKKcWRnbTFW6oDUjYCqcEiXTCboiYv8N1YxFx8xd+hdg6/pq1xfnc6j8l8Zn
         SkbhcOHiAwCwYNB1wLeW1Ps7uKNHKLAP0VjkYz1GgX9QH/od43MdbjQmx9hSUnVLvQGc
         iSsgJ+YiM+X1PtZ4XmqWJgc1CPKTUIwh75YliV/aDwOfbviOjSLDh8Rzwy5/ExRrQ3L7
         9HsCEz5SMWEdAs+U+R0MbNAnnvYIxEle0f4+wdQktWHQvtNrfXkX14JPDcjYC4zXaK1o
         LVYNTSSq9cyILqnaVaUFvNxXgstMdrrWi5z6UR+9Wk3nDwmW8hnia8XJSaWrNNG7iv3V
         Wbvw==
X-Gm-Message-State: AFqh2koW417pp/T+Dm2QpZCb6KShpIkccH3TkebD4rG1g2FpymMFwO2a
        Da44ogMTv8I1NbE2KfQzleeA0Q==
X-Google-Smtp-Source: AMrXdXtPoIX2X0V4s50VTw+IDcEnV51lGkQKW/IYmMVahDfQKPNCHL41tUCXIxpbGnhSXnJgqggWKg==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id fk8-20020a05600c0cc800b003cf497cc59emr37173573wmb.6.1674824469669;
        Fri, 27 Jan 2023 05:01:09 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l4-20020a7bc444000000b003db03725e86sm4270999wmi.8.2023.01.27.05.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:01:09 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Fix regulators node names
Date:   Fri, 27 Jan 2023 15:01:06 +0200
Message-Id: <20230127130106.1136226-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Bindings check fails as the schema expects the regulator node names to
have the suffix -regulators, so use the name and the id of the pmic to
compile the node name instead.

Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 725d3bc3ee72..ec17226e11b8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -39,7 +39,7 @@ vph_pwr: vph-pwr-regulator {
 };
 
 &apps_rsc {
-	regulators-0 {
+	pm8550-b-rpmh-regulators {
 		compatible = "qcom,pm8550-rpmh-regulators";
 		qcom,pmic-id = "b";
 
@@ -168,7 +168,7 @@ vreg_l17b_2p5: ldo17 {
 		};
 	};
 
-	regulators-1 {
+	pm8550vs-c-rpmh-regulators {
 		compatible = "qcom,pm8550vs-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -182,7 +182,7 @@ vreg_l3c_0p91: ldo3 {
 		};
 	};
 
-	regulators-2 {
+	pm8550vs-d-rpmh-regulators {
 		compatible = "qcom,pm8550vs-rpmh-regulators";
 		qcom,pmic-id = "d";
 
@@ -196,7 +196,7 @@ vreg_l1d_0p88: ldo1 {
 		};
 	};
 
-	regulators-3 {
+	pm8550vs-e-rpmh-regulators {
 		compatible = "qcom,pm8550vs-rpmh-regulators";
 		qcom,pmic-id = "e";
 
@@ -242,7 +242,7 @@ vreg_l3e_1p2: ldo3 {
 		};
 	};
 
-	regulators-4 {
+	pm8550vs-f-rpmh-regulators {
 		compatible = "qcom,pm8550ve-rpmh-regulators";
 		qcom,pmic-id = "f";
 
@@ -280,7 +280,7 @@ vreg_l3f_0p91: ldo3 {
 		};
 	};
 
-	regulators-5 {
+	pm8550vs-g-rpmh-regulators {
 		compatible = "qcom,pm8550vs-rpmh-regulators";
 		qcom,pmic-id = "g";
 
-- 
2.34.1

