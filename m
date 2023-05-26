Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26125712F24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 23:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237856AbjEZVu0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 17:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236975AbjEZVuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 17:50:25 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C829116
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:23 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-309550d4f73so1949668f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 14:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685137822; x=1687729822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQCHkaNjg7B8uU70YTMMcfxcQRpMvCAxEZvOsfZMRn4=;
        b=Ow3YxLP17Zqa29Aey3cY0pPBNGhz2PrLE8lnGicxk9K85oBJImSo4DfSThw5tUajqx
         qCYlEkTHxR2AX00OwK85JNe9P+Z6A5hvv60EriUg1QM5lPRz6XWPgp33rLTRkDRhOMLd
         /7dcYMusxjFfADqij18bJksICd1u6VbL6+7TK8lM4YCkoYXLmuckloELifDFuTorYruF
         0V10ffwxffKs2YzJhKNO+iLiQllt6qbKD+YCwLhhhFWx1ym/7xKeS47d0a6p8HELy2Um
         I+Uzi9XwvuLOxP+O1N3CQsn4mfPlerQDvgWm74884IlnjFoQ4LT4Rr3ziTiBcb9FkBe4
         SEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685137822; x=1687729822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQCHkaNjg7B8uU70YTMMcfxcQRpMvCAxEZvOsfZMRn4=;
        b=VBOEx2FSM34zd+B9d5VXYgnomkAWcB4w/L8dDJ8jxZKALDQlt97i4ivQB+NWBQUBZ1
         bkzOFjgC6+b2Pv5zE6lUormV3f6S2khlR79X9xCp3coihZcYe1l9WVfkVNSoricCzG5M
         3WMF3BjpOYf/XOyahsNRK1AGw+oeJaLLvxgkyBEUWXWPmh+A0S0yGay2KFLK/ORCJ8Sy
         cfPgMVsT0fELnXoZWXGZC+Ta0+Nx/f73vHZ1oawaysp6CmErL44SlveEpcNS/Bm0yDpz
         RcFz1V0QNt/8RxhbQoqQfH7e/Tyw0hT8k7fBSo2HsWHg5KoLMa7r1cDT+iuHOCKKOEgD
         ZKtg==
X-Gm-Message-State: AC+VfDxAih1ZvoOnLqaxnZfEJmSRv/SfDjbCgQTyRExvSe1Xk1MHsDwG
        d/1QzVC30moVli8JUyYq4yFG2g==
X-Google-Smtp-Source: ACHHUZ5JI8azDWbtYJ5p/awvoWr/R01yB85YkSVPgTFvz6NU3+xhvAiDCkkooqKdhQorP5zEjTg7Ow==
X-Received: by 2002:adf:f990:0:b0:2ff:801b:dec6 with SMTP id f16-20020adff990000000b002ff801bdec6mr209626wrr.20.1685137822090;
        Fri, 26 May 2023 14:50:22 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id u4-20020adfdd44000000b003063176ef09sm6294314wrm.6.2023.05.26.14.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:50:21 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Fri, 26 May 2023 22:50:20 +0100
Subject: [PATCH v2 1/5] arm64: dts: qcom: pmi8998: enable rradc by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230524-pmi8998-charger-dts-v2-1-2a5c77d2ff0c@linaro.org>
References: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v2-0-2a5c77d2ff0c@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=2853;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=KQMlmNGA0rqIPBYDI45x978bAqVpLcrpgsv3EKXfkS0=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkcSmcDxBSLRfUW/nw/+6z2OglwYoSWL5PwjlKA
 /LpjdCjXu+JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHEpnAAKCRAFgzErGV9k
 tqy0D/9h6+4PRGuk6ftIFfe39FKKryOb7re0FJdc+6hycJ6u4X+7u2pIFfdwFXfDGTG1O6mfeJ7
 nkXVFDm4epPjVOwLVjKKfGLX1ffwhm3/OL3yvDjn2XoHN0IsXJ7ynU2AGF0SDowAhXZQUgjjMLm
 /VUMC8ICmJpOGdjMcQJfpcdrA632bEjTi1ngR8FH8YCH2taAF0oGz7TqLYkKqLNIO2/HyZocY+U
 fvlCfbAdw6hgD4JXtdiilc6ZSSGwfK79EIKi6j8Ypkxnq2fmMsTP62Lh5az0LjYY19wDtFbfaiR
 mHO4wIHLBVpKw4bsDEpsQIJlk9pytcT8MT9QRS2DEN+JctoTZ9O2+o/uvq1V3DvHwzU4Xyh9AA4
 aapMQWYIpZMeKxen5w0HmhB0PCsuGgsjsoGceND11A4vCPT6tedZ+nHDI9PUpfR5R4SQ9bUJjV7
 sgz75di6E7luAtRKFuSMATQQikDHXGXhMjJEkxIUal13aLWCbgj9qUYKCOLnKdJ6TPiNnTfAjv3
 rumzG8o3YVZrX8sfaBPaS5mx1k6Gh3At1rIcdj+0BbgGikcH9kb+Lj8Cx9LbMX/qrS80tDfUJSY
 vXUg6lDDgGz3x9VIlgnT0VnZ6ZHFHWvGolzhI4eafXjtlHV+BNFe3tgxxTGPCXntBvWAOvjGnCr
 SjLirpTUZziZIQQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need for the RRADC to be disabled by default,
lets just enable it by default and not clutter up DT.

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi         | 4 ----
 arch/arm64/boot/dts/qcom/pmi8998.dtsi                        | 2 --
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
 5 files changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 062d56c42385..68e634f8212c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -279,10 +279,6 @@ vol_keys_default: vol-keys-state {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 &qusb2phy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
index ffe587f281d8..be6f60bfc26c 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -23,8 +23,6 @@ pmi8998_rradc: adc@4500 {
 			compatible = "qcom,pmi8998-rradc";
 			reg = <0x4500>;
 			#io-channel-cells = <1>;
-
-			status = "disabled";
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..66087af02d74 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -649,10 +649,6 @@ led@5 {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	dai@22 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5c384345c05d..55ee8dcf27c3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -480,10 +480,6 @@ pinconf {
 	};
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 &q6afedai {
 	qi2s@22 {
 		reg = <22>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 5ed975cc6ecb..1915643f1c49 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -346,10 +346,6 @@ &pm8998_resin {
 	status = "okay";
 };
 
-&pmi8998_rradc {
-	status = "okay";
-};
-
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	dai@22 {

-- 
2.40.1

