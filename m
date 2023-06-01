Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90EF5719B6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbjFAMBS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233208AbjFAMBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:01:16 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964C11A8
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:00:49 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96fe2a1db26so96643466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685620847; x=1688212847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVdjRmMjqn5czjtng9+0EfYP4vCg0E5/tp4esA7IHkY=;
        b=IBEJHdxdXG4KQGTEwn71VoZzztAlZ7Zpuqwyv5aczbMYy8p3ER3fLUV1DUL0ocwhva
         ucAXWvSoOtACFWNnthyy28vNrimK/alQ4NlzTZBf8geWQdLFMlJd6kDkYn2y6qtOzA+U
         ofrRLDEzJz67wUavnTx3OrGo03bh6Wt9aERnG5Xuk7lZFHC/s+66XB2K28BC5M9JyV1Y
         CJ4ukJ9RkadychfCuAhq0FmA4QJFhwk6eu26Ak4ZnivZd43ov71DgASE//XTw9++bzno
         EoZILUbSDFZp25Kee4v+hPi8NiRrzj9ZgmqH6j26lek1OZQQx9Ol+B1BqMEvUuSjgCo2
         cKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685620847; x=1688212847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVdjRmMjqn5czjtng9+0EfYP4vCg0E5/tp4esA7IHkY=;
        b=iKyHrVBzQyTdgbua1HuAdcIj+xAV3I8QhKZDUIPCA7hFBxWRJSnFv+j8U0xSpMKZho
         JK4AU8SZT0jAMYnbptXnKI3hoOnVtkajkxnDGTWR2Taxewkh07LuY3VtVpPsNde6NQ6T
         sfxFHBrgi3G9gITmkeMcvT4CM0lD6OnX7iNnVL+X6PPx6eNr8aPqSpUF3hvCxJrwNXW+
         W1kGiA5xXtsBWtyGRTHptxEdX5QTn+bIC4yMtjYlq+Ts0tx4j19bNSiv8QzoL4SZENkm
         Al+salLPMshUKPW5Y2SO+Uk3jIE8vomU9zoT4JQzSrKP3HIIl5cLBP3329EoeFSEkbXt
         f8mQ==
X-Gm-Message-State: AC+VfDyBphBghjXOkG6y8rxbzzBbByKrbO3D2balNB5JNicYk57lGjmd
        5IPmBUEW0fAIwDItj8ui5to7MhKSWXoQn6WJ44Q=
X-Google-Smtp-Source: ACHHUZ4DpTHChIaoWfuEsu8QUVfHMtysQeWWnbAF3bQAKpakyvxctUAcAeg7d21IrYTnNC9PO2OUkg==
X-Received: by 2002:a17:907:7e85:b0:972:aa30:203e with SMTP id qb5-20020a1709077e8500b00972aa30203emr8541091ejc.34.1685620847484;
        Thu, 01 Jun 2023 05:00:47 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906b01800b0096f6e2f4d9esm10359923ejy.83.2023.06.01.05.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:00:47 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] arm64: dts: qcom: sm8350: Add missing interconnect paths to USB HCs
Date:   Thu,  1 Jun 2023 15:00:28 +0300
Message-Id: <20230601120029.38859-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601120029.38859-1-abel.vesa@linaro.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
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

The USB HCs nodes are missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 2798a5d6e5f7..88ef478cb5cc 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2304,6 +2304,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_0 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -2373,6 +2377,10 @@ usb_2: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
2.34.1

