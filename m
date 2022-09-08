Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4E805B1687
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbiIHIL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiIHILd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:11:33 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630FF923CB
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:10:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z20so18943723ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YZLACUPz0dSdErasL/kyxzUvd85vQCbH1Jqb2nBEYMw=;
        b=RPEZmW8fjs5QH9W9/Im5vpfIX69sElWEIZ8UcoT4JJ9ciA6OXjt4P+rejpW6v/tvkI
         JyglMAOD/o4vQO0qNs5hjFKZ8ECL15kZ9fX45doquozLNPv9zUGkazWxYQAlIvTGTAew
         bICET3/j5hO3ie3LrXWry7Ux4T2jxTwcs8QZemBT14xVyOq/wE4IkE6W4jZYAemuzlY/
         VcBhXo6tvvq0nJBgVShKG0qk+9OEU38cL4kepUnCEvlUC3+i/X8MdiuL0y278z4+TcQN
         unNrgvoDffQx+IK/qtxLLNUe0c9sT+a3Tdk+lWy++j7Iq1/GNGi6GjOAgu1YZXX5PyM2
         f0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YZLACUPz0dSdErasL/kyxzUvd85vQCbH1Jqb2nBEYMw=;
        b=my0FjgYEOkUrQZqX0W1/77u9+BP9uYEHn6feEt0J1LVa/KC7GrEjlh6n3CSs0N3u16
         QDbwesJEcJVb+aEymFlfrPGdWD3dlmeLEdujsJn+oi+5lNyNnl/pYqgQUm2oxoUYq5dJ
         6NtpWAdsrbtAafQMxO9CpluK/Iz1xp1SKv7GGjwhuBWVcJJjrETKqyjx8CB6mLpPe1rB
         Eg1V3uC3AcZW/0RWBHdG1/oRNKcKcogWPEPYPVfI/X3sl6QsHEiexP1uNRgYa3QbCGOE
         ldnUCPnfaBweSDSR7QpVgWNm/LS87isLtRVCpfE9RrZoCZEFzio2OH0fY9rgKalJe/Aj
         cagQ==
X-Gm-Message-State: ACgBeo206NYBquX2VWqqFNKat0ZRMyG9CBhL68YuR8W3f16M73xFaJlJ
        VXJRv25kxtVNz5H7K0BxVooD/A==
X-Google-Smtp-Source: AA6agR6502NqVm0e5msexurrPH9GuLxDnMMfTqJyqU3vmCg/75xiDzqlJsh/Gma7W5WZZaa+zuDgwA==
X-Received: by 2002:a05:651c:1783:b0:261:83f5:4b4c with SMTP id bn3-20020a05651c178300b0026183f54b4cmr2069278ljb.422.1662624657287;
        Thu, 08 Sep 2022 01:10:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651c131200b00261e7e7b698sm3075777lja.123.2022.09.08.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:10:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] arm64: dts: qcom: sa8295p-adp: add fallback compatible to PMIC GPIOs
Date:   Thu,  8 Sep 2022 10:10:49 +0200
Message-Id: <20220908081050.29751-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908081050.29751-1-krzysztof.kozlowski@linaro.org>
References: <20220908081050.29751-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bindings require all PMIC GPIO nodes to have two compatibles - specific
followed by SPMI or SSBI fallback:

  qcom/sa8295p-adp.dtb: pmic@8: gpio@c000:compatible: ['qcom,pm8150-gpio'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index ca5f5ad32ce5..98f8420488b6 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -183,7 +183,7 @@ pm8450a: pmic@0 {
 		#size-cells = <0>;
 
 		pm8450a_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio";
+			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -199,7 +199,7 @@ pm8450c: pmic@4 {
 		#size-cells = <0>;
 
 		pm8450c_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio";
+			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -215,7 +215,7 @@ pm8450e: pmic@8 {
 		#size-cells = <0>;
 
 		pm8450e_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio";
+			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
@@ -231,7 +231,7 @@ pm8450g: pmic@c {
 		#size-cells = <0>;
 
 		pm8450g_gpios: gpio@c000 {
-			compatible = "qcom,pm8150-gpio";
+			compatible = "qcom,pm8150-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.34.1

