Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485C051BE48
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 13:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358212AbiEELmB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 07:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358191AbiEELlw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 07:41:52 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9722B53E13
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 04:38:12 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id ba17so4866403edb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yzN3FtomMSFQXU8U8DdUxmokxQ+geUR12BbvG9ovSgk=;
        b=qc/bdjCFTaKD5+74QcqLb+atIW0PQikRXnVek6x0CCPDQ6FmKNj8WfJiYWdvTKXKdd
         sIo/zvKAzyXlHhfMwnrEHd9pPVJfXLdPmTmBGpLsDEAE1L8Pc4vNGmpSUhPXFvNa9vHT
         cYc3iFkh9gvs8XIU9M8Pf/phQUkpQbH1FTNe1X1W3Px1MZAvAUbG6t34+BzVTscITInJ
         qh+RQFOFc77tD19EV3NDywtp7Mkq0rWjxzTeUXN15eGRIwqy2Xq2EFA1WYUeWr5O9saE
         KXdYMmy8liuvt0GZUfbuADBzsUGAtWS14lFafOpTnUGtDzRcVZpvf6s0orDvAvVXQjAo
         peiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yzN3FtomMSFQXU8U8DdUxmokxQ+geUR12BbvG9ovSgk=;
        b=P0Xqz38BEv5yhZA9qeE7pYC8ICfQKbq1nbSsX6AelEeIcniMO53VGSFP8B7Y9kkIK8
         Ve1aOABQmVcM5T6wHKtiw4sldBROhHmGuE7p0XnimH8jAsyJUuWrszrsOA+mfNtA0Eu+
         87fg/YDfN2d4GMSXadQ5I23HSi1+vEUrTqdh4acXTQ+nheQCja8EiHuXpaI1uQAYJ1D3
         o6kkgMh4R+foIq1iehfwWi4aHnus0n/K7181VwiGOk5bwyiGFk6C4Fi3kiQeNpJM7xoN
         +ccbctUcprnBERHcBvC48rQxQpN262r/WvLguCW7YYqM3lP49X5/fW06k0Q2mEkMqVQb
         0fSg==
X-Gm-Message-State: AOAM533U0nAxLGO+NHjqDy2BcKbdmwg7C3tSfaisgpVvmv1kk23OzQgi
        d07i5FPciw+EpwzsVdI/LBP4nw==
X-Google-Smtp-Source: ABdhPJwyZ0bkH/7KxfvogHNZ3lnAZ5Zds5SQZM3wZx3qP4qu1BIZGmFbnitcT/AtZ9iPouelFQfblw==
X-Received: by 2002:a05:6402:268d:b0:428:c73:95c4 with SMTP id w13-20020a056402268d00b004280c7395c4mr10208557edd.44.1651750691010;
        Thu, 05 May 2022 04:38:11 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b006f3ef214db6sm661006ejf.28.2022.05.05.04.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 04:38:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/6] ARM: dts: qcom: use dedicated QFPROM compatibles
Date:   Thu,  5 May 2022 13:37:58 +0200
Message-Id: <20220505113802.243301-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use dedicated compatibles for QFPROM on APQ8064, IPQ8064 and MSM9874,
which is expected by the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-apq8084.dtsi | 2 +-
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 34c0ba7fa358..3bf870b7de00 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -796,7 +796,7 @@ ref_muxoff: adc-channel@f {
 		};
 
 		qfprom: qfprom@700000 {
-			compatible	= "qcom,qfprom";
+			compatible = "qcom,apq8064-qfprom", "qcom,qfprom";
 			reg		= <0x00700000 0x1000>;
 			#address-cells	= <1>;
 			#size-cells	= <1>;
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index da50a1a0197f..503b4ae9fb1a 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -242,7 +242,7 @@ apcs: syscon@f9011000 {
 		qfprom: qfprom@fc4bc000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-			compatible = "qcom,qfprom";
+			compatible = "qcom,apq8084-qfprom", "qcom,qfprom";
 			reg = <0xfc4bc000 0x1000>;
 			tsens_calib: calib@d0 {
 				reg = <0xd0 0x18>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 808ea1862283..b3c0d140e6a0 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -723,7 +723,7 @@ qcom,ssbi@500000 {
 		};
 
 		qfprom: qfprom@700000 {
-			compatible = "qcom,qfprom";
+			compatible = "qcom,ipq8064-qfprom", "qcom,qfprom";
 			reg = <0x00700000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 814ad0b46232..5d2ab5ceb65c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1120,7 +1120,7 @@ restart@fc4ab000 {
 		qfprom: qfprom@fc4bc000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-			compatible = "qcom,qfprom";
+			compatible = "qcom,msm8974-qfprom", "qcom,qfprom";
 			reg = <0xfc4bc000 0x1000>;
 			tsens_calib: calib@d0 {
 				reg = <0xd0 0x18>;
-- 
2.32.0

