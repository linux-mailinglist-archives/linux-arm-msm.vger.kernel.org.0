Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5E08655A97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Dec 2022 16:43:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbiLXPnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Dec 2022 10:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiLXPnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Dec 2022 10:43:03 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F51CDEA0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:02 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y25so10699247lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Dec 2022 07:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snACIu0wLHvmoLYefxk6KlM9d3tjS1vfRSz1/xrUibc=;
        b=QhjrQy/kec6727PAyryU95qMP+lOLAGjmg1mq14ZKn+GNUtpF+KST2qDZ9kuPXrINs
         HbYP2en5IB3R2+VCFI0qFhVpOSERrgS13NUrS/aJiQ8fWAH79H9bKZZfAOYl+SRnwsBz
         KpP0m/og0m1k+8/Mp1jzDsC6jxTC6hSOZUkK+WLoiZAk9rf+ZR6wiqYKh5jTqFP8Rscj
         RGIK9VB0Nv/k3JZuW2lxJJOzdd+jja3roqW+hyFklLwhmrQX24GTMrajBetQNdRQWiHj
         sr+LCor6BKpKPgU2LbL4zgqC/RMmIHGmQRCWFaJfBvUnyFHmDO70hx7PfeYhBusY+FpX
         OG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snACIu0wLHvmoLYefxk6KlM9d3tjS1vfRSz1/xrUibc=;
        b=Evfh3KZ7Ek/NPOklznlKngy4zXThl3dZGLC94vNvzjJ+XrpEKsQ6WS55psd9BEiS0Q
         W3hobrhCz1p9AGrSeLdWde+nBvS3bvgjlIQch3KMDKBnUh32901OV49TtmbhRti2oCpJ
         81GS15zndwbEUlZ9LYupmmV4kSBBsPpCXeY55t8ciKJM8DImKRn0P4bF+v3Pj9IgOHWv
         CQNylDJ8vdjV483fRA7WGZMaffia5KK4NfP17qdFAj9x+ziu0VN04ETzxj+68h2THWJt
         4uZfoGQy3Wi1/P6UPB3YbcRAm6EGIj+cDcUZcrswgzS/Yxj4aGt5OQvQjddGY3frswdq
         46ZA==
X-Gm-Message-State: AFqh2ko6JoPw/N4jcIhR6ktk7H52IpJXv5a/8cq5UNFDHfI/FtlCWEV/
        jg1bIPPz/ErvmY9Y4vqGlphPiA==
X-Google-Smtp-Source: AMrXdXsb3xhU14R0psscJPtfRgx/UStOwy6JWoORVE+aYbgDQ2Iu42Zj52T2HV7pajRTKKKIdXvmLQ==
X-Received: by 2002:a05:6512:31c5:b0:4b0:25f9:14ea with SMTP id j5-20020a05651231c500b004b025f914eamr4548415lfe.21.1671896581847;
        Sat, 24 Dec 2022 07:43:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020ac251ae000000b004b257fef958sm999927lfk.94.2022.12.24.07.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 07:43:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/5] arm64: dts: qcom: use generic node name for CS35L41 speaker
Date:   Sat, 24 Dec 2022 16:42:55 +0100
Message-Id: <20221224154255.43499-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
References: <20221224154255.43499-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Node names should be generic so use consistently speaker-amp for CS35L41
speaker amplifier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi    | 4 ++--
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 09a31f707639..25c3e02f224b 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -454,7 +454,7 @@ &i2c2 {
 	status = "okay";
 	clock-frequency = <1000000>;
 
-	cs35l41_l: cs35l41@40 {
+	cs35l41_l: speaker-amp@40 {
 		compatible = "cirrus,cs35l41";
 		reg = <0x40>;
 		interrupt-parent = <&tlmm>;
@@ -469,7 +469,7 @@ cs35l41_l: cs35l41@40 {
 		#sound-dai-cells = <1>;
 	};
 
-	cs35l41_r: cs35l41@41 {
+	cs35l41_r: speaker-amp@41 {
 		compatible = "cirrus,cs35l41";
 		reg = <0x41>;
 		interrupt-parent = <&tlmm>;
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 1f2d660f8f86..4862fd69413e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -461,7 +461,7 @@ &i2c11 {
 	status = "okay";
 	clock-frequency = <1000000>;
 
-	cs35l41_l: cs35l41@40 {
+	cs35l41_l: speaker-amp@40 {
 		compatible = "cirrus,cs35l41";
 		reg = <0x40>;
 		interrupt-parent = <&tlmm>;
@@ -476,7 +476,7 @@ cs35l41_l: cs35l41@40 {
 		#sound-dai-cells = <1>;
 	};
 
-	cs35l41_r: cs35l41@41 {
+	cs35l41_r: speaker-amp@41 {
 		compatible = "cirrus,cs35l41";
 		reg = <0x41>;
 		interrupt-parent = <&tlmm>;
-- 
2.34.1

