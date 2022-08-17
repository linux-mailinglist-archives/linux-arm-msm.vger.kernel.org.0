Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28B43596F90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239126AbiHQNO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239770AbiHQNOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C823051A19
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l21so13536400ljj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=StgnaHhGCg7OOpqTG13+gQqRFOCLdTRA/VCywEDqg9kMIxRkqhIjEL6/unZNraETkB
         OY78slefTO6VmDzp97WDvD8kTArUqhb1NLsuK7dpIINzEiwMK1YWNK9g8TqUfbVweYMm
         FIgJ0b+KVQtMsadPvgTAwA26rnWXysiwVIdai5xvQ4DdVGOA3ClgjDb5I0IEcgQ+Gv1U
         pyhxFEJkeL2O6+cfBaxxXSVEhe4+VnOd7U8+etGNUDTddXn7jHg1/sKyJW5B3MseCKzD
         NP8IjoOxxroQY3Y1ne8qNUgojmtamVj7SkkIGcdYG36ye/FMasRKQE/ytP2+enkQueNs
         RdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Yb2tg6NLcz0SjyT+zhbpZCCAWG7Bnyw4PloKDdxoVAU=;
        b=xGnFAtkst3r1nvyL0CsPBsuJbnrtHn1hhJrUbwCoudAP1XN/0McyTkxUKI6H7pK/Br
         5IPHD4WsWu2ZDpZ5tGeYgdEVPNpKRxMFVogRMeXeMfzaDoLtaWa1d9sKZYNO9wWZA7fX
         5YUsnAue2Jf6bomlywIEpQonLVdLY+JndInVWUT/5FaGFSTOvpqVGihZsEkR6yjdBoyV
         vlxAXznnqnFNiGutKvLdcGDhdJm5GumI2LTDyG575nWlAja94EGIKWd68GzX3aYcaz9x
         K9HdWbTmwVD747hKCCTIu6disgvtGSYg63pOBnmWUnPSN+Z4baDPhUzxgkXCWC/hqmS2
         GmWQ==
X-Gm-Message-State: ACgBeo0v3Lor0E3PDFKg0dp/oWIBSCnOaG+wjCvmt8/9N8wfCFt1QHZO
        adA3RF2hCltpdD/lnMRmxqY8ZQ==
X-Google-Smtp-Source: AA6agR4Jr9dVJN0cBFc7EFaxXfsdQSVgqEaGe2HDLtNEJ6H2epeCLVj35rKOvxNYeo5RnnOoO2U2wg==
X-Received: by 2002:a05:651c:10d2:b0:25e:5a65:9026 with SMTP id l18-20020a05651c10d200b0025e5a659026mr8217403ljn.193.1660742079394;
        Wed, 17 Aug 2022 06:14:39 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 12/12] ARM: dts: qcom: msm8226: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:15 +0300
Message-Id: <20220817131415.714340-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
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

  qcom-msm8226-samsung-s3ve3g.dtb: hwlock: 'reg' is a required property
  qcom-msm8226-samsung-s3ve3g.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index 0b5effdb269a..efb5d1edc3a8 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -44,13 +44,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
-
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -508,9 +501,10 @@ rpm_msg_ram: memory@fc428000 {
 			reg = <0xfc428000 0x4000>;
 		};
 
-		tcsr_mutex_block: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
+		tcsr_mutex: hwlock@fd484000 {
+			compatible = "qcom,msm8226-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0xfd484000 0x1000>;
+			#hwlock-cells = <1>;
 		};
 	};
 
-- 
2.34.1

