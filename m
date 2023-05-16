Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A747045A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 08:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjEPG5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 02:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjEPG5F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 02:57:05 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE564EFF
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 23:56:24 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-96aa0cab88dso747781766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 23:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1684220181; x=1686812181;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0t5l+WauKFuSjKN0DdhbFlPP/4Myn0FEo7zOmra1qKg=;
        b=UXz/sN7MXVAuoYA7DL4FEkvX/rwkbYxW6271pyYaL7b3Qm4qlzvUMpt0zBef7KzXIN
         Ya36IU4CWnHUrq7UzUHCsQk/BDyE9c7Vhcnet0/8PwM7xavEPl+FXfgnjjQfuNLnVHel
         H3zBRHsAAsbrrLrGMtJHjkXWS4xQXe2lW6E4eIFrdBznJQF9D9Auqpxn7BMq+WnnBPuN
         JJxAdIPdQ2uiQnVST5MgC7Wh0wHC+1yPR+5whoItEc2xf+X+F0zCo3vXhFRk6+jxUg5y
         c9+WhYW1aR9vG0CffMQoAULgP82qfHp1givdTTE+MV3D8OPrhEm2Oz9AixfJVF5CsR9x
         ZY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220181; x=1686812181;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0t5l+WauKFuSjKN0DdhbFlPP/4Myn0FEo7zOmra1qKg=;
        b=fzGlfrTdYwH1JzG3MfxeLgO+f0EERs4ihcIQyoEra0F4oc1eeya5f/6m9XLJYxqpgv
         R5sm3A3jjWSciRJpYpPe+gMZFmsjCUFpH4cSRAwny13GTJzYUzatHNyuLbuC84tU5LbJ
         OvzjJkidrDPm+6BxUmCa0+i48le9ePFrtKOhOznY2VIvwXCIhyol2PYous25yHIQxSio
         aglk6SH2MRRQshf0+1cZGyqP8u1hIEUBLIwpBzOZD5TxSjfY/JURM0q4MEkR+Nu+aCH0
         0ixrls3aoQHbfudkwcV6IQZiV9+Njntzc41p/zLmr2vKebvLpY+eZTTA1t/9bBci2Orx
         APYQ==
X-Gm-Message-State: AC+VfDzEZylXyGQsrQSW5DJBoEk8tPeJDHFPFmqH4rmwSOHugKCqajpX
        0saw149FM4Y2bidP40pRz4PdSg==
X-Google-Smtp-Source: ACHHUZ4P2axEyTdCQdOTVnti1mbrBL9eebGt4t6j0dr1R06YfzyRk5KLpVwOXX4YiQOcRjcejXKgdw==
X-Received: by 2002:a17:907:788:b0:96a:19d8:f082 with SMTP id xd8-20020a170907078800b0096a19d8f082mr23591445ejb.25.1684220181246;
        Mon, 15 May 2023 23:56:21 -0700 (PDT)
Received: from [192.168.183.139] ([41.66.96.127])
        by smtp.gmail.com with ESMTPSA id wi21-20020a170906fd5500b0094edbe5c7ddsm10651654ejb.38.2023.05.15.23.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 23:56:20 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Tue, 16 May 2023 08:56:14 +0200
Subject: [PATCH] arm64: dts: qcom: sm6350: Move wifi node to correct place
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230516-sm6350-order-v1-1-5c3b7c4cd761@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAA0pY2QC/x2NQQ6CMBAAv0L27JLSQlG+YjyUdit7sJDdxGgIf
 7d4nEwms4OSMClMzQ5Cb1ZeS4Xu0kBcQnkScqoM1lhnhs6jvrwbDK6SSDDfwtX5FEfbj1CTOSj
 hLKHE5Yzy1qNvXfs93SaU+fNf3R/H8QPHZ5zvegAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Somehow wifi was placed further up in the file than where it should be.
Move it down so the nodes are sorted by reg again.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 44 ++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 18c4616848ce..4dffd7974fa3 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1891,28 +1891,6 @@ frame@17c2d000 {
 			};
 		};
 
-		wifi: wifi@18800000 {
-			compatible = "qcom,wcn3990-wifi";
-			reg = <0 0x18800000 0 0x800000>;
-			reg-names = "membase";
-			memory-region = <&wlan_fw_mem>;
-			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&apps_smmu 0x20 0x1>;
-			qcom,msa-fixed-perm;
-			status = "disabled";
-		};
-
 		apps_rsc: rsc@18200000 {
 			compatible = "qcom,rpmh-rsc";
 			label = "apps_rsc";
@@ -2010,6 +1988,28 @@ cpufreq_hw: cpufreq@18323000 {
 			#freq-domain-cells = <1>;
 			#clock-cells = <1>;
 		};
+
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0 0x18800000 0 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_fw_mem>;
+			interrupts = <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x20 0x1>;
+			qcom,msa-fixed-perm;
+			status = "disabled";
+		};
 	};
 
 	timer {

---
base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
change-id: 20230516-sm6350-order-f9a836dc7247

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

