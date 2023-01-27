Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0498E67E406
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 12:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbjA0Lrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 06:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231947AbjA0LrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 06:47:20 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F257579C
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:23 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l8so3249186wms.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX2OJmIw4fW8hzsA4eBDxt2dLhXvxptu+5S1yeJoeUQ=;
        b=rAww8Zwc7rkkkYUUfC/GBky7PmY/f8hUJg1BJeWaLRXg/bbJ7tnIbloo9gN1pLrYqc
         poETS8IKbjHG1Ya4CB4b+UWxMQnSoWm7hhSiITU9ybPq0cDv57MCXX/Wkw9T4onFF/ME
         gi0Y+76dxJ1u3oRif6RqqHDcL+CNrDW2xiwbzvKHfBYFuuiuh2c0UZvoRet5mVws/PQn
         V9egekhIzO056TXUkXxtumEs9ons55vuABOhGSEGi/MoaHXEf9/GJXwqZZC5Hycr58S7
         8I4sheMNJ6ZBR+yUkpYLl/Fcrhg9YRyw3ClbNf2Z7ZC8kaFPoiGUz12spt1QZbXXAuQa
         veGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX2OJmIw4fW8hzsA4eBDxt2dLhXvxptu+5S1yeJoeUQ=;
        b=nb11YY/61/sCFuTbZ9uk8CovotYh2Mp662COCi+XcR/WM3ShCtBjrrdfMLhHtvecaj
         +JifHBbz12f4Aq816iMaDagX4uZTFQOjPWYS+P6O/Q60G5lp83KfUgoQh3zzzHtH2P+L
         SW9R2AXaSo4HK/nQ8NB6WrcOBAiau2gcY6yF2JbF6JGkbytm1w3hcW8pV23RaeWfo4oq
         1zZoLDgaJXz2YPvXnFI23jIH+BkLiQRDc/Yi1bxTbnZcR1QU7iOMBViAUkEzxUPldSW3
         N+2vO140O7wPzs8AqbY/7e2LyVGi7I07ByeocBTSb9vhKzbqUqBSVBCvKbL4PuYvof24
         P9Mw==
X-Gm-Message-State: AFqh2kq8jZcagCiEvJbIqpqJ+C7KpvU47oev8JfiFhSt4suOSkGzk6z4
        iEtmEYxikOn5pHSAlApfWu5O2Q==
X-Google-Smtp-Source: AMrXdXsAFGqbRqEyK5okLcEONXDGmn6fK9eqtTgcX3K7V89w7XMwX7RDLSTuk8h4dUlmh+hcbQzkzg==
X-Received: by 2002:a05:600c:a687:b0:3d2:2a72:2573 with SMTP id ip7-20020a05600ca68700b003d22a722573mr39212052wmb.11.1674819856109;
        Fri, 27 Jan 2023 03:44:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm3807760wrs.47.2023.01.27.03.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:44:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/11] arm64: dts: qcom: sc7180: align RPMh regulator nodes with bindings
Date:   Fri, 27 Jan 2023 12:43:40 +0100
Message-Id: <20230127114347.235963-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
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

Device node names should be generic and bindings expect certain pattern
for RPMh regulator nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180-idp.dts      | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 6ea8dd7d3e01..c3bdd3295c02 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -90,7 +90,7 @@ mdata_mem: mpss-metadata {
 };
 
 &apps_rsc {
-	pm6150-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm6150-rpmh-regulators";
 		qcom,pmic-id = "a";
 
@@ -212,7 +212,7 @@ vreg_l19a_2p9: ldo19 {
 		};
 	};
 
-	pm6150l-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm6150l-rpmh-regulators";
 		qcom,pmic-id = "c";
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index dcb179b2a3fb..423630c4d02c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -438,7 +438,7 @@ flash@0 {
 };
 
 &apps_rsc {
-	pm6150-rpmh-regulators {
+	regulators-0 {
 		compatible = "qcom,pm6150-rpmh-regulators";
 		qcom,pmic-id = "a";
 
@@ -551,7 +551,7 @@ pp2850_l19a: ldo19 {
 		};
 	};
 
-	pm6150l-rpmh-regulators {
+	regulators-1 {
 		compatible = "qcom,pm6150l-rpmh-regulators";
 		qcom,pmic-id = "c";
 
-- 
2.34.1

