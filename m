Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 575AE596F28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239141AbiHQNFe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239634AbiHQNEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:04:41 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BA53F335
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id o2so18951248lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=DqeinnIMS7tnZ1s/F5WbYXe7dS10PhHD2RlaXqtenk4=;
        b=i0GvDg8TPViBlqsgSYnRwUvswrg91GsMb+QaX4/VEVX2zBTIOPJt4gpUlxkvcXpBvT
         xK6+oxY6A3mVE05M0AW4zmDifbsfOCNDRjAH70dyD8TJliMxGLVYLN6Vp8u5xera9IT1
         RoEouXPxXYB4W7DoAzax/1F30Pq2WI3Y7jLZO3h8V5s+C7h9aNwK29gPFeZK58PwrGx/
         nuQn+j7/AwPxahNDvRsGaG1KtaSXjBkYaa8r57BzaSNVFNE48ryz03CCBznEcwwSdj+6
         zsFWcsCqStRuqJKbNDFTU+Owsfv2bZZzwNRCDLLV2gvayHioBcyKT8RLkEu4a9wF4Wtd
         YRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=DqeinnIMS7tnZ1s/F5WbYXe7dS10PhHD2RlaXqtenk4=;
        b=Fs6Qm420tUyr/DllUVEIdvvEvIBN4U1AtBKrCDddEvtZmieFmBFxsR4r6HNEA5lvel
         TQbBaI0XbZBjrr+UZWK5gA1sUffe/zDLq6ktkHvdQ7hG2jKS+BRjumKX3AEWo+sl4jP5
         eXlm1hJQCkG+kin+XnvaQSp596abnuTzyBjpS2W2QlSCtD2hQamGncyZQ1zwtOJjA4MN
         cgU7NoQpFtwi60nS5LQ7YPTBW7Mn4i8brXsIJf1/+G9I5GVbaCDXgN5G/FEK8Xa018kQ
         2Yh3qYZ2mKCURSZG8UL4Ah2lV3p++YICt8+9x6TWj9Uf2xCufZfT3nc80o1f2TNjTrnO
         2xFg==
X-Gm-Message-State: ACgBeo2XqZUNkUmUeacGyNiIW5Ll5VjWEZPMo6tAbX8ceIcghqDhCMcH
        3vp4SQkQUVTCcw0WEil42apPzQ==
X-Google-Smtp-Source: AA6agR5TbOLMn+IOpEsiRnErXR+auYE0jmCcgUOl4UbPjLbAdI9ArIKLFXB3SX2CkDNJG+YlZYa+Ug==
X-Received: by 2002:a05:6512:22ce:b0:48c:190f:5c37 with SMTP id g14-20020a05651222ce00b0048c190f5c37mr8321869lfu.564.1660741448295;
        Wed, 17 Aug 2022 06:04:08 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25601000000b0048b3768d2ecsm1683243lfd.174.2022.08.17.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:04:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 13/14] arm64: dts: qcom: sdm630: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:03:41 +0300
Message-Id: <20220817130342.568396-14-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
References: <20220817130342.568396-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a..40a40d00eae4 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -697,9 +697,10 @@ tsens: thermal-sensor@10ae000 {
 			#thermal-sensor-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1f40000 {
-			compatible = "syscon";
-			reg = <0x01f40000 0x40000>;
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x01f40000 0x20000>;
+			#hwlock-cells = <1>;
 		};
 
 		tlmm: pinctrl@3100000 {
@@ -2351,12 +2352,6 @@ intc: interrupt-controller@17a00000 {
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

