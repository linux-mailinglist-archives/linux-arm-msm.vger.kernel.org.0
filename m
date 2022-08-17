Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDC9596E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 14:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239227AbiHQMEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 08:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239204AbiHQMEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 08:04:23 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD914D164
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:19 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z20so13361775ljq.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DmgjoU3ZwmShD+iuLbm/N6H6WPhywoNwmKzID5e5568=;
        b=j/QnFP4W4/aHt9WeYXXpq/i3mE8ytEu0XXcD6vrAlm/2ebp/72isn/wHDJpyGGZySm
         INKCpl1NSLTrfpDYofC4eskzicQo8glDFvPt1YDtdU+/lWVTqd0knSXiG50CkvQM/kui
         oYcX936jAbvkqP3TFwny0FKcFoAk6WgUpVqRptwBt74Fg9rNK2p3z5j7uKq5XYLjR2qR
         111dk7lQzoH3wo+b8QJLBvnFopMMXOoy0iRFhLYjmGqzKic664AWx507p12to5fhwsT7
         kIs/QRuLCraUolYhQmqsAGemb/ySIX/CoW5kzBuxDelUee5k6sv6xm3lM10njXwI1Hyy
         Ddvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DmgjoU3ZwmShD+iuLbm/N6H6WPhywoNwmKzID5e5568=;
        b=TVP7QH8TtcDR5POKcHeXPN6Erbr7/+/J+349mBpphD/MGjKnXfuJyTJlEk5NSQxVVq
         PaP8yZBg3gUmRYLLScwMtHadH1vrc1frS64A8ONzMlpWg7pKJoN/6hUZbEz42fK0q363
         F7C5vSeDf9WCmIlejLvOZArFl73rAyDlidNVMG2mmVD/s2ZHh5EZ4IEDdNgcXmLF88Jk
         raZGC9e2AZAUxjpOgDPKlQJWD9SQ5klyfbhTXt0HlfSuWxw8ZyWuhjm2bue0BwJ8/XfX
         NEq49rDCFcTQqmhFpZgwbi+Nrj4w8h/Of/MxPdMu0lCo4tayS+B2dyaVrAKwlqKHUEuk
         4V3A==
X-Gm-Message-State: ACgBeo3p8WnLrXqfWltbHT1iXc/WPmQ1baAb1rTbD2Wh8G8/ncbgzVeV
        CrWDbEuL89pakQM/J0wfBmy/lQ==
X-Google-Smtp-Source: AA6agR6I1w5MNcoo7t8sGOgTtQ9uIgjNN68nM8xwTvZCFW+XbogVVwEdriDsOLVKVlwF05vdl3PWsQ==
X-Received: by 2002:a2e:8188:0:b0:25e:4ae6:5503 with SMTP id e8-20020a2e8188000000b0025e4ae65503mr7460455ljg.412.1660737858207;
        Wed, 17 Aug 2022 05:04:18 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id d15-20020a05651221cf00b0048a97042251sm1670496lft.22.2022.08.17.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 05:04:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 03/14] arm64: dts: qcom: msm8996: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 15:03:52 +0300
Message-Id: <20220817120403.458000-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
References: <20220817120403.458000-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/msm8996-xiaomi-natrium.dtb: hwlock: 'reg' is a required property
  qcom/msm8996-xiaomi-natrium.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 3411ced96db6..166374566a49 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -363,12 +363,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	memory@80000000 {
 		device_type = "memory";
 		/* We expect the bootloader to fill in the reg */
@@ -838,9 +832,10 @@ pnoc: interconnect@5c0000 {
 				 <&rpmcc RPM_SMD_PCNOC_A_CLK>;
 		};
 
-		tcsr_mutex_regs: syscon@740000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@740000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x00740000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_1: sycon@760000 {
-- 
2.34.1

