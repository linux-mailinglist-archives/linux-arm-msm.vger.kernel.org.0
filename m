Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2035D4B55B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 17:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356224AbiBNQKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 11:10:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356221AbiBNQKh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 11:10:37 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F6760D94
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:23 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id j26so16838191wrb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 08:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BnDmn/bGiXHzA/HR2vbnCnaA9xu9dPUN92kb7gNI0E8=;
        b=fhjDpQtldi51DoRrxcjQ4QySV3xYa4dsWTGNWasn8tE0fuqrmf4455PekHoGnbh8RA
         WeYNa1sLTEAXVDjHPs6FCcCGMW/ddc+XtlyOxsiergq5Sj365kJaJPXOFIR+K1HFhiZw
         LpH/Y64V3JSBZOBKnClGh1LEqEaPNrR4mNuuVV2sKkYH/k+H1Ju6IMkKiVDL33FpVBzs
         kI1sHKCRfns2dKeyKs0M4qOYbE0yP1cqZsyH4CByyUBLh+IFYXVDHc2Ho8MerthnhOZ+
         uzPIG68U6Bgd+YTs7aISfXUtIKfE5d10L7Xh0AvUPnvZR5Qx66cj5RJ1eddpzIzC4dvh
         MZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BnDmn/bGiXHzA/HR2vbnCnaA9xu9dPUN92kb7gNI0E8=;
        b=pOieOmzWwtHylQqVg3IgHtEZJOdlLWyH23dGCbSTLPxAuNmKmd0CcuKSztdzqeLDcD
         yIPBFAU9NZlIMAj9FhMEkBjSOLz7DKWjCuxB9+mb8pG5w7zC9Yn+sitg6uFnGdqERYqp
         4kXWWwJsYQGFvq6WixR5GOhQv+kFiypp4kCcL1ZLIbI0b0R4x6criKumEoo+dld2SgzB
         wUCJEHFzF1ku0f1S3IViMAwHzX93TFSFWp9xBJsUmK31yKqeK97Ag0jvZUZZAPND3R7e
         MQVQ2LZ7w81leOfLWvG3rIPUGiH+jziBbwZvEBcZD9VSDfX4o68c+wZehzrwVvSUUQCu
         3c4A==
X-Gm-Message-State: AOAM532GG8MMWQ6/1dTBesZ1to5WC88TeZP8IhIrJ8EsSoSNT+C8AjY8
        LA6QinmFgApruISml3YEOtFfjw==
X-Google-Smtp-Source: ABdhPJyvVNBAhdJFt9bEImTAf3pCwZ2mTB73doCzcfrhpO5RxC/wz5x0irX8twik5gNfsvHgH4rVdw==
X-Received: by 2002:a05:6000:1847:: with SMTP id c7mr273776wri.103.1644855022517;
        Mon, 14 Feb 2022 08:10:22 -0800 (PST)
Received: from srini-hackbox.lan (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.gmail.com with ESMTPSA id k28sm13677022wms.23.2022.02.14.08.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 08:10:22 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh+dt@kernel.org, gregkh@linuxfoundation.org
Cc:     devicetree@vger.kernel.org, ekangupt@qti.qualcomm.com,
        bkumar@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        srini@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, Jeya R <jeyr@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 12/12] arm64: dts: qcom: add non-secure domain property to fastrpc nodes
Date:   Mon, 14 Feb 2022 16:10:02 +0000
Message-Id: <20220214161002.6831-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
References: <20220214161002.6831-1-srinivas.kandagatla@linaro.org>
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

From: Jeya R <jeyr@codeaurora.org>

FastRPC DSP domain would be set as secure if non-secure dsp property is not
added to the fastrpc DT node. Add this property to DT files of msm8916,
sdm845, sm8150, sm8250 and sm8350 so that nothing is broken after secure
domain patchset.

This patch is purely for backward compatibility reasons.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8150.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 41897eb3736a..a1543012c4fa 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1370,6 +1370,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,smd-channels = "fastrpcsmd-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 
 					#address-cells = <1>;
 					#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cfdeaa81f1bb..c9d613063966 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -838,6 +838,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "adsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
@@ -888,6 +889,7 @@
 				compatible = "qcom,fastrpc";
 				qcom,glink-channels = "fastrpcglink-apps-dsp";
 				label = "cdsp";
+				qcom,non-secure-domain;
 				#address-cells = <1>;
 				#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 9255982adb69..637c6a6d4054 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1755,6 +1755,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2997,6 +2998,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -3442,6 +3444,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index c97ea638f6aa..3be4e630c2fe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2594,6 +2594,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2659,6 +2660,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -4429,6 +4431,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 53b39e718fb6..a9a11c747a3a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1996,6 +1996,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "sdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2065,6 +2066,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
@@ -2367,6 +2369,7 @@
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					qcom,non-secure-domain;
 					#address-cells = <1>;
 					#size-cells = <0>;
 
-- 
2.21.0

