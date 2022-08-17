Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181AE596FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239817AbiHQNOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239781AbiHQNOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:39 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A5E4D830
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x19so18962832lfq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Ye4bqmRVQU/UtyZrgiLeA6KXU6bvQ0m892CxJrKhdQ4=;
        b=ed6cpMDb8WI+kpHuNPDw3tEHtLzGoeIM7/DhxZ8qY1spbgm2GgkLKM2vYL41UwjWTW
         Jr9TR0jKQQ5WmNC/Ebsaac+0rh0uwoGkYKo3oiCmJN6xlqoF2bO2Ltl+ci+4TMMgchCU
         FjSnDVVPFsVUXiiCcbt9tO1SmhcoEjt1SW0ez7B++yxaAZw7dskA50tLPmv+EVyh2vg7
         MltuQedxRcmvs4pBtnEZ8xEHWm/RYJHmvWfyR+i2TopkLd8TfOeeCbZGXGYJh7wu+1Hs
         /1WVWpH11/l7UHlZ+uMA4g/d/7NfcdEaXD97rSId0OpsKfyf+3LM6T3bHvGt1t3I+lzk
         Whvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Ye4bqmRVQU/UtyZrgiLeA6KXU6bvQ0m892CxJrKhdQ4=;
        b=vrhPTkwW/WQ87cnSgHwhoKRsu4u74udbXLUqier3/2/LU74pXv9IEMSumCHfBS/sjM
         PpsuOwCj0FrHFmU7YfgIq5YE6pev4lsFXdjugB3XccklZ5v5i2+h7UkMNQWqOF+50trl
         1uQ6xApdOvzf4V6aATG/XnxPnLoBYoynjcjLs3RVNkPmjqnYZiHophYCGuTXtrMW4Pmy
         oZaNMM6MbpNrO87EomjK6Mabl9wqgjik6ig1K5VATq2fUKI9jj98ZehoR/8V00Oxx6lh
         8wnzjVGEplaqH5MJ0pJ41m3z1m/ySKx6/bP4FFm/QNlS0YArtb4LSaMH3tzR1ri1SLV5
         gnqA==
X-Gm-Message-State: ACgBeo2NpkIdMvAghmyWiRYpLO9TO1IAUaC59lZl2bZktK4ZbmMuC0qi
        HXyCCj2UKrhVDS4B31d1Zo4Bdw==
X-Google-Smtp-Source: AA6agR40LiTC3alpKQxZw8Z8Ahc4i1D+Q9jCLV9rHVJrjn5TH84JSJC2mmd4LlwEX2Gei2nrCKh5+Q==
X-Received: by 2002:a05:6512:3047:b0:491:4104:cf93 with SMTP id b7-20020a056512304700b004914104cf93mr6591392lfb.546.1660742070296;
        Wed, 17 Aug 2022 06:14:30 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:29 -0700 (PDT)
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
Subject: [RFT PATCH 06/12] arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
Date:   Wed, 17 Aug 2022 16:14:09 +0300
Message-Id: <20220817131415.714340-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
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

  qcom/ipq6018-cp01-c1.dtb: hwlock: 'reg' is a required property
  qcom/ipq6018-cp01-c1.dtb: hwlock: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index aaad7d9059f6..ae56fccebe21 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -129,12 +129,6 @@ scm {
 		};
 	};
 
-	tcsr_mutex: hwlock {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_regs 0 0x80>;
-		#hwlock-cells = <1>;
-	};
-
 	pmuv8: pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) |
@@ -252,9 +246,10 @@ gcc: gcc@1800000 {
 			#reset-cells = <1>;
 		};
 
-		tcsr_mutex_regs: syscon@1905000 {
-			compatible = "syscon";
-			reg = <0x0 0x01905000 0x0 0x8000>;
+		tcsr_mutex: hwlock@1905000 {
+			compatible = "qcom,ipq6018-tcsr-mutex", "qcom,tcsr-mutex";
+			reg = <0x0 0x01905000 0x0 0x1000>;
+			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
-- 
2.34.1

