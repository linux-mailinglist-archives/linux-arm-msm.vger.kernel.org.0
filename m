Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C467C655EE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 01:47:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiLZArl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 19:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbiLZArk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 19:47:40 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10C2DE8
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 16:47:35 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id x44-20020a05683040ac00b006707c74330eso5930228ott.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akxcV2cbB4tJ7g7nvmljID4qtmKpDankQRHava68ybw=;
        b=Znm9ABhYhs0gBpho7oHw1+ctmxtk10iMkj87Ow+SPaUuSDo+y9wbLzv+dEmN3ikApL
         0PdUfcxA7474J0/hToT5bYV1Oc/4or+WKS9CjK5XcUu1ao6a6lwprRHhg9xGU2thoWMs
         D5As1Wq0VR9zwBgTFk3Dozet0rR6nRGke9tIyp97gehT2N67j2M8WTzKMWHAwVJ7kap5
         de6S7VWIyaItgavgHO8RvE2fMD+RXtF3B6MXvb/QXhMbCZ/i+J75opQcDJANlwewfu/H
         IcKpyjxp1S9ngABTZbQIIROIVr9YIhdorvwg9Qw2PnVo0zI71hlNCbV8NV7QN6Wsgd8h
         1tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akxcV2cbB4tJ7g7nvmljID4qtmKpDankQRHava68ybw=;
        b=v6jJaVdrX1G1CZ+uFSnf0Leugi1XSBe9PTDHutpumZP2/7GD0trGekTwtKUSI54qlR
         yntRv1ro7FhkDVgp1vQINabkN3m5PdPR8TI2r3X6WXuDL9FYX7PQspNcGwK0Yiw3WEg3
         DIIe0nWFv0Xl5bYLXj5/3y5OjqxC1csqEjKkr/E6yj0rPcS3acRrIsMSiYxShg9bzHv0
         CjAqeMETPoy47gNjeBIZF4FOOcqvolHSaUPVrMsWMod3hWs1VviB+VdeDmRKkd58NesI
         CFK1+FgJugfSzlLPhE/Vrj9MWR9HJA/G45GPjuX9R9yhBCfn14dw3XTXl1Y3A47CMBRG
         F7Aw==
X-Gm-Message-State: AFqh2koaer80PcDOdGcE+gaM/PuMCOCESc8Hv2Uf7L8oFsqWdAE4zbxw
        STScQlf1Q/M6TKaAdvIIyD0MLA==
X-Google-Smtp-Source: AMrXdXt6uI087vVxk6tkdMl+VzVrPk3bILzywaRz3jcyNP1gHjlYlMxWUnheK0pTJHZbOSzkDMLU9Q==
X-Received: by 2002:a9d:6d0e:0:b0:678:2963:3831 with SMTP id o14-20020a9d6d0e000000b0067829633831mr8661258otp.22.1672015654496;
        Sun, 25 Dec 2022 16:47:34 -0800 (PST)
Received: from localhost (2603-8081-5300-41db-0000-0000-0000-127b.res6.spectrum.com. [2603:8081:5300:41db::127b])
        by smtp.gmail.com with ESMTPSA id r9-20020a056830418900b006706e4f6863sm4698161otu.75.2022.12.25.16.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 16:47:33 -0800 (PST)
From:   Steev Klimaszewski <steev@kali.org>
To:     steev@kali.org
Cc:     agross@kernel.org, andersson@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Fix firmware paths
Date:   Sun, 25 Dec 2022 18:47:27 -0600
Message-Id: <20221226004727.204986-1-steev@kali.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221225040821.8395-1-steev@kali.org>
References: <20221225040821.8395-1-steev@kali.org>
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

The firmware paths were pointing to qcom/manufacturer whereas other
devices have them under qcom/chipset/manufacturer, so fix this up on the
c630, so we follow the same standard setup.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 7e80e2950f8d..b04cb563496c 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -94,7 +94,7 @@ backlight: backlight {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/LENOVO/81JL/qcadsp850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcadsp850.mbn";
 	status = "okay";
 };
 
@@ -306,7 +306,7 @@ vreg_lvs2a_1p8: lvs2 {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/LENOVO/81JL/qccdsp850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qccdsp850.mbn";
 	status = "okay";
 };
 
@@ -345,7 +345,7 @@ &gpu {
 	status = "okay";
 	zap-shader {
 		memory-region = <&gpu_mem>;
-		firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+		firmware-name = "qcom/sdm850/LENOVO/81JL/qcdxkmsuc850.mbn";
 	};
 };
 
@@ -502,7 +502,7 @@ &mdss {
 
 &mss_pil {
 	status = "okay";
-	firmware-name = "qcom/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/LENOVO/81JL/qcdsp2850.mbn";
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
 };
 
 &qup_i2c10_default {
@@ -801,6 +801,7 @@ &usb_2_qmpphy {
 };
 
 &venus {
+	firmware-name = "qcom/sdm850/LENOVO/81JL/qcvss850.mbn";
 	status = "okay";
 };
 
-- 
2.35.1

