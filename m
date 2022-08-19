Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A20599744
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Aug 2022 10:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347218AbiHSIc4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Aug 2022 04:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347665AbiHSIco (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Aug 2022 04:32:44 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B991E9AAD
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:33 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a7so181957ljr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Aug 2022 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HUb81+JEG6Xfm8piVDwL1AMOuxmRGVBYXMDhN0hd0ms=;
        b=rYqOxrMR0a43Wuh/jdIepeZapi1JH23fopQiltPNP2wyBw5Imbcp6XyhQ0g8ZKzu0e
         Fc/5pkNrZMinq05pftWxFxF23KP/ZQZkqtNSEYAQN0v6m3q1bO8L0TxoaJt//06BWOdb
         PAH52qj9Po5SQ+7G//uBQ2h01WvPv3vRIxvAXwPSBUgPUYLzNb2/YSmogTyKRQKDdHVa
         KUviwKlqHP7dGGM7Lu/FZPsiWb5RFd+ZX90OeJaiUQ0wYWj/b4j309WYi6atoI2/AWFg
         o4gWzHU4Hh24juderxgFKmusH4ZxQlqRj+yM2k/tflM21i23/xIsQZmBkLpJgBa80yXL
         753Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HUb81+JEG6Xfm8piVDwL1AMOuxmRGVBYXMDhN0hd0ms=;
        b=VwwAW2wJHr9IBr+FjrbMBRqYMKcJ5IC/v6zkO0OTTmY13jYDEpWKhjkCmqJv/kdxGw
         PVJMYW1LYyXCVj5n008VPjuplsjyEvEXqCoCoX3idKrY8NgzCP3sXEBYhWjOvFLxGmUu
         AaIGdaoQEtcgpaIs40N5jA1NoPk69C1Eu5k80W1dqBo0ofxF081cNCxZEiksGSwaIk7z
         T3E4xubOs4w9xh5eV7765G4YiQuqHSjK6mqHEs3NQMqMUc4eT91aVfLPkRRJ6u2SU+9Y
         EQGMp2Zg74gXB+f9hvhLENApUH4+wrLB/xiN5aL/nXpmwFRdQHU99Mhukgk2Wuv7BK87
         2BAg==
X-Gm-Message-State: ACgBeo1GAhA7SNy0JE4BYrMwzrF6ZJ5+bksNxd8qC8WM/hSVILPa2ysI
        dSyBBObq06wnNNEtcvXC2ovRgw==
X-Google-Smtp-Source: AA6agR7zfGoVmGIWmhB1UGGA3KQnBfEKQNYXqcnoAuy4DHb0Gpt5hHDIJV17efLJKrHd7A1oUfbuuA==
X-Received: by 2002:a2e:8515:0:b0:25e:5582:388f with SMTP id j21-20020a2e8515000000b0025e5582388fmr1730529lji.261.1660897952818;
        Fri, 19 Aug 2022 01:32:32 -0700 (PDT)
Received: from krzk-bin.. (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id j8-20020a19f508000000b00492a54f0be1sm545355lfb.284.2022.08.19.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 01:32:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v3 14/16] arm64: dts: qcom: sdm630: switch TCSR mutex to MMIO
Date:   Fri, 19 Aug 2022 11:32:07 +0300
Message-Id: <20220819083209.50844-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
References: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TCSR mutex bindings allow device to be described only with address
space (so it uses MMIO, not syscon regmap).  This seems reasonable as
TCSR mutex is actually a dedicated IO address space and it also fixes DT
schema checks:

  qcom/sdm636-sony-xperia-ganges-mermaid.dtb: hwlock: 'reg' is a required property
  qcom/sdm636-sony-xperia-ganges-mermaid.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a4f73be3d60a..9ae6610af93a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -697,9 +697,10 @@ tsens: thermal-sensor@10ae000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
 			reg = <0x01f40000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr_regs_1: sycon@1f60000 {
@@ -2356,12 +2357,6 @@ intc: interrupt-controller@17a00000 {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x1000>;
-		#hwlock-cells = <1>;
-	};
-
 	sound: sound {
 	};
 
-- 
2.34.1

