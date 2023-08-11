Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8C8A7798C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236751AbjHKUsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236698AbjHKUsp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:48:45 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0595F2D55
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe11652b64so3770063e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691786923; x=1692391723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRy29PLfl3uv7uYq7ooGKIoRmBa7PZkCEGgELznuvEQ=;
        b=bOyC2qyNRTyNTveRG2ET/rdR1xG/Z4VRYBAaMA6L9pLnpx5PobkQMZuz6gt//cXnyU
         UliRq7r2fBfLC4XevYRSAEDtVaWAbtLpWRGEYGaphfC88y0VxwrH9hB78tJWcDwSH0dH
         NAMm1+ydnpg6rCi6D4R+4WWv8kM7XDH5dqtTrZ9qspPLEPEfPcvNq2U6KKN9rDeJcNiV
         dJIqEwMXTlJLD20VnuFJ1YwX6LwLL0DizNevKjbpwL89+RhewIQguG91FslAzwumXVJk
         EcY4gFarsOQFmXbiU8IB0U1TMyWQtWOYdHbze2xJa/pqCvUzo3e9iVXPynksCZAoLdoJ
         7h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691786923; x=1692391723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DRy29PLfl3uv7uYq7ooGKIoRmBa7PZkCEGgELznuvEQ=;
        b=kOja1M1Lf1o9t/vZ7+xIeXwSrfoAbnDA4CaNzE3ra7clLNy/j1QHNVYGCtAVXhkuWC
         LI8aZGNDfiXq0O3PZr+otjFkPhoqE3d4tK5/flVBRtsQn1j8tMxMvYA5E4ivojbfiAKw
         kce3+zyZwA8Y5UJtJr92kUCyr1TprWq/dhwIQ5RX0gX7JLQ+d8bc4eHNTJ0Nn/5NtBSU
         FxK4YZLFyKZ5udi/orx0vlHVTBP8QWr6m6NFbiP8ydBcbv79L/olAHKu9a1qcIC6i0Ty
         Nz97nrSHosvr9WR24/mO1ncUvqJUzzT3F/qtc2vFXNFpNhR9+zU97+9EoCf0cm9dwe5r
         Z+6Q==
X-Gm-Message-State: AOJu0Yx5e01Qn6urdLgJ4cpCMzQPcUfQrapukj4pBpidOTg/Vov21n8G
        oyQuC8QVvD1OxEtIs9RbMJ3yTw==
X-Google-Smtp-Source: AGHT+IHFugGiP54BeQTodasgBwrbYOAzXLh8txsaNO45XaoDzJMbtmPPqjrG+Miv+uONghXhZbPtdA==
X-Received: by 2002:a05:6512:2346:b0:4f8:5905:8e0a with SMTP id p6-20020a056512234600b004f859058e0amr2532023lfu.6.1691786923080;
        Fri, 11 Aug 2023 13:48:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w1-20020ac24421000000b004fe8d684172sm843603lfl.234.2023.08.11.13.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:48:42 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:48:35 +0200
Subject: [PATCH RFT 2/6] arm64: dts: qcom: sdm670: Add PDC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-tlmm_wakeup-v1-2-5616a7da1fff@linaro.org>
References: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
In-Reply-To: <20230811-topic-tlmm_wakeup-v1-0-5616a7da1fff@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691786918; l=971;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=um/5BTEZycheILrl/QxnMPLkTqEt8HDkcKZ/UZi7lao=;
 b=dJ9CENwPlUOTjQ/gDAH8Kr4v8q3NUK9TDrNuw/SKsfgjBXQEkcugLKC0pho5MrbyOOj+3ncA6
 UlRPYm5r1zMBaYWqeMfyi6pn5KLZ/OlTQuLq5QYm6SvSBPmgt9r+7X9
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the PDC to enable deep sleep wakeup from external sources.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index a1c207c0266d..da10f0a6d92e 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1169,6 +1169,16 @@ usb_1_dwc3: usb@a600000 {
 			};
 		};
 
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm670-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 40>, <41 521 7>, <49 529 4>,
+					  <54 534 24>, <79 559 30>, <115 630 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,

-- 
2.41.0

