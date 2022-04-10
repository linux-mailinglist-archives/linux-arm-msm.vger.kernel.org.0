Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A9A64FB0DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 01:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233196AbiDJXrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 19:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiDJXrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 19:47:15 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A7720BFC
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x33so17335799lfu.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 16:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGAwW8cyDnSHOVehGo3+DcIdw3tvgSiqRKqWSvsRZR4=;
        b=FOOJaRLlUNZd0KK6bRpwCQ8WZzRzp2oCsuyLnHH769uv4l7F+pRXJdqGGozoNID7FJ
         heacOzN0kIOm3Yi/JvXg2jq1oU1qewueHvnpFmymy7fp4+zuiGLX3Xomk1vCdTYvk749
         1WLnwaj+WIiymsckEg9joMm8ay6skA4fHrPiNUY9Aj/p5Ucjj0YFejt8w3EQPKjhsxhs
         uiZO1fVNez7ilgCHtXPAhSO8MxSLvxzjvv+lAdNLngh2NjzZDh53i1c0McNEAfGHRFiV
         jbKCOtJVAKapJHyxhJL3JmXWpse3h70GVioH1vWXOCIYnhBeBH1Oe7ABwS8ih4wbSkDk
         0X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGAwW8cyDnSHOVehGo3+DcIdw3tvgSiqRKqWSvsRZR4=;
        b=TIvw0F9kdsvEhwtzI45LqVVQnv+WyvDvG4T3eXrW3m2gqZXhcEXJAoOEeBk8Q3qZv3
         TI7cDz4dSOUDlDbg8XPuSbGAs3EQaeeozVbQ+sN1wyc6ssr7T7+57fcT7G3Ws7irKoST
         dAf9Sid/kKhZUgzLIN38q7v1VnxRrKstsglTPCOeyJiY2YkB4j0fQk+4riNcjxAdRjuc
         VuHf2lWan9x55BI1R6l3P0DpwHZkFwMrD0riM904ocCF2OJB4Z84EfsaZrChVYM6jt+z
         kWq2xPvc2cXF+BN/9PJ5cRHVgqH0yfLzRn+2hhC0X8vvKQJgl48Qlkobqb46gGrwr/f+
         BbXQ==
X-Gm-Message-State: AOAM531ctRDI9FzFwOliBCMJ2RWfOE/e+lNJ2WWIbuHSaEuV3ngIceHu
        0HJW/SwSvilDmJWAL/JM1o7gQg==
X-Google-Smtp-Source: ABdhPJx9D0XNIvp6DPPfUOJPZuSw4mtta3d2pg8zFCrnr2Gny+Yf6gCla6TRsQ+SOcb2S7BFWQrPdw==
X-Received: by 2002:a05:6512:3d24:b0:46b:9f95:9e57 with SMTP id d36-20020a0565123d2400b0046b9f959e57mr3956993lfv.246.1649634300518;
        Sun, 10 Apr 2022 16:45:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m28-20020a19435c000000b00464f6d27ff1sm1153881lfj.103.2022.04.10.16.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 16:44:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8450: Add thermal sensor controllers
Date:   Mon, 11 Apr 2022 02:44:56 +0300
Message-Id: <20220410234458.1739279-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
References: <20220410234458.1739279-1-dmitry.baryshkov@linaro.org>
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

From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

The change adds description of two thermal sensor controllers found
on SM8450.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 934e29b9e153..b695ce824722 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1021,6 +1021,28 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		tsens0: thermal-sensor@c263000 {
+			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c263000 0 0x1000>, /* TM */
+			      <0 0x0c222000 0 0x1000>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
+		tsens1: thermal-sensor@c265000 {
+			compatible = "qcom,sm8450-tsens", "qcom,tsens-v2";
+			reg = <0 0x0c265000 0 0x1000>, /* TM */
+			      <0 0x0c223000 0 0x1000>; /* SROT */
+			#qcom,sensors = <16>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow", "critical";
+			#thermal-sensor-cells = <1>;
+		};
+
 		aoss_qmp: power-controller@c300000 {
 			compatible = "qcom,sm8450-aoss-qmp", "qcom,aoss-qmp";
 			reg = <0 0x0c300000 0 0x400>;
-- 
2.35.1

