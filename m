Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69AAB6994DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 13:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjBPMxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 07:53:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbjBPMxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 07:53:07 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D3847433
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:05 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id r2so1737057wrv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIbmvEodTo/kIMv9iHrU04rcMXe5obN6DOGgl5KOWXI=;
        b=J8q9/OVs3hya9brx9d0S1cgjcrRSbFYTFIKNrW8s3EG61lVfEURRat1xOzwnPcZWy9
         FA67oviWqfVVhwA7oPtQO/uT78WFGxW/MlSHaZVytYP6c0Do4VFMdagczPTYlfwbkTc3
         mUxs21Msn1HOtbEsjxrmsxSiw4C74bxyjaLPDmeLqjwZno2hPntVxfpG00qJESiw3N8A
         3XAsGz97Jw24g+B6OtSh4ffMkvIkbZ9DXd0nkcvBMJKfUgULhxYjQ5C7c6J6W4hm6kG7
         sJT5jXfEwYPyFacW7pf42huvLTm0kAt1o0X3dhazmZLQ1tMJVctaoOQ4efF6l5foMm3D
         P+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIbmvEodTo/kIMv9iHrU04rcMXe5obN6DOGgl5KOWXI=;
        b=k2aSbzJlwhhSnlI3tx7sQDH/4apYRgVMhK3O2YG028f3tBQOcmSXpT9tgNIsOi97+M
         fuixHwpqTyfrNaZ5K5mRhj7jwZCyVhao84dvkjqCPVSDzo/rqzpA9L+e71dpRAMhLWC+
         qz8MGGCVnAJHjLt16ORzkS1fVAVuhddO/T9WiDWn1mHcmxLmx5WiSQLj61Ry8+oVEBY+
         LjjJVENP/Uf8J/+WzkjyRnFFjFnF1O6/o7rX+lgJAQbU914EJuUo9wABJ8kmlxq1BmLa
         dPUDK1hYYU+6+VSk/R4pwydqdYvF5ARLpM4Didv69hL38HbmVI+g5EirJBYCVZC+PHIU
         YANQ==
X-Gm-Message-State: AO0yUKUpzxtL19K60natBNp1WxHPi4wYj6C4jV1YUYPxW9lXkE1bsTxQ
        st/Iv+8GgV5xi093JGUwYRV+Vw==
X-Google-Smtp-Source: AK7set8igzAu1zI4iCghKKAXdAa1auJMVFW5CoqBrSmzAN3By5VqFUyAiGo1iqumju80klDDd1QHiQ==
X-Received: by 2002:adf:cd03:0:b0:2c5:58fb:fa92 with SMTP id w3-20020adfcd03000000b002c558fbfa92mr4155175wrm.7.1676551984193;
        Thu, 16 Feb 2023 04:53:04 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7c5b:1160:db5d:72da])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b002be5bdbe40csm1453292wrs.27.2023.02.16.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:53:03 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 4/9] arm64: dts: qcom: sa8775p-ride: enable i2c18
Date:   Thu, 16 Feb 2023 13:52:52 +0100
Message-Id: <20230216125257.112300-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230216125257.112300-1-brgl@bgdev.pl>
References: <20230216125257.112300-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This enables the I2C interface on the sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index a538bb79c04a..5fdce8279537 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart10;
+		i2c18 = &i2c18;
 	};
 
 	chosen {
@@ -20,6 +21,13 @@ chosen {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -37,6 +45,13 @@ qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
+
+	qup_i2c18_default: qup-i2c18-state {
+		pins = "gpio95", "gpio96";
+		function = "qup2_se4";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart10 {
-- 
2.37.2

